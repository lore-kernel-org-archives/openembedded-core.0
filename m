Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D49EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 16:46:49 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.1689.1692809203046463620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 09:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=G3ApiDoS;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50098cc8967so1107719e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 09:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692809201; x=1693414001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cGHWXPr7cvpP5L7/vN42Rx+j3Iis126KKFrmDbHyPq0=;
        b=G3ApiDoSt6Dj8LwKhjOFN1FN5AYi9qMPmpj4SXg6lgd/HvYpyz905eG94Mwc5kU+so
         yZMmS3r+AqvuppVVmACq4nBhARPC1KhalPI557bR+7fr4V6uJMkY+jS3Cufqcj7OFmUo
         B5vHdAoiY/E/DunDnewx5uFesf/fX7PGPvbZ73sVxkVjsHlpg4Y/CD2QZCqjtDzCGqDy
         kcYgM974LIQ1fuJNV5nATjxt6MZYWGuIxNi9u8MH7xhGAZbTBWxX4ANWwicFRb7/suko
         jIkOdMTRorqgu3KmQM83OeAdzq3dIhbN4KQorRxJK9NVLEmGLChZx+Lst6XxU20xxInx
         A2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692809201; x=1693414001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGHWXPr7cvpP5L7/vN42Rx+j3Iis126KKFrmDbHyPq0=;
        b=AOHpLLfU6gmnEO+ZB3Ulz03b7Ly3Gzi35xisD3XY7uJcNvxdSqrhD0GmK7fnJFXmDb
         ZIPwJ7sH1Jp/VPdYqLyTwHeuYApBfL5VD7OFCF/XhGiVRPs2jc2XJBpW1kqoTsvXMzh3
         vXuIJVn17doHHEseKVsD6zOHSGTtyB4U0WwKDkt/Gm5q1mIGN4ENCCQjrps33CS3G82E
         B2b7qAc9N1a+cFy5QFggpN0yMgdNzlZLgE0xe4RpHsWIuKaCEx8p0B9PHLu0e1/CIjaq
         C5aOgqitz/0eWqOBeSXXJZCHNmvDL55xmnZLFePWFZnC1UsoxCdmdiAwAr2koBUU+nDS
         HTQQ==
X-Gm-Message-State: AOJu0Yx5AMBdWlCxsitGH0ajONX9h+X7bHKVdhxPyPN4lGRhuScd45GD
	2b9td8Jwl3V2HyReOB1DZMAgTqKF78n4RGJAm1c=
X-Google-Smtp-Source: AGHT+IHX2umVt546eHBXOyPQpWB8xC0AVF8SD9F8SYo6fK21Q3eDb5L9V8f8/+6HsOT0NHWXvlczvVib3DG+B20hm1Y=
X-Received: by 2002:a05:6512:1149:b0:500:98ff:4162 with SMTP id
 m9-20020a056512114900b0050098ff4162mr1786381lfg.40.1692809200546; Wed, 23 Aug
 2023 09:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230823162404.457379-1-leon.anavi@konsulko.com> <20230823162404.457379-2-leon.anavi@konsulko.com>
In-Reply-To: <20230823162404.457379-2-leon.anavi@konsulko.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Aug 2023 18:46:29 +0200
Message-ID: <CANNYZj-et3+B=2C5TfxFjMBTck=JCGDh36giY0hcD5nN7TSdPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] neatvnc: add new recipe
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 16:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186622

Both this, and aml recipe should go to meta-oe, unless there is a use
case for having them in oe-core.

Alex

On Wed, 23 Aug 2023 at 18:24, Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Add a new recipe for neatvnc v0.6.0, a liberally licensed VNC
> server library with a clean interface. It is required for building
> Weston with VNC backend.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  meta/conf/distro/include/maintainers.inc     |  1 +
>  meta/recipes-graphics/neatvnc/neatvnc_git.bb | 40 ++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-graphics/neatvnc/neatvnc_git.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 11b47ffe84..f659e24a66 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -895,3 +895,4 @@ RECIPE_MAINTAINER:pn-zip = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-zstd = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-aml = "Leon Anavi <leon.anavi@konsulko.com>"
> +RECIPE_MAINTAINER:pn-neatvnc = "Leon Anavi <leon.anavi@konsulko.com>"
> diff --git a/meta/recipes-graphics/neatvnc/neatvnc_git.bb b/meta/recipes-graphics/neatvnc/neatvnc_git.bb
> new file mode 100644
> index 0000000000..dc4678f082
> --- /dev/null
> +++ b/meta/recipes-graphics/neatvnc/neatvnc_git.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "A liberally licensed VNC server library"
> +DESCRIPTION = "This is a liberally licensed VNC server library that's intended to be fast and neat."
> +HOMEPAGE = "https://github.com/any1/neatvnc"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
> +
> +SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
> +
> +SRCREV = "8b3dc1ae6099dcfa73aec3ae11df2fdc58540d14"
> +
> +PV = "0.6.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libdrm pixman aml zlib"
> +
> +PACKAGECONFIG ??= "tls"
> +PACKAGECONFIG[tls] = "-Dtls=enabled,-Dtls=disabled,gnutls"
> +PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,libjpeg-turbo"
> +PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false,libpng"
> +PACKAGECONFIG[benchmarks] = "-Dbenchmarks=true,-Dbenchmarks=false,libpng"
> +
> +PACKAGE_BEFORE_PN += "${PN}-examples"
> +ALLOW_EMPTY:${PN}-examples = "1"
> +FILES:${PN}-examples = "${bindir}"
> +
> +NEATVNC_EXAMPLES = "draw png-server"
> +
> +inherit meson pkgconfig
> +
> +do_install:append () {
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'examples', 'true', 'false', d)}; then
> +               install -d ${D}${bindir}
> +               for bin in ${NEATVNC_EXAMPLES}; do
> +                       install -m 0755 ${B}/examples/$bin ${D}${bindir}
> +               done
> +       fi
> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186621): https://lists.openembedded.org/g/openembedded-core/message/186621
> Mute This Topic: https://lists.openembedded.org/mt/100918320/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

