Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65110C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:43:59 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.4913.1668069831724984165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MVM6vUcd;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id l12so1864882lfp.6
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 00:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HqWDgvxBdFsayO/cGC5IhQvkVSm4TxYQRFxEmGmrb1U=;
        b=MVM6vUcdEEbEOlX4v2P4+s1piaaTVvT+omc16ajZCOB2zgB/S/CmvVxJ8AcCE6lhv0
         22AWLE0SZPsnsLXh5FEqjphyyjxmyCX3oT/gzwCONtejO4ILN8lIcaisYpD54V2ylm0p
         N/bucYVZf76wqbhn7xgvmrZ92cqUItVPKTfB/3a/pks+Feej2aFFNn0cMLplbCKkdvXH
         RPkJ9XUY4pl3cvvSZ9N9HBHLRq3ILxfFYMs8qjJTJ6Ze1uGk6AOaxvIvtMjFZZdYSaGo
         u/U9FH3usS2N/XKIF/1zcHlmueAAi0rS+1iH4KS2Ofp8wCCqgH8NcXXjuv0AtaokASqZ
         V+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqWDgvxBdFsayO/cGC5IhQvkVSm4TxYQRFxEmGmrb1U=;
        b=oOez3QMAqFA+zICGfFeRdSWkTYNxClJBh4P4lZ14HpSsWDYK+tMwdy3CN48/Ii/GNz
         /T3cwKRoDJs/DG3A5YAHKdDQEYNuKZpO3Git8e7bsWPkpDOMjzS7yrK6XD7NZDDs+DeC
         aQC6sqhsto3bZ4drYfEtCLIiZsQ5wdpAVfjxgCNn8rqgQEcAhHcw3CHgETAakfnILD3o
         IFeDkjTiBFpjFp6Z89Y74XUn7JceaOzbiUHbJykpz61zujkE2k8ZV4bZujekv4IVAykN
         HJLvJTXWXen1dmI9jzcG3Lf3023bk2mYCxitb9s7rdkF521BGk4/Nrx0d5Ni79aaBP0z
         vw4g==
X-Gm-Message-State: ACrzQf1q8EQTXCsd8EhSghkZ3P3OhmmvscKyk0tHZaY7xjCAZDqAXn9e
	ErdT7yT6xGwb0clXQKAdcUrTuvlle+vDv8PSTY0=
X-Google-Smtp-Source: AMsMyM4+jHbotZM7E29wANONsGt43JskZ3Vjl/dIJ+yx76STfDk+jVZAXViUymDblbsWiA+pshjOyo+K2bhhzYnHa3E=
X-Received: by 2002:a05:6512:230b:b0:4a9:39f4:5793 with SMTP id
 o11-20020a056512230b00b004a939f45793mr1235995lfu.131.1668069829697; Thu, 10
 Nov 2022 00:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20221110020136.908205-1-pkj@axis.com>
In-Reply-To: <20221110020136.908205-1-pkj@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Nov 2022 09:43:38 +0100
Message-ID: <CANNYZj9PiHMr3fjgKiuVk9SrZmSxEUAa9eV9f0K8k5hsjEnV3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pango: Make it build with ptest disabled
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 08:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173070

This snippet is going to be eliminated altogether, can you check that
this patch addresses the problem?
https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/package-version-updates&id=232607c0a781272e2d7f54f1a13980c109fd1d25
(if I force push, the commit is 'pango: replace a recipe fix with an
upstream submitted patch')

Alex

On Thu, 10 Nov 2022 at 03:01, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> This avoids the following error:
>
>   ERROR: pango-1.50.11-r0 do_package: QA Issue: pango: Files/directories
>   were installed but not shipped in any package:
>     /usr/libexec
>     /usr/libexec/installed-tests
>     /usr/libexec/installed-tests/pango
>     /usr/libexec/installed-tests/pango/nofonts
>     /usr/libexec/installed-tests/pango/nofonts/fonts.conf
>
> Also use tabs for indentation of shell code.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-graphics/pango/pango_1.50.11.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/pango/pango_1.50.11.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
> index f545689811..f982d9a65b 100644
> --- a/meta/recipes-graphics/pango/pango_1.50.11.bb
> +++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
> @@ -38,13 +38,15 @@ PACKAGECONFIG[thai] = ",,libthai"
>  GIR_MESON_OPTION = 'introspection'
>
>  do_configure:prepend() {
> -    chmod +x ${S}/tests/*.py
> +       chmod +x ${S}/tests/*.py
>  }
>
>  # https://gitlab.gnome.org/GNOME/pango/-/issues/713
>  do_install:append() {
> -    mkdir -p ${D}/${libexecdir}/installed-tests/pango/nofonts/
> -    install ${S}/tests/nofonts/fonts.conf ${D}/${libexecdir}/installed-tests/pango/nofonts/
> +       if [ "${@bb.utils.filter('PACKAGECONFIG', 'tests', d)}" ]; then
> +               mkdir -p ${D}${libexecdir}/installed-tests/pango/nofonts
> +               install ${S}/tests/nofonts/fonts.conf ${D}${libexecdir}/installed-tests/pango/nofonts
> +       fi
>  }
>
>  LEAD_SONAME = "libpango-1.0*"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173063): https://lists.openembedded.org/g/openembedded-core/message/173063
> Mute This Topic: https://lists.openembedded.org/mt/94928175/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

