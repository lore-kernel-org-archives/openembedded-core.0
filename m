Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 11B577DDCA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 14:22:23 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id t76so7370520wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dLAKPKb/tw2M5qUQ3sUUOxxn3cXTrNFJA/RF0xvaThs=;
	b=W7Qcvx3Lw9d2O2npPtmdGJUF9DNpx0fpacezZ/Y4Gw/MPXO/RT0xGuzOpE5KWz8746
	61gMeD46autT5vQEuKKI0xzmi/t5+6dpfUJUIwSprUS+BjlRRcDFs1CAyF8P47w03GdW
	xkzBdDmauNuGO018AkYP2zoGWlM3U55m9BXLqb0AEexZlfYur0oCdWl2UxXriUBZywUf
	n/URBVY5Rt6hRV6s1nAH9KUnEq1ik80+ipXvM/Jog7mHowbYzemZMXv7vjgm7uevcCEt
	3SKaijVLf7Yrp0nUr3+eKDno2n2gKiBsUsxjRMcMAyyZWa0geA1qu8HUYAZGiurkAyd0
	K28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dLAKPKb/tw2M5qUQ3sUUOxxn3cXTrNFJA/RF0xvaThs=;
	b=CzGYKEu9chsfcpiV65kcrOecsXgs9FUUIcUmRQlp5OoKGkPkVG2BPEjLfaE8iLbWG0
	DAb54uFnn/wDfxeJ0TkC1hfWPq8YQzmuZ/2LubrGibCgr7ZJ9t3x5gqjE9SdO+TpvowN
	BrsUT4wuHlucXMNbA1ssE2TRZEUGEMMEQoZJtNkQyVEvfk7PzC0M4DGoLm9gicf01L0i
	JzA8wmd2e5AnsaOG+h5AHT82VSkCNUV01j16dCW6In2s+s1xqVHlw9M1OH4rNSz7b+3v
	nnCCYNb+lCfCgjSi133GUmdYPB8xpMa/VGxxYQBcUmRk0enRB5A81c3hKCP9XY2nhH0e
	r61w==
X-Gm-Message-State: APjAAAVn4Y6bho0J4EZQJg/Kf+KFInG/81szyXS5v4KoGw6k5QS9K+oo
	MNu/3jDHhhNDLhXFY9dRzjdW4C5QF2gv45bP2qU=
X-Google-Smtp-Source: APXvYqxEV+fHxkTZjnQvZTtRVjdF1bt9KD59xw2Zlz5n0DbynvaIOuGiKOBERs1O2MXlBUh5kb70+s65t4XK3eMdOgw=
X-Received: by 2002:a1c:e3c4:: with SMTP id a187mr6804157wmh.87.1556893344593; 
	Fri, 03 May 2019 07:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <1556826055-7896-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LYPgt+hnVkvnMmt85eCW4bjq1rhugRNoXi5CQY+fQKz4g@mail.gmail.com>
In-Reply-To: <CAJTo0LYPgt+hnVkvnMmt85eCW4bjq1rhugRNoXi5CQY+fQKz4g@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Fri, 3 May 2019 16:22:13 +0200
Message-ID: <CALatG=4JGQkQebOimNOJueDCUOUK=4jGKVTCEsVHbqO+P8TQaA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: gerard.salvatella@toradex.com, Stefan Agner <stefan.agner@toradex.com>,
	Luka Pivk <luka.pivk@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fix a libxkbcommon runtime error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2019 14:22:24 -0000
Content-Type: multipart/alternative; boundary="000000000000c1fd880587fc7a36"

--000000000000c1fd880587fc7a36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ross:

Copy that, will make a V2 soon.

the best,
thank you

Burton, Ross <ross.burton@intel.com> =E6=96=BC 2019=E5=B9=B45=E6=9C=883=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8811:58=E5=AF=AB=E9=81=93=EF=BC=
=9A

