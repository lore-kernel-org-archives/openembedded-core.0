Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4AEFA65E11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:08:13 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so6560927pab.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 16:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=zfyXbXBSP+QPNCwQ6OgpnNOVE6qtOgffmkJsvBEDSpM=;
	b=U1nUZMWuAW+VCWCAAMPjmGqelbVcphAzY77OGk2RRDso56aq2PG8h5uEf125CmnkAC
	63sMejmh2draRfKEG64JCOeaJJyOoVeSPoF6LHGBdpNpeaedG9uc5ZD/p8VLj7Ichhz+
	Na6jLgnr6Hz2VrZfHa5D7V7Baos4zWeFp3nVF4cwthz0qrUzaLdN/EWuxIKiXz48htvI
	6PqeF1tOa6FEeRfp/ab0tWrMJCNcE+lCwBYFTXks19muYJygb5u3Zp+NLOxmuI3KubFj
	tMbA4my39gR9CF4FRKTXvyCzmk3iGwiDGxxOuzB955Ohe49sACAuNrEViSlCcXygtY0Z
	5Hnw==
X-Received: by 10.66.65.230 with SMTP id a6mr30514760pat.18.1408316894984;
	Sun, 17 Aug 2014 16:08:14 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:ccfd:ba03:18dd:3204?
	([2601:c:9380:601:ccfd:ba03:18dd:3204])
	by mx.google.com with ESMTPSA id
	lq4sm52253684pab.48.2014.08.17.16.08.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Aug 2014 16:08:13 -0700 (PDT)
Message-ID: <53F135DC.8050503@gmail.com>
Date: Sun, 17 Aug 2014 16:08:12 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1408316678-13283-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1408316678-13283-1-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH] nettle: update nettle to version 3.0
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
X-List-Received-Date: Sun, 17 Aug 2014 23:08:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Ignore this one. hit send too fast.

- Armin

On 08/17/2014 04:04 PM, Armin Kuster wrote:
> With this update, LGPLv3 was added to many files.
> Each supported algorithms govern which license they want.
> Many are stated as  "ether v2 or v3 or both in parallel".
> Update license to be v2 or LGPLv3.
>
> The previous verion had one GPLv3 file so the licesne was incorrect.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   .../nettle/{nettle_2.7.1.bb => nettle_3.0.bb}             | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>   rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.0.bb} (53%)
>
> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_3.0.bb
> similarity index 53%
> rename from meta/recipes-support/nettle/nettle_2.7.1.bb
> rename to meta/recipes-support/nettle/nettle_3.0.bb
> index f53afcc..0dc9bb6 100644
> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
> +++ b/meta/recipes-support/nettle/nettle_3.0.bb
> @@ -1,17 +1,18 @@
>   SUMMARY = "A low level cryptographic library"
>   HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>   SECTION = "libs"
> -LICENSE = "LGPLv2.1 & GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
> -                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
> -                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
> -
> +LICENSE = "LGPLv2.1 & GPLv2 | LGPLv3"
> +LIC_FILES_CHKSUM = "file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263\
> +                    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6\
> +                    file://COPYINGv3;md5=11cc2d3ee574f9d6b7ee797bdce4d423\
> +                    file://serpent-decrypt.c;beginline=53;endline=67;md5=a4ccbeb343203d3586661f45c1cab577 \
> +                    file://serpent-set-key.c;beginline=56;endline=70;md5=150b0ea44cdfb712a83331bff566e9a8"
>   DEPENDS += "gmp"
>
>   SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
>
> -SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
> -SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
> +SRC_URI[md5sum] = "f64b1bf1e774b7ae6e507318e340250e"
> +SRC_URI[sha256sum] = "9651c0bd2326eb737d0ed9eb403444712407c01a25b0fe813432ef31bebcd913"
>
>   EXTRA_OECONF = "--disable-openssl"
>
>

