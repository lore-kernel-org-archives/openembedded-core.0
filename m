Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117EBC433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 10:27:17 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.49816.1638786431347862455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 02:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=TnHGh+d+;
 spf=pass (domain: burtonini.com, ip: 209.85.128.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f54.google.com with SMTP id y196so7711530wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 02:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QX3CSipVYGEn0LiXaKhELdjoWziqGs6CXvG0r9dV5a4=;
        b=TnHGh+d+VJKKThOk6BrQayWINfoHMed6EqUMzm1DR+lO7263HScuiPkVWrI07sihsI
         y21Y3KQ38PRYlRah/tYRcEoBiWfEV8kv9F9Nvly/uxf6AeAw+cUGwYHClodxbiDACt+w
         9OOUBm/yNFCj1Iub467oamzNfia2Qp4XEpdJPCV+w3HPKhXretrS60RUBwzjcVHjODBO
         eCXFtWNLkI5HjmDSSPJzfpty2+stf0Ei1Z5AISc6T91dU1SrDsoAKfDqgu98knEgZmj1
         CvBEOuzanSRyy1kxBZo0bTEQZGOhuJw6afUL1nq3yBD7e+Ggr7NyqIjsgJVPpXEYlOup
         OooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QX3CSipVYGEn0LiXaKhELdjoWziqGs6CXvG0r9dV5a4=;
        b=zzxO5LuTRPon3j5xNdTeIgiCoYUtptM2gPG9TwyjnvtkqKm6Lm9kyqtjXvpuurU9+m
         56r6JqcWu87j1K1x9c7x6QMjaXOYhMeUsSXWfAEZoroqDvgaR9sWdSrO2wJ7AJ7tG9RW
         RFua/xXbmvHn7fKIcJe49miZHMjmt1IO+5p6j3ajjbClUw8+KU5hsFvFsaUVmUf8REJ0
         XGPtOZ/qrndIOTxhBq2ggustIrmMRxaycFQTzXPf3Qptr5wd7dm6LKj7aXV+MBwkaK7m
         v0y12CBz+nTcjWDddsrGGLyD4pXleIAWu/z04JVoXxBcigQ5kIRS3kD/1GlMLLuEJEGs
         LmHA==
X-Gm-Message-State: AOAM530fGEAbOWXt/gfpuuomgVfKimbRrMs3SshrEV61DtI8uGgdTZt7
	ayu4FA6mW8h8k92M9+DhXwiTHjbvfnfemx5ESaCw9IswJ28=
X-Google-Smtp-Source: 
 ABdhPJyCqH6HtPDdzj0mH5ar+NX3jg46yvoRFZQQv9c6/c1XSyAT1okOl+flfiUh2AHbW17roe79f4agxlUcbgh+hsU=
X-Received: by 2002:a1c:447:: with SMTP id 68mr38168442wme.69.1638786429910;
 Mon, 06 Dec 2021 02:27:09 -0800 (PST)
MIME-Version: 1.0
References: <20211203164340.2963235-1-ross.burton@arm.com>
 <20211203164340.2963235-3-ross.burton@arm.com>
 <505b640190d97b7dbcfc306de4c5a357008978a1.camel@linuxfoundation.org>
 <44ecb2fe1e3d42988f77a4074baa8075@axis.com>
In-Reply-To: <44ecb2fe1e3d42988f77a4074baa8075@axis.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 6 Dec 2021 10:26:59 +0000
Message-ID: 
 <CAAnfSTuAmxuLD-n-QPzotQrd=Xsf2LkhY=svx-0G=hFtsvMC7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] libxkbcommon: allow building of API
 documentation
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 10:27:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159216

On Sun, 5 Dec 2021 at 01:24, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> > stdio: ERROR: Nothing PROVIDES 'doxygen-native' (but /home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb,
> > virtual:multilib:lib32:/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb DEPENDS on
> > or otherwise requires it). Close matches:
> >
> > Not quite sure what is going on there yet, seems a little strange.
>
> Not very strange when you consider that the doxygen recipe is in meta-oe....

Whoops.  I honestly thought it was in core!

Ross

