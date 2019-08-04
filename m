Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E8BAF7F275
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2019 00:49:49 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d23so77756348qto.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 17:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DRI8rxLt1wKJwsHTK5Nv1MYcV5nlhBGS0vdoSUng2Qo=;
	b=NQPXVCZ6WDchTrYqMVRwWqx72JHtHTkdrvo8sXz1kxWYGGS1vucLL8w9LJ3njbvOUZ
	93UF/HCTcLsLP9QyOFlnN0R3KmJVTASfq6yYpkvd1ObZd3HrCQxSY9oyBNaQWXujsC3W
	tHTFxTFC0VBAD77SzZVqGxRVijEkhsCgnWFFewcP6AkXVS+mP7aDnyUknO/Jk4ICZ2qO
	F5y4TYrG7hUrxv5NepZs73xxROkOc9qWWJH0y+4WkWC8Xlv/VC0JQjYcAPG4F/FkP5bD
	al9NNXQu0qt9Rk4HWdOa8jDZQZwByf6mPPEma7P/pnwr+/AYgfvrtgrr11XaZnF7hHBu
	xiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DRI8rxLt1wKJwsHTK5Nv1MYcV5nlhBGS0vdoSUng2Qo=;
	b=Ko+bDNFry4nF31dJQ2/9+aXD9wQaEdiVEzf6rJt7n573YnqKUfxMPb1cIGcKRsD6yT
	0BdgdxaSeDyM+UljzcD7SEdcD0LwLgfKVjCCwVw5U/PdcuxiQZgPp2l14s8PEH+5DVqa
	AttEKzTiRqjkoyqWL0i/DbIOT8uzOW6Ii6hsDgKDf9rCytaWGnKSWHWXejGLmEEowCsc
	liKBOzHA9llWtnJp8nX5mcRZceq3UMevk/s5jklzLta5QknxyK8WglJwdnq+jsLdMNvT
	F1JK1CZZDbVbtmuPHui6uPKleLlkiOw9pBuHqyqup8m+k/8c1QDF8cnDkHZv175hHyLn
	gYqg==
X-Gm-Message-State: APjAAAW+h1ye619mD/w3Vd0vfEH06IR7LTnhXKDZ93i98PjnOEUsFGIk
	j6nXtKL9tDhvLQ6aqDC3+ASu7MGgv2xFq0noHHA=
X-Google-Smtp-Source: APXvYqzqg5gf09h8z5M34rnR68LZ1JAQutL5yvrj9EfX3Z8qDqPtsUR/q4eWiwvgFq4Rfmj0hJmmCkisQEM2wXgdNrA=
X-Received: by 2002:ad4:4112:: with SMTP id
	i18mr104651002qvp.175.1564879790422; 
	Sat, 03 Aug 2019 17:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190802203719.20437-1-ross.burton@intel.com>
	<20190802203719.20437-5-ross.burton@intel.com>
In-Reply-To: <20190802203719.20437-5-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Aug 2019 17:49:23 -0700
Message-ID: <CAMKF1soKtwNUY6SchZLPH8oHbbUiLabEir+JJD1_FdhHqGfhEw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] libxx86dga: remove obsolete client libary
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
X-List-Received-Date: Sun, 04 Aug 2019 00:49:50 -0000
Content-Type: text/plain; charset="UTF-8"

Ross

I am seeing

https://errors.yoctoproject.org/Errors/Details/257733/
https://errors.yoctoproject.org/Errors/Details/257734/

I wonder if they are related to this series

On Fri, Aug 2, 2019 at 1:51 PM Ross Burton <ross.burton@intel.com> wrote:
>
> No modern drivers nor applications use DGA, so remove the client library.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  .../xorg-lib/libxxf86dga_1.1.5.bb             | 19 -------------------
>  2 files changed, 20 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 0bb4a57248f..d9ef9bf1fdb 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -442,7 +442,6 @@ RECIPE_MAINTAINER_pn-libxt = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-libxtst = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-libxv = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-libxvmc = "Armin Kuster <akuster808@gmail.com>"
> -RECIPE_MAINTAINER_pn-libxxf86dga = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-libxxf86vm = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-libyaml = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-lighttpd = "Alexander Kanavin <alex.kanavin@gmail.com>"
> diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb
> deleted file mode 100644
> index e1cb3456588..00000000000
> --- a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require xorg-lib-common.inc
> -
> -SUMMARY = "XFree86-DGA: XFree86 Direct Graphics Access extension library"
> -
> -DESCRIPTION = "libXxf86dga provides the XFree86-DGA extension, which \
> -allows direct graphics access to a framebuffer-like region, and also \
> -allows relative mouse reporting, et al.  It is mainly used by games and \
> -emulators for games."
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=abb99ac125f84f424a4278153988e32f"
> -
> -DEPENDS += "libxext"
> -
> -PE = "1"
> -
> -SRC_URI[md5sum] = "0ddeafc13b33086357cfa96fae41ee8e"
> -SRC_URI[sha256sum] = "2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203"
> -
> -XORG_PN = "libXxf86dga"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

