Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E04F605FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 00:57:22 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id 203so5970881ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 16:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=+HX8J9RD0w4erlDD8GGw3kZ+ZpedLg/ZclTKVqSJtP4=;
	b=OCBX6ctb/L+iW30/Lg2iAZiuZXKMADfnZ4cl2fk20jEBcgMMm+1+ZN1ercKGQrC+gu
	kB9qAbMd9opmaZDd9h14T2NzVRNr35FtDCHRAuk9103qF4gsFKIwoOIqve1KwxmGwzoV
	k3TjzfmgCYAUHgD+piHO0A0whK24S7MZx2dHkADuB0HD91dtcsoUPK77jTtwOUzxcEWd
	/HAdSmFW2+1/xeo88ErMjRBSb1Xo9yJ5mSAKSxwQpKfhKwZmbsgDVGhlFTZB/6J8STyO
	dRFjwzGQWplVVfFM91t6KrSk7O91LLtF+DGkUKbsY4jfO5ro7YE13bOewOaifih+0dL9
	XaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=+HX8J9RD0w4erlDD8GGw3kZ+ZpedLg/ZclTKVqSJtP4=;
	b=X0GYM1AqqTYGsCt9H0Atkd6jgXGeCCCXDSK9E43KuIAenItOPDonuILiea+R8UErr6
	3mjqZfmiwYCzalC6SoJe04ThtzPk8Rbg4EuV/nHeJw4BM3+/AEoCHkoRb/GLvQlHXpef
	YYQ2rF4sEZEZXq3ePT6U9DS22KN9qeDmvABAnpu3MERoTCh1XMFW2MCkF23F30solYIZ
	BaxwPq9D3+1/oGeqDv+O7jtFgzQJBX43P0ywsmQJzSirJHwDNf5E7Y81bgidUxo+elg2
	ejA1aYJK4jR7Eaj7DGfB+8oap6SffHg7Uw0HgIvCxt/9OV/BRNqm6+NmgoL2hLGggu8K
	FARQ==
X-Gm-Message-State: AMke39l244UIJnGQ6iSIuSJY/HkG6DkAQyNA1Tm1uinqiQ5sEy+ZFbNfqsZoA95U08Ej4hJ/
X-Received: by 10.107.84.2 with SMTP id i2mr576252iob.176.1487897843128;
	Thu, 23 Feb 2017 16:57:23 -0800 (PST)
Received: from pohly-mobl1 (ip-64-134-128-59.public.wayport.net.
	[64.134.128.59]) by smtp.gmail.com with ESMTPSA id
	r20sm2492473ioi.10.2017.02.23.16.57.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Feb 2017 16:57:21 -0800 (PST)
Message-ID: <1487897839.11306.49.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 01:57:19 +0100
In-Reply-To: <1487872131-6571-2-git-send-email-patrick.ohly@intel.com>
References: <1487872053.11306.39.camel@intel.com>
	<1487872131-6571-1-git-send-email-patrick.ohly@intel.com>
	<1487872131-6571-2-git-send-email-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] ovmf: increase path length limit
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
X-List-Received-Date: Fri, 24 Feb 2017 00:57:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-02-23 at 18:48 +0100, Patrick Ohly wrote:
> The VfrCompile tool has a hard-coded maximum length for path names
> which turned out to be too small by around 20 characters in the
> Yocto autobuilder setup. Increasing the maximum by a factor of 4
> is relatively easy and makes the problem less likely.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-core/ovmf/ovmf_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index 6b3a597..76e836a 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -50,6 +50,11 @@ COMPATIBLE_HOST='(i.86|x86_64).*'
>  OVMF_SECURE_BOOT_EXTRA_FLAGS ??= ""
>  OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLAGS}"
>  
> +do_patch[postfuncs] += "fix_path_len"
> +fix_path_len () {
> +    sed -i -e 's/^#define MAX_PATH.*255/#define MAX_PATH 1023/' ${S}/BaseTools/Source/C/VfrCompile/EfiVfr.h
> +}

I've used sed here because it was easy. I'll also send a version which
uses a proper patch. Just beware of the line encoding issues. The patch
really must have CR line ends, otherwise it won't apply to the source.

It might be safer to pull V2 of the ovmf patch from:
https://github.com/pohly/openembedded-core/commits/ovmf

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




