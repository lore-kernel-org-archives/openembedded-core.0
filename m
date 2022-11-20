Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0256DC4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 18:01:02 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.18490.1668967253459236174
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 10:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d2XWXkfF;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id j4so15836832lfk.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 10:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U0Wu41b9+dYTI0ARdWI4lTqXfv9CMu00mB3wyOvNSGM=;
        b=d2XWXkfFg/MN2NsCyvD5m/CSjGuzq0aVVWHUezkLn8NvQMGhEMYYlj55ni1WGbRXr/
         n8cQmdVbEg610FkE615aKQaXvewNbf9t/piTpPzDdN8IU4Rx43m8KPP+HU8Cq19sqreo
         l7goSdhmF0xD5H05lymI5uiWIkPucZtXJvoZSg2kCp4q6EQXFm7780C9mIKqN0T11356
         8wFNXX4OBk/UgGXRqqao0ei6fvs0lSWWmTg2LWeYiU/8TZcWPhMAPK9fsXIGnxQ+zr1y
         E2TOW/Jod6jZbtfRj72WE48SSivYsn5ISthVh+/wvN7uTXfcLITQytDCTPL8ZdP/L0JP
         CZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0Wu41b9+dYTI0ARdWI4lTqXfv9CMu00mB3wyOvNSGM=;
        b=4H+q7jdUfdYt2uYrDAXToB9cqumBL20fQb45/cNP5ufzq/R/tWQ7vpYG+h1EiyqxAq
         A2Z+y9PllAUzfHFc5FPJdvzHTw8/nzsDkfoRiyJn8cKL9vVCB8HwHnmifuuRxtM1o/DB
         i/QfwR5oSYlQF9B63PbpVfWFDhHIUNQiRbbq74zQePErYI0fvE5QOumRGDLAuI2eMkfB
         32jr+HgjSCFc8slk6Ciqdqpjhl7Pf99RGNco7o88TNGvDBkdB/rcThRSOVjRmM1gbjcr
         2OGcLJ4wDDly8F0Lzed9OBIuFQWJa5YWxjtUVNitdNAKa7eGNB0aF5kA1TyokQGgnMQ0
         fsfA==
X-Gm-Message-State: ANoB5pm7HCL5G0NoSDCWB1TQXts+6UP3rgyvD+Uh5muAWos0fBhPZaCv
	rxGLAis7Illj9gqAW2+COnR+ElAhNoJtlv/pJwk=
X-Google-Smtp-Source: AA0mqf49gYy3/QKX7bv8qHnfWVUeEGMTB9wGrQInqGd2QFNUDw8Yy+xoHDIPAr69EZrv2zB1zDjm4yiNUWWltNpkX7E=
X-Received: by 2002:ac2:53a8:0:b0:4b1:5125:2f14 with SMTP id
 j8-20020ac253a8000000b004b151252f14mr4735584lfh.345.1668967251365; Sun, 20
 Nov 2022 10:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20221120175237.194899-1-f_l_k@t-online.de>
In-Reply-To: <20221120175237.194899-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 20 Nov 2022 19:00:39 +0100
Message-ID: <CANNYZj_QqqH5FzZHke2W2yKbP+YHhfHkf4kT7ahtBpkOv2OV9w@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 18:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173639

I have to ask you to resend and drop the DISTRO_FEATURE idea. We do
not want to make the impression that python2 is supported in any way,
and as explained earlier this implies that all scripts that ask for
python would work with both 2 and 3. No, this is a clean break, and
anyone who still has 2.x stuff has to adjust it to ask for
#!/usr/bin/python2.

Alex

On Sun, 20 Nov 2022 at 18:53, Markus Volk <f_l_k@t-online.de> wrote:
>
> Currently /usr/bin/python is provided by the python2 package. If python2
> is not installed, the built image lacks a provider for it.
> This results in failed scripts when using '/usr/bin/python' shebang.
>
> This patch adds a /usr/bin/python symlink for python3 to fix this issue.
> For images containing python2 and python3, the do_rootfs task will fail
> because now both of them provide the same file.
> To allow this corner case, a DISTRO_FEATURE 'python2' has been introduced which,
> if set, will prevent python3 from creating the symlink.
>
> The link is created with relative path because using an absolute path would fail
> for native and nativesdk.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
>  meta/recipes-devtools/python/python3_3.11.0.bb             | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 64203cf0fc..7b6f509a45 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -203,6 +203,7 @@
>          "files": [
>              "${bindir}/python${PYTHON_MAJMIN}",
>              "${bindir}/python${PYTHON_MAJMIN}.real",
> +            "${bindir}/python",
>              "${bindir}/python3",
>              "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
> diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.0.bb
> index 92a1f69320..18b631f79d 100644
> --- a/meta/recipes-devtools/python/python3_3.11.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.0.bb
> @@ -144,6 +144,7 @@ do_install:prepend() {
>
>  do_install:append:class-target() {
>          oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> +        ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf ./python3 ${D}${bindir}/python', d)}
>  }
>
>  do_install:append:class-native() {
> @@ -156,6 +157,7 @@ do_install:append:class-native() {
>          # (these often end up too long for the #! parser in the kernel as the
>          # buffer is 128 bytes long).
>          ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +        ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf ./python3-native/python3 ${D}${bindir}/nativepython', d)}
>
>          # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
>          # and the overhead in each recipe-sysroot-native isn't worth it, particularly
> @@ -213,6 +215,7 @@ do_install:append() {
>  }
>
>  do_install:append:class-nativesdk () {
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf ./python3 ${D}${bindir}/python', d)}
>      # Make sure we use /usr/bin/env python
>      for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
>           sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> @@ -376,6 +379,7 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX
>
>  # For historical reasons PN is empty and provided by python3-modules
>  FILES:${PN} = ""
> +RPROVIDES:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', '${bindir}/python', d)}"
>  RPROVIDES:${PN}-modules = "${PN}"
>
>  FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173637): https://lists.openembedded.org/g/openembedded-core/message/173637
> Mute This Topic: https://lists.openembedded.org/mt/95156228/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

