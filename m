Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.34237.1623061249456005290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 03:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EvmcaKMc;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id z15so8580652vsn.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 03:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ThRyFL0ec16fY4fMqFxrNNa4Gvx5PP4MonZUI2bY8ew=;
        b=EvmcaKMc9VHEFmiV8xTH++wPEQup6l/jCxChYngtDS0UYMT/Gv6dYH4Rc+ZgZrqFIg
         adirKBZXjYOyoBOyXf/XlvoL4qGCCyBjBxJbtXzzcVjwVCpZoCODa4rj1ztxbCaqzuTW
         KbTjAS60YQ3DjP9+AMgt18MJJJ3KxjrRbtWmv21JYdNQocIPJakJ6K4flPQLqXNsPwOQ
         j8jllF4LpOqTrRqfDHEWpDVsZV94jPD4CNXBEWjG9zKQ1h2+sbL5sRDnadHWGKVvoiVZ
         QxgZk/6xb5u1o5/FPKeYWvvnHokY41fZHne9esrCc2lFz0GkKalah4cxyP8meqJuQ1Z2
         j5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ThRyFL0ec16fY4fMqFxrNNa4Gvx5PP4MonZUI2bY8ew=;
        b=bnbQaL5Ztc3G7QQEZxvpJUvJSHO3FjjnOve7gUeHE2rsMOG2UmQrK8XnZ4W2hQrjA+
         au2I94lJYCR34I4EqzOyiyqJiZTz/CqZT50z7oznk+w7ejgs3F1agq2CRiygc7M7wYAl
         H/Os5sObLZcKEWPdKaTzav1U6H2jQlNO2ff6d8IcbR4FVuaBpEZrvNxSnnmEB1kbezpC
         g5SgmtZVU13aVX6r+FXobp3BL3iCS2uS++TJtnjR1NLiMx5cO4+7ZGxtQg1mCMonLQBt
         kxvrFQ9qaarcP7YDFoEWLDLNyLAgo4Emj1TTaDxJAcfOybMyRqivoTDpbc/ac0W9MoM/
         +qlA==
X-Gm-Message-State: AOAM5301rLoa3o5MLFycdx02EcOBaDQFv3IHirdZx/1OthXn2caomMTT
	Fb8btHwk/iwRQLW2VlbGI3D0w7icwnxjXXX4AJQ=
X-Google-Smtp-Source: ABdhPJxeM847bBJW2XWree0Jb8yr00TJwTbtEq4vtT3WXIoo1Hbstw1q4QOS21ajnQbTRgezXiqTBOgL05LmgAZ1lyM=
X-Received: by 2002:a67:1502:: with SMTP id 2mr7924932vsv.54.1623061248602;
 Mon, 07 Jun 2021 03:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
 <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com>
 <CANNYZj9spx5kAGMZBTTYz_daHG=G17uAfx6rE3=0fe+CP8-p=A@mail.gmail.com> <CAMKF1sqWNP8G=DwthpeiXfV2niSygRBeNQACXDrVgT5NEds3vA@mail.gmail.com>
In-Reply-To: <CAMKF1sqWNP8G=DwthpeiXfV2niSygRBeNQACXDrVgT5NEds3vA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 7 Jun 2021 12:20:37 +0200
Message-ID: <CANNYZj-iYbPjM7KKv+bPL_Tu2WZqG2sOCB5njjHHZ-5ou36rUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002bf54205c42a65c5"

--0000000000002bf54205c42a65c5
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jun 2021 at 00:19, Khem Raj <raj.khem@gmail.com> wrote:

> here is a small testcase to excercise utimensat_time64
>
> https://raw.githubusercontent.com/xantares/test-seccomp-time64/master/test-time64.c
>
> gcc -m32 test-time64.c
>
> it will be good to check how the resulting binary behaves with centos
> provided libc and sdk provided one.
>

Yes, testing the issue without involving the sdk would be good, but I can't
build it in the host environment, and don't have rights to install missing
32 bit support packages (not sure what that would be):

/usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such file or
directory
 # include <gnu/stubs-32.h>
           ^~~~~~~~~~~~~~~~

Alex

--0000000000002bf54205c42a65c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 7 Jun 2021 at 00:19, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">here is a small testcase to excercise utimens=
at_time64<br>
<a href=3D"https://raw.githubusercontent.com/xantares/test-seccomp-time64/m=
aster/test-time64.c" rel=3D"noreferrer" target=3D"_blank">https://raw.githu=
busercontent.com/xantares/test-seccomp-time64/master/test-time64.c</a><br>
<br>
gcc -m32 test-time64.c<br>
<br>
it will be good to check how the resulting binary behaves with centos<br>
provided libc and sdk provided one.<br></blockquote><div><br></div><div>Yes=
, testing the issue without involving the sdk would be good, but I can&#39;=
t build it in the host environment, and don&#39;t have rights to install mi=
ssing 32 bit support packages (not sure what that would be):</div><div><br>=
</div><div>/usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No s=
uch file or directory<br>=C2=A0# include &lt;gnu/stubs-32.h&gt;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~</div><div><br></div><div=
>Alex<br> </div></div></div>

--0000000000002bf54205c42a65c5--
