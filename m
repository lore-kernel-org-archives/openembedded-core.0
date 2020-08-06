Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.393.1596688366704884866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 21:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YCQKJLJO;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id dd12so16821191qvb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 21:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VHKTzb+fEyfUlg+eL8/J9+eDvXS+i3QPQLgZPhaxs/g=;
        b=YCQKJLJOFmhQZUZcEUn08EjnXOmjNFxOZfEaxQqVr4ackpYlylyY4ug7dYQT+9+FTY
         cdY8jO27Fdp+50cMEV4sLnqDnDcdqaFZT5XZo/59+K54/GbSO3UM9WEADUyTvlEkPFDe
         Yr3vPCobDUWN9PCDx/6X/uh1nVaQ40wtyFbImOKZDTAtHkDVbagO9WC52f7PsHreRu3D
         j59BGjtrvtXa9DhHzjTIlLQVlboC7zPyVDdO/iBuKqcXPnJhwkluF0QeRfi5UIYmPQ9r
         xXRGPiV+iVjoz3RH9DBqIWLTxDul8wm6qGWh1kE8Y8cPhlQK8C1zj+Dp2b2Wq2x3EwuV
         MWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VHKTzb+fEyfUlg+eL8/J9+eDvXS+i3QPQLgZPhaxs/g=;
        b=X+tKB599VvdP/cXKPjvJ5S+VCuXrcLdv0u9wWAKYGdFyzcBvXDWyG9QBtGiT1wzGBi
         YkvAr/WR248N1EwneRwcSZ6KA7uLo+g8yPrWNRRBq3ix1Z5fq14T9Kh4eExsL0Xz7H32
         FXD2+9eJWSagV6hdC+Z2wqzhc65y7nv4QSVTLdmmjPGztDQ1bA+NoKxJIiehTwFpQUR0
         0Bwzl435ALBopJ6ooEMmmkHv7918ho3bw1kurVjTMK5gGEFUNOEzmGcRyRAj+VteMA9D
         6d+fIm8qYlKOmB/c8l81ILdwUJwzL9/zFgCisRXxtmaP5K5Rm3J8T3hvBIf/sX+0O2Aq
         Uicw==
X-Gm-Message-State: AOAM53122Yw9558RjniTLDNHsR1DsMhkJoj0toy2aZvUQM0jDqL3XGkw
	bsyb5bak0IYonhnwZQr8gJLl+oaUakZDQAwNyo0=
X-Google-Smtp-Source: ABdhPJxnnVpUeoWGJWQrCAFw8G+NJZ6tA5R+xFUGHPQtQyKEqNCiElazyZslv7MqDlivmXiyseXIuF0T1E3Cr7w3Mrs=
X-Received: by 2002:a0c:b591:: with SMTP id g17mr7328216qve.4.1596688365741;
 Wed, 05 Aug 2020 21:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200805190819.935438-1-raj.khem@gmail.com> <042aa5f860ca83daf551472440bb9a06c1629850.camel@intel.com>
In-Reply-To: <042aa5f860ca83daf551472440bb9a06c1629850.camel@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 Aug 2020 21:32:34 -0700
Message-ID: <CAMKF1spL25=4SQjQuCZRO-cgPnCrhw8QwTcg7v=Ad_L_d+EC9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] xf86-video-intel: Fix build with -fno-common
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000db6ad005ac2dfa12"

--000000000000db6ad005ac2dfa12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2020 at 6:38 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> On Wed, 2020-08-05 at 12:08 -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...0001-i810-Make-I810PatternROP-extern.patch | 29
> > +++++++++++++++++++
> >  .../xorg-driver/xf86-video-intel_git.bb       |  1 +
> >  2 files changed, 30 insertions(+)
> >  create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-
> > intel/0001-i810-Make-I810PatternROP-extern.patch
> >
> > diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-
> > i810-Make-I810PatternROP-extern.patch b/meta/recipes-graphics/xorg-
> > driver/xf86-video-intel/0001-i810-Make-I810PatternROP-extern.patch
> > new file mode 100644
> > index 0000000000..610efd65d9
> > --- /dev/null
> > +++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-
> > Make-I810PatternROP-extern.patch
> > @@ -0,0 +1,29 @@
> > +From c9a9791576025e46f4411342c0e29ffcc79869ca Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 5 Aug 2020 11:51:54 -0700
> > +Subject: [PATCH] i810: Make I810PatternROP extern
> > +
> > +Its also defined in i810_accel.c
> > +Fixes build with -fno-common
> > +
> > +Upstream-Status: Pending
>
> Should we take this exact same change so we can mark this as a
> backport?
>
>
> https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/commit/652=
d93cbbdc159c0883f1b626ea48e28bac63ae3


I think that=E2=80=99s better will just add the backport bits and send v2

