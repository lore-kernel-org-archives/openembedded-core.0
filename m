Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044E1C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 14:35:04 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.6077.1668177296138542847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 06:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fHAw/uyI;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id m22so12922553eji.10
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kAji9rA1JEMkiDI8broKz8guNvJVFwt9LqFJAvwcP4k=;
        b=fHAw/uyINKpJdk4CD8/wMWN47M33qQREcuwDaHv48OQ6z+r9GSk9ElgdPN1Q/f0Pwr
         WpakneOvB4vVhmbjAl/BsGEw/IKZGwFppXKjG6CDZajofD4lqsveBsiHWcRA6Dvi74qt
         ROZDYg6j9hddU5Y630EDgVXyS1N4XeypVLf3NvR1Ylb3i3ahMM7OonYCruHKMCgzdU8D
         4tfLP0i3uAWbk+WVPpqEgCfu9k24efBYQm18+k7d9ZY5n8K663yyJTfLfbYM5zPV1xxc
         NOVikNH8zMwEfj1hAumboaN/kFJUKlq3OPnE/9zHWMSE7JUoNwIv0KUQd8smDCNDYT+F
         0wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAji9rA1JEMkiDI8broKz8guNvJVFwt9LqFJAvwcP4k=;
        b=PYnz8sXigIFIkw5YHYtKy7UX9uwbLLXGJa/CnQPOPMAlQe6dHVPJOMtb+DsKx7h5sY
         WUb72UQfZ/OQ78iW9k5izcGRNeSp8fy+0J3y27CoayEgEzaCIfVZbkk65uxVhFg16LXi
         /fZpRBUIAhsQq6jWMrQBtLPkUx5/3lK3AGCaqTJRT4qdi+j0FHgpmofIidg/O/zYg0ov
         PJ/Oj4x4Jq+ihY1Jl7DdEhMLiJI2GL/Kx977B3b0QLjeycB+mZTBCWlzNWRGQyNvHjdP
         qbMOYoKQFnp8MhITq8UbKzeQnz+OCoSRZ2XcLYlIGQFo65UefUOuu7BEWTproG9VSiqq
         qYIQ==
X-Gm-Message-State: ANoB5pl3+X/iTyeBqMr2ijj/9nqoP8XemVez/ww4HFrpmfQ2eOlg6kJ1
	yZw0J8yIYrqP7XHOTnpM49Gbm7rdriFGMx2GY5163VG1Bvhy1g==
X-Google-Smtp-Source: AA0mqf56arsRILzYOodb5KRolN6jX9lxmKqRt6mhEimnFbK4u6n2vW/PaVDsWytNEV9KXl67n1C0Azdp9uctrIaZMQw=
X-Received: by 2002:a17:906:a0d0:b0:7ac:2e16:a8d2 with SMTP id
 bh16-20020a170906a0d000b007ac2e16a8d2mr1956257ejb.584.1668177294124; Fri, 11
 Nov 2022 06:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20221109011421.1257186-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20221109011421.1257186-1-xiangyu.chen@eng.windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 11 Nov 2022 04:34:42 -1000
Message-ID: <CAOSpxdZBZdKoE-vZaz4fZoSz03ToKn-AQcEGF1G6rLgVAPF5YQ@mail.gmail.com>
Subject: Re: [OE-Core][kirkstone][PATCH] lttng-tools: Upgrade 2.13.4 -> 2.13.8
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 14:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173132

Master branch is currently at 2.13.7, so you will need to submit the
version bump to 2.13.8 for master first.  I will then cherry-pick the
version bumps to langdale and kirkstone.

Thanks!

Steve

On Tue, Nov 8, 2022 at 3:14 PM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  .../{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb}  | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (90%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> similarity index 90%
> rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> index 0ea4da05ce..a814eb79f9 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>             file://disable-tests.patch \
>             "
>
> -SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
> +SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
>
>  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>
> @@ -113,7 +113,7 @@ do_install_ptest () {
>          for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
>              cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
>              case $f in
> -                *.so|userspace-probe-elf-binary)
> +                *.so|userspace-probe-elf-*)
>                      install -d ${D}${PTEST_PATH}/tests/$d/
>                      ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
>                      # Remove any rpath/runpath to pass QA check.
> @@ -124,6 +124,7 @@ do_install_ptest () {
>      done
>
>      chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
> +    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
>      chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
>      chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
>
> @@ -185,4 +186,10 @@ do_install_ptest () {
>  INHIBIT_PACKAGE_STRIP_FILES = "\
>      ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
>      ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \
> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary \
> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/.libs/userspace-probe-elf-cxx-binary \
> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/gen-syscall-events \
> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/.libs/gen-syscall-events \
> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack \
> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/.libs/gen-syscall-events-callstack \
>      "
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173006): https://lists.openembedded.org/g/openembedded-core/message/173006
> Mute This Topic: https://lists.openembedded.org/mt/94904524/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

