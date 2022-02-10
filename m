Return-Path: <mans.zigher@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B846C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 12:35:13 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web08.9344.1644496511843577080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 04:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JTcplGeS;
 spf=pass (domain: gmail.com, ip: 209.85.217.52,
 mailfrom: mans.zigher@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id t22so6198692vsa.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 04:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tOmgjdQIIMl21NQL/W84Pv+Bf+cKWlYxfsrBMIT4FDw=;
        b=JTcplGeSUF3oXFAjOEcvoPrvpR3xMu6CkTwQ80iqktbsc15IcGhHorwjGJmuFEYab9
         /NpxTU9pmUdF5Q78+v0yjEF3aBGwzxPky6mk3xQdAucC8j1b/P/PlYrCtxETeeEru+if
         NipKcmcSTBAYNDyp6jasoZAoYpkNwGeIEgQgIB0GIMW/gdFbG7FMAegFisQ212PO3v4n
         ZF7jew69Y+v7T5UbrqeWNq6rmqUDTDjdMDmHHeo/NCFTv70aUsHyLWvJbFptejS05VP1
         OdFq4s8n76dp5dgcnop5yfVQNcyLouxAjEkSQzKiXn6vmjBfScXDbSqFM8e2q1YpfJGd
         Hpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tOmgjdQIIMl21NQL/W84Pv+Bf+cKWlYxfsrBMIT4FDw=;
        b=yWS0hFVi3v47vZPjDMNKFvYl+57bRHMccMBuGXlL+Cx3lgb1ebUBqu7GZqea7UVk63
         n4CX6/cJWYoBoLFc6nKHx7Il4NhdR09fDSwwBGvtHBOvw8ft9gTQeOcHb9xb62mJrJEI
         bUruufT73NsBL8MFiDGq9gZVNz4SP8+1lZDInrr3sbMBvzu8KUch9AaCEm6nzz7HztwJ
         tIbnnSX/tWCKSveGPrh6hpHV8pg/tqPOo0WH1Pzihw7VIPhJEuTICV1yZ2dAxIl0DfK7
         lqicXCC+aGto7dBIIoEApoOTVcDOU65H1FLpWpnajz3ZhUfKU0CdNCCuliyxkvUZZ4xt
         JSZQ==
X-Gm-Message-State: AOAM533Ps6TI/PCuipUMKUW1I0lR1bB0UiWvR2wl/h3O+nlZ5dkcScFV
	5LzDQlHvPSy4mCZAVWRw4r2yy/d3EpqktN6XcdU=
X-Google-Smtp-Source: 
 ABdhPJyiJ2Rs/gPlrSEk9/MpMSF3qX+m01HjqivjF6H5rGK1zyNRIhVLrSOEP2BhoE9t//uSakiwBy4FiIbEyoW+8hE=
X-Received: by 2002:a67:7185:: with SMTP id m127mr1548316vsc.4.1644496510833;
 Thu, 10 Feb 2022 04:35:10 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAEhQi8kj1kqd6cdG-1LOrmVJ75nR4W47wsa3b5r0RkwmyQho3g@mail.gmail.com>
 <CAMKF1sqBH1K0syKq+nNeM_ppsVC6qpbivvpzz286ez_2Yb=Lfg@mail.gmail.com>
 <16D269E7B2ADA751.11771@lists.openembedded.org>
In-Reply-To: <16D269E7B2ADA751.11771@lists.openembedded.org>
From: =?UTF-8?B?TcOlbnM=?= <mans.zigher@gmail.com>
Date: Thu, 10 Feb 2022 13:34:59 +0100
Message-ID: 
 <CAEhQi8n-_BEPMYhvx1vpJg79rnfUC8BOqOaVwhAbd5eaxxyUpA@mail.gmail.com>
Subject: Re: [OE-core] Missing python.h when building ntpsec
To: mans <mans.zigher@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 12:35:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161612

For anyone stumbling on this issue the solution is to adjust the
recipe to contain

CFLAGS_append = " -I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}/"

instead of

CFLAGS_append = " -I${PYTHON_INCLUDE_DIR}"


Den tors 10 feb. 2022 kl 12:40 skrev Mans Zigher via
lists.openembedded.org <mans.zigher=gmail.com@lists.openembedded.org>:
>
> Hi,
>
> So Python.h does actually exist. It was just me that was looking for
> the wrong file python.h but the issue is that ntpsec is not able to
> find the h-file
>
> ['arm-oe-linux-gnueabi-gcc', '-march=armv7-a', '-mfpu=neon',
> '-mfloat-abi=hard', '-fstack-protector-strong', '-pie', '-fPIE',
> '-D_FORTIFY_SOURCE=2', '-Wa,--noexecstack', '-Wformat',
> '-Wformat-security', '-Werror=format-security',
> '--sysroot=/home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/recipe-sysroot',
> '-DUNITY_EXCLUDE_FLOAT_PRINT', '-fstack-protector-all', '-Wshadow',
> '-Wpacked', '-Wcast-qual', '-Wmissing-declarations',
> '-Wdisabled-optimization', '-Wimplicit-function-declaration',
> '-Winvalid-pch', '-Wpointer-arith', '-Wwrite-strings', '-Winit-self',
> '-Wfloat-equal', '-Wformat', '-Wformat-signedness',
> '-Wformat-security', '-Wsuggest-attribute=noreturn', '-fPIC', '-O1',
> '-Wall', '-Wextra', '-Wmissing-prototypes', '-Wstrict-prototypes',
> '-Wundef', '-Wunused', '-g', '-O2', '-Wa,--noexecstack',
> '-fexpensive-optimizations', '-frename-registers', '-ftree-vectorize',
> '-finline-functions', '-finline-limit=64',
> '-Wno-error=maybe-uninitialized', '-Wno-error=unused-result',
> '-fno-omit-frame-pointer', '-DTARGET_ION_ABI_VERSION=2',
> '-I${PYTHON_INCLUDE_DIR}', '-fPIC', '../../test.c', '-c',
> '-o/home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/build/.conf_check_d3b505aa7ab58576b6d76a2fc3091b1f/testbuild/main/test.c.1.o']
> err: ../../test.c:2:10: fatal error: Python.h: No such file or directory
>  #include <Python.h>
>           ^~~~~~~~~~
> compilation terminated.
>
> from /home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/pylib:
> Test does not build: Traceback (most recent call last):
>   File "/home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/.waf-2.0.20-36f5354d605298f6a89c09e0c7ef6c1d/waflib/Configure.py",
> line 335, in run_build
>     bld.compile()
>   File "/home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/.waf-2.0.20-36f5354d605298f6a89c09e0c7ef6c1d/waflib/Build.py",
> line 176, in compile
>     raise Errors.BuildError(self.producer.error)
> BuildError: Build failed
>  -> task in 'testprog' failed with exit status 1 (run with -v to
> display more information)
>
> Could not build python extensions
> from /home/extmzigher/Workspace/2016platform/python_product/builds/python/tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/ntpsec/1.2.1-r0/ntpsec-1.2.1/pylib
>
> So something is not correct with the include path. But thanks for your help
>
> Thanks,
>
>
> Den ons 9 feb. 2022 kl 18:51 skrev Khem Raj <raj.khem@gmail.com>:
> >
> > On Wed, Feb 9, 2022 at 5:50 AM Mans Zigher <mans.zigher@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > I am trying to backport ntpsec from master to Thud but I have
> > > encountered an issue where python.h is missing in the sysroot for the
> > > ntpsec so the configuration task is failing. The ntpsec recipe has
> > >
> > > DEPENDS += "bison-native \
> > >             openssl \
> > >             python3"
> > >
> > > So should that not result in python.h being included to the sysroot
> > > for the ntpsec? Any hints on what to look for?
> > >
> >
> > what happens if you change python3 to python in depends
> >
> > > Thanks,
> > >
> > >
> > >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161608): https://lists.openembedded.org/g/openembedded-core/message/161608
> Mute This Topic: https://lists.openembedded.org/mt/89021393/3617459
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mans.zigher@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

