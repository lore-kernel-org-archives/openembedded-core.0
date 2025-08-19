Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47CACA0EF8
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 09:43:12 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.10164.1755596588682528744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 02:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dN4fm5p2;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70a928ad710so40061126d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755596588; x=1756201388; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VBRUE8a2XavcR+7d2IT5XpTVKaBmDy3kaBu827QNKbY=;
        b=dN4fm5p2SuiEiS4s0d2HQp64ugLEkPYOX+T08d9oywnK+j8raHtPUBj3T5anSqm9FB
         oBaMohN9yQj9T4e6soduC1ZWc0djFtsobdHrAGxZzOyNWjfbRdUjj+riYPvH7W7Lbvwf
         xrDXJNex7psq1vnNzvE84mTAWmRLnN+EOLBKawd2MjEXZfh9DqkJT5eLaRj4Rpa8o0wq
         yFb8yYSz9wK8DYAwmQKSEHm5yTxLdR8rO7kXCJxVX6x6EqY+rfsMqvNu+q1KvoqKTB/8
         Si9L3nC8hBMPr6qztV42xLXhLlFVc4qfL4VsRHNONrfecSBOp8JcYwpd2FDWCS1iBBfY
         rh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596588; x=1756201388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBRUE8a2XavcR+7d2IT5XpTVKaBmDy3kaBu827QNKbY=;
        b=OAqMcRlfO/pLIJlRePp1K63KgNVIziPNNBixXwbSJKvGVg7Ut0myL/LUx3YF5/kxE5
         jTu69Eu2Gt1elaQ1I+G7SRWMCMihFmMRIDVO9sml7+9gzRG22s8HRl5Twu9DfP+U0was
         N3G6Yc+Bi5Us4vU8mk27aUHa2ib79hWAuvPjBTGgMP5OBcSakHu3OlgCOTKFlBtL+0n0
         Ovol/mJi3+trD/EGsdFukW6ZmdM0bKrSQdgcXz8XSlfsts1xq8JMJV3HztFTqvXUCPaO
         +ybeyvmkYiQcEBYES6sqjU08I3b69RAtc3CQFYz8g4BjYxg19KhiBqR5ZlXrTb+fLNsi
         mBbA==
X-Gm-Message-State: AOJu0Yxnpsahvp1emaBxtY2etOp0JlZbHuaV/lpTORg9maUluLZRCRUX
	pn/c9aGydmKK7ETsEEJ9cwpQAzMF+KjKfWmMdUeMFhl/3uxaMCuMw6ehR0Q7X+LemDQ4hdo42nc
	QsFX7jjgUM1v8gE+dlbLzaHaL4bKew4U=
X-Gm-Gg: ASbGncsiDmNXe/23NOZeKLPk9k8kM1EfbR9Ju4+MDMl81h8GWLob7D8QS/yyzU4qQET
	T+ylBCboS/5RT1EyhKbZ3sssEWRmpNZ2tyyzCehwxALmDZOykqTte2p4D+AmFPLS5+6mqIYk7kz
	4yQ+ECVqTTEbuYlV6y7rslf1P4tzrx3UbfBXFB1SlsiLeyNHZstXNcgwsKGB8oRFbx6ywY56UaE
	O45RONDqiyPXy8uEw4Yy1PxaavVf2dBFwcroKo85jdhhbqsmsny
X-Google-Smtp-Source: AGHT+IEC4up9ErhVMXH8BSWrf+MtZbqn+pl1jCbdK2lRyGEa0O3l+BOTKYjEk0GKGtBPLF0LSK6+10okP53NRkJOSc0=
X-Received: by 2002:a05:6214:410e:b0:707:5633:d702 with SMTP id
 6a1803df08f44-70c2b6da85fmr18513246d6.9.1755596587645; Tue, 19 Aug 2025
 02:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org> <CANNYZj8e=BpGeFryh0+bn6sRT2jFRjJ=n=kwdVHMEaTx9YG00w@mail.gmail.com>
In-Reply-To: <CANNYZj8e=BpGeFryh0+bn6sRT2jFRjJ=n=kwdVHMEaTx9YG00w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Aug 2025 11:42:56 +0200
X-Gm-Features: Ac12FXx3rRCwpdh5ZYsE7Vn4SJA7AyBA3hbwGFZ6yQ9QuMSp5YDcrRNMwwz-nyo
Message-ID: <CANNYZj_PJgweyLaffD0h+8DZUHXY3hMkKv7RmkWNn857wGptcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "qemux86-64: Reduce tuning to core2-64"
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	docs <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222094

On Mon, 11 Aug 2025 at 11:25, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Mon, 11 Aug 2025 at 00:25, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> >
> > This was originally applied as our autobuilder had older hardware and couldn't
> > cope with the newer settings. This has been resolved in the new cluster so we
> > can go back to the newer tuning, which software is now more likely to need.
>
> The other reason was that qemu's TCG implementation of these v3
> instructions back then was very new and had subtle bugs which have
> since been fixed.
>
> This change merits a mention in release notes:
>
> ======
> qemux86-64 MACHINE now defaults to x86-64-v3 micro-architecture level
>
> The previous default was Core 2 era processors. This change means that
> the toolchain is configured to build for that level, and qemu is
> configured to emulate it.
>
> v3 level adds support for AVX/AVX2/BMI/BMI2/F16C and other newer
> instructions which are seeing increasing usage in modern software and
> add performance benefits. Please see
> https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels for
> definition of the levels and lists of Intel/AMD CPUs where support for
> the instructions was first added.
>
> Note that if qemu system emulation is used on an x86 build machine
> with kvm enabled, then the build machine's CPU must also be recent
> enough to support these instructions natively.
> ======


The change has now merged, so the above can be added to the docs too.

Alex

