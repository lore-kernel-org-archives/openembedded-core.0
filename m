Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A170C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 01:00:14 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.16579.1636938013190836102
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 17:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F/e2pR5R;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id j63so10734170qkd.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 17:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+urE5y+voyHJ5Nebv71r8WM7gkXhAeVlKqPbAC6Ibbk=;
        b=F/e2pR5RZdihC0MM53ffRpGPWDVDqYdiWtnAJ2Gil+ds668GzlB4j2KgbWsawJ1so7
         ysyxoLCln5mYRO4+QJvnPKcHAA2Z50lnu4kMRRgfI0VaoXilAxo5JqIwY1ryOeLHStb8
         ZbCrQBSfIn4sJ7NeZAugQWnQPqfH8Y+4GZ0WKS09RH4NoR2YbO7+jLL0gOxsI0hO7qIE
         jGbL5wG77vbVJiGyeBDd3EGS0/Gi7SjqXkBIDlVXP/RSPWy7M5cU2pqnPtV23d4J3yV1
         96ZVzR5fxMlY5OqFsmk0k7bBTjNofzU3Jazdxwk7cI+U0o+A7BxaUe4SkfvYBDRLuMPy
         XHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+urE5y+voyHJ5Nebv71r8WM7gkXhAeVlKqPbAC6Ibbk=;
        b=OaCmmvjhonpkm0w9dQXkARjodm2s/29wAJ+sNH7u789cEiiu1/K4dy0OjxFEXpX3lD
         2uZqVmv3pTQ6G8JZNruNRN76FJUm0yhMWriRtnVSS0EjOkErrnnk5bFZgyOMq0OQ+X/y
         uvaprSUpRap3sjoYCe1JuQjogXtxEx5hL5DpTe5gKYgk/xxWTpxY1P8zdMLJlEwEEVX5
         C62BdQ5UeMU9Yp7I55ygRKGaZghDzxaTrZaJ6riXNEPdZOyNksFDEI8gNLnuiJ6SYY15
         0QACxQchIa22N6/v2rD775y3Z9AcpWJ4oKogSiPkjw5h6ZIxMBe94+R8rGEFSYrWKKh2
         Gaxw==
X-Gm-Message-State: AOAM533Q7bYzbmi3JgCePjuESzujosoY1QnRwsijEPAR6rI4YWItAwwa
	vi9hS6gSTnH5Qxi15EQGsJof+6floze6Mi9gP2w=
X-Google-Smtp-Source: 
 ABdhPJz/M7MyhDSYYZZ7Mm+Ra8evCpw3CgMVpgz/UEORvDQUpFbZ7DDH7AcEHBrLwKCPuJVYpbXduyj5Q0v3LbGw1XU=
X-Received: by 2002:a05:620a:4f6:: with SMTP id
 b22mr26640422qkh.98.1636938012177;
 Sun, 14 Nov 2021 17:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20211114065008.3899-1-jacob.kroon@gmail.com>
 <dfc7b7fc105d153303d7d5933689d9b469fb5a22.camel@linuxfoundation.org>
 <c02ee82c-4d14-d704-6fa0-50578f9f746f@gmail.com>
In-Reply-To: <c02ee82c-4d14-d704-6fa0-50578f9f746f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Nov 2021 16:59:46 -0800
Message-ID: 
 <CAMKF1som8UK6MYYj7RAPs0ai9JZL6kY8GDam-d_67xGEPOnkpQ@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] mklibs: remove recipes and class
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 01:00:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158272

On Sun, Nov 14, 2021 at 11:47 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 11/14/21 20:36, Richard Purdie wrote:
> > On Sun, 2021-11-14 at 07:50 +0100, Jacob Kroon wrote:
> >> From: Alexander Kanavin <alex.kanavin@gmail.com>
> >>
> >> This is not enabled or tested by default, and has never been
> >> ported to python 3 upstream[1], which means it doesn't work at all
> >> with plain poky. If you need it, please put it in a separate layer
> >> and/or modernize to work with py3.
> >>
> >> https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs
> >>
> >> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> (cherry picked from commit 908df863b419d1cad7317153101fc827e7e3a354)
> >
> > What issue is it causing in hardknott? Normally we don't backport invasive
> > changes like that...
> >
>
> The problem is that mklibs-native doesn't build with gcc 11, and
> "image-mklibs" was in USER_CLASSES by default in hardknott.
>
> I sent a patch to fix mklibs build here:
>
> https://lists.openembedded.org/g/openembedded-core/message/151982

This fix is correct and it is trivial. We can apply it

>
> but after some discussions we just decided to drop mklibs support
> entirely with the proposed patch.

Was there any other reason ?

>
> /Jacob
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158263): https://lists.openembedded.org/g/openembedded-core/message/158263
> Mute This Topic: https://lists.openembedded.org/mt/87042685/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

