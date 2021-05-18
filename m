Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web09.6141.1621330110283410557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 02:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M3ZZKpf9;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 15so1693005vkn.11
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 02:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mZkEvjnbvxCm1JuomVuh88A/w5OApQ5TI2StUyPvr/U=;
        b=M3ZZKpf9lx5JvIhazyF/a+GdVz9pB1x3FHdiuODa+9yGCtnCt8eAiyBR38cEM19skY
         9NqlcoPMYY2CG+KPsl8Dbp+R//OGej0pfCi5TR0iP1lCw87UHaErPDUctRgQjPchxsKY
         t4vgQk1DUnfW1U8540cT0luEQnY7Nbd7e9w69/vQY6hDkk3Q8fZJZCIyuW82yldx3AEn
         6rPepGOWK/DKdVSawrykGtczvm8z5SEkfcqnY+kgt78q4xK7Gj9U6/fKakMmndulJPTf
         5LF04MqLWFaMSjsVYOaP0KVuECEQrQ8WoVeIGGSWj1wWguOyfbVY/xV1C8zvVxfYYzRx
         1CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mZkEvjnbvxCm1JuomVuh88A/w5OApQ5TI2StUyPvr/U=;
        b=s9km+1LkkazNXXOSNwo2BwormDcm/nDb/+xfMH1QkSDqa9rm2wrhKsLMEzFcBnc1RJ
         4ii8houwxpJ7wKydlseXYWWodi/A3LaPPUOOl5pFZaM1vas1PMBaawWrS+Fk1kSniFUv
         6QpYiD2k4HfAFZyj6naS5XTyUkLL5BQ9n/blDK2AgyQAs/XGKOme2d/C6HaUoAGk5KNB
         5YsJUnEV2pHLe2mzUNI6fm3FnyKJgi/Al1tDPJY6/qt8lU6j7UWB1lmUOGHkYoROsLpx
         wkaJ2m1EKSntzT8F59oVif54/mlHHjoZeGWes/Uyoo9IVdykd88wzg3Tsu+QrozJWG5t
         gT/A==
X-Gm-Message-State: AOAM532AHqOMxOcP/pMosW38QgiOyYB4dyEQRlKkbDO2X+qepVhc9w5K
	zIS9gaZEj0sFn/dPi3+da1KK838J9MdJDKEUEvg=
X-Google-Smtp-Source: ABdhPJz5y/zMVIGT5mrG4+Eu6kG5/9BYmkbWeDcDh89mh70S+HZjFwLPPnScZxkXT1j4GmxJZZpIxkUPkz7j9gtH3vw=
X-Received: by 2002:a1f:9d46:: with SMTP id g67mr4845338vke.10.1621330109420;
 Tue, 18 May 2021 02:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210517170104.2605486-1-jacob.kroon@gmail.com>
 <51470f7e-9267-950e-5c1c-47cc863360a1@gmail.com> <197aa141-4879-ca63-7e6e-1506df47b5c0@gmail.com>
In-Reply-To: <197aa141-4879-ca63-7e6e-1506df47b5c0@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 18 May 2021 11:28:18 +0200
Message-ID: <CANNYZj_KP6q_KOk+rOG_5CLZb3=vc_9U=Kzka4vKT3hGu+_-NQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mklibs-native: Fix build with gcc 11
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003c56fd05c297550b"

--0000000000003c56fd05c297550b
Content-Type: text/plain; charset="UTF-8"

Don't bother, it looks abandoned:
https://salsa.debian.org/installer-team/mklibs

Alex

