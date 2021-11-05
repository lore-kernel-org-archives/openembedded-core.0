Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA408C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 11:19:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.4157.1636111150881495773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 04:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eP2BAnvG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso9292640wmd.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 04:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6u2s7NHaIT3w8SK/n+FQrO5v8ZO3C+G7DXugN1kDqyQ=;
        b=eP2BAnvG8SP4MjQuZ0T1cC+4eRri/hrT4QH5+urCyJ2bX/+9h7rhsPpq4EtDD7grAk
         tttdYzA9gijmfoiFVw6ued8sxJp4Pa5hugIohPJIHckbp1bGg31WHd1CG//m2RMZZcCS
         bN0jkahNpBdb2bwzQKWMjMdnM0KpoZNMOTs08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6u2s7NHaIT3w8SK/n+FQrO5v8ZO3C+G7DXugN1kDqyQ=;
        b=Oim+8wSlJlgGimSXTti3c96R7eONa2QRbkTchD3XK6eJHbs7tPpxvd15xEwLi9Jw6u
         b7mEG60Ku9pHmzSMboCQXHyzAncpLvl++QiIX1foZM//Y4kkoB5bmcM7qOcRY5x96l+4
         3xZJwsVxAomgVxErWXGQK2Uc6Sntgx5FaQUqpRMcY76FccYAv8RWbxZ5ZCYrLI+GeoKY
         7LxWAvi+iauA3QiZir7KABCr+bVa4JL2ArTtoByHRiqJ2x9N/MDQRjyyeE4UAvayeil5
         eQXAfG+iRDdMDdaBvMLYYOn6VoR54s1zM52DQoMg3z3HWCph4OYTNYO99w9YJGFnRju6
         hnfw==
X-Gm-Message-State: AOAM530nua2t5Xgy9Bdlbl5ZdsqWQ39J5NCwq2YUx26LSJUQuY6L8whT
	jEGGWJStV1OcKi7frY1BZPkNCw==
X-Google-Smtp-Source: 
 ABdhPJymCsuPbMGCrIt1RhMRVcwMgyjUW7WRXFHtkxNOp+stlno1tbPVi57+8RK6WPJhoM1al09eqQ==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr30564454wmj.30.1636111149338;
        Fri, 05 Nov 2021 04:19:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:38e6:15ea:3134:28e5?
 ([2001:8b0:aba:5f3c:38e6:15ea:3134:28e5])
        by smtp.gmail.com with ESMTPSA id
 p12sm9310259wrr.10.2021.11.05.04.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 04:19:09 -0700 (PDT)
Message-ID: 
 <4f0010a081d65b32d7f883aa1c04fb696884200c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] gdb: Upgrade to 11.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
  Joshua Watt <JPEWhacker@gmail.com>
Date: Fri, 05 Nov 2021 11:19:08 +0000
In-Reply-To: <20211104013024.3517635-1-raj.khem@gmail.com>
References: <20211104013024.3517635-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 11:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157890

On Wed, 2021-11-03 at 18:30 -0700, Khem Raj wrote:
> Drop backported patches
> Changes are here [1]
> 
> [1] https://sourceware.org/pipermail/gdb-announce/2021/000129.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  .../gdb/{gdb-10.2.inc => gdb-11.1.inc}        |  14 +-
>  ...ian_10.2.bb => gdb-cross-canadian_11.1.bb} |   0
>  .../{gdb-cross_10.2.bb => gdb-cross_11.1.bb}  |   0
>  ...make-man-install-relative-to-DESTDIR.patch |  20 +-
>  ...ux-nat-Define-_ABIO32-if-not-defined.patch |   8 +-
>  ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  10 +-
>  ...port-for-Renesas-SH-sh4-architecture.patch |  39 +-
>  ...readline.a-when-using-disable-static.patch |  12 +-
>  .../gdb/gdb/0006-use-asm-sgidefs.h.patch      |   8 +-
>  ...atch => 0007-Change-order-of-CFLAGS.patch} |  12 +-
>  ...8-resolve-restrict-keyword-conflict.patch} |   8 +-
>  ...> 0009-Fix-invalid-sigprocmask-call.patch} |   8 +-
>  ...h => 0010-gdbserver-ctrl-c-handling.patch} |  10 +-
>  ...-arc-Add-support-for-signal-handlers.patch | 218 ---------
>  ...-for-signal-frames-for-Linux-targets.patch | 232 ----------
>  ...count-the-REGNUM-in-supply-collect-g.patch | 104 -----
>  ...-native-support-for-ARC-in-GNU-Linux.patch | 414 ------------------
>  .../gdb/{gdb_10.2.bb => gdb_11.1.bb}          |   0
>  19 files changed, 74 insertions(+), 1045 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-10.2.inc => gdb-11.1.inc} (56%)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_10.2.bb => gdb-cross-canadian_11.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_10.2.bb => gdb-cross_11.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/gdb/{0008-Change-order-of-CFLAGS.patch => 0007-Change-order-of-CFLAGS.patch} (75%)
>  rename meta/recipes-devtools/gdb/gdb/{0009-resolve-restrict-keyword-conflict.patch => 0008-resolve-restrict-keyword-conflict.patch} (91%)
>  rename meta/recipes-devtools/gdb/gdb/{0010-Fix-invalid-sigprocmask-call.patch => 0009-Fix-invalid-sigprocmask-call.patch} (90%)
>  rename meta/recipes-devtools/gdb/gdb/{0011-gdbserver-ctrl-c-handling.patch => 0010-gdbserver-ctrl-c-handling.patch} (82%)
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch
>  rename meta/recipes-devtools/gdb/{gdb_10.2.bb => gdb_11.1.bb} (100%)

Breaks on mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299

Cheers,

Richard


