Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 593F26142E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:52:01 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id r18so9445513vso.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ikUfxAh1m1nrRSlpDfKpm6YYznHG0CQFUjg7Yjd2M4k=;
	b=NBJtUB5njWvX4tphAmkWpqKVihQmecPXkYBlMp3yS86GRNp7PfEYtEmYlOE9kY0YH5
	peI41u897LDcVOIGPWRhhScl0f/AumUoubXEnLmPm3Luvwu9Cj683JO6UuN9HibzkzLK
	+og66heM3yysclzf14uB1FsJpHvD5IydUFmbb5MyVXongdkDhWW8cfKGYeoQVvIvIzKX
	BdmcfUQv7GWKgNcrFKyW1nMo3DoSz7OEkRyauQHM3GcmTsg/qEMhCs3TvH5D8M0imiOx
	O1aYz0yQDygSbE2ckk3fYjB+FHFcQ9NA4FdgeslYxvyHILmjNmM08iBdt1qBHSflX/qY
	6BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ikUfxAh1m1nrRSlpDfKpm6YYznHG0CQFUjg7Yjd2M4k=;
	b=FSJccBo9gfZWvai7Dnugj41RDskZRbbFZ99tN4Ptps+XiJ5QHqqqJB9fbjukH91twy
	AY0WgcAqoeJaC4iJw9ZEacDDFK1jla7ykzdRaYHeY3k7XUVVTriSkba2UBum7LIIkuMK
	j2LO72h4htarHlKbV3/BijiP3Jp/AyGE2l8UICxd5GPSf5FYXAo+g0Cfjpw3Uxxz4Lqs
	QORZ1Fr72oodzeJsTs9FbV2Kr1208japKR0NFu5Dh86UG+uMsMUhCWiXm2ESAgR0TzA2
	kIMuDrSLVOtO3d7gSjU3iTF8YHiU/NumKSbQ/RvNc4/WMB/tdYgxRLwxyUklTxDR1muc
	OTZQ==
X-Gm-Message-State: APjAAAVoKZFke+ahFvXAzi2jL8Q7IesED3YgLANAEnJB63wmBEeMsWB8
	jh6fq83bkyMEzKSkV4+cIMEYajpMWnKHt9fj67k=
X-Google-Smtp-Source: APXvYqyYJSYDqgyJkLEjFJrJ9h4ebsXBIP8yBEDSAPeiBqIPqJwzEWHsWmlt1cQ2IpVuxYEM3udR6AdUCckEPY7Fcjc=
X-Received: by 2002:a67:7987:: with SMTP id u129mr6684279vsc.83.1581886322101; 
	Sun, 16 Feb 2020 12:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-8-alex.kanavin@gmail.com>
	<CAMKF1sq9i1=fzsAFiCm+kWPudORLp7gXxpWKZHYF7rRYMN2i0A@mail.gmail.com>
In-Reply-To: <CAMKF1sq9i1=fzsAFiCm+kWPudORLp7gXxpWKZHYF7rRYMN2i0A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Feb 2020 21:51:50 +0100
Message-ID: <CANNYZj_7fu6SHkginQ38BC8QXnP=9MPu3f8NQBTwBgeaAbHvWQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/10] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Sun, 16 Feb 2020 20:52:01 -0000
Content-Type: multipart/alternative; boundary="0000000000004dd1a7059eb79cc1"

--0000000000004dd1a7059eb79cc1
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Feb 2020 at 21:15, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Feb 16, 2020 at 7:52 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > webkit nowadays requires a couple of supplementary libraries for this,
> > so bring them in (courtesy of meta-browser, which will hopefully
> > adjust without a lot of trouble).
>
> its not meta-browser, I guess you should credit meta-wpe here [1]
> and perhaps Cc the meta-wpe maintainer as a courtesy.
>

Actually, it's copied from meta-webkit
https://github.com/Igalia/meta-webkit/
which does not say in the readme who the maintainer is, so I am not sure
whom to CC.
I can adjust the commit msg though.

Alex



