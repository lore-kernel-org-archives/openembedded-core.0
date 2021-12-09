Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD39C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 08:55:56 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web10.9135.1639040155352203630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 00:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WnY7QltG;
 spf=pass (domain: gmail.com, ip: 209.85.221.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id q21so3287337vkn.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 00:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZ3fuoEelBTWr0NsV6Bv7XHEQrH/KAw9r+8hJtDdgm4=;
        b=WnY7QltG7E7hvkZtnsEyV/GYG57VHKRbJEf0kz1g0QLNt25OjLYwE5s87k9BqOBmlf
         JZzIadvqNeahZ6DzpYebI9TKUbNjjwqXky0ao/d7b6XnRbjCArw+4s1YcxJj0hhBSPNT
         V7Kpzj+mRDmPGLEUqOM76BE75LSyZkENhcIvKc0N7Tzh2GMRrIb1LN9K2fj+XSv32wlW
         qoVWugRyrDhMjvpB1m0P8TNmoNdMho9iLzRmnyls6C/GDh1LmZlEZ+YviuRo7knBcfR0
         Gu9t+tutkylQ2SWNeeLkKMvomRnNSQp7XMJj/E3f3HNM70S9UOMG0JVtderVVyWU8nQR
         DNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZ3fuoEelBTWr0NsV6Bv7XHEQrH/KAw9r+8hJtDdgm4=;
        b=FYzYnfFOxsDHYF51Jij360IejkIM26zSZC1jsjUlLq6CLRVLmJwDSj7V19/2bP1fxJ
         AqOKVnnEHKsLakSYa4iXXU4/uLSgh7E2AWdkv47FH6tXHoMeqZ3qUa4wi+OaaOSk2Aps
         MJC0UQIZ3NE1lVMLXlprKAEjPPfkk8fQU2UsGMIST1r0eMks4qavxiRLI1vVjFQXEj8E
         rukZxqDBq0ALJad/BFura1iZVtZjZDx7784NRYiwntrNIowj5Z3saTrNsY/podbzGzAS
         tuGYLYcUbYF5z3LqncqKB+JOsdMkgtOXUzaAzXzAKz0KAWuC7dVL/eDcnGXnJTlIgx1E
         2Itg==
X-Gm-Message-State: AOAM531InO0VwaCF506vrsVEyS3G1rXQI7bXzkA1P/jIWnVn77UGY0/b
	QfcLg1RcfnMaptHRGgsePyxZdAIRdxvKxsV0OofJ2BIBeRY=
X-Google-Smtp-Source: 
 ABdhPJy+WZWYNW3e1OZVwVHjuqH3Ge2YpUSpNXqG/MwPPAzBJNEmMrpzvThdtejuUpX3NUI2H0oSLAgAWiYv+J1U+nA=
X-Received: by 2002:a05:6122:14b4:: with SMTP id
 c20mr7126882vkq.30.1639040154425;
 Thu, 09 Dec 2021 00:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-6-alex@linutronix.de>
 <CAMKF1sqqgxwq+cV9t8MQG2v86FD0ajdx8+MQJd=+AAAiZwAK9Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqqgxwq+cV9t8MQG2v86FD0ajdx8+MQJd=+AAAiZwAK9Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Dec 2021 09:55:43 +0100
Message-ID: 
 <CANNYZj_LusK_zCrpa1v263JXKfEJ4c=c8nzvbcOXsyOy5QGccw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/29] ruby: update 3.0.2 -> 3.0.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000002d5def05d2b2c68a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 08:55:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159442

--0000000000002d5def05d2b2c68a
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Dec 2021 at 00:01, Khem Raj <raj.khem@gmail.com> wrote:

> > +    set -x
>
> perhaps not needed ?
>

Yes, there's a followup patch in the set.

Alex

--0000000000002d5def05d2b2c68a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 9 Dec 2021 at 00:01, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt; +=C2=A0 =C2=A0 set -x<br>
<br>
perhaps not needed ?<br></blockquote><div><br></div><div>Yes, there&#39;s a=
 followup patch in the set.</div><div><br></div><div>Alex<br></div></div></=
div>

--0000000000002d5def05d2b2c68a--

