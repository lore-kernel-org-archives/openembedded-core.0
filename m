Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web11.5292.1588178369330272307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MlPDas3i;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id p5so887295vke.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bmNDBx9ZtmtTogO+yCX/KBAPkJsofKF7q7lHo2hARhI=;
        b=MlPDas3iIbZ661Dgrgpw7X5OzCNqXsHdxUcZbZLXoFioLjW8T5GD6rHexyJog9/OG5
         hVQaKarsB3Xh9i7RLhp80mRqWKGkMblX+DVAzgw5GGb0XXhNqUbIZ7jKpIcL6l7kcu2I
         HQW9/BSxpqRnRFPwRV+dIE0svs74NoFkRJEpw8uleWPsKJw6qV0DyjuB7+Lc6fkcjFFL
         udnCBovlyv2FcYnEL0xKE26JQCkf+CY5IzHWhkxHMmEGKSks2NJn90ePx3aIW33CrM1v
         O0lFz4M+MHn+7zbAaZiVzszl6u+BHTBaCkltTL+9DDo66xTuJb2JJ5YdGz9kMjPEzkr1
         hWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bmNDBx9ZtmtTogO+yCX/KBAPkJsofKF7q7lHo2hARhI=;
        b=DPWpqb8V6hmSbNVIZui5d7PRA0lz0XY7zzCQ251nrB08bYnm6EGKqQoCyw8ZCpYmuj
         hVZ6wc1YZ/NjTmD9eGSQrQCO5geIF84xLfkkUq3L+DgQ9RgqA734+AXsKhhYUmM/AyzE
         ElZ6AL18BeYT/S0WYryyXAnlQgSjeWVr6iHCTp1lBdfVjVPgHUt9h8zvWUsNHSetGwWb
         hwi0CBzpWCx/+546+yi1DiF9ywc1j7sdRoNb4PGzU0LY7HTfEaetBXpPFPDUMlhyWDf6
         2R1OtGtnOS4aB/i9IuqQ1gNANjj5UF8JgJF5nKHXS3hzGH/GD0Qeg7cHRQ7MRx/nEvhk
         V0pw==
X-Gm-Message-State: AGi0PuZtbDRnm+4xWQl1T9us3HwZKHX4VL77wot2JzKw9xOs15ZErcld
	uDjpkdcQCfPe4okf3iSceXeIbHWuO5Eb2NALPrRChg==
X-Google-Smtp-Source: APiQypKEgo5ik3E/ZOVmGUtebzAzSs4zj0BOwwZC5yDeOQhlWblRcUIsMiTHtBn37DivmP8Vp9GOHTAiBSIAUcO5EzY=
X-Received: by 2002:ac5:c810:: with SMTP id y16mr14878324vkl.49.1588178368265;
 Wed, 29 Apr 2020 09:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200429143353.11360-1-oleksandr.s.popovych@globallogic.com>
In-Reply-To: <20200429143353.11360-1-oleksandr.s.popovych@globallogic.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 29 Apr 2020 18:39:16 +0200
Message-ID: <CANNYZj-Svfwh9YFEmszHXaxUF5EevT5Ygug147isBYzuTooYpg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] expat: Added ptest
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
Content-Type: multipart/alternative; boundary="0000000000007b02aa05a47097a5"

--0000000000007b02aa05a47097a5
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2020 at 16:46, Oleksandr via lists.openembedded.org
<oleksandr.s.popovych=globallogic.com@lists.openembedded.org> wrote:

> For ptest support for expat package:
>
>  - expat_2.2.9.bb recipe was switched on cmake-based building system to
> avoid cahnges in autotools build system  which considered in upstream as
> potentially deprecated (https://github.com/libexpat/libexpat/issues/330).
>
>  - expat_2.2.9.bb recipe was divided into expat_2.2.9.bb recipe which is
> switched on cmake-based build system and expat-native_2.2.9.bb recipe
> which is left with autotools build system. This solves problem with
> dependency loop between cmake-native and expat-native packages. Without
> this split, because expat-native package is listed in DEPENDS for
> cmake-native package, next dependency loop appears:
>

Cmake actually bundles expat in its source tree, and there's an option to
use it. Can you please enable that (for cmake-native only), so the
dependency loop, relying on autotools in expat-native, and splitting the
expat recipe are avoided?

Alex

--0000000000007b02aa05a47097a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 29 Apr 2020 at 16:46, Oleksandr v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;oleksandr.s.popovych=3D<a href=3D"mailto:globallogic.com@lists.openembedde=
d.org">globallogic.com@lists.openembedded.org</a>&gt; wrote:<br></div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">For=
 ptest support for expat package:<br>
<br>
=C2=A0- <a href=3D"http://expat_2.2.9.bb" rel=3D"noreferrer" target=3D"_bla=
nk">expat_2.2.9.bb</a> recipe was switched on cmake-based building system t=
o<br>
avoid cahnges in autotools build system=C2=A0 which considered in upstream =
as<br>
potentially deprecated (<a href=3D"https://github.com/libexpat/libexpat/iss=
ues/330" rel=3D"noreferrer" target=3D"_blank">https://github.com/libexpat/l=
ibexpat/issues/330</a>).<br>
<br>
=C2=A0- <a href=3D"http://expat_2.2.9.bb" rel=3D"noreferrer" target=3D"_bla=
nk">expat_2.2.9.bb</a> recipe was divided into <a href=3D"http://expat_2.2.=
9.bb" rel=3D"noreferrer" target=3D"_blank">expat_2.2.9.bb</a> recipe which =
is<br>
switched on cmake-based build system and <a href=3D"http://expat-native_2.2=
.9.bb" rel=3D"noreferrer" target=3D"_blank">expat-native_2.2.9.bb</a> recip=
e<br>
which is left with autotools build system. This solves problem with<br>
dependency loop between cmake-native and expat-native packages. Without<br>
this split, because expat-native package is listed in DEPENDS for<br>
cmake-native package, next dependency loop appears:<br></blockquote><div><b=
r></div><div>Cmake actually bundles expat in its source tree, and there&#39=
;s an option to use it. Can you please enable that (for cmake-native only),=
 so the dependency loop, relying on autotools in expat-native, and splittin=
g the expat recipe are avoided?</div><div><br></div><div>Alex<br></div></di=
v></div>

--0000000000007b02aa05a47097a5--