>
> [1]
> https://github.com/WebPlatformForEmbedded/meta-wpe/tree/master/recipes-wpe/libwpe
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-sato/webkit/libwpe_1.4.0.1.bb    | 19 +++++++++++++++++++
> >  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb  |  2 +-
> >  .../webkit/wpebackend-fdo_1.4.1.bb            | 19 +++++++++++++++++++
> >  3 files changed, 39 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
> >  create mode 100644 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> >
> > diff --git a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
> b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
> > new file mode 100644
> > index 0000000000..b9c71f9dc5
> > --- /dev/null
> > +++ b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "General-purpose library specifically developed for the
> WPE-flavored port of WebKit."
> > +HOMEPAGE = "https://github.com/WebPlatformForEmbedded/libwpe"
> > +BUGTRACKER = "https://github.com/WebPlatformForEmbedded/libwpe/issues"
> > +
> > +LICENSE = "BSD"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=371a616eb4903c6cb79e9893a5f615cc"
> > +DEPENDS = "virtual/egl libxkbcommon"
> > +
> > +# Workaround build issue with RPi userland EGL libraries.
> > +CFLAGS_append_rpi = " ${@bb.utils.contains('MACHINE_FEATURES',
> 'vc4graphics', '', '-D_GNU_SOURCE', d)}"
> > +
> > +inherit cmake
> > +
> > +SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> > +SRC_URI[md5sum] = "1d4d38413ee0d0043f74d0445cab906f"
> > +SRC_URI[sha256sum] =
> "09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b"
> > +SRC_URI[sha1sum] = "a41480a0a85cfa11b3f87f801b7c37bc3410e060"
> > +SRC_URI[sha384sum] =
> "30488e375d956809a84b0d8af7b386a332541c77dcbd53496a896f894dbf39ac34534e935d6bc7a75c1b536f04f7f0a0"
> > +SRC_URI[sha512sum] =
> "cbbe6b8e9bbb864d7f96bbdb56db262bbd341c86bc7bedfcc51be8077c0ea58a4e88c61b7b7bec937d5476e6cb81c093229bf80e3ee99452829287bd26175670"
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> > index 4aa8533b42..8d87ad49a3 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> > @@ -44,7 +44,7 @@ PACKAGECONFIG ??=
> "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
> >                     libsecret \
> >                    "
> >
> > -PACKAGECONFIG[wayland] =
> "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland"
> > +PACKAGECONFIG[wayland] =
> "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe
> wpebackend-fdo wayland-native"
> >  PACKAGECONFIG[x11] =
> "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
> >  PACKAGECONFIG[geoclue] =
> "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
> >  PACKAGECONFIG[enchant] =
> "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
> > diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > new file mode 100644
> > index 0000000000..84df0c2535
> > --- /dev/null
> > +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "WPE's backend based on a freedesktop.org stack."
> > +HOMEPAGE = "https://github.com/Igalia/WPEBackend-fdo"
> > +BUGTRACKER = "https://github.com/Igalia/WPEBackend-fdo/issues"
> > +
> > +LICENSE = "BSD"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1f62cef2e3645e3e74eb05fd389d7a66"
> > +DEPENDS = "glib-2.0 libxkbcommon wayland virtual/egl libwpe"
> > +
> > +DEPENDS_append_class-target = " wayland-native"
> > +
> > +inherit cmake
> > +
> > +SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> > +SRC_URI[md5sum] = "c6362491a4a38ddac42b66f140e1cff2"
> > +SRC_URI[sha256sum] =
> "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
> > +SRC_URI[sha1sum] = "9217c8a5511bc53544b42cb23390256580ac4b0c"
> > +SRC_URI[sha384sum] =
> "79f3a28bc8e0a8240dc9962a6a245276d39dd8112a753d5ada39e98332d857eb9fc9c2879a702060807a10ea60be796d"
> > +SRC_URI[sha512sum] =
> "8fdd13843c77b95b96b3feffea463bce565620997680e209a0cdcc09314a1469f2f1cb4744dceb2cf6c8d6ce5cb2bbdb4c7fbaf0451a687640c3f63bbdbfc4d4"
> > +
> > --
> > 2.25.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004dd1a7059eb79cc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 16 Feb 2020 at 21:15, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sun, Feb 16, 2020 at 7:52 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; webkit nowadays requires a couple of supplementary libraries for this,=
<br>
&gt; so bring them in (courtesy of meta-browser, which will hopefully<br>
&gt; adjust without a lot of trouble).<br>
<br>
its not meta-browser, I guess you should credit meta-wpe here [1]<br>
and perhaps Cc the meta-wpe maintainer as a courtesy.<br></blockquote><div>=
<br></div><div>Actually, it&#39;s copied from meta-webkit</div><div><a href=
=3D"https://github.com/Igalia/meta-webkit/">https://github.com/Igalia/meta-=
webkit/</a></div><div>which does not say in the readme who the maintainer i=
s, so I am not sure whom to CC.</div><div>I can adjust the commit msg thoug=
h.</div><div><br></div><div>Alex<br></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[1] <a href=3D"https://github.com/WebPlatformForEmbedded/meta-wpe/tree/mast=
er/recipes-wpe/libwpe" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/WebPlatformForEmbedded/meta-wpe/tree/master/recipes-wpe/libwpe</a><br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-sato/webkit/<a href=3D"http://libwpe_1.4.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libwpe_1.4.0.1.bb</a>=C2=A0 =C2=A0 | 19 =
+++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a>=C2=A0 |=C2=A0 =
2 +-<br>
&gt;=C2=A0 .../webkit/<a href=3D"http://wpebackend-fdo_1.4.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">wpebackend-fdo_1.4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 39 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-sato/webkit/<a href=3D"http://li=
bwpe_1.4.0.1.bb" rel=3D"noreferrer" target=3D"_blank">libwpe_1.4.0.1.bb</a>=
<br>
&gt;=C2=A0 create mode 100644 meta/recipes-sato/webkit/<a href=3D"http://wp=
ebackend-fdo_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_=
1.4.1.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://libwpe_1.4.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libwpe_1.4.0.1.bb</a> b/meta/reci=
pes-sato/webkit/<a href=3D"http://libwpe_1.4.0.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libwpe_1.4.0.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b9c71f9dc5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://libwpe_1.4.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libwpe_1.4.0.1.bb</a><br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +SUMMARY =3D &quot;General-purpose library specifically developed for =
the WPE-flavored port of WebKit.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/WebPlatformForEmbedd=
ed/libwpe" rel=3D"noreferrer" target=3D"_blank">https://github.com/WebPlatf=
ormForEmbedded/libwpe</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://github.com/WebPlatformForEmbe=
dded/libwpe/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/WebPlatformForEmbedded/libwpe/issues</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;BSD&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D371a616eb4903c6cb79e9=
893a5f615cc&quot;<br>
&gt; +DEPENDS =3D &quot;virtual/egl libxkbcommon&quot;<br>
&gt; +<br>
&gt; +# Workaround build issue with RPi userland EGL libraries.<br>
&gt; +CFLAGS_append_rpi =3D &quot; ${@bb.utils.contains(&#39;MACHINE_FEATUR=
ES&#39;, &#39;vc4graphics&#39;, &#39;&#39;, &#39;-D_GNU_SOURCE&#39;, d)}&qu=
ot;<br>
&gt; +<br>
&gt; +inherit cmake<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://wpewebkit.org/releases/$%7BBPN%7=
D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wpewebkit.=
org/releases/${BPN}-${PV}.tar.xz</a>&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;1d4d38413ee0d0043f74d0445cab906f&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;09849dfb34877354f34f318e138971cf22e677b2=
179e1f0a8ea00ab0b7bd8e9b&quot;<br>
&gt; +SRC_URI[sha1sum] =3D &quot;a41480a0a85cfa11b3f87f801b7c37bc3410e060&q=
uot;<br>
&gt; +SRC_URI[sha384sum] =3D &quot;30488e375d956809a84b0d8af7b386a332541c77=
dcbd53496a896f894dbf39ac34534e935d6bc7a75c1b536f04f7f0a0&quot;<br>
&gt; +SRC_URI[sha512sum] =3D &quot;cbbe6b8e9bbb864d7f96bbdb56db262bbd341c86=
bc7bedfcc51be8077c0ea58a4e88c61b7b7bec937d5476e6cb81c093229bf80e3ee99452829=
287bd26175670&quot;<br>
&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26=
.4.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a> b/meta/=
recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" rel=3D"noreferre=
r" target=3D"_blank">webkitgtk_2.26.4.bb</a><br>
&gt; index 4aa8533b42..8d87ad49a3 100644<br>
&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a><br>
&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a><br>
&gt; @@ -44,7 +44,7 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DI=
STRO_FEATURES&#39;, &#39;wayland x11&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0libsecret \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG[wayland] =3D &quot;-DENABLE_WAYLAND_TARGET=3DON,-DENABL=
E_WAYLAND_TARGET=3DOFF,wayland&quot;<br>
&gt; +PACKAGECONFIG[wayland] =3D &quot;-DENABLE_WAYLAND_TARGET=3DON,-DENABL=
E_WAYLAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native&quot;<b=
r>
&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;-DENABLE_X11_TARGET=3DON,-DENABLE_X=
11_TARGET=3DOFF,virtual/libx11&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[geoclue] =3D &quot;-DENABLE_GEOLOCATION=3DON,-DENA=
BLE_GEOLOCATION=3DOFF,geoclue&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[enchant] =3D &quot;-DENABLE_SPELLCHECK=3DON,-DENAB=
LE_SPELLCHECK=3DOFF,enchant2&quot;<br>
&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo=
_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.4.1.bb</a>=
 b/meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_1.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.4.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..84df0c2535<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_1.4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.4.1.bb</a><br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +SUMMARY =3D &quot;WPE&#39;s backend based on a <a href=3D"http://free=
desktop.org" rel=3D"noreferrer" target=3D"_blank">freedesktop.org</a> stack=
.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/Igalia/WPEBackend-fd=
o" rel=3D"noreferrer" target=3D"_blank">https://github.com/Igalia/WPEBacken=
d-fdo</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://github.com/Igalia/WPEBackend-=
fdo/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/Igalia/=
WPEBackend-fdo/issues</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;BSD&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1f62cef2e3645e3e74eb0=
5fd389d7a66&quot;<br>
&gt; +DEPENDS =3D &quot;glib-2.0 libxkbcommon wayland virtual/egl libwpe&qu=
ot;<br>
&gt; +<br>
&gt; +DEPENDS_append_class-target =3D &quot; wayland-native&quot;<br>
&gt; +<br>
&gt; +inherit cmake<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://wpewebkit.org/releases/$%7BBPN%7=
D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wpewebkit.=
org/releases/${BPN}-${PV}.tar.xz</a>&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;c6362491a4a38ddac42b66f140e1cff2&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;6249a0b7cbfa662206a8d2fa24e2c574e75c681a=
d0e93468091f1dc68ddb299d&quot;<br>
&gt; +SRC_URI[sha1sum] =3D &quot;9217c8a5511bc53544b42cb23390256580ac4b0c&q=
uot;<br>
&gt; +SRC_URI[sha384sum] =3D &quot;79f3a28bc8e0a8240dc9962a6a245276d39dd811=
2a753d5ada39e98332d857eb9fc9c2879a702060807a10ea60be796d&quot;<br>
&gt; +SRC_URI[sha512sum] =3D &quot;8fdd13843c77b95b96b3feffea463bce56562099=
7680e209a0cdcc09314a1469f2f1cb4744dceb2cf6c8d6ce5cb2bbdb4c7fbaf0451a687640c=
3f63bbdbfc4d4&quot;<br>
&gt; +<br>
&gt; --<br>
&gt; 2.25.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000004dd1a7059eb79cc1--
