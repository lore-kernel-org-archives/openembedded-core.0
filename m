Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BE0C6379F
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 10:08:16 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.5398.1677060493564421450
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 02:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ig1d14GD;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id x41so7367676ljq.13
        for <Openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 02:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5F8vrdcmdSZMGNhKpo/MPsRW9xyVmV6g4Rw8AeMmN4Y=;
        b=Ig1d14GDIFKHUM3zRJd62eTLGyZY9nZjJ1+bF56pm5u5xny+AL5InCH3yVLSABsg1Y
         CHnSkJsJlPqiKFMuiSA8p1XWh/0Od2jiAyzjEILjtPf28nnaVFjLb7RQrGXLuo+G8hhq
         viRF9De6RyRK6KWo2g6FHfSG9HeW/PkaP4gT2WtbiDPpBaTZZwgcHKSJkBIND9Qq/WLu
         FYopWrYUN2nUDE+nfsPYkWpz0l4pNcBHbIZs2IeNHM8jTAhan9MAD/6XyxECzeEb2iV9
         gvoHBTgFMdSuD/c8l0bhPJXoYcIDhgNDuDm+FNWgsj3QzMQoLRzYdCaZW3d9gjB8zHRa
         RJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5F8vrdcmdSZMGNhKpo/MPsRW9xyVmV6g4Rw8AeMmN4Y=;
        b=NhxCQpWnhC2jG4RgPfJDupw+Cy0u7OYfu6jju5DLP8iiZ0oG6ed9TY0SR1S66U3vD/
         TwlaYgjKbVrKLIokBQmT/iekViX0ZaETkYKV2a5L7KEfvzhOr21hHp6mz4o1mHxjgAdZ
         Ye2QOcCyIFFiYstF5yJqNEcavz9gp9plRJ+4tdl/XBQOV6s9knEyUQNl3qeNwgSVLmzL
         oXHCxIZ3J6AREtsT0ib5p2QeGOIwYJtD4JI/jWkHVLsLsT7NUa7WjubFDxSSumHx5uX6
         xtbxZCG8ZQ9poCtl0YHDfGd074QKQO2CRcCSdgwSVMsIUJwm00T9MUMqehnluW2MaNJQ
         RXtA==
X-Gm-Message-State: AO0yUKU6KFs2noFxOGG+TiR2G53cA4qeJKy+okvbaRk5ZvXxd7q/GLpU
	UjBuRAtF9ACE0HqPmT3gcEt3Uk9Mr/qMnIpo/64=
X-Google-Smtp-Source: AK7set/FCqzUBVYuKMUzFbwUbj7vNYm7gECnhOY84Z/v1ctEg7pvewk5lRJJQKjkAX3YfE8cWTuXL16JmF6o1JC9E/M=
X-Received: by 2002:a05:651c:201a:b0:293:5f96:ac3f with SMTP id
 s26-20020a05651c201a00b002935f96ac3fmr2510820ljo.10.1677060491049; Wed, 22
 Feb 2023 02:08:11 -0800 (PST)
MIME-Version: 1.0
References: <CAApg2=SJRjhc5SGEoBYfKb6PkMqRW21ED8Bv1v-+QTSASCsQ4g@mail.gmail.com>
 <9A00276D-E0D8-47DA-AC38-96418BF47388@arm.com>
In-Reply-To: <9A00276D-E0D8-47DA-AC38-96418BF47388@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 22 Feb 2023 11:07:59 +0100
Message-ID: <CAApg2=R=FpcgX1TAfGNCT0uNcNy76FXkMN1cgyUGPwQMHyEsmw@mail.gmail.com>
Subject: Re: Cve fetcher update
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000d5fe2305f5471242"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 10:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177563

--000000000000d5fe2305f5471242
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 2:47 PM Ross Burton <Ross.Burton@arm.com> wrote:

> Hi Marta,
>
> > On 21 Feb 2023, at 13:20, Marta Rybczynska <rybczynska@gmail.com> wrote=
:
> > I'm finishing the new fetcher for cve check using the 2.0 NVD API. Will
> need testers to check as many configurations as possible before we switch
> the format.
> >
> > The current estimate is this week, hoping that the real life doesn't
> interfere.
> >
> > Good news for all users is that nothing changes for you. Results should
> be compatible. The one noticeable thing is that the complete fetch is
> longer than before.
>
> Awesome, thanks Marta.  I=E2=80=99ll happily review and test the code.
>
> How long is a complete fetch now?  My very rough testing when I first
> looked at the new API suggested 30 minutes for a full sync.
>
>
Thanks Ross. The fetcher now has the recommended 6 seconds wait so it is
long - but a similar time you had (around 30 min). It seems that in
practice it does not change much - the rate limiting is on the server side.
This being said, there is only my instance now, when there will be many
more, it could change.

Kind regards,
Marta

--000000000000d5fe2305f5471242
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 21, 2023 at 2:47 PM Ross =
Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Mar=
ta,<br>
<br>
&gt; On 21 Feb 2023, at 13:20, Marta Rybczynska &lt;<a href=3D"mailto:rybcz=
ynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br>
&gt; I&#39;m finishing the new fetcher for cve check using the 2.0 NVD API.=
 Will need testers to check as many configurations as possible before we sw=
itch the format.<br>
&gt; <br>
&gt; The current estimate is this week, hoping that the real life doesn&#39=
;t interfere.<br>
&gt; <br>
&gt; Good news for all users is that nothing changes for you. Results shoul=
d be compatible. The one noticeable thing is that the complete fetch is lon=
ger than before.<br>
<br>
Awesome, thanks Marta.=C2=A0 I=E2=80=99ll happily review and test the code.=
<br>
<br>
How long is a complete fetch now?=C2=A0 My very rough testing when I first =
looked at the new API suggested 30 minutes for a full sync.<br>
<br></blockquote><div><br></div><div>Thanks Ross. The fetcher now has the r=
ecommended 6 seconds wait so it is long - but a similar time you had (aroun=
d 30 min). It seems that in practice it does not change much - the rate lim=
iting is on the server side. This being said, there is only my instance now=
, when there will be many more, it could change.<br></div><div><br></div><d=
iv>Kind regards,</div><div>Marta <br></div></div></div>

--000000000000d5fe2305f5471242--

