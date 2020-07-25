Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.7812.1595675280791625506
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2020 04:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ikN8tnbE;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id q15so6200639vso.9
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2020 04:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2B/g2S8Mu0/0PiCKLHdo3B1MgeDVKzvaQuFQaeJTDhg=;
        b=ikN8tnbE757FAdVLtCPUMBC4pRLAMbWyqP4HflcJpmoPXwrFAEPb292jje2U93UZ+S
         kLXcHhHEMINVDpIXs8JoHh6975fTm6wrP7XoRAHS7l6m9w9WgVM2zks/GhDmfBuLxhoy
         oGqmZ1nZZDPqzCKcFK/REoj2C+yr94MAQjL5nUPapu2T7BrlY3xYEW7JUjr4JQLRt/qS
         JUMVp5c9hLwU8tzVrCPAzBVFDIMrSSrwQA64dUeLPbIYqvr5csXP7qj/RLTuFSUVwziT
         Ht+ZeHb6v3fGmBtbAkhYiGkN7GxItmZtagtPAE5p7ZdjVyq2woQjXFM0eLjVUQ9+honY
         GeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2B/g2S8Mu0/0PiCKLHdo3B1MgeDVKzvaQuFQaeJTDhg=;
        b=HKozmhmhe4XbtlBSAfMaU0Xx2uOMFDaiJPkjcw9SOjviiMSxHoumLVuu01SEHpnGYA
         yItDrRpJVtAmbYtKaLs9UrZbINrozbMvW5CWWZTc7Lh1SQiBCn80wNAM3NIai/8c7HvX
         El1FtNjtzqK3Xst2evw7SgLqiVpR2Si1Ow+/Z+2kLe2HV1gLzDI/MQf+POEySQtLvLMY
         ExKAOdlCnFA1xBQhi4WGAzgtoOls0z7bl+Kq7sFEFofVv+heYxEA7UmsaZT0g/lk+Y1G
         ftLCf1YrJaW61SFaQ5ure2FCdocNqM9ByxxFGPCdnJ58U+tY0VRtckbh7IvAW13HMd1f
         qaQw==
X-Gm-Message-State: AOAM532yAJcEy9aDGP/fIWuhfv4JTq4Pef08pNqXuURqTJrFiCKBphvv
	ZM/7RI1kPXhoshxMbxsmiYiYnT3yrEZo5NcchNA=
X-Google-Smtp-Source: ABdhPJy7TZf8TnGmg2lwldL9WxRgBWqguFTg0wOaXPyzPGdHu+B+93neMHNPqQWEw8N6jEteU3NbBV4sORRbgMYdmF4=
X-Received: by 2002:a67:cf88:: with SMTP id g8mr10654377vsm.25.1595675279934;
 Sat, 25 Jul 2020 04:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134844.105405-1-trevor.gamblin@windriver.com>
 <CAMKF1soY7W40VRw-puspRKkmQ0FEiFk35=W_z=uz93Hj2mWVxA@mail.gmail.com> <f6d9c9c0-71e1-439e-f20e-00f7cc721c0e@windriver.com>
In-Reply-To: <f6d9c9c0-71e1-439e-f20e-00f7cc721c0e@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 25 Jul 2020 13:07:48 +0200
Message-ID: <CANNYZj8J_ZrcQNLqPg0NRUfu042kCBJWmiDaxejTyuWnv9MMmw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] llvm: upgrade 9.0.1 -> 10.0.0
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003cc9fc05ab421ada"

--0000000000003cc9fc05ab421ada
Content-Type: text/plain; charset="UTF-8"

Llvm 10.0.1 is now out, please rebase and resend the patches :)

Alex

On Fri, 29 May 2020 at 15:30, Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

