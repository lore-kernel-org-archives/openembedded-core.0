Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B532EC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 14:54:34 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.11152.1647528873772914057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 07:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JWEnlEKp;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id v2so4543812qtc.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zP5PeH12wpad+mo/xtaazNVjwSjNt9fPXTrl9X0TNF4=;
        b=JWEnlEKp7P+nO+WCyN8t7DyU4Sbq11DQjsCzU/LfI7RI8Qy3ydxyUJ9cgi1yCO3d82
         gOC/p1k1hRhn8jigQLUnAzoHkFLdgpVE1NQX0txn1GfetExvC6hKfCmyTBxZOWAeRyC4
         qGuid5i9stYiuTnklWhkAaRNtEfcpwAi8Dc8+HIsefkgfsH9KdjW2jpeU/zgKO3ntdQl
         pjt8A+GO3jn1M6N6FTA9q4anl7DSe8/YLKihyA763vvG5w6amk6x9yqUztoD/HSMp8ry
         Z0r6kOe51BWFW5WTSsuXb+hxQZ+pOP0IgIhzQnQUcjx3hstPYIciYVitP9PMfJpjh+pO
         Oa/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zP5PeH12wpad+mo/xtaazNVjwSjNt9fPXTrl9X0TNF4=;
        b=llu8KB9XgndcD+aaKwlDwY4fjictReiWiND6aNvaybUOZBf/caHaLY0LGzhqMJH0Rf
         yNq5bIBx6/oGSSu/jcXH40hT39b0bKR4Zi8Q4OPl2Ad1WM5uDb9MJ/5nt3ktBhlWcBCn
         RQpwedu6vi11AG9b/MylfNXGzouQJtTSTmoCkRYbNQU6KR1LsAGkzYZCmDw3ma2sK5xS
         bRtWCjK6FoMFIND4eaPatNGxZN9uOz/J7u3lIOGv394Exq/6TuBtmvH5hRPjxGwLA9GL
         BHnRcr0nOlNDVy/bteq34+x7ePficlBfEsqSG55iZfpzsYkfIZGYM5P27tpBzUvrrbT/
         djYQ==
X-Gm-Message-State: AOAM532uiPSEXBjorngFXpLrH+d/FYP52TJaOcacJT+pEq9qkYohPMDd
	7adE9HCp4Yl2ZJebHiVGsdO3fy6iGT5gnLyW82M=
X-Google-Smtp-Source: 
 ABdhPJzDZqNM29x6pIJHmjpP+vhhKvwzHf3KnckOU+0OUQA/8dWrn+xWbZd2EJ6Ew3meTWugkyQD+T7Bd848xv238N8=
X-Received: by 2002:ac8:5743:0:b0:2e1:cee6:f15 with SMTP id
 3-20020ac85743000000b002e1cee60f15mr3977826qtx.634.1647528872803; Thu, 17 Mar
 2022 07:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220308155252.2454464-1-raj.khem@gmail.com>
 <20220308155252.2454464-2-raj.khem@gmail.com>
 <CAAnfSTtuxTW5R9Vpuf7N1htF72m_X-KabOE3gV-5p9cmBHHj3A@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtuxTW5R9Vpuf7N1htF72m_X-KabOE3gV-5p9cmBHHj3A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2022 07:54:07 -0700
Message-ID: 
 <CAMKF1srK6sexQ0ArGe7myvrXvFjEaumYZgreRHBeBwMXcVU5RQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] libsdl2: Depend on virtual/egl
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 14:54:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163419

On Wed, Mar 9, 2022 at 4:31 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 8 Mar 2022 at 15:52, Khem Raj <raj.khem@gmail.com> wrote:
> > -PACKAGECONFIG[opengl]     = "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/libgl"
> > +PACKAGECONFIG[opengl]     = "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/egl"
>
> What does libSDL2 look for, then? Is it EGL explicitly? Or GLX? Or
> something else.

it looks for egl implementation provider which in X case is same as
virtual/libgl provider ( mesa )
in next release I think we should make clear difference between openGL
implementations instead of
specifying pins on libraries

>
> I agree that the virtual/libgl thing is a mess, but if we're clearing
> it up we need to clear about what is changing.
>
> Ross

