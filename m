Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33215C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 14:48:29 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.8453.1655995708050505597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 07:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RfRfhPUw;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id y32so33787030lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 07:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r9QI7RdEOJIwUT86+iyu3QRQlfm5jH9k/As2Clgxn6o=;
        b=RfRfhPUwKDDSIJmM3UvR3RElEoiNOW8lcWRVkS/74jy/jZLJMec+Xj2bhXcqgywKjp
         9lyRG7t9QebwllZn7ubxAn0Dzto6lBx2Hja2rN8iVkKSe8Av0zOxBDlbVf+w8ZXeRjAx
         yke6KaDH92a0yFb/OKxrNJHBrIvzN15b3Y69q03dpBECkXzLq1yeXUYZnLDxCQpEqPGu
         cXFmLJozkHAybY3X5+cJfGhNub/pIG6KjgTCUlukkAcCda63KaH3z+5B3a9G2rEF4Iig
         r2+FwWkGXCeYggmqOBrUqka6rN+XflwYzORjlskr8zAksbXkFf+GmRfgG948X60L6uOQ
         pGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r9QI7RdEOJIwUT86+iyu3QRQlfm5jH9k/As2Clgxn6o=;
        b=08LnKv6PP7jFXVcksPTGb95+tN1F+ZvqQXNZi58im/uIuQAghCdKW1QM7K+3PJ3VrB
         dMH2n4LiDIj6A4/Jt1WXTiiggpAjWLPWmzsdnajuiIYargBuBMxbaAJwEi1Yr7F+Hxet
         G3opIXv/eixfO/P/zDUW3yK1MwmN6EmAnGt7lRhtBZLjmL9JE8RB/h4oTOIXl6MKF1J5
         hmooEahfRzwVcZvDV10GKMVfiNNq4LB0A1RMUZ6KAfbIGd/HppmiPNTkIxRlChbmr240
         neWMeLJXsRS3GPVHiCwmy6TfRtvEA6oX8qiXiAfiD4kCvnpMf2+rav0+V6gIlusKTidU
         wUig==
X-Gm-Message-State: AJIora/QBuV7X4lwN6hbCFv4zjZ51FjfKuzMsgYcp9Lwr6D70LUzOafA
	VuQoO2dALeXPzeivBI3oCwCC+VaPVpAXtdgwMiITVj3G0/0=
X-Google-Smtp-Source: 
 AGRyM1ssX9K0oWA3CpA2P/8/vts1aiF00hc0xTlBa06DpJFIv5cWrbBLVeQekqNNalp1MZe9V/2z0jsLGRl0PugWNw8=
X-Received: by 2002:a05:6512:3b21:b0:47f:665a:bf50 with SMTP id
 f33-20020a0565123b2100b0047f665abf50mr5713610lfv.673.1655995706382; Thu, 23
 Jun 2022 07:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220623134640.230019-1-f_l_k@t-online.de>
In-Reply-To: <20220623134640.230019-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Jun 2022 16:48:15 +0200
Message-ID: 
 <CANNYZj_QXjcfcE4TZN8BDLnnfs1CG=L92pc8ttsObGboLkWOCg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv3] llvm: install optviewer if available
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 14:48:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167271

Is there a reason the patch is marked as Pending? If not, then please
submit upstream before submitting to oe-core.

Alex

