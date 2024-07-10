Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DB3C3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 10:06:30 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.10710.1720605980524861937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 03:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MlLsQNhm;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee910d6aaeso68378941fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720605979; x=1721210779; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9wToIdyGcijzAP4zi/AC2YSVOG+DXxCyZvF3W4xqqs=;
        b=MlLsQNhmXoKCNugM8wxs1YKIcxZvL7ck4ZgOOKl8nAsX4yHbQxU739GFL76I9x1uHi
         eqY4cut8kqZQIo5fKg1pHKV9YdANLaGOzkDtRAN+9xtZC70si2W7NjOjuPevoYD3FK0F
         +PDjpFC26115F9n4bwQk7/79kXx8epkbUwVpdea9MnUGjP1mZcycACIdEO3w8f/GlbY0
         aNyDT4hA/tjT+07RJIN+hopS56EXU6xMPbYUAeQDaPVoPgn1B+8Jz6I52Zlaf/AJLBFP
         6XlokaYia6kKNVDh33mQ+o6h51NzzaXUWdPc2SVWLGL0SDkOQZMk3y7Ahm+BBrti75vc
         oTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720605979; x=1721210779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9wToIdyGcijzAP4zi/AC2YSVOG+DXxCyZvF3W4xqqs=;
        b=XrMUjfGLJqQrHKq25ki7wIflbc1hmT2P1KNfev4/AFeUFEADUulj2FQjLZF/r81LvC
         ut5YTFvQPjmB6fjUmf/qhRpmbvb/T6kmIO7Iik6CSdcox1jLX2ubxirUQCFryKioX9fq
         xO2QRhRPDc+SrQxVNqeZBae+RdKW7UgcWSyYJfn5La30ZE4xYPJFxdk1CiatSzE90rjh
         ZCAuUvgE7nDE/70n8qguUakfcPQLsXyoTzv0FtQ9lDmXLUm2lzeiGbDScg/vcRNIKILz
         Mk37rcIuJAwF8QhvOo+Fg5u949NSqozh6gkPC4BAj74+dlg3h9tQiDoQMSlu5zlG/gsj
         83Bg==
X-Gm-Message-State: AOJu0Yy+N8s+kdOtkWC0KIdV3f3zGW0mEBq4duMOvdpJc701yPDdSOW8
	N0ha909TtoP8Hid3hcKWAzaVPf80C+Yc4CyelUKMeZ2hj9Z+K6wCAMivVnsJm/uPWM17O8kxwrj
	yomh2+eq4VDgLELLOLF7JkvgHTRk=
X-Google-Smtp-Source: AGHT+IFaiKhYHhjSPhu9iUsl7WJEnOoqqOKiIn7p883xsjdFZ8DTADMpf/zorzPHAdMkJZPsvpDI+6AcAUZxhiYt5aE=
X-Received: by 2002:a2e:a16a:0:b0:2ee:84a1:9be6 with SMTP id
 38308e7fff4ca-2eeb30e50f8mr31617741fa.14.1720605978338; Wed, 10 Jul 2024
 03:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <s0O2.1720605728052853271.156O@lists.openembedded.org>
In-Reply-To: <s0O2.1720605728052853271.156O@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Jul 2024 12:06:06 +0200
Message-ID: <CANNYZj8JmJ6-xWY5MFB6NHioW2HStrb7vdxbXCg3EP8t6hEJwQ@mail.gmail.com>
Subject: Re: [OE-core] Yocto Python package upgradation from 3.10 to 3.11.5 version
To: jahnavijha14@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 10:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201729

Is your upgraded python used for both python3 and python3-native?
nativepython3 is coming from python3-native variant of the recipe, so
somehow that is still using the 3.10?

It helps if you publish the layer. It's difficult to help without
seeing what you did exactly.

Alex

On Wed, 10 Jul 2024 at 12:02, jahnavijha14 via lists.openembedded.org
<jahnavijha14=gmail.com@lists.openembedded.org> wrote:
>
> Hi,
>
> I want to upgrade the Python package version (3.10) present in yocto Kirkstone build to Python-3.11.5 version.
> For this I created my own layer and inside that have added Python recipe file for 3.11.5 version and its related files.
>
> When I bitbake the recipe for python. (bitbake python3). I encounter one error related to do_configure which says:
>
> checking for --with-build-python... configure: error: "nativepython3" has incompatible version 3.10 (expected: 3.11).
>
> How do I link my Python 3.11.5  with nativepython3?
>
> //////////////////////////////////////////////////////////////////
>
> | checking whether -lc should be explicitly linked in... no
> | checking dynamic linker characteristics... GNU/Linux ld.so
> | checking how to hardcode library paths into programs... immediate
> | checking whether stripping libraries is possible... yes
> | checking if libtool supports shared libraries... yes
> | checking whether to build shared libraries... yes
> | checking whether to build static libraries... yes
> | checking for --with-build-python... configure: error: "nativepython3" has incompatible version 3.10 (expected: 3.11)
> | NOTE: The following config.log files may provide further information.
>
> ////////////////////////////////////////////////////////////////////////
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201728): https://lists.openembedded.org/g/openembedded-core/message/201728
> Mute This Topic: https://lists.openembedded.org/mt/107139491/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

