Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web09.9293.1610550593581696122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 07:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qMntoLmE;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id g5so770603uak.10
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 07:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t6ZRh1JKHltvTD1PvfuqBwZNHBsndpQ/GM0MXUCglK4=;
        b=qMntoLmEX8yu0HfDafRyFLNMGsuuxMkFmjbv0Xp3CRRYgwb6QCpJ8BRdTbNiZFQMjP
         mloochxAKRdQPiBlrnmGbNtpBgSY7TuVFJkQChLGNz0YxvdZPa/a0oR2hlMLQpIAqUGf
         7swn06WFUUEXoFj65jTokxgtDFdX2e0P8ExWg+Yfb5YAnjz/7mg3MQBfB6JvqXX78SjV
         kID478V3Yb3xlPYirhdkXkEnIRu9lMlCtD1Jn4q/OLmYmnVf/vb1ODBgsR4wRuwgrvSy
         ZRcvv9IZ/+v+4u0bYSycAyf+DDrbxtZ0aFYhKMPfNb7IUKs2lqVtxF+LJsaOdottHib4
         SEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t6ZRh1JKHltvTD1PvfuqBwZNHBsndpQ/GM0MXUCglK4=;
        b=ciI98jF6CjMBrf2sRPqzlRW1nOTrZcDM4kd8EBh2yQj7/9Tml+qFTMFxvpAI7phxJx
         1aJdzjADPCnpaOHVMM5KqVCGsm+8LAUiz7Dl7c9Lvyr8DKylXON5wn6N26MqiVE5NbKC
         G/FDw+8HJjppp+i021ZwvrzeLMjrCjy3laQEN9Ojh/Seay3m514XoM+Jht7R/ZX3o2At
         R2A0dqEs8nrgeIPrcJSXIUVdZla0+TBJmvDQlYBWusmVGm7xM7WgdZRnbSmQrs/sVVvj
         kA1zl2s9Flk2H5hL7p6EZmDqxAEqxJqCZkjl9syKf6I2WP30AjUyd9fHOCTeK0jN0k/6
         tF3g==
X-Gm-Message-State: AOAM533kUBvVPqDd0Mmvv9tpJKPe8AGFhQ7IqO8Ss+CYl0OKybUBYD7J
	CbDCW9bCqBepC4RjyQ66EP5gGE8m1jpST3kJP0Y=
X-Google-Smtp-Source: ABdhPJwMYn181FqhUdDL7lQJGbaRgSCKGeXs1MvfI3AoFo5wL4so1G6jbE1lRY28us9TNjjr5tR497jLr05R4wcsEtk=
X-Received: by 2002:ab0:4597:: with SMTP id u23mr2323393uau.100.1610550591528;
 Wed, 13 Jan 2021 07:09:51 -0800 (PST)
MIME-Version: 1.0
References: <1610545059-22137-1-git-send-email-wangmy@cn.fujitsu.com> <1610545059-22137-2-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1610545059-22137-2-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 13 Jan 2021 16:09:39 +0100
Message-ID: <CANNYZj8vHOseGKh8gcVEL_0xMKqbZQKkCxoGJLRwkZ1Jk-a-kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gpgme: upgrade 1.15.0 -> 1.15.1
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6a1d505b8c987b0"

--000000000000e6a1d505b8c987b0
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Jan 2021 at 14:40, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> - configure.ac            |   1 +
> - src/Makefile.am         |   4 +-
> + configure.ac            | 125 ++++++++++++++++++++--------------------
> + src/Makefile.am         |  80 ++++++++++++-------------
>

This does not look right at all. Did you try rebasing the patches with
'devtool upgrade'?

Alex

--000000000000e6a1d505b8c987b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 13 Jan 2021 at 14:40, Wang Mingyu &lt;<a href=3D"mailto:wang=
my@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">- <a href=3D"http://configure.ac" r=
el=3D"noreferrer" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
- src/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>+ =
<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">config=
ure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 125 +++++++++++++++++=
+++--------------------<br>
+ src/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 80 ++++++++++++-=
------------<br></blockquote><div><br></div><div>This does not look right a=
t all. Did you try rebasing the patches with &#39;devtool upgrade&#39;?</di=
v><div><br></div><div>Alex<br></div></div></div>

--000000000000e6a1d505b8c987b0--