On Thu, 23 Jun 2022 at 15:47, Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...Lists.txt-only-install-opt-viewer-if.patch | 60 +++++++++++++++++++
>  meta/recipes-devtools/llvm/llvm_git.bb        | 11 ++--
>  2 files changed, 66 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-devtools/llvm/llvm/0001-opt-viewer-CMakeLists.txt-only-install-opt-viewer-if.patch
>
> diff --git a/meta/recipes-devtools/llvm/llvm/0001-opt-viewer-CMakeLists.txt-only-install-opt-viewer-if.patch b/meta/recipes-devtools/llvm/llvm/0001-opt-viewer-CMakeLists.txt-only-install-opt-viewer-if.patch
> new file mode 100644
> index 0000000000..12c9f0d0c0
> --- /dev/null
> +++ b/meta/recipes-devtools/llvm/llvm/0001-opt-viewer-CMakeLists.txt-only-install-opt-viewer-if.patch
> @@ -0,0 +1,60 @@
> +From 8dbfe220d16054245d8122e620639e7d62a4d791 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Thu, 23 Jun 2022 15:07:01 +0200
> +Subject: [PATCH] llvm/tools/opt-viewer/CMakeLists.txt: install opt-viewer only
> + if enabled
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + llvm/tools/opt-viewer/CMakeLists.txt          | 36 ++++++++++---------
> + 1 files changed, 19 insertions(+), 17 deletions(-)
> +
> +diff --git a/llvm/tools/opt-viewer/CMakeLists.txt b/llvm/tools/opt-viewer/CMakeLists.txt
> +index c0070f8cbfac..fb6ee384f6d1 100644
> +--- a/llvm/tools/opt-viewer/CMakeLists.txt
> ++++ b/llvm/tools/opt-viewer/CMakeLists.txt
> +@@ -1,20 +1,22 @@
> +-set (files
> +-  "opt-diff.py"
> +-  "opt-stats.py"
> +-  "opt-viewer.py"
> +-  "optpmap.py"
> +-  "optrecord.py"
> +-  "style.css")
> ++if(LLVM_HAVE_OPT_VIEWER_MODULES)
> ++  set (files
> ++    "opt-diff.py"
> ++    "opt-stats.py"
> ++    "opt-viewer.py"
> ++    "optpmap.py"
> ++    "optrecord.py"
> ++    "style.css")
> +
> +-foreach (file ${files})
> +-  install(PROGRAMS ${file}
> +-    DESTINATION "${CMAKE_INSTALL_DATADIR}/opt-viewer"
> +-    COMPONENT opt-viewer)
> +-endforeach (file)
> ++  foreach (file ${files})
> ++    install(PROGRAMS ${file}
> ++      DESTINATION "${CMAKE_INSTALL_DATADIR}/opt-viewer"
> ++      COMPONENT opt-viewer)
> ++  endforeach (file)
> +
> +-add_custom_target(opt-viewer DEPENDS ${files})
> +-if(NOT LLVM_ENABLE_IDE)
> +-  add_llvm_install_targets("install-opt-viewer"
> +-                           DEPENDS opt-viewer
> +-                           COMPONENT opt-viewer)
> ++  add_custom_target(opt-viewer DEPENDS ${files})
> ++  if(NOT LLVM_ENABLE_IDE)
> ++    add_llvm_install_targets("install-opt-viewer"
> ++                             DEPENDS opt-viewer
> ++                             COMPONENT opt-viewer)
> ++  endif()
> + endif()
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index 0d7b042958..b756b97b96 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -31,6 +31,7 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
>             file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
>             file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
>             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
> +           file://0001-opt-viewer-CMakeLists.txt-only-install-opt-viewer-if.patch;striplevel=2 \
>             "
>
>  UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
> @@ -112,10 +113,6 @@ do_install() {
>          # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
>          mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
>
> -        # Remove opt-viewer: https://llvm.org/docs/Remarks.html
> -        rm -rf ${D}${datadir}/opt-viewer
> -        rmdir ${D}${datadir}
> -
>          # reproducibility
>          sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
>  }
> @@ -125,7 +122,7 @@ do_install:class-native() {
>         install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
>  }
>
> -PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
> +PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-optviewer ${PN}-liblto"
>
>  RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
>
> @@ -149,6 +146,10 @@ FILES:${PN}-llvmhello = "\
>      ${libdir}/LLVMHello.so \
>  "
>
> +FILES:${PN}-optviewer += "\
> +    ${datadir}/opt-viewer \
> +"
> +
>  FILES:${PN}-dev += " \
>      ${libdir}/llvm-config \
>      ${libdir}/libRemarks.so \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167269): https://lists.openembedded.org/g/openembedded-core/message/167269
> Mute This Topic: https://lists.openembedded.org/mt/91943162/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

