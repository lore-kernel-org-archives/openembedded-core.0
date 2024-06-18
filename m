Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC974C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 17:46:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.752.1718732808725623770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 10:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dWVoIXt0;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cc148159dso1636272e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 10:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718732807; x=1719337607; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eghk+TwUoQMEkIHtDZRSHWZs7ZQo8mtwYmtj4ZHGV40=;
        b=dWVoIXt043fvEpAHzi0pyUo7C8vCGBly0OiVzl8MVYOLJV101DPvENWoNQCI8XgNrn
         RhKXLntE5RLZAI8qQRWW2TuyKcWmBt4gQjqeP89VY7gdmFHDfVlWxnQAkDIaxLBw8vst
         5zeJLG9Wq/i2dobNdoCFkwUnqIykKK84lKh5VLNg15s+Ra3LSF0yVpevrnG6PB3Cn/6c
         jfp22PnYNFwiaPnu2yQmD8mBEH8fEnLG8Ld4SYhwJBZqzSkO7tKUa2AIWGHL+k+mZcqF
         JHkKeD+vDtStLZqHa/Vk+zmVWfRZ/SNrNFn7rXAK9AABG67P2VmwuL+BBVMyz/BwVx/q
         qDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718732807; x=1719337607;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eghk+TwUoQMEkIHtDZRSHWZs7ZQo8mtwYmtj4ZHGV40=;
        b=PSuI/46Cb2yY8w2tUUnQBCjXy/ZV7nLNEoIpY/6xZbDfhnvl8FG2DnZXmo2iZ2CvyF
         hz3vP+OLxqCDGD7dkGeJktdSZ0fmthGA0shTjEagaRz0nFe98YxVlBL534LgU3yufGiU
         PBbC4vI8B0OoOEWmUSoFAmAKJqnZhuUqeQVOL3Of7EYoaurptcxk+XUsgv4WBQlMbsCh
         J75tKFr+DplvRHlzC20aiLRDkqPJbQ9lTbSMPUoI2BotC6wULj/by3ziAVNekiMLpilf
         bm/f0ezNG9Qgq0OqL2DN6BJonoeg/AU/nqbarDQQUaCifa0A6atF4xkRp12v138w5iiR
         kdIw==
X-Gm-Message-State: AOJu0YxDsl9NoFNuVGsLC/dDWgxYIG+73J9qpW19ps1/4B0JsPLry4L/
	vfwlKGB/SMPDTUQC4X0tojZrd8GTDfo2nN3yBhlkpNO+yy0xXIAKUHGlJdsYy/PFdzH+PckduuZ
	D4ISdBbHOVS9EUjTMwqojsk9sMtMk17Uo
X-Google-Smtp-Source: AGHT+IH1pRLJ0R4N7SZHYggbJE2187QAZvGv4Ojosih5XUjj3q06uIYFiW4mxAMErKWdcYzzLOsiGbNmBkaZm6Au2EA=
X-Received: by 2002:a19:911d:0:b0:52b:c071:f034 with SMTP id
 2adb3069b0e04-52ccaa98b97mr167300e87.60.1718732806437; Tue, 18 Jun 2024
 10:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9qC_iWAgqr29Jgx_QfuQDVBy_-e6KDKnOoN86WQn5ZBQ@mail.gmail.com>
In-Reply-To: <CAK5yBb9qC_iWAgqr29Jgx_QfuQDVBy_-e6KDKnOoN86WQn5ZBQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Jun 2024 19:46:42 +0200
Message-ID: <CANNYZj9MSAhmxtMYJij2LHU7zEmbJb3tXf2yBcOyd-60tOO7UQ@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 18 June 2024 (WW25)
To: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 17:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200881

On Tue, 18 Jun 2024 at 17:01, Stephen Jolley via
lists.openembedded.org
<sjolley.yp.pm=gmail.com@lists.openembedded.org> wrote:
> Patches in the Pending State: 205 (19%) [last week 205 (19%)]
>
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/

I've been (gently) triaging Pending patches, collecting the fixes here:
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/misc-fixes
and sending them to oe-core in manageable batches. In that branch,
there's just 180 pending patches now.

Making oe-core pending-free is within reach, but there's a group of
toolchain recipes with significant amounts of 'pending' that I had to
skip due to insufficient knowledge of what the patches do, and how to
drive their upstream submission. These are:

binutils
glibc
gcc
gdb
musl
libunwind
elfutils
valgrind

So if specialists in these, particularly Khem, can help me out, this
would be much appreciated. The less pending stuff we have, the
smoother the version updates are going to be in the medium to longer
term, for one thing.

Alex

