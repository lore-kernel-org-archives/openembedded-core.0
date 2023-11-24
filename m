Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20ADBC61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 17:03:39 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.144232.1700845409728450517
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 09:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FvE+7drI;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6ce2988d62eso1204463a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700845409; x=1701450209; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B1JmSY1df+08/xVPGwYN073Pr1oNGAMhRi7SvJjufUw=;
        b=FvE+7drImC/ab5iKXFZBbNbVzhg98BOk/ltIyUlQV3Z+gahv0HDCo0aciwik87onMU
         30d6N7UG4rXPDcm1XVrXsLlCGHFGghFCj8bz5/K20Rj3tCOY5dlo7elAvzvMrYvP81jL
         NR4SdRmAroYkHQKhe47NhsCqVKOze/kTEapse3IuFApHI1wDDe122tout1k0ICPUxp9M
         0O30ggugzgp6LViPfHbOVLjIET0i8xUAGupbeDICiEn2u1zmTS7YVKsyDaNJ9asXhsmA
         tbWkIhQbvHc/y2ZC5j6AM69mMqBZ79dAJgD6KG2gA69NALqFa8E+7FlJ1JLAP54G3iFe
         MoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845409; x=1701450209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1JmSY1df+08/xVPGwYN073Pr1oNGAMhRi7SvJjufUw=;
        b=IXhkJUIF2Ip9x5/WVsCAZ4jqCd6QhhhNVySNDIfRJDN4gs0hmye58CJca2NMUgpG8+
         B4bw2LIqSSuOOQWUil8BVcIGMJhkgMJ4SWufoXKyiJWjtUsQ0Z6S7ETnu++YIeQD6jnu
         AL1po9PJ/gJbWPE9toLO3Ja/j48qCF+zsaPY8vi9aKJy6v6lK0enuU4NeGgi2dpBveKB
         nsASlJwBGmHZXLHkFcTo7Emk9Za00rIYCc4AGcrm6L4+Cgt2Fb8gI9ISp/NXRv++cOez
         q6+tII6sxgCexBbhOqSK/Sph1Ps7JFwE2hWuZ2XHuOyZ7Wd0aVrc2/aEx4Fuy1zXNmFa
         0IAA==
X-Gm-Message-State: AOJu0YyTrhKj3zDXp7is47rZQ9y9S3u4/2dZQNJwybbz+sYOculGKif/
	A0WE5hrhhsf8xvR9wcERAbjl396nQjlmxhrRrQw=
X-Google-Smtp-Source: AGHT+IHQ9fljZ5iKs1cnKMdKhOHefAasFX/yKOwpewV3ah0wFjDZj/mG2q/z2xPMC3IuzjhzMOcNaPNyv82IxanKTGQ=
X-Received: by 2002:a05:6870:e0c9:b0:1f5:b5ca:438d with SMTP id
 a9-20020a056870e0c900b001f5b5ca438dmr4141648oab.16.1700845408782; Fri, 24 Nov
 2023 09:03:28 -0800 (PST)
MIME-Version: 1.0
References: <CAHvQdo1KaZ2S1srqjvyj=R0tVroUieExEXmfBpiEBq9J1RZxDQ@mail.gmail.com>
In-Reply-To: <CAHvQdo1KaZ2S1srqjvyj=R0tVroUieExEXmfBpiEBq9J1RZxDQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Nov 2023 09:03:17 -0800
Message-ID: <CAMKF1sqXJRha2wXUoMu_M9opLT2FCB+-36L9uvx-YDZRO3BQ7Q@mail.gmail.com>
Subject: Re: rootfs.py generates wrong ld.so.cache in case of usrmerge distro feature
To: Johannes Pointner <h4nn35.work@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000688fe6060ae8ee36"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 17:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191212

--000000000000688fe6060ae8ee36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 2:34=E2=80=AFAM Johannes Pointner <h4nn35.work@gmai=
l.com>
wrote:

> Hello,
>
> I did recently my first Nanbield build which required the distro
> feature usrmerge because of using systemd and as a result QtWebEngine
> didn't work anymore.
> I reported this to Qt(https://bugreports.qt.io/browse/QTBUG-119140),
> but looking deeper into this it turned out to be an issue related to
> the generated ld.so.cache in the rootfs.py.
> At the moment in the ldconfig-native which is used to generate this,
> are the paths to LIBDIR("/usr/lib") and SLIBDIR("/lib") hardcoded, but
> that isn't correct if usrmerge is enabled, at least I think so.
> The resulting ld.so.cache looks like this:
> 236 libs found in cache `/etc/ld.so.cache'
>        libzstd.so.1 (libc6) =3D> /lib/libzstd.so.1
>        libz.so.1 (libc6) =3D> /lib/libz.so.1
>        libxtables.so.12 (libc6) =3D> /lib/libxtables.so.12
>        libxslt.so.1 (libc6) =3D> /lib/libxslt.so.1
>        libxml2.so.2 (libc6) =3D> /lib/libxml2.so.2
> ...
>
> Would it be OK to configure the paths LIBDIR SLIBDIR using base_libdir
> and libdir?


I think it should check for usrmerge feature and generate the correct
values during build


>
> Thanks,
> Hannes
>

--000000000000688fe6060ae8ee36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 24, 2023 at 2:34=E2=80=AFAM Johannes Pointner &=
lt;<a href=3D"mailto:h4nn35.work@gmail.com">h4nn35.work@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
I did recently my first Nanbield build which required the distro<br>
feature usrmerge because of using systemd and as a result QtWebEngine<br>
didn&#39;t work anymore.<br>
I reported this to Qt(<a href=3D"https://bugreports.qt.io/browse/QTBUG-1191=
40" rel=3D"noreferrer" target=3D"_blank">https://bugreports.qt.io/browse/QT=
BUG-119140</a>),<br>
but looking deeper into this it turned out to be an issue related to<br>
the generated ld.so.cache in the rootfs.py.<br>
At the moment in the ldconfig-native which is used to generate this,<br>
are the paths to LIBDIR(&quot;/usr/lib&quot;) and SLIBDIR(&quot;/lib&quot;)=
 hardcoded, but<br>
that isn&#39;t correct if usrmerge is enabled, at least I think so.<br>
The resulting ld.so.cache looks like this:<br>
236 libs found in cache `/etc/ld.so.cache&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0libzstd.so.1 (libc6) =3D&gt; /lib/libzstd.so.1<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0libz.so.1 (libc6) =3D&gt; /lib/libz.so.1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0libxtables.so.12 (libc6) =3D&gt; /lib/libxtables=
.so.12<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0libxslt.so.1 (libc6) =3D&gt; /lib/libxslt.so.1<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0libxml2.so.2 (libc6) =3D&gt; /lib/libxml2.so.2<b=
r>
...<br>
<br>
Would it be OK to configure the paths LIBDIR SLIBDIR using base_libdir<br>
and libdir?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I thi=
nk it should check for usrmerge feature and generate the correct values dur=
ing build=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex" dir=3D"auto"><br>
<br>
Thanks,<br>
Hannes<br>
</blockquote></div></div>

--000000000000688fe6060ae8ee36--