<https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/commit/652d=
93cbbdc159c0883f1b626ea48e28bac63ae3>
>
> Thanks,
>
> Anuj
>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/legacy/i810/i810.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/legacy/i810/i810.h b/src/legacy/i810/i810.h
> > +index 347188c9..19be049c 100644
> > +--- a/src/legacy/i810/i810.h
> > ++++ b/src/legacy/i810/i810.h
> > +@@ -322,6 +322,6 @@ extern void I810InitMC(ScreenPtr pScreen);
> > + extern const OptionInfoRec *I810AvailableOptions(int chipid, int
> > busid);
> > +
> > + extern const int I810CopyROP[16];
> > +-const int I810PatternROP[16];
> > ++extern const int I810PatternROP[16];
> > +
> > + #endif /* _I810_H_ */
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-
> > intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-
> > intel_git.bb
> > index 7ab2236237..3c97b8c4f4 100644
> > --- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> > +++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> > @@ -15,6 +15,7 @@ S =3D "${WORKDIR}/git"
> >
> >  SRC_URI =3D "git://anongit.freedesktop.org/xorg/driver/xf86-video-
> > intel \
> >             file://0001-Sync-i915_pciids-upto-8717c6b7414f.patch \
> > +           file://0001-i810-Make-I810PatternROP-extern.patch \
> >  "
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
> >=20
>

--000000000000db6ad005ac2dfa12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 5, 2020 at 6:38 PM Mittal, Anuj &lt;<a href=3D=
"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color=
:rgb(204,204,204)">On Wed, 2020-08-05 at 12:08 -0700, Khem Raj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...0001-i810-Make-I810PatternROP-extern.patch | 29<br>
&gt; +++++++++++++++++++<br>
&gt;=C2=A0 .../xorg-driver/<a href=3D"http://xf86-video-intel_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xf86-video-intel_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 30 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video=
-<br>
&gt; intel/0001-i810-Make-I810PatternROP-extern.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-=
<br>
&gt; i810-Make-I810PatternROP-extern.patch b/meta/recipes-graphics/xorg-<b=
r>
&gt; driver/xf86-video-intel/0001-i810-Make-I810PatternROP-extern.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 0000000000..610efd65d9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-<b=
r>
&gt; Make-I810PatternROP-extern.patch<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +From c9a9791576025e46f4411342c0e29ffcc79869ca Mon Sep 17 00:00:00<br=
>
&gt; 2001<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 5 Aug 2020 11:51:54 -0700<br>
&gt; +Subject: [PATCH] i810: Make I810PatternROP extern<br>
&gt; +<br>
&gt; +Its also defined in i810_accel.c<br>
&gt; +Fixes build with -fno-common<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
<br>
Should we take this exact same change so we can mark this as a<br>
backport?<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/c=
ommit/652d93cbbdc159c0883f1b626ea48e28bac63ae3" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/=
commit/652d93cbbdc159c0883f1b626ea48e28bac63ae3</a></blockquote><div dir=3D=
"auto"><br></div><div dir=3D"auto">I think that=E2=80=99s better will just =
add the backport bits and send v2=C2=A0</div><div dir=3D"auto"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)"><a href=3D"https://gitlab.freedesktop.org/xorg/driver/xf86-v=
ideo-intel/-/commit/652d93cbbdc159c0883f1b626ea48e28bac63ae3" rel=3D"norefe=
rrer" target=3D"_blank"></a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/legacy/i810/i810.h | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/legacy/i810/i810.h b/src/legacy/i810/i810.h<br>
&gt; +index 347188c9..19be049c 100644<br>
&gt; +--- a/src/legacy/i810/i810.h<br>
&gt; ++++ b/src/legacy/i810/i810.h<br>
&gt; +@@ -322,6 +322,6 @@ extern void I810InitMC(ScreenPtr pScreen);<br>
&gt; + extern const OptionInfoRec *I810AvailableOptions(int chipid, int<br=
>
&gt; busid);<br>
&gt; + <br>
&gt; + extern const int I810CopyROP[16];<br>
&gt; +-const int I810PatternROP[16];<br>
&gt; ++extern const int I810PatternROP[16];<br>
&gt; + <br>
&gt; + #endif /* _I810_H_ */<br>
&gt; +-- <br>
&gt; +2.28.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-<br>
&gt; <a href=3D"http://intel_git.bb" rel=3D"noreferrer" target=3D"_blank">=
intel_git.bb</a> b/meta/recipes-graphics/xorg-driver/xf86-video-<br>
&gt; <a href=3D"http://intel_git.bb" rel=3D"noreferrer" target=3D"_blank">=
intel_git.bb</a><br>
&gt; index 7ab2236237..3c97b8c4f4 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-video-=
intel_git.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-intel_git.bb<=
/a><br>
&gt; +++ b/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-video-=
intel_git.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-intel_git.bb<=
/a><br>
&gt; @@ -15,6 +15,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://anongit.freedesktop.o=
rg/xorg/driver/xf86-video-" rel=3D"noreferrer" target=3D"_blank">anongit.fr=
eedesktop.org/xorg/driver/xf86-video-</a><br>
&gt; intel \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Sync-i915_=
pciids-upto-8717c6b7414f.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-i810-Make-I810P=
atternROP-extern.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+=
)&quot;<br>
&gt; <br>
</blockquote></div></div>

--000000000000db6ad005ac2dfa12--