>
> On 5/28/20 9:57 PM, Khem Raj wrote:
> > On Wed, May 27, 2020 at 6:48 AM Trevor Gamblin
> > <trevor.gamblin@windriver.com> wrote:
> >> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> >> ---
> >>   meta/recipes-devtools/llvm/llvm_git.bb | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
> b/meta/recipes-devtools/llvm/llvm_git.bb
> >> index d24ed761bf..787cc3adcf 100644
> >> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> >> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> >> @@ -19,9 +19,9 @@ inherit cmake pkgconfig
> >>
> >>   PROVIDES += "llvm${PV}"
> >>
> >> -MAJOR_VERSION = "9"
> >> +MAJOR_VERSION = "10"
> >>   MINOR_VERSION = "0"
> >> -PATCH_VERSION = "1"
> >> +PATCH_VERSION = "0"
> >>
> > It also needs updating LLVMVERSION in
> > meta/conf/distro/include/tcmode-default.inc
> > secondly, I would suggest to wait for 10.0.1 which is releasing in a
> weeks time.
>
> Alright, I'll watch for that release.
>
> Thanks!
>
> >
> >>   PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
> >>
> >> @@ -29,7 +29,7 @@ LLVM_RELEASE = "${PV}"
> >>   LLVM_DIR = "llvm${LLVM_RELEASE}"
> >>
> >>   BRANCH = "release/${MAJOR_VERSION}.x"
> >> -SRCREV = "c1a0a213378a458fbea1a5c77b315c7dce08fd05"
> >> +SRCREV = "d32170dbd5b0d54436537b6b75beaf44324e0c28"
> >>   SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH}
> <http://github.com/llvm/llvm-project.git;branch=$%7BBRANCH%7D> \
> >>
> file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2
> \
> >>
> file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
> >> --
> >> 2.24.1
> >>
> >>
> 
>

--0000000000003cc9fc05ab421ada
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Llvm 10.0.1 is now out, please rebase and resend the =
patches :)</div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 29 May 2020 at 15=
:30, Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com">tre=
vor.gamblin@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
On 5/28/20 9:57 PM, Khem Raj wrote:<br>
&gt; On Wed, May 27, 2020 at 6:48 AM Trevor Gamblin<br>
&gt; &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" target=3D"_blank"=
>trevor.gamblin@windriver.com</a>&gt; wrote:<br>
&gt;&gt; Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gambli=
n@windriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-devtools/llvm/<a href=3D"http://llvm_git=
.bb" rel=3D"noreferrer" target=3D"_blank">llvm_git.bb</a> | 6 +++---<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">llvm_git.bb</a> b/meta/recipes-d=
evtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">llvm_git.bb</a><br>
&gt;&gt; index d24ed761bf..787cc3adcf 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" r=
el=3D"noreferrer" target=3D"_blank">llvm_git.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" r=
el=3D"noreferrer" target=3D"_blank">llvm_git.bb</a><br>
&gt;&gt; @@ -19,9 +19,9 @@ inherit cmake pkgconfig<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0PROVIDES +=3D &quot;llvm${PV}&quot;<br>
&gt;&gt;<br>
&gt;&gt; -MAJOR_VERSION =3D &quot;9&quot;<br>
&gt;&gt; +MAJOR_VERSION =3D &quot;10&quot;<br>
&gt;&gt;=C2=A0 =C2=A0MINOR_VERSION =3D &quot;0&quot;<br>
&gt;&gt; -PATCH_VERSION =3D &quot;1&quot;<br>
&gt;&gt; +PATCH_VERSION =3D &quot;0&quot;<br>
&gt;&gt;<br>
&gt; It also needs updating LLVMVERSION in<br>
&gt; meta/conf/distro/include/tcmode-default.inc<br>
&gt; secondly, I would suggest to wait for 10.0.1 which is releasing in a =
weeks time.<br>
<br>
Alright, I&#39;ll watch for that release.<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0PV =3D &quot;${MAJOR_VERSION}.${MINOR_VERSION}.${PATC=
H_VERSION}&quot;<br>
&gt;&gt;<br>
&gt;&gt; @@ -29,7 +29,7 @@ LLVM_RELEASE =3D &quot;${PV}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0LLVM_DIR =3D &quot;llvm${LLVM_RELEASE}&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0BRANCH =3D &quot;release/${MAJOR_VERSION}.x&quot;<br>
&gt;&gt; -SRCREV =3D &quot;c1a0a213378a458fbea1a5c77b315c7dce08fd05&quot;<=
br>
&gt;&gt; +SRCREV =3D &quot;d32170dbd5b0d54436537b6b75beaf44324e0c28&quot;<=
br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/=
llvm/llvm-project.git;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer" target=3D"=
_blank">github.com/llvm/llvm-project.git;branch=3D${BRANCH}</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-llvm-=
TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=3D2 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-llvm-=
allow-env-override-of-exe-path.patch;striplevel=3D2 \<br>
&gt;&gt; --<br>
&gt;&gt; 2.24.1<br>
&gt;&gt;<br>
&gt;&gt; <br>
<br>
</blockquote></div>

--0000000000003cc9fc05ab421ada--
