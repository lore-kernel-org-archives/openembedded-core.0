Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FE5C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 14:38:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.15777.1693233517002102164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 07:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hWhuvaEV;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fef56f7222so31806435e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693233515; x=1693838315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X7M8DFQkt/YNk6lIgK5mOj49+4I0eTSdshunT9KspJk=;
        b=hWhuvaEVZzoUVwq7cTEzz4+OEFYpL/wNSggMqslk5Gwj5OeyrjNNtjJYCpVrbGUUVy
         JXAmAFrfo4sFcBtDtBnzDi+Q1gtmvi2NcwMp+VcfhPt9CDGleBAiAlKCK0rWUeDq2nS7
         82zmT7iJLYEo7r2+kf2/2GPcjLbqsCQEK63Dra8AvIjuDQLH2NNNZZM9zzRAEg/BLbaP
         v6RtJsXivUnuOh+RMH4LITuyMTWPC0HC47Nm4gGjyFhiFS54VmZMikXhaiu3zAxfkGj9
         f/xr53pfOBloZx95bztPuxYHBuAgMZc50YAhPx2XIC4FnfObarnhTlVByflLsboWnEEz
         QlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693233515; x=1693838315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7M8DFQkt/YNk6lIgK5mOj49+4I0eTSdshunT9KspJk=;
        b=LxNMmQSAlvFo4CUxhRT7+JtoDZtw/NeiXY+vwVXLiezDyNefICTLhJaXS8QvF019vP
         qLVxyH3/U16oFy3+sjE2zhu21zgN2swaDrjkcXo3WBX8WQi2IqMtkV84XisKje1NbvOn
         HuB1upUSGQ0ZBf7C1VCH8GBhxD9su8gtnTSrCwfcTSMxy7/PEpG8W3KUk0g3941QECBu
         ThA28nioFdbdISklvfM0mXWxHgqt4K364Vea3uUy42LvZT7V8cT+S1QoGLA7GBoQ9EKF
         bnNRRlF5YXnW/emwcM2qLT4nWhmZjui37wbvYsPKjyYfqh01xoiNoVWyckUv9R6bHzAw
         TGlg==
X-Gm-Message-State: AOJu0YzwAY5aA89hp6/jR0RHEGrks5j0qa8wZhgLTtfgK2pZiaQVsN8D
	zu70lJZTym7NGtoYgHyESKR4WQGlxh8npLZosB0=
X-Google-Smtp-Source: AGHT+IHKXvzMAQhUV7rVCftueLUA3q6Rq7aWPLBAbOpM6A1RhUaXO6yvZtJHAhUjbttZ+1lpLbUABI9eHZRr6Pum8U4=
X-Received: by 2002:a5d:54cd:0:b0:313:f463:9d40 with SMTP id
 x13-20020a5d54cd000000b00313f4639d40mr17225247wrv.65.1693233515211; Mon, 28
 Aug 2023 07:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <17770DD987E9D871.7893@lists.openembedded.org>
In-Reply-To: <17770DD987E9D871.7893@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 28 Aug 2023 16:38:14 +0200
Message-ID: <CA+chaQd5F63Lj9fPVWgh84xOhNjV97nKqk7kwCkt76RUOyhTog@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] efivar: backport 5 patches to fix
 build with gold
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: multipart/alternative; boundary="0000000000003230680603fca6c8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 14:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186831

--0000000000003230680603fca6c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 10:30=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> * LDFLAGS +=3D "-fuse-ld=3Dbfd" in the recipe doesn't work and
>   it still fails to build with ld-is-gold in DISTRO_FEATURES
>
>   removal of this line sent to master in:
>   https://lists.openembedded.org/g/openembedded-core/message/185167
>
> * the most important ones are the 1st which removes --add-needed
>   and the last which removes src/include/workarounds.mk completely
>   while 2-4 patches just update src/include/workarounds.mk for the
>   last one to apply cleanly
>
> * alternatively we can bump SRCREV to latest 38 as master did in:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D4df808c616f84=
7d90203582fd950a49bb8360dd0
>   which brings 23 commits, but instead of adding 5 more patches
>   allows to remove 5
>

Steve: this should be OK to backport, unless you want me to send backport
of above minor upgrade instead.

--0000000000003230680603fca6c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jul 31, 2023 at 10:30=E2=80=AFPM =
Martin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* LDFLAG=
S +=3D &quot;-fuse-ld=3Dbfd&quot; in the recipe doesn&#39;t work and<br>
=C2=A0 it still fails to build with ld-is-gold in DISTRO_FEATURES<br>
<br>
=C2=A0 removal of this line sent to master in:<br>
=C2=A0 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/185167" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/185167</a><br>
<br>
* the most important ones are the 1st which removes --add-needed<br>
=C2=A0 and the last which removes src/include/<a href=3D"http://workarounds=
.mk" rel=3D"noreferrer" target=3D"_blank">workarounds.mk</a> completely<br>
=C2=A0 while 2-4 patches just update src/include/<a href=3D"http://workarou=
nds.mk" rel=3D"noreferrer" target=3D"_blank">workarounds.mk</a> for the<br>
=C2=A0 last one to apply cleanly<br>
<br>
* alternatively we can bump SRCREV to latest 38 as master did in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D4df808c616f847d90203582fd950a49bb8360dd0" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3D4df808c6=
16f847d90203582fd950a49bb8360dd0</a><br>
=C2=A0 which brings 23 commits, but instead of adding 5 more patches<br>
=C2=A0 allows to remove 5<br></blockquote><div><br></div><div>Steve: this s=
hould be OK to backport, unless you want me to send backport of above minor=
 upgrade instead.=C2=A0</div></div></div>

--0000000000003230680603fca6c8--

