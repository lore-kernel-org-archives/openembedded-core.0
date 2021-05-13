Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web08.247.1620939896445896392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 14:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uv7/KmC1;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id i7so18777986ioa.12
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 14:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pa5PZvPgQpFGcERUMGD8hwQ7yY4LVzcuF8dEWH9f/ac=;
        b=uv7/KmC12WxAnhQmyv3wXAG3Vwt2L31Hj14qb4n+h63D6Jz104MjBfEIsTLZ7ip5lp
         j4cC5LtvDkJ/pr5ekEm6eLDKLUPucGBjalVsP0VUD++6vhv1fgFrtbXWkfVyejt2YvcH
         TbBeSBYWzyikmOhDEwTFZCgVNEg0IhJnZTWROoHkmGKeNcn9A22F/YvNwttt2cnQ2Mbg
         SJ+Ml+7tsN1bG6eeVcnoe3NZfvHt/Swm2IFaXS9nweyO169W8EjrALvsnjxdGMT4T4Ni
         efezij8QubZxUjlrr7m1ffZktviaP94dyzwcRQ9sIRLfEbdGynO/vFyIXoKBzvughh+V
         Y6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pa5PZvPgQpFGcERUMGD8hwQ7yY4LVzcuF8dEWH9f/ac=;
        b=CNWJsBal3xveHNTK5C33jH/I17NNGT44Wwsv45+hzrGerO1bWzdoGx+EZVI2HBsTsl
         mdcGKXzCc+sgpP0eDh9Y/jsunyxWyszEjfqRWyN8NdBDRTiD0vsF+UGhbJx3wN8ytZPe
         KcIFrNhxaXKxGj6P2SEogdOva1jRAmYQTI1K7QFf0ysdD6qLHhGF1GrdbOWJ1HCVf/QT
         GpwFo3opLGDW3OqqmhFncd/P0uu7XkhPWCtNc3YNCUQLXGw1UYK55XiuvthyOwoUvLup
         53dYKQsSWRX2qTqzWhiR2UJIumrm7IHjOpAgREfgIs4sYTNsldf+fgX3NGR7CVk//a74
         FoPQ==
X-Gm-Message-State: AOAM5311gbwEJTwcn2Vve/dMPGYkFqDxoQS4QNkJOEDdJ/3fDphMipZh
	oEre9Fykbb7Hoeigm9aEJxE5Zt5cArmgZVV7qUg=
X-Google-Smtp-Source: ABdhPJzDdg4kZ3uvz6hQJ1JoOvqw9KHKFOWKnRbdjLQdTU4oyXFYRHxAF2govcOAjqfp02cdiezXWxysMqdkGV0A4eU=
X-Received: by 2002:a05:6638:a2c:: with SMTP id 12mr39415459jao.99.1620939895622;
 Thu, 13 May 2021 14:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9K2m7ucmPihEzSyjXw7Cno-cnX9jgzP081-VeObbmJmg@mail.gmail.com>
 <18445.1620938085981224859@lists.openembedded.org>
In-Reply-To: <18445.1620938085981224859@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 13 May 2021 23:04:44 +0200
Message-ID: <CANNYZj8HK0F1iF9KtibCSYT7j6kzy5VaN3kS_XDL8HwsvMdGYQ@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: Benjamin Gilbert <bgilbert@backtick.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ae500f05c23c7a6d"

--000000000000ae500f05c23c7a6d
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 May 2021 at 22:34, Benjamin Gilbert <bgilbert@backtick.net>
wrote:

> Tarballs, commits on published branches, and annotated tags are all
> supposed to be stable artifacts.  But I don't know of any general
> expectation that a specific branch continues to exist, other than the one
> created by Bitbake.  GitHub's branch rename tool doesn't leave the old
> branch behind, not even a symref, so I don't think this is a fringe
> viewpoint.  And as I said, automated builds usually only care about tags,
> commits, and the default branch.
>

Just wanted to add that there's a reason Yocto doesn't use tags alone: they
can and do move from one commit to another, and to the best of my knowledge
there only way to tie them to a commit is to specify the commit too.

Alex

--000000000000ae500f05c23c7a6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 13 May 2021 at 22:34, Benjamin Gilbert &lt;<a href=3D"mailto=
:bgilbert@backtick.net">bgilbert@backtick.net</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Tarballs, commits on published=
 branches, and annotated tags are all supposed to be stable artifacts.=C2=
=A0 But I don&#39;t know of any general expectation that a specific branch =
continues to exist, other than the one created by Bitbake.=C2=A0 GitHub&#39=
;s branch rename tool doesn&#39;t leave the old branch behind, not even a s=
ymref, so I don&#39;t think this is a fringe viewpoint.=C2=A0 And as I said=
, automated builds usually only care about tags, commits, and the default b=
ranch.<br></blockquote><div><br></div><div>Just wanted to add that there&#3=
9;s a reason Yocto doesn&#39;t use tags alone: they can and do move from on=
e commit to another, and to the best of my knowledge there only way to tie =
them to a commit is to specify the commit too. <br></div><div><br></div><di=
v>Alex<br></div></div></div>

--000000000000ae500f05c23c7a6d--
