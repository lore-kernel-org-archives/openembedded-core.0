Return-Path: <pespin.shar@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id D48A476E04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 11:48:10 +0000 (UTC)
Received: by lagj9 with SMTP id j9so107026788lag.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/srpV6dUC5hSZQCM5EA1XUbBTxKkkzpGH6yfFXNxUzI=;
	b=bWe2h+7zz70IzZtVC9kTLDSU7hz/+PzUDQnsOD/kKLUcyo15rTd5Uy9hW+2Kb5665+
	/SdXkL8sqk85ouH6QhuVHCD37oqTvTxdix22iJnUDJC9/r+95by9XHj2X8BlYMeu3VA8
	5vJ7/GGp7GV1BeIgO47anHR/Hc+WQCvKJsPl9D28iCdpn7zp5rXTedib5v2jcuKJ/9t2
	e4nGafNRfov2rLVThsLIVB/tWv7vj3t1NHrtXKGY6/2le1e1sMLWbEbm/5sdQQw9Orqu
	PpYuM1CCTYtbsog8akB/iZiV0vEMQoNjc/8/ZpWLUCB9tccJscD13WJDbv0Zv6Zcamtl
	+7Yw==
MIME-Version: 1.0
X-Received: by 10.112.198.97 with SMTP id jb1mr20237674lbc.8.1442317689340;
	Tue, 15 Sep 2015 04:48:09 -0700 (PDT)
Received: by 10.25.1.207 with HTTP; Tue, 15 Sep 2015 04:48:09 -0700 (PDT)
In-Reply-To: <1442317009.1922.4.camel@iki.fi>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442227275-19855-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442317009.1922.4.camel@iki.fi>
Date: Tue, 15 Sep 2015 13:48:09 +0200
Message-ID: <CAEGpDuauZUVHVBdJCAfiu7VtHOFY1t8OM0uTJXJyHmkHHq4YzA@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Andrew Shadura <andrew.shadura@collabora.co.uk>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] dbus: add user sessions support
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
X-List-Received-Date: Tue, 15 Sep 2015 11:48:11 -0000
Content-Type: multipart/alternative; boundary=001a11c33c7a86c834051fc7c190

--001a11c33c7a86c834051fc7c190
Content-Type: text/plain; charset=UTF-8

Hi,

I agree with Tanu. +1 enabling for user-session by default if systemd is
used.

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2015-09-15 13:36 GMT+02:00 Tanu Kaskinen <tanuk@iki.fi>:

> On Mon, 2015-09-14 at 12:41 +0200, Andrew Shadura wrote:
> > ---
> >  meta/recipes-core/dbus/dbus_1.10.0.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/dbus/dbus_1.10.0.bb
> b/meta/recipes-core/dbus/dbus_1.10.0.bb
> > index 31cbef0..e099f4b 100644
> > --- a/meta/recipes-core/dbus/dbus_1.10.0.bb
> > +++ b/meta/recipes-core/dbus/dbus_1.10.0.bb
> > @@ -68,7 +68,9 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
> >                 ${datadir}/dbus-1/session.conf \
> >                 ${datadir}/dbus-1/system.d \
> >                 ${datadir}/dbus-1/system.conf \
> > -               ${systemd_unitdir}/system/"
> > +               ${systemd_system_unitdir} \
> > +               ${systemd_user_unitdir} \
> > +"
> >  FILES_${PN}-lib = "${libdir}/lib*.so.*"
> >  RRECOMMENDS_${PN}-lib = "${PN}"
> >  FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool
> ${bindir}/dbus-test-tool"
> > @@ -105,6 +107,7 @@ PACKAGECONFIG_class-nativesdk = ""
> >  PACKAGECONFIG[systemd] =
> "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
> >  PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
> --disable-x11-autolaunch, virtual/libx11 libsm"
> >  PACKAGECONFIG[apparmor] =
> "--enable-apparmor,--disable-apparmor,libapparmor"
> > +PACKAGECONFIG[user-session] =
> "--enable-user-session,--disable-user-session"
>
> I think user-session should be enabled by default when systemd is in
> DISTRO_FEATURES. Some services, e.g. PulseAudio, can fully enable their
> systemd integration only if dbus is compiled with --enable-user
> -session.
>
> --
> Tanu
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c33c7a86c834051fc7c190
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br></div>I agree with Tanu. +1 enabling for u=
ser-session by default if systemd is used.<br></div><div class=3D"gmail_ext=
ra"><br clear=3D"all"><div><div class=3D"gmail_signature">Pau Espin Pedrol<=
br>mail/jabber: <a href=3D"mailto:pespin.shar@gmail.com" target=3D"_blank">=
pespin.shar@gmail.com</a><br><a href=3D"http://blog.espeweb.net" target=3D"=
_blank">http://blog.espeweb.net</a><br></div></div>
<br><div class=3D"gmail_quote">2015-09-15 13:36 GMT+02:00 Tanu Kaskinen <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@=
iki.fi</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n Mon, 2015-09-14 at 12:41 +0200, Andrew Shadura wrote:<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.0.bb" rel=3D"=
noreferrer" target=3D"_blank">dbus_1.10.0.bb</a> | 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.0.bb" =
rel=3D"noreferrer" target=3D"_blank">dbus_1.10.0.bb</a> b/meta/recipes-core=
/dbus/<a href=3D"http://dbus_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank=
">dbus_1.10.0.bb</a><br>
&gt; index 31cbef0..e099f4b 100644<br>
&gt; --- a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.0.bb" rel=3D"=
noreferrer" target=3D"_blank">dbus_1.10.0.bb</a><br>
&gt; +++ b/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.0.bb" rel=3D"=
noreferrer" target=3D"_blank">dbus_1.10.0.bb</a><br>
&gt; @@ -68,7 +68,9 @@ FILES_${PN} =3D &quot;${bindir}/dbus-daemon* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir=
}/dbus-1/session.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir=
}/dbus-1/system.d \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir=
}/dbus-1/system.conf \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_unit=
dir}/system/&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_syst=
em_unitdir} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_user=
_unitdir} \<br>
&gt; +&quot;<br>
&gt;=C2=A0 FILES_${PN}-lib =3D &quot;${libdir}/lib*.so.*&quot;<br>
&gt;=C2=A0 RRECOMMENDS_${PN}-lib =3D &quot;${PN}&quot;<br>
&gt;=C2=A0 FILES_${PN}-dev +=3D &quot;${libdir}/dbus-1.0/include ${bindir}/=
dbus-glib-tool ${bindir}/dbus-test-tool&quot;<br>
&gt; @@ -105,6 +107,7 @@ PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[systemd] =3D &quot;--with-systemdsystemunitdir=3D$=
{systemd_unitdir}/system/,--without-systemdsystemunitdir&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;--with-x --enable-x11-autolaunch,--=
without-x --disable-x11-autolaunch, virtual/libx11 libsm&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[apparmor] =3D &quot;--enable-apparmor,--disable-ap=
parmor,libapparmor&quot;<br>
&gt; +PACKAGECONFIG[user-session] =3D &quot;--enable-user-session,--disable=
-user-session&quot;<br>
<br>
</span>I think user-session should be enabled by default when systemd is in=
<br>
DISTRO_FEATURES. Some services, e.g. PulseAudio, can fully enable their<br>
systemd integration only if dbus is compiled with --enable-user<br>
-session.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Tanu<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a11c33c7a86c834051fc7c190--
