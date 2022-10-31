Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D039AFA3744
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 22:17:20 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web12.2276.1667254637608033428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 15:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P6Hgs4iO;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id p8so21267709lfu.11
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AF2eSnGq17sMP7PEUWX+ZCsArnLZrAFKy4EyMudHurs=;
        b=P6Hgs4iOPoGezY6CpBogGlePkR+x3KQhsaRYl1Lc0m1IgShlF1q2LK7Pu3oJzemWSL
         bZJVR8AxnP4nneywUTB/9qdJKTuD/jNeA39iJuPuypt6QcvUwjmofqM4TlgRxXvMPI4E
         C97oCOOWBgRp9lB8hmk0LI64jvTuiTz6L1i7R5OialhxZ0M7z4xHIveGBfEFb+4YS2dx
         +oopWg853UoOyxJKJqPvaxKVRK//HaRbOtIfsBbM7vTyTvcPC3wDGh/VIjykl746MELk
         CEvItR0J3KhX9Xnjdpkr35cB6yl8WU11SEeTC56NbZSwlZTs3ccY0GEhIEksE3DQALRi
         hKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AF2eSnGq17sMP7PEUWX+ZCsArnLZrAFKy4EyMudHurs=;
        b=REcVhGCRAiuPVPhPEvC8m9DvDXlfGv6hh/pWV9lOryG+ZIHozYfYBxZGRNtaXkEaYU
         W0EOPanuNcpZNMsidnGzjeWBW1PaosKtS3/Jjbfhnoa+T1Za4LfqYrfKUNB/3LlIc8zj
         uHYDT/OI3XimyWuD9G6sCF3B8HBA0VgbPh7u2nFcruuuTfwJilj+sb+pJLRV6XHa0PgA
         99o3xpc9hx3dEPhQIUq/hLdNhi3veye4r28s48hFXzJ2gWK7S4IAzVcPenREkzaKdy+a
         H7S9zCf0Zup4Xl53/f3W0xmumEO878e6ai/YHF2hfpuA+z2l5jYWW1TqqZF/KGWXl+rl
         yVWA==
X-Gm-Message-State: ACrzQf1NSQts5gqmpGIkxfvz8lNiaCX/KkgjcjETVZAqszE9vJ9A+W5t
	/u5z04T4TqHzJhHuTZ1DHIkbvwmk3LN8WkWw17c=
X-Google-Smtp-Source: AMsMyM7OP3H5n1msC5khxos+PktBtiFJjteMy/zIPPvrm+yh6hxGNLSxYVAx2sfvnxth/ZPHy/Yk5K5wcQUEJZ4QPxw=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr6382150lfv.131.1667254635980; Mon, 31
 Oct 2022 15:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221031114719.2725967-1-alex@linutronix.de> <20221031114719.2725967-12-alex@linutronix.de>
 <cb0b4ef0e5b5d7665e4182e17f48006ab32dbd65.camel@linuxfoundation.org>
In-Reply-To: <cb0b4ef0e5b5d7665e4182e17f48006ab32dbd65.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Oct 2022 23:17:04 +0100
Message-ID: <CANNYZj_sufZoP8VDXAPCtH0-KCZ_XcPQaf5_mQgvuEDYJ0NJsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/13] go: submit patch upstream
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 22:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172345

On Mon, 31 Oct 2022 at 22:55, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I did sort that, I'm not sure I quite wanted to get into a larger
> discussion on how to do it properly and to rewrite the patch and run
> more tests though...

I wasn't inspired by those review comments either, perhaps we can
convince upstream to take the existing patch as a 'bug report' and
leave the actual fix to them.

Alex

