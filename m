Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338B1C54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 08:01:18 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.31221.1700553675091884706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 00:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IrHWOpEq;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so63790351fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 00:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700553673; x=1701158473; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mVbZcG/+dy76eacuS3dX1Nn7McYpNos6f6U6eWO+aUw=;
        b=IrHWOpEqjae7qzEKDgpXmR9dX9IJTvUQzdoiLfJ+/1m76Vh1Kn3urrA+sM+5mheSHA
         kU1fDaDwguzqUw8JtnVQ2G/ukfGUsD1grUSY7p3GIxBM6Bm9uKm7h9oJ7o/P3J+mcD2a
         EbxfZBklHb3FepBbHPEP4GuYW37Cy3H3tQXewHpyTlZPiKdEBhH2UIiGXD91lZ1sGCTf
         qX0X+lZne5vhz8DRZh8YgEw7V3l7PDXFeDyzNMKIpZ38HMIxa2No3glgSrtirc6z78Kl
         5e8CCTFcNIYAyW9cHsgmUcNC+rVHk/PfPOrMxLCDVczYv4DTWCstVS8BOWydKOKCpTLw
         YgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700553673; x=1701158473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVbZcG/+dy76eacuS3dX1Nn7McYpNos6f6U6eWO+aUw=;
        b=SO64jm8rApaHsdo7L8Ug3WBVqtPDpQMQ71IbMRX4rIrfEEGlt5993au6HJNq7Zwl0w
         Srrulvq6yNFrdgEB9wL2a9qwri76HuJj/RYA4Ku1zVcop4dps+CzqjCceVPr4ytpIyYD
         3pSG5pHfAPy/XaW0WqERogHVIFNAfLwoagdQqJZ2ITOr7RTnuOrIIXohpnlLP0yeez7O
         bMECddJGwSJjcWc+YR2ziPN6R0HsxjH/MnH0MNa7Ttwcpaus40ypJUQZ45wXTkhpTYtk
         oA5021b1TRWqnfSRoQEYiFwO9buHNJrDmPnmiPrf7gLaHjmjJyFISmT8qQm4cXU7FXus
         Y9/A==
X-Gm-Message-State: AOJu0YzG0OfFOVuFF9BsbetQtG8JB8r7l1BI8eHHX0OilHQPwN7ErNin
	R7FI/Dc0tCl9OT0t37kDjBByX63otG9lKgEAlq4=
X-Google-Smtp-Source: AGHT+IH5LCZiqdB8XHrBPMdZLtA9rP9G+DcZqolkB8nTUT4iarY+UA3zc5pex4/D4qFW2QC4afcPvm6QeQr7TFXFcHA=
X-Received: by 2002:a05:651c:482:b0:2c7:cf34:fc0c with SMTP id
 s2-20020a05651c048200b002c7cf34fc0cmr5631277ljc.44.1700553673175; Tue, 21 Nov
 2023 00:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20231121013448.8478-1-anuj.mittal@intel.com>
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Nov 2023 09:01:01 +0100
Message-ID: <CANNYZj875r5x4iErR+k_AZN+uZeXRSSLn8S=Xzzd6+TjU=im-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/11] gstreamer1.0: upgrade 1.22.6 -> 1.22.7
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 08:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190956

Thanks for this set, much appreciated!

Alex

