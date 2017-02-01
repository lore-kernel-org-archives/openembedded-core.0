Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 85C84600E3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 16:56:43 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 194so34648377pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=oSQ8RtV4WJmuxQ3CHniSUZZjplJqLZzeG+oPZlUYmrE=;
	b=sRW/LCrwR9uyHEDrf6SCFA2fiuRcsmi3FWVa6YTzJ9I954NYst6XLHQE4z4LX7j/LD
	ID3TWDZ2/DnlioSmmPI1mLzlKUS1bgp6CztTdTbiXnbnXy6f9ROv3aRDUTj28ATstgVa
	KEmNjC4YsggffDdD03SporLIQO02APc/ObMdKxyJ1xPHgGT3+Kqml7esauVRBTNW2Sx8
	6IJ02REoqZFqoNaSparTw3F4Fzy8GjOPhXb5qmIooAl7j0UBgZDnoZSzK85PcNF7s6uO
	0N70zqyL7h4lxZZt9+DMA6yFxVXdv7v2TV/g4wCJN0Rdk5nWWFvFX8N2uR7C8Ga91XYa
	hdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=oSQ8RtV4WJmuxQ3CHniSUZZjplJqLZzeG+oPZlUYmrE=;
	b=FfBUgQ6r7x2rye8Z+IJ9nGBUo04ypiTniGIcZBeWR8L0ZpWnIkTgckN6Dv325qGblJ
	6BeL1sOlEhDYpqMKmWi8htp1+dd3ckImsfuEnh5PQGoxtOcy/VVTVx2e2Z6RLfdC9QDO
	ljgpLThbSrRVRNFVmy60HZ7OqyCTfU71MXo8syRVi1Zipjo3F/P4wYNv5pYaPfiJ2oat
	WEAytXDIVJ/kDBkEh+MIJ62fVWTc/whVWYt1gcfcD9WREAIF7UH7v2ju6kSPgjzOU2aW
	veyN3ydtVOLS+cvHTIIFEs0ew9M+URdX+/B8TJgy4l7zUUB/DLMQHYE5BE7BWBNHpUc0
	s2pA==
X-Gm-Message-State: AIkVDXIwAtQsE2HTFATUhK+f9KbwyxTMzJR1U4EUsBQ3XBf1/LIXbHp0DU9MGx2f21b8HA==
X-Received: by 10.99.181.7 with SMTP id y7mr4814344pge.57.1485968203493;
	Wed, 01 Feb 2017 08:56:43 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:8ce9:48a5:c3c4:adfc])
	by smtp.gmail.com with ESMTPSA id
	184sm51542324pgj.5.2017.02.01.08.56.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 08:56:43 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20170131090529.5321-1-patrick.ohly@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <aeb5c3c0-339c-45e0-9e1e-bbad796e1a2b@gmail.com>
Date: Wed, 1 Feb 2017 08:56:44 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170131090529.5321-1-patrick.ohly@intel.com>
Subject: Re: [PATCH] libtasn1: depends on yacc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2017 16:56:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/31/17 1:05 AM, Patrick Ohly wrote:
> This fixes a potential pollution by the build host and build error
> when yacc isn't installed on the build host:
> 
>  | ../../libtasn1-4.9/build-aux/ylwrap: line 175: yacc: command not found
>  | Makefile:1116: recipe for target 'ASN1.c' failed
>  | make[3]: *** [ASN1.c] Error 127
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-support/gnutls/libtasn1_4.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/gnutls/libtasn1_4.9.bb b/meta/recipes-support/gnutls/libtasn1_4.9.bb
> index b8ff9eaf7a9..3da5d4bcc56 100644
> --- a/meta/recipes-support/gnutls/libtasn1_4.9.bb
> +++ b/meta/recipes-support/gnutls/libtasn1_4.9.bb
> @@ -16,6 +16,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
>             file://0004-tools-eliminated-compiler-warnings.patch \
>             "
>  
> +DEPENDS = "bison-native"
> +

nit on style, you generally put checksum assignments immediately after
SRC_URI containing the origninal src location. Secondly, if we use +=
then we dont run the risk of it overwriting prior assignments if any

>  SRC_URI[md5sum] = "3018d0f466a32b66dde41bb122e6cab6"
>  SRC_URI[sha256sum] = "4f6f7a8fd691ac2b8307c8ca365bad711db607d4ad5966f6938a9d2ecd65c920"
>  
> 