> I'd much prefer a dependency that is conditional on the
> DISTRO_FEATURES and have an alternative recipe that just ships the
> locale data.
>
> Ross
>
> On Thu, 2 May 2019 at 20:41, <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > We had observed a runtime error when we run a QT application on weston
> > compositor, as follows:
> > | xkbcommon: ERROR: couldn't find a Compose file for locale "C"
> >
> > after some investigation, we found the libx11-locale is being required
> > by libxkbcommon at runtime, or else we get the above error and the QT
> > widgets could not get the keyboard events.
> >
> > To fix the issue, I think there might be two ways:
> >
> > 1 Allow the libx11 to be built without the requirement for x11 being in
> >   DISTRO_FEATURES, as this patch series are trying to do.
> > 2 Create another libx11-data recipe to provide the locales of libx11.
> >
> > I would like to get your input about this fix, please kindly help me
> > review it.
> >
> > Ming Liu (2):
> >   meta: unset REQUIRED_DISTRO_FEATURES for libx11 and its dependents
> >   libxkbcommon: RDEPENDS on libx11-locale
> >
> >  meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb       | 2 ++
> >  meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb       | 2 ++
> >  meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb      | 4 ----
> >  meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb     | 2 ++
> >  meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb | 4 ++++
> >  meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb       | 2 ++
> >  6 files changed, 12 insertions(+), 4 deletions(-)
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c1fd880587fc7a36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Ross:<div><br></div><div>Copy that, will make a V2 soo=
n.</div><div><br></div><div>the best,</div><div>thank you</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Burton, Ross=
 &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;=
 =E6=96=BC 2019=E5=B9=B45=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=
=E5=8D=8811:58=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">I&#39;d much prefer a dependency that is conditio=
nal on the<br>
DISTRO_FEATURES and have an alternative recipe that just ships the<br>
locale data.<br>
<br>
Ross<br>
<br>
On Thu, 2 May 2019 at 20:41, &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;<br>
&gt; We had observed a runtime error when we run a QT application on weston=
<br>
&gt; compositor, as follows:<br>
&gt; | xkbcommon: ERROR: couldn&#39;t find a Compose file for locale &quot;=
C&quot;<br>
&gt;<br>
&gt; after some investigation, we found the libx11-locale is being required=
<br>
&gt; by libxkbcommon at runtime, or else we get the above error and the QT<=
br>
&gt; widgets could not get the keyboard events.<br>
&gt;<br>
&gt; To fix the issue, I think there might be two ways:<br>
&gt;<br>
&gt; 1 Allow the libx11 to be built without the requirement for x11 being i=
n<br>
&gt;=C2=A0 =C2=A0DISTRO_FEATURES, as this patch series are trying to do.<br=
>
&gt; 2 Create another libx11-data recipe to provide the locales of libx11.<=
br>
&gt;<br>
&gt; I would like to get your input about this fix, please kindly help me<b=
r>
&gt; review it.<br>
&gt;<br>
&gt; Ming Liu (2):<br>
&gt;=C2=A0 =C2=A0meta: unset REQUIRED_DISTRO_FEATURES for libx11 and its de=
pendents<br>
&gt;=C2=A0 =C2=A0libxkbcommon: RDEPENDS on libx11-locale<br>
&gt;<br>
&gt;=C2=A0 meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.6.7.bb=
" rel=3D"noreferrer" target=3D"_blank">libx11_1.6.7.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 meta/recipes-graphics/xorg-lib/<a href=3D"http://libxau_1.0.9.bb=
" rel=3D"noreferrer" target=3D"_blank">libxau_1.0.9.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_1.13.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libxcb_1.13.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 | 4 ----<br>
&gt;=C2=A0 meta/recipes-graphics/xorg-lib/<a href=3D"http://libxdmcp_1.1.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libxdmcp_1.1.3.bb</a>=C2=A0 =C2=A0=
 =C2=A0| 2 ++<br>
&gt;=C2=A0 meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_0.=
8.4.bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_0.8.4.bb</a> | 4 =
++++<br>
&gt;=C2=A0 meta/recipes-graphics/xorg-lib/<a href=3D"http://xtrans_1.4.0.bb=
" rel=3D"noreferrer" target=3D"_blank">xtrans_1.4.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 6 files changed, 12 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000c1fd880587fc7a36--