On Tue, 21 Nov 2023 at 02:34, Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../{gst-devtools_1.22.6.bb => gst-devtools_1.22.7.bb}          | 2 +-
>  ...streamer1.0-libav_1.22.6.bb => gstreamer1.0-libav_1.22.7.bb} | 2 +-
>  .../{gstreamer1.0-omx_1.22.6.bb => gstreamer1.0-omx_1.22.7.bb}  | 2 +-
>  ...plugins-bad_1.22.6.bb => gstreamer1.0-plugins-bad_1.22.7.bb} | 2 +-
>  ...ugins-base_1.22.6.bb => gstreamer1.0-plugins-base_1.22.7.bb} | 2 +-
>  ...ugins-good_1.22.6.bb => gstreamer1.0-plugins-good_1.22.7.bb} | 2 +-
>  ...ugins-ugly_1.22.6.bb => gstreamer1.0-plugins-ugly_1.22.7.bb} | 2 +-
>  ...reamer1.0-python_1.22.6.bb => gstreamer1.0-python_1.22.7.bb} | 2 +-
>  ...rtsp-server_1.22.6.bb => gstreamer1.0-rtsp-server_1.22.7.bb} | 2 +-
>  ...streamer1.0-vaapi_1.22.6.bb => gstreamer1.0-vaapi_1.22.7.bb} | 2 +-
>  .../{gstreamer1.0_1.22.6.bb => gstreamer1.0_1.22.7.bb}          | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.6.bb => gst-devtools_1.22.7.bb} (95%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.6.bb => gstreamer1.0-libav_1.22.7.bb} (91%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.6.bb => gstreamer1.0-omx_1.22.7.bb} (95%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.6.bb => gstreamer1.0-plugins-bad_1.22.7.bb} (98%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.6.bb => gstreamer1.0-plugins-base_1.22.7.bb} (98%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.6.bb => gstreamer1.0-plugins-good_1.22.7.bb} (97%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.6.bb => gstreamer1.0-plugins-ugly_1.22.7.bb} (94%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.6.bb => gstreamer1.0-python_1.22.7.bb} (91%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.6.bb => gstreamer1.0-rtsp-server_1.22.7.bb} (90%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.6.bb => gstreamer1.0-vaapi_1.22.7.bb} (95%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.6.bb => gstreamer1.0_1.22.7.bb} (97%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.7.bb
> similarity index 95%
> rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.7.bb
> index 90bbd9c7336..b545f020cf8 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.7.bb
> @@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
>             file://0001-connect-has-a-different-signature-on-musl.patch \
>             "
>
> -SRC_URI[sha256sum] = "8928560efaf16137c30285e718708e5d0bab0777eb4ef8127e0274e120d3d86b"
> +SRC_URI[sha256sum] = "157cf93fb2741cf0c3dea731be3af2ffae703c9f2cd3c0c91b380fbc685eb9f9"
>
>  DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
>  RRECOMMENDS:${PN} = "git"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.7.bb
> similarity index 91%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.7.bb
> index 8906556b44b..7169223636a 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.7.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
>                      "
>
>  SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "7789e6408388a25f23cbf948cfc5c6230d735bbcd8b7f37f4a01c9e348a1e3a7"
> +SRC_URI[sha256sum] = "1525b917141b895fe5cf618fe8867622b2528278a0286e9f727b5f37317daca1"
>
>  S = "${WORKDIR}/gst-libav-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
> similarity index 95%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
> index 2579aa3d661..ad40cf5513b 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
>
>  SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
>
> -SRC_URI[sha256sum] = "223833c42518ad7eb1923bb4dd3726809f59a66d6e9aaaa69cb29ad0750c8758"
> +SRC_URI[sha256sum] = "d7a18ec47d40a472bd5cba2015e0be72b732f1699895398cec5cd8e6a3a53b44"
>
>  S = "${WORKDIR}/gst-omx-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb
> similarity index 98%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb
> index 3db7ddff5f2..b7d787b611b 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb
> @@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
>             file://0002-avoid-including-sys-poll.h-directly.patch \
>             file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
>             "
> -SRC_URI[sha256sum] = "b4029cd2908a089c55f1d902a565d007495c95b1442d838485dc47fb12df7137"
> +SRC_URI[sha256sum] = "c716f8dffa8fac3fb646941af1c6ec72fff05a045131311bf2d049fdc87bce2e"
>
>  S = "${WORKDIR}/gst-plugins-bad-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb
> similarity index 98%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb
> index 1f67ca303a1..3b8923e8f22 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb
> @@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
>             file://0003-viv-fb-Make-sure-config.h-is-included.patch \
>             file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
>             "
> -SRC_URI[sha256sum] = "50f2b4d17c02eefe430bbefa8c5cd134b1be78a53c0f60e951136d96cf49fd4b"
> +SRC_URI[sha256sum] = "62519e0d8f969ebf62a9a7996f2d23efdda330217a635f4a32c0bf1c71577468"
>
>  S = "${WORKDIR}/gst-plugins-base-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.7.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.7.bb
> index 6b76ba957ee..b8496a17508 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.7.bb
> @@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
>             file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
>             file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
>
> -SRC_URI[sha256sum] = "b3b07fe3f1ce7fe93aa9be7217866044548f35c4a7792280eec7e108a32f9817"
> +SRC_URI[sha256sum] = "b6db0e18e398b52665b7cdce301c34a8750483d5f4fbac1ede9f80b03743cd15"
>
>  S = "${WORKDIR}/gst-plugins-good-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.7.bb
> similarity index 94%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.7.bb
> index 77f79a630af..8a67531123a 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.7.bb
> @@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
>  SRC_URI = " \
>              https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
>              "
> -SRC_URI[sha256sum] = "3e31454c98cb2f7f6d2d355eceb933a892fa0f1dc09bc36c9abc930d8e29ca48"
> +SRC_URI[sha256sum] = "520b46bca637189ad86a298ff245b2d89375dbcac8b05d74daea910f81a9e9da"
>
>  S = "${WORKDIR}/gst-plugins-ugly-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
> similarity index 91%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
> index addf12c4277..a3870316353 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
> @@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
>
>  SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "51de2d6d13b12ce095eac97c0b94ee59c2aeba3712bb7462b78c4d57dde176c5"
> +SRC_URI[sha256sum] = "1ef8df7608012fa469329799c950ec087737a6dabad3003c230658b58c710172"
>
>  DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
>  RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.7.bb
> similarity index 90%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.7.bb
> index fd79fe43241..af1c2ced449 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.7.bb
> @@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
>
>  SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
>
> -SRC_URI[sha256sum] = "0ae33a8b50443b62f11581a9181e906b41cd3877b2d799dbea72912c3eda4bb3"
> +SRC_URI[sha256sum] = "f7fac001e20ad21e36d18397741c4657c5d43571eb1cc3b49f9a93ae127dc88f"
>
>  S = "${WORKDIR}/${PNREAL}-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
> similarity index 95%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
> index bf4c1050578..4cad50742d6 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>
>  SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
>
> -SRC_URI[sha256sum] = "d9ba2fc26bef98c78e982c599f585d46bbb65fe122da89c2d7ab41f468a52c7b"
> +SRC_URI[sha256sum] = "0e9fff768b89de6d318b34146e4e781d82b9a0f4025dc541b2c8349c7bcb7f67"
>
>  S = "${WORKDIR}/${REALPN}-${PV}"
>  DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb
> index a8984643222..72161b272fb 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb
> @@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
>             file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
>             file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
>             "
> -SRC_URI[sha256sum] = "f500e6cfddff55908f937711fc26a0840de28a1e9ec49621c0b6f1adbd8f818e"
> +SRC_URI[sha256sum] = "01e42c6352a06bdfa4456e64b06ab7d98c5c487a25557c761554631cbda64217"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
>                     check \
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190940): https://lists.openembedded.org/g/openembedded-core/message/190940
> Mute This Topic: https://lists.openembedded.org/mt/102720807/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

