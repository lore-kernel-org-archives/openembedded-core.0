Return-Path: <mans.zigher@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B661AC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 11:40:58 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web09.8946.1644493257304550640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rd7C0Tms;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: mans.zigher@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id n14so2870170vkk.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YOwuHYBiuPTotmvTDdH1BD4EGpS6k2mwbAU3Tp9POpU=;
        b=Rd7C0Tms2YKOKCDs/5DZeOCERYXx1Gy5iKaMmcHhqiFmfuk/Kjm41XtAREFquwrgfM
         zWmHBHIJtO0bAu2RLDOepOh36ykLZPB2jXNXZgxStqiUupq2H4m//MfyTwydSfcFVEp2
         bHKxFgzT+j0OT0lULAYz6YKR3Kou0LY0ziHEjoVeLj1BrV9NV6UmT1jCpHI3VWG8W1mO
         zQSwRO3YrIXV8FZqDmMb49SrGDWdkis8pcSOP5tHTzKH3oTKSTQV00PzUXXtHAE6Crpp
         VxVXPQJ1lGIVhukroyWh5BUoGWBM+mi0VO3XGpyfeP7/mFCsV2jgZyS0fhXEsrpcseVG
         /Q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YOwuHYBiuPTotmvTDdH1BD4EGpS6k2mwbAU3Tp9POpU=;
        b=1FPAjwa2MWpPnCX2AgNT2znVmj2Ibc6DUoGO/gYx40xjqqGkFUBQfhRtG/8cDf80ad
         bgrWV1Sn5QOs4n7fXZ3+tkj18XYPVueQHTKShWD9TRtXviQUHRXofweBZ2KQ5g/tInhG
         wG9FHGkHYKAtQlh405fak6l6fTh2vH93cw4fviGb0ln/piU8XMhJE0m/EYJddNwVvagq
         MrYdA5Ms8y7mTu7cMm3FKueODt1wlAhqpqjwTd90yaOZlcyyICVv6usDy5GgqjoASW5C
         Q0lIfw7pbu/lETQe4dizB7cT3hMHCDUiFYvOtSKt3opjX8YFCoIfVYEYQ0aTPGJJcC+J
         kE3g==
X-Gm-Message-State: AOAM531Iej9MvrAVCWb8MNuJPnHpEltvYuSH+hJPDfDtu10/wr/QamAd
	gNsT7Z+CmJhk0/oZDAF+7NyC4nryDul9QwbIzcU=
X-Google-Smtp-Source: 
 ABdhPJwUNFkCBB4zAZILK3sZucswCXKsz0T+v2WCXvlR/5gR+qMbqspgmt1YBk8Sh/vBLtODpgeEudriCHZdvCqQ5PQ=
X-Received: by 2002:a05:6122:883:: with SMTP id
 3mr2470775vkf.38.1644493256304;
 Thu, 10 Feb 2022 03:40:56 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAEhQi8kj1kqd6cdG-1LOrmVJ75nR4W47wsa3b5r0RkwmyQho3g@mail.gmail.com>
 <CAMKF1sqBH1K0syKq+nNeM_ppsVC6qpbivvpzz286ez_2Yb=Lfg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqBH1K0syKq+nNeM_ppsVC6qpbivvpzz286ez_2Yb=Lfg@mail.gmail.com>
From: =?UTF-8?B?TcOlbnM=?= <mans.zigher@gmail.com>
Date: Thu, 10 Feb 2022 12:40:44 +0100
Message-ID: 
 <CAEhQi8=aNJpbocsYBJJ=RNbTVDxns6ZTPPcf0MCq9h0kgm=LMw@mail.gmail.com>
Subject: Re: [OE-core] Missing python.h when building ntpsec
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 11:40:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161608

Hi,

So Python.h does actually exist. It was just me that was looking for
the wrong file python.h but the issue is that ntpsec is not able to
find the h-file

['arm-oe-linux-gnueabi-gcc', '-march=armv7-a', '-mfpu=neon',
'-mfloat-abi=hard', '-fstack-protector-strong', '-pie', '-fPIE',
'-D_FORTIFY_SOURCE=2', '-Wa,--noexecstack', '-Wformat',
'-Wformat-security', '-Werror=format-security',
'--sysroot=/home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/recipe-sysroot',
'-DUNITY_EXCLUDE_FLOAT_PRINT', '-fstack-protector-all', '-Wshadow',
'-Wpacked', '-Wcast-qual', '-Wmissing-declarations',
'-Wdisabled-optimization', '-Wimplicit-function-declaration',
'-Winvalid-pch', '-Wpointer-arith', '-Wwrite-strings', '-Winit-self',
'-Wfloat-equal', '-Wformat', '-Wformat-signedness',
'-Wformat-security', '-Wsuggest-attribute=noreturn', '-fPIC', '-O1',
'-Wall', '-Wextra', '-Wmissing-prototypes', '-Wstrict-prototypes',
'-Wundef', '-Wunused', '-g', '-O2', '-Wa,--noexecstack',
'-fexpensive-optimizations', '-frename-registers', '-ftree-vectorize',
'-finline-functions', '-finline-limit=64',
'-Wno-error=maybe-uninitialized', '-Wno-error=unused-result',
'-fno-omit-frame-pointer', '-DTARGET_ION_ABI_VERSION=2',
'-I${PYTHON_INCLUDE_DIR}', '-fPIC', '../../test.c', '-c',
'-o/home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/build/.conf_check_d3b505aa7ab58576b6d76a2fc3091b1f/testbuild/main/test.c.1.o']
err: ../../test.c:2:10: fatal error: Python.h: No such file or directory
 #include <Python.h>
          ^~~~~~~~~~
compilation terminated.

from /home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/pylib:
Test does not build: Traceback (most recent call last):
  File "/home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/.waf-2.0.20-36f5354d605298f6a89c09e0c7ef6c1d/waflib/Configure.py",
line 335, in run_build
    bld.compile()
  File "/home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/.waf-2.0.20-36f5354d605298f6a89c09e0c7ef6c1d/waflib/Build.py",
line 176, in compile
    raise Errors.BuildError(self.producer.error)
BuildError: Build failed
 -> task in 'testprog' failed with exit status 1 (run with -v to
display more information)

Could not build python extensions
from /home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/pylib

So something is not correct with the include path. But thanks for your help

Thanks,


Den ons 9 feb. 2022 kl 18:51 skrev Khem Raj <raj.khem@gmail.com>:
>
> On Wed, Feb 9, 2022 at 5:50 AM Mans Zigher <mans.zigher@gmail.com> wrote:
> >
> > Hi,
> >
> > I am trying to backport ntpsec from master to Thud but I have
> > encountered an issue where python.h is missing in the sysroot for the
> > ntpsec so the configuration task is failing. The ntpsec recipe has
> >
> > DEPENDS += "bison-native \
> >             openssl \
> >             python3"
> >
> > So should that not result in python.h being included to the sysroot
> > for the ntpsec? Any hints on what to look for?
> >
>
> what happens if you change python3 to python in depends
>
> > Thanks,
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161562): https://lists.openembedded.org/g/openembedded-core/message/161562
> > Mute This Topic: https://lists.openembedded.org/mt/89021393/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

