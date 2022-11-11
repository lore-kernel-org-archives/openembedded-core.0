Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECB8C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 08:07:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.3223.1668154068934062178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 00:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N1qQzIX2;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id l12so7242271lfp.6
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 00:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qhta0t/CE5IzEGMxQQUWvB5ISOvObMaCW19EkZilxGM=;
        b=N1qQzIX2BmcgFizxLN4Dfccd92d+D2xpVdsNfnyDBi2nKDm1LTMfQaF1mm7hh4/xje
         1BZVtuz1XqA3GugK69lhygYwfAgMp3/SNvmBAACZhsXhFZoBdD8wa8LGP1Sg68A4LHxy
         6CQ0+L7+atFOf/RX6V7q5akdJH+THYd5xaQC2Ri0nOEYBUF33F6QkhBRYlvtc7fJSDhM
         tHTwxKMp93LsbcMw6PbmConFq2rNWgtXqIJKSWiX2GxRCLGaYfbD78bNhQsAAq9/Ghwl
         4eMExD8gxBPDLt7HIDevLlKc01Xcie71XiwakomY6osg2t6qz6zJeDinQP3D3ds0Au/m
         qBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhta0t/CE5IzEGMxQQUWvB5ISOvObMaCW19EkZilxGM=;
        b=UcQoAazUXNIe2U+tj1U99aTXXQDJO+DGcz29FEKanUgKYU52bWdkCmniIjToWIvdjm
         nAQAhDRvSS/RCtl8cuA0I5+PrAB4xRPtJGG1z0EiqBtYmZg9UzeDb+fU3d7C1NXQ6Vib
         3LI7SbnqPNcRfl0WlyfI60Mj0umlbEyWVB4OTGNyk1/vMnzqR72paVTBbU20obMlzk/E
         hs3DDeTCisJI0clXg32sk2H/HxRUapfbF059c3KKE1Gc4fWQ4TDHz2eK90ZraDTge0eI
         EfUeekIqMAmjZhxducA05+ra6OORJnAIA7Xhw2yz+6tFCP7QC4nmSASUKrZwbrhQPcHt
         ZBKA==
X-Gm-Message-State: ANoB5pnrJppRxwepMBjUsHh4BKqvwfs1nzAcjzTbhA/u7D5fXC/qEQon
	X/0J2LrzqbDe/CKbTe9TgOM5RgvpxvfD3zLJQK1g/wdH
X-Google-Smtp-Source: AA0mqf6Qio9ZWRvwnGsXi3Tvhz62EvjKfnGnYZpcBELaSGlwGi1fO0FIXsN7uoym4FZggU6wWoHyYUkiMdK2pol3N2c=
X-Received: by 2002:a05:6512:3d8d:b0:4a2:4aad:8fff with SMTP id
 k13-20020a0565123d8d00b004a24aad8fffmr350641lfv.445.1668154067051; Fri, 11
 Nov 2022 00:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20221111080358.1046007-1-vince@underview.tech>
In-Reply-To: <20221111080358.1046007-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Nov 2022 09:07:35 +0100
Message-ID: <CANNYZj9LGK0pcXvhnTLcvWVi+wUkxnKGA6wfnDKRgp70Mc9P4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: update llvm-config RPATH
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 08:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173122

And same here: if the issue is in llvm-config, then it shouldn't be
fixed up after the fact in mesa.

Alex

On Fri, 11 Nov 2022 at 09:04, Vincent Davis Jr <vince@underview.tech> wrote:
>
> RPATH on the llvm-config binary is set wrong which leads to.
>
> llvm-config: error while loading shared libraries: libtinfo.so.5:
> cannot open shared object file: No such file or directory
>
> AND
>
> File "/../../../mesa/<version>/recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", line 223, in finditer
>   return _compile(pattern, flags).finditer(string)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> TypeError: expected string or bytes-like object, got 'NoneType'
>
> Which in turn leads to meson configure failures as the llvm
> version number isn't properly returned.
>
> The libtinfo.so.5 library can be found in STAGING_BASELIBDIR
> update rpath on llvm-config to STAGING_BASELIBDIR. So, that
> meson configure succeeds.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 7dbca5876a..77f9a5c81d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -64,6 +64,11 @@ do_configure:prepend () {
>         if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ]; then
>                 cp ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR}
>                 cp ${STAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}
> +
> +               # RPATH on the llvm-config binary is set wrong which leads to
> +               # llvm-config: error while loading shared libraries: libtinfo.so.5: cannot open shared object file: No such file or directory
> +               # Which in turn leads to meson configure failures as the llvm-config version number isn't properly returned
> +               chrpath --replace ${STAGING_BASELIBDIR} ${STAGING_BINDIR}/llvm-config
>         fi
>  }
>
> @@ -227,7 +232,7 @@ do_install:append () {
>      rm -f ${D}${libdir}/gallium-pipe/*.la
>      rm -f ${D}${libdir}/gbm/*.la
>
> -    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
> +    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
>      chrpath --delete ${D}${libdir}/dri/*_dri.so || true
>
>      # libwayland-egl has been moved to wayland 1.15+
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173119): https://lists.openembedded.org/g/openembedded-core/message/173119
> Mute This Topic: https://lists.openembedded.org/mt/94954417/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

