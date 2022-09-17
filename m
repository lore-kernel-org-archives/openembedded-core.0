Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F172ECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 16:38:45 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.328.1663432721563961782
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 09:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gHPkqBiX;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so56433843fac.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yFOgoWWx+jTLs58FaZTrO6eBqExGYmq+eKr1IiJNifA=;
        b=gHPkqBiXWn1GgMP+HkYgjaAx1TpxP7vcfYCRam1my3j28qTCH+5fNKe26QdHtRUwjw
         E/i/CQLVlEc4Q95qb2CYAS9WpY5JJoR1pfoyiWmaSZx8qK9E3Bfof+AZrLrljigJQPUR
         Rg8uXJ8MXmlLsQPtRrgvI/xpJxF2ss3cRRgiCgeM/o8HJoCdtRWANv87+gjDyhhYumAI
         oYiYVW4EHk1Rz/E13+0gAWNRxHXnsOu6Q8UybIkLUYfe8RRafqoa6BaQaMgOUEABXUyL
         jpO8EZRj0FbP182eVOkregQs91cy9zA48kRNCE5Dwvh4Cckw0MtnovXAC+7lb6VujBhR
         CIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yFOgoWWx+jTLs58FaZTrO6eBqExGYmq+eKr1IiJNifA=;
        b=6OwCXYmusdns1Ly67QxABSix2rPJOXLdvLKSq9fi4NfqQboD4ovl1wjmX8Kl0HnBLt
         W3hgMjl1xcrCkZLBFXxh7WssDsMv+p7qprKGkvDW5XiPvKVavLinX0oMLUcIqZRQ1pxx
         yUG99EH7UmJG1EDZO41H0AWO0pmPOE5oKgn16kgumUBh4+X45IWt4Ets7H5vuSDT3vai
         EiVqdk/jC4wBQVpp6ynh3FLUNkaMOFycWVYGfaVLGXFRk8BeybVpLjfLJ8Cb2RUEu7sh
         fQYBO1FNRV2QVqGxvXEe2Vii2uy+Fe8mWl5k3x0fznyjf94Z/6Ei+2WNz5BlcHzcJIVN
         40+w==
X-Gm-Message-State: ACrzQf2xfBfGoo7j8m4wZYu52PVkcfcnT75acnTJCV2URXE4k/lbHaNJ
	wU1d9MjqdYs2HZUZaknK65CuIaSDegnEig+Uffo=
X-Google-Smtp-Source: 
 AMsMyM7186MGj/QyqacgpBiHegmdbMQqbOjFDHEJ2aLtI1YY4FEPjlz0AVG6kXxhWQ1Zdqft1fGeKNXUfrmqf7XNSFM=
X-Received: by 2002:a05:6870:9107:b0:12c:e448:c5fd with SMTP id
 o7-20020a056870910700b0012ce448c5fdmr510oae.55.1663432720791; Sat, 17 Sep
 2022 09:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220917115642.766941-1-andrey.konovalov@linaro.org>
In-Reply-To: <20220917115642.766941-1-andrey.konovalov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Sep 2022 09:38:14 -0700
Message-ID: 
 <CAMKF1srKXtQ=oJX+tz6_EWC=d_CjPmxSvnA5SFHiYDfU3MJu1g@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 0/1] mesa: clover | Microsoft/Intel CLC:
 fix building OpenCL programs
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 16:38:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170840

On Sat, Sep 17, 2022 at 4:56 AM Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> This fixes the errors like:
>
> -----8<-----
> dragonboard-845c:~$ clinfo
> <snip>
>    Max work group size                             1024
> === CL_PROGRAM_BUILD_LOG ===
> <built-in>:1:10: fatal error: 'opencl-c.h' file not found
>    Preferred work group size multiple (kernel)     <getWGsizes:1504: create ker>
>    Preferred / native vector sizes
>      char                                                16 / 16
> <snip>
> -----8<-----
>
> Here clinfo runs on target board and produces correct output except for
> the "Preferred work group size multiple (kernel)" item. This is the only
> item which requires clinfo to build and run a small OpenCL kernel. But
> building OpenCL program fails as clover can't find the include file.
>
> The reason is that the include search path is set at mesa build time by
> setting CLANG_RESOURCE_DIR to "$(llvm-config --libdir)something" and
> passing it in cpp args. This results in path to sysroot included into
> CLANG_RESOURCE_DIR:
>
> -----8<-----
> dragonboard-845c:~$ strace clinfo 2>&1|grep include
> newfstatat(AT_FDCWD, "/workdir/master.test/build-rpb/tmp-rpb-glibc/work/armv8-2>
> newfstatat(AT_FDCWD, "/usr/local/include", 0xfffffc3bad68, 0) = -1 ENOENT (No s>
> newfstatat(AT_FDCWD, "/workdir/master.test/build-rpb/tmp-rpb-glibc/work/armv8-2>
> newfstatat(AT_FDCWD, "/usr/include", {st_mode=S_IFDIR|0755, st_size=12288, ...}>
> openat(AT_FDCWD, "/usr/include/opencl-c.h", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No>
> -----8<-----
>
> Hence clover fails to locate /usr/lib/clang/14.0.6/include/opencl-c.h.
>
> Microsoft/Intel CLC *should* have the same problem, as the code in
> compiler/clc/clc_helpers.cpp is pretty close to the one in
> gallium/frontends/clover/llvm/invocation.cpp. Except for the case when
> the contents of opencl-c.h is compiled into the CLC library (seems to be
> the most common configuration for Windows), and the problem with locating
> the include file on the target fs doesn't exist.
>
> This patch is RFC for two reasons:
> * I am not sure if using hardcoded "/usr/lib" is good enough
> * The compiler/clc/clc_helpers.cpp part is not tested. Maybe splitting
>   the patch into two - the clover and the Microsoft/Intel CLC parts separated -
>   would make more sense.
>
> Last note for those to try reproducing the build with clover:
> clover uses libclc from meta-clang. meta-clang master branch has moved to
> clang 15.0.0 recently, which breaks mesa build as the mesa fixes to account
> for clang 15.0.0 changes have been merged into mesa main branch, but have not
> yet made it into the last mesa release.
> My temporary solution is rolling meta-clang back to the commit just before the
> 14.0.6 -> 15.0.0 update, and cherry-picking "llvm-config: Replace TARGET_*
> flags with normal equivalent flags". The latter is not required in my case,
> it just makes llvm-config wrapper from meta-clang (the one used in this build)
> to look closer to the llvm-config wrapper from oe-core.
>
> Andrey Konovalov (1):
>   mesa: fix building OpenCL programs
>
>  ...-meson.CLANG_RESOURCE_DIR-workaround.patch | 42 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
>

I am not able to find the patch with above changes. Did you miss sending it ?


> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170827): https://lists.openembedded.org/g/openembedded-core/message/170827
> Mute This Topic: https://lists.openembedded.org/mt/93741464/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

