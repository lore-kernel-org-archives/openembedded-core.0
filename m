Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0076C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 20:58:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.1154.1668113888561930675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 12:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UqWf8Lk1;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id l8so2318806ljh.13
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 12:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dcMkWTPklDZ+GJrbD0E4bESmGr5sYw9g3Nf0EEAE8y8=;
        b=UqWf8Lk1n5hx9gKko1tmTWJBy+pT8JjIQhkoOfDEOqKd2WnMdpfl4K2F2YjDFSPvwE
         /dI09qP/JVC8xqUg76PdUjIijZPkiO+DBnpllTwvfW+b52zEoF9QsiB1YX6c3Zzkhqj9
         jT1lami6KhSaJT6+G3JaG8D7tPvV/dmJV3D7q0tPeHhyz8weckiXjt+FL0VqfvepgNxP
         Pl3xt6HY+xgbVO4UWLNekC7ASm7O2yDRLMuxnZ9VElx6Pg80bV67bgOkMK5ReF/0P8+K
         ibUf4KMW9akNOQrmZvTt8vRh0EixAQiYJfhxAMGneHENnJDLWLGPIqwyWVa4LDU1AMHe
         mu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcMkWTPklDZ+GJrbD0E4bESmGr5sYw9g3Nf0EEAE8y8=;
        b=OBk2q3NoBYe+SVofddnkoSb7eXMy9mVAAhnITUOMy2Q1JCw268Kb+q6KPu3tbo9kw0
         1fkDjTFr3B+isltopDEgG5EZTPdGV98USmVvN2CxB0Z9fuueqDCXZkKevtAlHWGBuXr3
         ep0fG8YUy5ZZ1CPYg/UTldM9VnNMBhhMOn3vmQztsSYpviiSIrB0fyLnj4mBjLqBWQN6
         kIGWD3528klB4jGfFe46L305INtnvWCmGfBfFRkE9oDlUrCIp/0XFQcqshVLKNb40VLR
         i9d+1gZxHucX0WIb8zeoofgcMqgtGP2TGYcZfS7vKtdf01y+zY1uldNmOX3c6uFYGH5V
         UuiQ==
X-Gm-Message-State: ACrzQf3qmgOKxEfg7TuOK/Jvj9D5hCqqy9qSqYK/KXBeGAvicvIyXfCC
	3GfgUcDMopJ05iPsWNLYwA7El9ayUNDAVqfQZWY=
X-Google-Smtp-Source: AMsMyM74Z49BQ44ew0r4tP4j+0Q+/h4y5AmDZyznw2Qr4hN25iZI1I63/Wm5Il9D6Yh1vItHmtxpRIQrBcXSPqNSMWk=
X-Received: by 2002:a05:651c:23a5:b0:26d:d196:d04 with SMTP id
 bk37-20020a05651c23a500b0026dd1960d04mr9637200ljb.403.1668113886715; Thu, 10
 Nov 2022 12:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20221110204232.12768-1-jorcrous@amazon.com> <20221110204232.12768-4-jorcrous@amazon.com>
In-Reply-To: <20221110204232.12768-4-jorcrous@amazon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Nov 2022 21:57:55 +0100
Message-ID: <CANNYZj8Q4yDjr-=-u4VCMYf8khBDUmwu9+c7qKezqKSx-9grZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
To: jorcrous@amazon.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 20:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173110

On Thu, 10 Nov 2022 at 21:42, Jordan Crouse via lists.openembedded.org
<jorcrous=amazon.com@lists.openembedded.org> wrote:
> +DEPENDS += "vulkan-headers"
> +DEPENDS += "spirv-headers spirv-tools"
> +DEPENDS += "vulkan-loader"
> +DEPENDS += "glslang"

This should be squashed into a single line.

> +
> +EXTRA_OECMAKE = "\
> +                 -DBUILD_TESTS=OFF \
> +                 -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
> +                 -DASSEMBLER_WORKS=FALSE \
> +                 -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
> +                 -DGLSLANG_INSTALL_DIR=${STAGING_DATADIR} \
> +                 -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
> +                 -DUSE_ROBIN_HOOD_HASHING=OFF \
> +                 "

Some of the choices here would be good to explain in the commit
message. What is this 'robin hood hashing' and why do we not want it?
:)

> +
> +PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
> +PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"

These should be enabled by default subject to DISTRO_FEATURES.

> +FILES:${PN} += "/usr/share/vulkan/ /usr/lib/"
> +
> +INSANE_SKIP:${PN} += " ldflags"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +SOLIBS = ".so"
> +FILES_SOLIBSDEV = ""

All of the above should be removed. If there are error messages due to
that, please show them, and we'll figure out how to address them
properly.

New recipes also need a meta/conf/distro/inclue/maintainers.inc entry.

Alex

