Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D82C77B71
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 05:23:11 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.1448.1681795390878980960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 22:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MgSOmET4;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6a42e7c5c1cso211451a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 22:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681795390; x=1684387390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e07Zz0RHNG8S4vkYMUGy2ghjM5uuvv7FzFE+/gvUPQM=;
        b=MgSOmET4O6BJbZWez8gKuQOWmPfifQHvdKKSIC3/hKlT1PSsCKh0uX2cQ/wOcWbMbN
         VKGJhtWCHk/x28xKp93A4hqWGU3PW38m1lSaanYM0BZxxbO48gRqJSmC5hF0YtBe7/Dj
         E5GZkurWXWy0R2pWKshSGU9FIrYJjaVmqah9jlMDlpfrXryTK8ssk30uMDqZQJ1q1a2t
         uJlOncPux3rCpuS1bhUTA2CEzuBNyTVoLHIy+tIURkOzxiGLP/vvp4DRBUDCk+LejZQL
         ivojiqo+L1Jd/nWRMvb8TKQZfz9XYzG5VZLpu22NirZRH4lJoTU1L9+7zw8RH5SP8AG+
         xYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681795390; x=1684387390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e07Zz0RHNG8S4vkYMUGy2ghjM5uuvv7FzFE+/gvUPQM=;
        b=hipIfAj+C0qPerT+rA9q6Qf8S4T35n4w/NXIZepv8p1PsAhk/qRFeRQpseynVURqJo
         udVRshU9KGtrU0pEH8VIB6ycQwVCkhnmeInDZrx6r0np4FuwJFxjLn8Fe/cODZsjzSUk
         QYrYNb3Ybxn0eEBZQTna8mfn4eXyjyMeu6njFGdEoHqabvXE8IpWt4JYEq6wxZN1WhcW
         R60H1sLlsSgD1YXqt9tw+RRW4Wod7Qdg+ERDahPEWg78qTLiz6BGwbCjDcq7hzSIkb2I
         tqONDwN7iUZCL+WoU+WFmPWkGi14y68qNLCEY5QZC7NHxy3cIWrDLQwlQqlW8Wzm/ElV
         KjNw==
X-Gm-Message-State: AAQBX9cjJaYsfOzS1dTLpVPMCG2e8cQbybmOTppfgBCxKhuEbe+SgNOH
	JXrTT8FkiPh2MFdMEZIMGg9ZVitSZ6WB0PR+hoc=
X-Google-Smtp-Source: AKy350al7Hx8ftwp+4MWat6EaaRFu5nsdNatSzFFSix1+lXVnOlLvsNufvO4syMUPr/vC5OOBQAfg3qcFjSZD7bmdvs=
X-Received: by 2002:a05:6830:11ca:b0:6a4:4f4c:cb1c with SMTP id
 v10-20020a05683011ca00b006a44f4ccb1cmr298921otq.2.1681795389853; Mon, 17 Apr
 2023 22:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1socwNE1yE3ywMyimSqu8JF03hzKR27YKXL6qJu-1r2d3g@mail.gmail.com>
 <17294.1681789353965294418@lists.openembedded.org>
In-Reply-To: <17294.1681789353965294418@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Apr 2023 22:22:59 -0700
Message-ID: <CAMKF1so1_QYXQNyWX3uQZy_BCWm=TipazCbHcSr_A90ytyoJ5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptest
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cc147505f995806b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 05:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180177

--000000000000cc147505f995806b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 8:42 PM qiutt@fujitsu.com <qiutt@fujitsu.com> wrote=
:

> This should be a symlink to gcc on target so I wonder why it does not wor=
k
>
> First, see the coreutils=E2=80=99 files which installed on target.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>   Makefile  -->created by cross-compile
>
>   build-aux
>
>   init.cfg     --> copied from src
>
>   run-ptest
>
> tests
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> In Makefile, CC is defined by aarch64-agl-linux-gcc with
> --sysroot=3Drecipe-sysroot.
>
>  CC =3D aarch64-agl-linux-gcc  -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> --sysroot=3Drecipe-sysroot
>
> In init.cfg, CC  is used to compile k.c file.
>
>  $CC -Wall -shared --std=3Dgnu99 -fPIC -O2 $* "$in" -o "$out"
> $gcc_shared_libs_
>
> Because of =E2=80=9C--sysroot=3Drecipe-sysroot=E2=80=9D, it does not work=
.
>
> So, we could add =E2=80=9C-I /usr/include=E2=80=9D in Makefile or init.cf=
g, or delete =E2=80=9C
> --sysroot=3Drecipe-sysroot=E2=80=9D from Makefile.
>
> Which one is better?
>