On Tue, 18 May 2021 at 11:19, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On 5/18/21 12:20 AM, Khem Raj wrote:
> >
> >
> > On 5/17/21 10:01 AM, Jacob Kroon wrote:
> >> In gcc 11 the default mode for C++ is now -std=gnu++17 instead of
> >> -std=gnu++14,
> >> in which support for dynamic exception specifications has been removed.
> >>
> >> See
> http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
> >>
> >> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> >> ---
> >>   .../no-dynamic-exception-specifications.patch | 420 ++++++++++++++++++
> >>   .../mklibs/mklibs-native_0.1.44.bb            |   1 +
> >>   2 files changed, 421 insertions(+)
> >>   create mode 100644
> >>
> meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
>
> >>
> >>
> >> diff --git
> >>
> a/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
>
> >>
> b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
>
> >>
> >> new file mode 100644
> >> index 0000000000..5989a67c4f
> >> --- /dev/null
> >> +++
> >>
> b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
>
> >>
> >> @@ -0,0 +1,420 @@
> >> +In gcc 11 the default mode for C++ is now -std=gnu++17 instead of
> >> -std=gnu++14,
> >> +in which support for dynamic exception specifications has been removed.
> >> +
> >> +See
> http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
> >> +
> >> +Upstream-Status: Pending
> >> +
> >
> > the patch could be submitted upstream. Please try to do so
> >
>
> I tried to find a mailing list or maintainer I could post the patch to,
> but I'm not able to. Does anyone know who I should contact ?
>
> Given that it sounds more likely that we'll remove mklibs, I'll try to
> forward the patch to the project, but not promising anything.
>
> /Jacob
>
> 
>
>

--0000000000003c56fd05c297550b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Don&#39;t bother, it looks abandoned:</div><div><a hr=
ef=3D"https://salsa.debian.org/installer-team/mklibs">https://salsa.debian.=
org/installer-team/mklibs</a></div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, 18 May 2021 at 11:19, Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail=
.com">jacob.kroon@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On 5/18/21 12:20 AM, Khem Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 5/17/21 10:01 AM, Jacob Kroon wrote:<br>
&gt;&gt; In gcc 11 the default mode for C++ is now -std=3Dgnu++17 instead =
of <br>
&gt;&gt; -std=3Dgnu++14,<br>
&gt;&gt; in which support for dynamic exception specifications has been re=
moved.<br>
&gt;&gt;<br>
&gt;&gt; See <a href=3D"http://www.open-std.org/jtc1/sc22/wg21/docs/papers=
/2016/p0003r5.html" rel=3D"noreferrer" target=3D"_blank">http://www.open-st=
d.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmai=
l.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 .../no-dynamic-exception-specifications.patch | 420 ++++++=
++++++++++++<br>
&gt;&gt; =C2=A0 .../mklibs/<a href=3D"http://mklibs-native_0.1.44.bb" rel=
=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</a>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<b=
r>
&gt;&gt; =C2=A0 2 files changed, 421 insertions(+)<br>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifica=
tions.patch <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; diff --git <br>
&gt;&gt; a/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifi=
cations.patch <br>
&gt;&gt; b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifi=
cations.patch <br>
&gt;&gt;<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..5989a67c4f<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ <br>
&gt;&gt; b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifi=
cations.patch <br>
&gt;&gt;<br>
&gt;&gt; @@ -0,0 +1,420 @@<br>
&gt;&gt; +In gcc 11 the default mode for C++ is now -std=3Dgnu++17 instead=
 of <br>
&gt;&gt; -std=3Dgnu++14,<br>
&gt;&gt; +in which support for dynamic exception specifications has been r=
emoved.<br>
&gt;&gt; +<br>
&gt;&gt; +See <a href=3D"http://www.open-std.org/jtc1/sc22/wg21/docs/paper=
s/2016/p0003r5.html" rel=3D"noreferrer" target=3D"_blank">http://www.open-s=
td.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html</a><br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Pending<br>
&gt;&gt; +<br>
&gt; <br>
&gt; the patch could be submitted upstream. Please try to do so<br>
&gt; <br>
<br>
I tried to find a mailing list or maintainer I could post the patch to, <b=
r>
but I&#39;m not able to. Does anyone know who I should contact ?<br>
<br>
Given that it sounds more likely that we&#39;ll remove mklibs, I&#39;ll tr=
y to <br>
forward the patch to the project, but not promising anything.<br>
<br>
/Jacob<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000003c56fd05c297550b--
