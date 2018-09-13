Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 34B1C71B99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:39:41 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g53-v6so5956505qtg.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zubs+QwBWrgR474HaIAQR9HcOveybj9L2enRPM6HNLU=;
	b=JbbOE8kdxGW0VlmgabAI3eyLxyAcWWDZyZmsa4haedYrwwvgVK8cqkvCXrMg594Vjr
	8WUT/DbMd0Ri0RHNG/P+3JHK+/G9Uc5CnWfEJsw2NPp0irrwyfwDKSf4/3oOUHJd//jm
	WiqEsck+ABnl7mVEacGhswWK+vnLjF2qYG7Yo1K7IrDGqSpwZ5uZhZOIrcDzg+2YoBCx
	l/hjCTm1IlSOniybz6V/VOF5wU0lO4TzYM4HqkjxENdVugT1HO986seRwvEU+mLcOeqV
	yrkG7sJvpXTbHGre6beqi8rXkBiWjrx8zzEFIpL86lLCofgbKc7DyyR1nrKyarz8FwQ4
	hqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zubs+QwBWrgR474HaIAQR9HcOveybj9L2enRPM6HNLU=;
	b=DncRLEZ1oKuhiKyXN2cWtlSbHT57psxoOmJAc+3nZRlT1cMsVDDkmYbBmMR+n7sUyN
	MjV9NepW9G12LAdREcDcvjY5SMoHUHXer7BY+OjeqBhMEO0bfDXM4dRn7UsxYtGnzGCd
	95p0xDUumGCV5JmoK/hYOYtqVE3vT+3we/YHdqmxR8oi+JJuXdTIbVv3zcOpgmYFTtbE
	SJ876gD8o2AHn7tAc4Oyn6vh1JBQiwDN2jaOvDMLLvgyeCysm5cY7QlGBHcUaP+lt42G
	+D8h3my14GyAS+YHM/ttcd6ztKfCuGU4QjUzCiVZ+35PoEpc94PxUsm14ap5xVrOtoiF
	qyOw==
X-Gm-Message-State: APzg51BIM+oT4YfDEXag5wgM6YiaaRmNLyduZGCxMCk7q7NbfnID96Ie
	vDK6gCKUHJvd68XXI7HVe5xaVdp7zkWadmvi7ks=
X-Google-Smtp-Source: ANB0VdaAmPk7/cHmeFqIH2yvc8PCRpaPBI894QgSfgHWXPhKGgyID5ZYF4V0Ji8X+4MmppRTb5wrVX9QrceEC0nzqFw=
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr5734648qth.314.1536856781794;
	Thu, 13 Sep 2018 09:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20180911093750.5460-1-ross.burton@intel.com>
In-Reply-To: <20180911093750.5460-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Sep 2018 09:39:15 -0700
Message-ID: <CAMKF1spTqL8tug6OAcAeo6EPNysTiadQj+xhKrs==G-szv4f4g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] yasm: remove
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
X-List-Received-Date: Thu, 13 Sep 2018 16:39:41 -0000
Content-Type: text/plain; charset="UTF-8"

There are packages in other layers e.g. firefox which still depend on
yasm. Can we move it to meta-oe instead of completely dropping it.
On Tue, Sep 11, 2018 at 2:38 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Nothing in oe-core is using yasm now that gstreamer-libav and ffmpeg are using
> nasm, so remove it from oe-core.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/distro/include/maintainers.inc |  1 -
>  meta/recipes-devtools/yasm/yasm_1.3.0.bb | 16 ----------------
>  2 files changed, 17 deletions(-)
>  delete mode 100644 meta/recipes-devtools/yasm/yasm_1.3.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 2ecc3d61e38..0c65e8f816c 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -732,6 +732,5 @@ RECIPE_MAINTAINER_pn-xvideo-tests = "Maxin B. John <maxin.john@intel.com>"
>  RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
> -RECIPE_MAINTAINER_pn-yasm = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
>  RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
> diff --git a/meta/recipes-devtools/yasm/yasm_1.3.0.bb b/meta/recipes-devtools/yasm/yasm_1.3.0.bb
> deleted file mode 100644
> index 31af1e287e9..00000000000
> --- a/meta/recipes-devtools/yasm/yasm_1.3.0.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
> -LICENSE = "BSD"
> -HOMEPAGE = "http://www.tortall.net/projects/yasm/"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
> -
> -SRC_URI = "http://www.tortall.net/projects/yasm/releases/${BP}.tar.gz"
> -
> -SRC_URI[md5sum] = "fc9e586751ff789b34b1f21d572d96af"
> -SRC_URI[sha256sum] = "3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f"
> -
> -export CCLD_FOR_BUILD = "${CC_FOR_BUILD}"
> -
> -inherit autotools gettext
> -
> -BBCLASSEXTEND = "native"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