Delete sysroot

> Let me know, and I will send the patch v2.
>
> thanks.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180174):
> https://lists.openembedded.org/g/openembedded-core/message/180174
> Mute This Topic: https://lists.openembedded.org/mt/98258324/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cc147505f995806b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 17, 2023 at 8:42 PM <a href=3D"mailto:qiutt@fuj=
itsu.com">qiutt@fujitsu.com</a> &lt;<a href=3D"mailto:qiutt@fujitsu.com">qi=
utt@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)"><blockquote>
<p style=3D"margin:0px">This should be a symlink to gcc on target so I wond=
er why it does not work=C2=A0</p>
</blockquote>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">First=
, see the coreutils=E2=80=99 files which installed on target.</span><span l=
ang=3D"EN-US"></span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><span lang=3D"EN-US"></=
span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">=C2=
=A0=C2=A0Makefile=C2=A0 --&gt;created by cross-compile</span><span lang=3D"=
EN-US"></span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">=C2=
=A0=C2=A0build-aux</span><span lang=3D"EN-US"></span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">=C2=
=A0=C2=A0init.cfg =C2=A0=C2=A0=C2=A0=C2=A0--&gt; copied from src</span><spa=
n lang=3D"EN-US"></span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">=C2=
=A0=C2=A0run-ptest</span><span lang=3D"EN-US"></span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">tests=
</span><span lang=3D"EN-US"></span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><span lang=3D"EN-US"></=
span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US">In=C2=A0</span><span lang=3D"E=
N-US" style=3D"font-size:11pt">Makefile, CC is defined by=C2=A0</span><span=
 lang=3D"EN-US">aarch64-agl-linux-gcc with --sysroot=3Drecipe-sysroot.</spa=
n></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US">=C2=A0CC =3D aarch64-agl-linux=
-gcc=C2=A0 -fstack-protector-strong=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wforma=
t -Wformat-security -Werror=3Dformat-security --sysroot=3Drecipe-sysroot</s=
pan></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">In in=
it.cfg, CC=C2=A0 is used to compile=C2=A0</span><span lang=3D"EN-US">k.c fi=
le.</span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US">=C2=A0$CC -Wall -shared --std=
=3Dgnu99 -fPIC -O2 $* &quot;$in&quot; -o &quot;$out&quot; $gcc_shared_libs_=
</span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US">Because of=C2=A0</span><span l=
ang=3D"ZH-CN">=E2=80=9C</span><span lang=3D"EN-US">--sysroot=3Drecipe-sysro=
ot</span><span lang=3D"ZH-CN">=E2=80=9D</span><span lang=3D"EN-US">, it doe=
s not work.</span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US">So, we could add=C2=A0</span><=
span lang=3D"ZH-CN">=E2=80=9C</span><span lang=3D"EN-US">-I /usr/include</s=
pan><span lang=3D"ZH-CN">=E2=80=9D</span><span lang=3D"EN-US">=C2=A0in=C2=
=A0</span><span lang=3D"EN-US" style=3D"font-size:11pt">Makefile or init.cf=
g, or delete=C2=A0</span><span lang=3D"ZH-CN">=E2=80=9C</span><span lang=3D=
"EN-US">--sysroot=3Drecipe-sysroot</span><span lang=3D"ZH-CN">=E2=80=9D</sp=
an><span lang=3D"EN-US">=C2=A0from=C2=A0</span><span lang=3D"EN-US" style=
=3D"font-size:11pt">Makefile.</span><span lang=3D"EN-US"></span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">Which=
 one is better?</span></p></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Delete sysroot=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><p style=3D"margin:0mm=
" dir=3D"auto"><span lang=3D"EN-US" style=3D"font-size:11pt"></span><span l=
ang=3D"EN-US"></span></p>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">Let m=
e know, and I will send the patch v2.</span><span lang=3D"EN-US"></span></p=
>
<p style=3D"margin:0mm"><span lang=3D"EN-US" style=3D"font-size:11pt">thank=
s.</span><span lang=3D"EN-US"></span></p>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180174): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180174" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180174</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98258324/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98258324/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000cc147505f995806b--

