Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id C1D6A7804A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 19:12:58 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id d78so9413014qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 12:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q9spxwOgk6f5of04JzCPfO5tEPGN+CIz+ewi7BrZDHg=;
	b=qBFOraYo3Ic2NDKT778ZNWu0VLJ+o4JJ39BrTi76AHBdlMGBPRffRH2sMr98tiB3Yl
	Y1gX/3KLjDXvL1cQyDm7/qx8NURsr2YFtVH4u3bQend8xDNxfRmr/hTufSbaWeAgxTtb
	jX8tsQAPuvCssgtPrVK2zTkdMFrS/UaM4ZsnZgBQTDb5nmvqEgVoJpzfGpzywiSlbCzi
	3pW1eD5KU0/tXiaSpsTEdPFaU6ndbulPFRhrZAnTLIgRbn7LaRI39IESsVgLkDxjNZw+
	KrFna+RWqDvLsjLtU1gMHbrCRJl3dtq36lo9pdDxgh9voE0IQtRzU7Hk/QN/27mfxT7U
	w2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q9spxwOgk6f5of04JzCPfO5tEPGN+CIz+ewi7BrZDHg=;
	b=RB2LCNXknuLAnsrW1GVhPZiGtq9J9xSZeWQxR3tWgycChpjuG35Qi4+cJu9MDPSaXD
	684IPTXLr7U8j7yZynAhjjJyRw8jkmwB8TOnGL9zEvKfhfnwoy+DqPuts6v1ZPS/biz/
	aqne9X8d1vg6eV7halwKkg/xcfTwGcbHAnwKAUcuc0MawjCQ5Jf44kXH372WtvzHNZPY
	pSSVF9XLXy+3eSV76ubZJyvblVK8AWsFKvWvDvneDtTin5EE1uCvSwpGglgIgfmjjxMm
	dvep/wB3boK7XGSD5oVHJJ0z3jz6gqLReh8DEgDhA1HPXV8HV+evulMaA0nh4mo6NU/8
	LUlg==
X-Gm-Message-State: AKS2vOzETCIE4ih7sUeDK5PothAIIwv+iQ5FyeUgnDOFg07cvyIvolmk
	lQRCTSbzRCxgMCOXTCXc9z5GSWhCkyD9
X-Received: by 10.55.140.193 with SMTP id o184mr11401393qkd.127.1498245179010; 
	Fri, 23 Jun 2017 12:12:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 23 Jun 2017 12:12:38 -0700 (PDT)
In-Reply-To: <20170623173145.GW28053@denix.org>
References: <1497893408-105889-1-git-send-email-denis@denix.org>
	<20170623173145.GW28053@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Jun 2017 20:12:38 +0100
Message-ID: <CAJTo0LYpRn0RAWBhHV-5sAfeEWLbQ3DV5Za74DrY+76rE-2EVw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libinput: upgrade to 1.7.3
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
X-List-Received-Date: Fri, 23 Jun 2017 19:12:59 -0000
Content-Type: multipart/alternative; boundary="001a114f0ce8ae87b60552a563f8"

--001a114f0ce8ae87b60552a563f8
Content-Type: text/plain; charset="UTF-8"

This has been in staging for a few days, will be merged soon.

Ross

On 23 June 2017 at 18:31, Denys Dmytriyenko <denis@denix.org> wrote:

> Ping.
>
> On Mon, Jun 19, 2017 at 01:30:08PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../recipes-graphics/wayland/{libinput_1.6.1.bb => libinput_1.7.3.bb}
> | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-graphics/wayland/{libinput_1.6.1.bb =>
> libinput_1.7.3.bb} (85%)
> >
> > diff --git a/meta/recipes-graphics/wayland/libinput_1.6.1.bb
> b/meta/recipes-graphics/wayland/libinput_1.7.3.bb
> > similarity index 85%
> > rename from meta/recipes-graphics/wayland/libinput_1.6.1.bb
> > rename to meta/recipes-graphics/wayland/libinput_1.7.3.bb
> > index c8714f2..6194fba 100644
> > --- a/meta/recipes-graphics/wayland/libinput_1.6.1.bb
> > +++ b/meta/recipes-graphics/wayland/libinput_1.7.3.bb
> > @@ -10,8 +10,8 @@ DEPENDS = "libevdev udev mtdev"
> >  SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
> >             file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
> \
> >  "
> > -SRC_URI[md5sum] = "7e282344f8ed7ec5cf87ca9fc22674fb"
> > -SRC_URI[sha256sum] = "9d816f13eee63bcca0e9c3bb652c52
> ab55f39be4d1b90b54e4bfd1dc92ef55a8"
> > +SRC_URI[md5sum] = "f2993b477db8d7ec0e785ce04ffecb03"
> > +SRC_URI[sha256sum] = "096d612d2711f0caa2de544976ff37
> 29e6233511ab373808644cc2dd5affcb1d"
> >
> >  inherit autotools pkgconfig
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114f0ce8ae87b60552a563f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This has been in staging for a few days, will be merged so=
on.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On 23 June 2017 at 18:31, Denys Dmytriyenko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@den=
ix.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Mon, Jun 19, 2017 at 01:30:08PM -0400, Denys Dmytriyenko wrote:<br>
&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.c=
om</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">d=
enys@ti.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-graphics/wayland/{<a href=3D"http://libinput_1.6.1.b=
b" rel=3D"noreferrer" target=3D"_blank"><wbr>libinput_1.6.1.bb</a> =3D&gt; =
<a href=3D"http://libinput_1.7.3.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibinput_1.7.3.bb</a>} | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-graphics/wayland/<wbr>{<a href=3D"http://lib=
input_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.6.1.bb</a> =
=3D&gt; <a href=3D"http://libinput_1.7.3.bb" rel=3D"noreferrer" target=3D"_=
blank">libinput_1.7.3.bb</a>} (85%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://libi=
nput_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.6.1.bb</a> b=
/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://libinput_1.7.3.bb" re=
l=3D"noreferrer" target=3D"_blank">libinput_1.7.3.bb</a><br>
&gt; similarity index 85%<br>
&gt; rename from meta/recipes-graphics/wayland/<a href=3D"http://libinput_1=
.6.1.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>libinput_1.6.1.bb</a><br=
>
&gt; rename to meta/recipes-graphics/wayland/<a href=3D"http://libinput_1.7=
.3.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>libinput_1.7.3.bb</a><br>
&gt; index c8714f2..6194fba 100644<br>
&gt; --- a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://libinput_1.=
6.1.bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.6.1.bb</a><br>
&gt; +++ b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://libinput_1.=
7.3.bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.7.3.bb</a><br>
&gt; @@ -10,8 +10,8 @@ DEPENDS =3D &quot;libevdev udev mtdev&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/software=
/${BPN}/${BP}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://www.freed=
esktop.org/<wbr>software/${BPN}/${BP}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://touchpad-serial-=
<wbr>synaptics-need-to-fake-new-<wbr>touches-on-TRIPLETAP.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>7e282344f8ed7ec5cf87ca9fc22674<wbr>fb&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>9d816f13eee63bcca0e9c3bb652c52<wbr>=
ab55f39be4d1b90b54e4bfd1dc92ef<wbr>55a8&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>f2993b477db8d7ec0e785ce04ffecb<wbr>03&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>096d612d2711f0caa2de544976ff37<wbr>=
29e6233511ab373808644cc2dd5aff<wbr>cb1d&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools pkgconfig<br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114f0ce8ae87b60552a563f8--
