Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E63CD342E
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 07:06:22 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.10372.1695279977371839121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 00:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PL6SJOWd;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-501eec0a373so1169220e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 00:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695279975; x=1695884775; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=97PEDZWACyNk9b42Se7Efi5cDpFUycaqA8F3r3U2XDc=;
        b=PL6SJOWdEbb+rYzD9YQoE3sA6Q44+iV1RPARKGlQ8vMGYzju3TtnpI0OLNYiFYUL0+
         /Ojca0xwoaG7bRMtmI+u050mGC0DWH8QYrclCfo7wq0W9Gt96nuj+V6Y6nS3en/fGNFv
         t7S+Tu4UNoBulqoOGdVGqZ4PAt6fDXHD4izbQZ8+u3mFQ3cKYCVi2dcBe2CIZtkIixiS
         jsEdhc99CezRxqYr7fmU4bK9RMKmoyqBeM49BCNjUnUeuu3PkJkf2w+jeu45g0s/gDD/
         v3jOsai0ahAUa6ZZJJIxZGigUGDpQ4Mq2utk2WIeor0X2dgwqENuLT86KeT2x/lVI4bN
         DnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695279975; x=1695884775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97PEDZWACyNk9b42Se7Efi5cDpFUycaqA8F3r3U2XDc=;
        b=CZGXb4+bxucnIeFfvGH5BSvN6E6ftPRF+lf3F0u30nTVbvPtr9JTAg+N57AsXch6Ti
         Yr1/gJRip5lI2T/G91mL/9vCJb5KUpV12rL0/yv49+0zhsOPUNRHhfPY6vPiDDzMDUPF
         7RUSPTj2nb9OXcdQanq3zm1JzhrTr8OK4KmhmmmrwzXPA9UxFGSVBzLROI1j2+SASCGK
         a7LzpteyrG7PqLCIAKv1LWirU1PuwYpAOA8j0sBLIc6pjz1uCjloexiw7Qu7VCIrRglZ
         DW/YGUQP71Npj6aJHpmwOwrUf1jzIDkxHBp56FP/TpabLE7iSDKhDA1vJT1gEBUYiWzZ
         nJ4w==
X-Gm-Message-State: AOJu0YwQ0tjDRaGNKOpU4Qg8UgSSO6gXPt8luR5/gQLfbhMveHjoUg8E
	LddoGoDBbHLVc+BQnqBZMFNA8mWdEQTJMudwvMw=
X-Google-Smtp-Source: AGHT+IEjzG2RoUe0uTXfS/85T0lhkfCAyHjI7DcTke3KP4P+oR3REtwEKIyJSpsR63yRfrrtAfn4PN178TzU5FTXBSY=
X-Received: by 2002:a2e:b5d2:0:b0:2c0:21b6:e80c with SMTP id
 g18-20020a2eb5d2000000b002c021b6e80cmr3784815ljn.35.1695279974703; Thu, 21
 Sep 2023 00:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230921064727.1260198-1-kai.kang@windriver.com>
In-Reply-To: <20230921064727.1260198-1-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 09:06:03 +0200
Message-ID: <CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
Subject: Re: [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 07:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187975

Did you verify that fail in
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5795/steps/14/logs/stdio
does not occur?

Also booting sato and checking that it look ok is good to do.

Alex

On Thu, 21 Sept 2023 at 08:47, <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update adwaita-icon-theme from 43 to 45.0.
>
> * meson is used to replace autotools, then the patch is redundant
> * not overwrite PACKAGES and split license files to ${PN}-doc
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> v2:
> * not overwrite PACKAGES and split license files to ${PN}-doc
>
>  .../0001-Don-t-use-AC_CANONICAL_HOST.patch    | 27 -------------------
>  ...theme_43.bb => adwaita-icon-theme_45.0.bb} | 11 ++++----
>  2 files changed, 6 insertions(+), 32 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
>  rename meta/recipes-gnome/gnome/{adwaita-icon-theme_43.bb => adwaita-icon-theme_45.0.bb} (84%)
>
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
> deleted file mode 100644
> index 0a1487f8e3..0000000000
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From e1a12b73c25d1ad0f267b22ac5d799bc1fbd0fa4 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Tue, 30 May 2017 14:55:49 +0300
> -Subject: [PATCH] Don't use AC_CANONICAL_HOST
> -
> -This won't work when building allarch (and is only used to find out if
> -target is windows).
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -
> ----
> - configure.ac | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 6ddc49b..39752bb 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -3,7 +3,6 @@ AC_PREREQ(2.53)
> -
> - AC_INIT([adwaita-icon-theme], [43],
> -         [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
> --AC_CANONICAL_HOST
> - AC_CONFIG_MACRO_DIR([m4])
> - AC_CONFIG_SRCDIR([index.theme.in])
> -
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
> similarity index 84%
> rename from meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
> rename to meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
> index 8cb4d147f1..076dc63427 100644
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
> +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
> @@ -10,15 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
>                      file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
>                      file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
>
> -inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
> +GNOMEBASEBUILDCLASS = "meson"
> +inherit allarch gnomebase gtk-icon-cache
>
> -SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
> -
> -SRC_URI[archive.sha256sum] = "2e3ac77d32a6aa5554155df37e8f0a0dd54fc5a65fd721e88d505f970da32ec6"
> +SRC_URI[archive.sha256sum] = "2442bfb06f4e6cc95bf6e2682fdff98fa5eddc688751b9d6215c623cb4e42ff1"
>
>  DEPENDS += "librsvg-native"
>
> -PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
> +PACKAGES =+ "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires"
>
>  RREPLACES:${PN} = "gnome-icon-theme"
>  RCONFLICTS:${PN} = "gnome-icon-theme"
> @@ -37,4 +36,6 @@ FILES:${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
>  FILES:${PN} = "${prefix}/share/icons/Adwaita/ \
>                 ${prefix}/share/pkgconfig/adwaita-icon-theme.pc"
>
> +FILES:${PN}-doc = "${prefix}/share/licenses/adwaita-icon-theme"
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.34.1
>

