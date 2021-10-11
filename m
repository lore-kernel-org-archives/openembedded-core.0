Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E48C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 17:15:10 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web08.1487.1633972508800783975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DW8xEZ4I;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id h19so2664864uax.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KNbNrbZ/+5ISHBsa0VU5i4O2qEb4Epya8KSQpMMgk8k=;
        b=DW8xEZ4IW9UKyfmaaUVlXMRMJ/axabatgoQOGWy52fni4RlbfsX0xDpzwM/NH9MyLt
         ikRYRKS9nsiQeVK3Z+QqW+r5PlNqGgxcL95a4mB3KN9h+GqGhWPpvSYl4KBarTl15cbH
         fx8qFNOpEH9VUc8c2ExVGAWx/Fj8lEHawRneMg985COxCrAWcO0LJSwkm7ueZXHWI5jw
         Srh6NY5QiDoRCDc7dsvv9lFD6v/uaCKxzJOXQB7du4EAVZqojK99c66udk3hR6bKqHGH
         rnuPqnImx5mTMYGqkfCSJXH/R1LzqneR/ni0MURCsBiKWvhpyotwSyMx1KMHI4TosOR2
         3y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KNbNrbZ/+5ISHBsa0VU5i4O2qEb4Epya8KSQpMMgk8k=;
        b=fVH4FG3Fx+6KtGryU2SQvxMFveSMzG/mgbxmqc5W3AqMW6k89ml9zlXLGDBT/ZSgh9
         HyMY9y+bJtfb+5spNnTq9sLYIR+6SOTK7AJHlpImTQu/Cfcx86RQz5n6gYEQ45j3vcAf
         jvYtWTAr+bHpqTkN8op5YyjqsxtxoPUY/PX5apcdH+hf583ZwGLn4NdGHtXEZ9qCBYo1
         ehWPVA2kQpKgXOq0H3zhkV1lJckfV1e7dz1kTDkJHs1AE98uuuxfQdy+EOJ3I68ZZwhH
         v0YAmcTtsyXd18pOk0a9PZFEilG4OOEnkCZcRFndceIT4x3GD8rZG0fixsT1lfyCUO5r
         nmjA==
X-Gm-Message-State: AOAM531yUJ3CM+PtGgN4+jAmmnK1Bz2Uy5vmkx//C/4gmgLdgU+7Eq/n
	uqe44rWQteO10fuZ8qgoMLmo/+p02mSh9wMQLaE=
X-Google-Smtp-Source: 
 ABdhPJwXLfb0BPS0TE/CSStV3bXTClChCFRMIZnvP4mtptWlSRggywgvyY3vY6tAP8L0OOU1uFiXUh49CWfeGaOj+k8=
X-Received: by 2002:a05:6102:951:: with SMTP id
 a17mr14464519vsi.18.1633972507832;
 Mon, 11 Oct 2021 10:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211010191008.4122049-1-alex@linutronix.de>
 <20211010191008.4122049-13-alex@linutronix.de>
 <CAMKF1spWkdXuSBcc1Dkb6dkfiKxpKmkB6=2SsuaOyWhuu0NMkg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spWkdXuSBcc1Dkb6dkfiKxpKmkB6=2SsuaOyWhuu0NMkg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Oct 2021 19:14:56 +0200
Message-ID: 
 <CANNYZj9WzJCXmZPC6PYQzBnrAGoynjCppXfN21mDoy79vaxs5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/13] rust: generate target definitions from
 (arch, abi), not just arch
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000e6f58a05ce16dece"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 17:15:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156846

--000000000000e6f58a05ce16dece
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Oct 2021 at 19:03, Khem Raj <raj.khem@gmail.com> wrote:

>
> It missed the powerpc eabispe, If we are going to use ABI extensions
>

The AB gave a pass though. If someone needs it on powerpc, they now have an
easy way to adjust it.

Alex

--000000000000e6f58a05ce16dece
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 11 Oct 2021 at 19:03, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
It missed the powerpc eabispe, If we are going to use ABI extensions<br></b=
lockquote><div><br></div><div>The AB gave a pass though. If someone needs i=
t on powerpc, they now have an easy way to adjust it.<br></div><div><br></d=
iv><div>Alex<br></div></div></div>

--000000000000e6f58a05ce16dece--

