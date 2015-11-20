Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5FFDE60107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 16:10:06 +0000 (UTC)
Received: by obbww6 with SMTP id ww6so89992395obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 08:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=k7VdhSB5eGQADNh7KGBPfAjl07Rr5iU4lrXOdJTdwXk=;
	b=S4W3ZGf2beZgjnlBrltijM8n/Pzbj9sEoZmLePU+m5Bx/bx+TsDwBZP162U1yAkCtr
	gh17L/hLUvLiltu9LcQdN3m5EnI6hr/L6AP/hVi6OY/kf5/mxme/5m/pAVRBt7lklkig
	/8GD6pNdRsTkke+rmKmjyhrND2CJ0Qnu2ExS0+jttNiVOEudfYQmTsnI760or1c2BZ63
	nAKnmQUT0LKJIIE7Nq9WFXU0Y4f2BSPlrJAWqB/KWdMGzosvomlxHL53ZK4wPTbV/4M+
	QrRxU0YZHRYzSpeImI1DV85tA4v6GM1E6Dv7HBJAS1QXtO+ypOkQKZeNNLvESMbIS9io
	EWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k7VdhSB5eGQADNh7KGBPfAjl07Rr5iU4lrXOdJTdwXk=;
	b=m30iD31+Tc8rmFdtDhTFr332DCsfNcGq0Irr9RswQ/6yw1zpReZPYUQXMyd8EkoZmT
	U1AKm4VXKmrE8HI+mF4bqRrZOl8c+/fiNcT0GwBW2bGrLSI/e9dp8QVVzI7mBtUka8q9
	qDpPBqjVg0WtFE77W5GY6IplT7UCA1Kxso9TZBcQqfs05yj/M5KYswOcptTVttoiSw+f
	AJLnKFJZ1qDNLvrPhJPYgUjIaMmgRQpaFCipceC7NSpmcj1I6CKnmB4O+77GZytlB1xC
	wplhmtizHoDS28dd+fyLydFTl2Y9bqmDFExs3wCgxF4FxK5Ps0nJWjP06UIxu/iFeoep
	X3ZA==
X-Gm-Message-State: ALoCoQnPF85+MpsLMsyYfbpuc3DMQaFZe3/21teh9xBp2IvxCdQadR0mgtKeaV8buEM3d8c/qKK2
X-Received: by 10.60.129.233 with SMTP id nz9mr9043391oeb.48.1448035807151;
	Fri, 20 Nov 2015 08:10:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.51.67 with HTTP; Fri, 20 Nov 2015 08:09:37 -0800 (PST)
In-Reply-To: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
References: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 20 Nov 2015 18:09:37 +0200
Message-ID: <CAHiDW_HmbJRvWjND49gLXCwManmbf2hE8H748mk9+L5RABcYOw@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] dbus: build with systemd support
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
X-List-Received-Date: Fri, 20 Nov 2015 16:10:07 -0000
Content-Type: multipart/alternative; boundary=047d7b163751e85d970524fb1b63

--047d7b163751e85d970524fb1b63
Content-Type: text/plain; charset=UTF-8

On 20 November 2015 at 16:38, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:
>
> It's good to have the extra functionality, such as seat support
> provided with systemd support. Not least of all to support
> systemd user-sessions.
>
> This commit also changes references to the system unit path
> from ${systemd_unitdir}/system to ${systemd_system_unitdir},
> a new variable provided by bitbake.
>
> Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  meta/recipes-core/dbus/dbus_1.10.2.bb | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus_1.10.2.bb
b/meta/recipes-core/dbus/dbus_1.10.2.bb
> index 1abe067..f7ab39b 100644
> --- a/meta/recipes-core/dbus/dbus_1.10.2.bb
> +++ b/meta/recipes-core/dbus/dbus_1.10.2.bb
> @@ -68,7 +68,7 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
>                 ${datadir}/dbus-1/session.conf \
>                 ${datadir}/dbus-1/system.d \
>                 ${datadir}/dbus-1/system.conf \
> -               ${systemd_unitdir}/system/"
> +               ${systemd_system_unitdir}"
>  FILES_${PN}-lib = "${libdir}/lib*.so.*"
>  RRECOMMENDS_${PN}-lib = "${PN}"
>  FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool
${bindir}/dbus-test-tool"
> @@ -90,8 +90,7 @@ pkg_postinst_dbus() {
>  EXTRA_OECONF = "--disable-tests \
>                  --disable-xml-docs \
>                  --disable-doxygen-docs \
> -                --disable-libaudit \
> -                --disable-systemd"
> +                --disable-libaudit"
>
>  EXTRA_OECONF_append_class-native = " --disable-selinux"
>
> @@ -100,9 +99,7 @@ PACKAGECONFIG ??=
"${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
>  PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>
> -# Would like to --enable-systemd but that's a circular build-dependency
between
> -# systemd<->dbus

Has this issue been somehow resolved since the comment was added?

> -PACKAGECONFIG[systemd] =
"--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
> +PACKAGECONFIG[systemd] = "--enable-systemd
--with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd
--without-systemdsystemunitdir,systemd"
>  PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
--disable-x11-autolaunch, virtual/libx11 libsm"
>  PACKAGECONFIG[apparmor] =
"--enable-apparmor,--disable-apparmor,libapparmor"
>
> @@ -117,12 +114,12 @@ do_install() {
>
>         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
'false', d)}; then
>                 for i in dbus.target.wants sockets.target.wants
multi-user.target.wants; do \
> -                       install -d ${D}${systemd_unitdir}/system/$i; done
> -               install -m 0644 ${B}/bus/dbus.service
${B}/bus/dbus.socket ${D}${systemd_unitdir}/system/
> +                       install -d ${D}${systemd_system_unitdir}/$i; done
> +               install -m 0644 ${B}/bus/dbus.service
${B}/bus/dbus.socket ${D}${systemd_system_unitdir}/
>                 cd ${D}${systemd_unitdir}/system/dbus.target.wants/
> -               ln -fs ../dbus.socket
${D}${systemd_unitdir}/system/dbus.target.wants/dbus.socket
> -               ln -fs ../dbus.socket
${D}${systemd_unitdir}/system/sockets.target.wants/dbus.socket
> -               ln -fs ../dbus.service
${D}${systemd_unitdir}/system/multi-user.target.wants/dbus.service
> +               ln -fs ../dbus.socket
${D}${systemd_system_unitdir}/dbus.target.wants/dbus.socket
> +               ln -fs ../dbus.socket
${D}${systemd_system_unitdir}/sockets.target.wants/dbus.socket
> +               ln -fs ../dbus.service
${D}${systemd_system_unitdir}/multi-user.target.wants/dbus.service
>         fi
>
>         install -d ${D}${sysconfdir}/default/volatiles
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--047d7b163751e85d970524fb1b63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 20 November 2015 at 16:38, Andrew Shadura &lt;<a href=
=3D"mailto:andrew.shadura@collabora.co.uk">andrew.shadura@collabora.co.uk</=
a>&gt; wrote:<br>&gt;<br>&gt; It&#39;s good to have the extra functionality=
, such as seat support<br>&gt; provided with systemd support. Not least of =
all to support<br>&gt; systemd user-sessions.<br>&gt;<br>&gt; This commit a=
lso changes references to the system unit path<br>&gt; from ${systemd_unitd=
ir}/system to ${systemd_system_unitdir},<br>&gt; a new variable provided by=
 bitbake.<br>&gt;<br>&gt; Signed-off-by: Andrew Shadura &lt;<a href=3D"mail=
to:andrew.shadura@collabora.co.uk">andrew.shadura@collabora.co.uk</a>&gt;<b=
r>&gt; Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:joshua.lock@collabo=
ra.co.uk">joshua.lock@collabora.co.uk</a>&gt;<br>&gt; ---<br>&gt; =C2=A0met=
a/recipes-core/dbus/<a href=3D"http://dbus_1.10.2.bb">dbus_1.10.2.bb</a> | =
19 ++++++++-----------<br>&gt; =C2=A01 file changed, 8 insertions(+), 11 de=
letions(-)<br>&gt;<br>&gt; diff --git a/meta/recipes-core/dbus/<a href=3D"h=
ttp://dbus_1.10.2.bb">dbus_1.10.2.bb</a> b/meta/recipes-core/dbus/<a href=
=3D"http://dbus_1.10.2.bb">dbus_1.10.2.bb</a><br>&gt; index 1abe067..f7ab39=
b 100644<br>&gt; --- a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.2=
.bb">dbus_1.10.2.bb</a><br>&gt; +++ b/meta/recipes-core/dbus/<a href=3D"htt=
p://dbus_1.10.2.bb">dbus_1.10.2.bb</a><br>&gt; @@ -68,7 +68,7 @@ FILES_${PN=
} =3D &quot;${bindir}/dbus-daemon* \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/dbus-1/session.conf \<br>&gt; =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/dbus-1/system.=
d \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datad=
ir}/dbus-1/system.conf \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${systemd_unitdir}/system/&quot;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_system_unitdir}&quot;<br>&gt; =C2=A0F=
ILES_${PN}-lib =3D &quot;${libdir}/lib*.so.*&quot;<br>&gt; =C2=A0RRECOMMEND=
S_${PN}-lib =3D &quot;${PN}&quot;<br>&gt; =C2=A0FILES_${PN}-dev +=3D &quot;=
${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool ${bindir}/dbus-test-too=
l&quot;<br>&gt; @@ -90,8 +90,7 @@ pkg_postinst_dbus() {<br>&gt; =C2=A0EXTRA=
_OECONF =3D &quot;--disable-tests \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-xml-docs \<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-doxygen-docs \<br=
>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-li=
baudit \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
-disable-systemd&quot;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--disable-libaudit&quot;<br>&gt;<br>&gt; =C2=A0EXTRA_OECONF_ap=
pend_class-native =3D &quot; --disable-selinux&quot;<br>&gt;<br>&gt; @@ -10=
0,9 +99,7 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;systemd&#39;, &#39;systemd&#39;,<br>&gt; =C2=A0PACKAGECONF=
IG_class-native =3D &quot;&quot;<br>&gt; =C2=A0PACKAGECONFIG_class-nativesd=
k =3D &quot;&quot;<br>&gt;<br>&gt; -# Would like to --enable-systemd but th=
at&#39;s a circular build-dependency between<br>&gt; -# systemd&lt;-&gt;dbu=
s<br><br><div>Has this issue been somehow resolved since the comment was ad=
ded?</div><div><br></div><div>&gt; -PACKAGECONFIG[systemd] =3D &quot;--with=
-systemdsystemunitdir=3D${systemd_unitdir}/system/,--without-systemdsystemu=
nitdir&quot;<br>&gt; +PACKAGECONFIG[systemd] =3D &quot;--enable-systemd --w=
ith-systemdsystemunitdir=3D${systemd_system_unitdir},--disable-systemd --wi=
thout-systemdsystemunitdir,systemd&quot;<br>&gt; =C2=A0PACKAGECONFIG[x11] =
=3D &quot;--with-x --enable-x11-autolaunch,--without-x --disable-x11-autola=
unch, virtual/libx11 libsm&quot;<br>&gt; =C2=A0PACKAGECONFIG[apparmor] =3D =
&quot;--enable-apparmor,--disable-apparmor,libapparmor&quot;<br>&gt;<br>&gt=
; @@ -117,12 +114,12 @@ do_install() {<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39=
;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in dbus.target.wants sockets.targe=
t.wants multi-user.target.wants; do \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_=
unitdir}/system/$i; done<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}$=
{systemd_unitdir}/system/<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unit=
dir}/$i; done<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in=
stall -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_syst=
em_unitdir}/<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cd ${D}${systemd_unitdir}/system/dbus.target.wants/<br>&gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -fs ../dbus.socket ${D}${syste=
md_unitdir}/system/dbus.target.wants/dbus.socket<br>&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -fs ../dbus.socket ${D}${systemd_unit=
dir}/system/sockets.target.wants/dbus.socket<br>&gt; - =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -fs ../dbus.service ${D}${systemd_unitdir}/=
system/multi-user.target.wants/dbus.service<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -fs ../dbus.socket ${D}${systemd_system_unit=
dir}/dbus.target.wants/dbus.socket<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/so=
ckets.target.wants/dbus.socket<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ln -fs ../dbus.service ${D}${systemd_system_unitdir}/multi-u=
ser.target.wants/dbus.service<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>&gt=
;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/default/=
volatiles<br>&gt; --<br>&gt; 2.5.0<br>&gt;<br>&gt; --<br>&gt; _____________=
__________________________________<br>&gt; Openembedded-core mailing list<b=
r>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembe=
dded-core@lists.openembedded.org</a><br>&gt; <a href=3D"http://lists.openem=
bedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.or=
g/mailman/listinfo/openembedded-core</a></div></div>

--047d7b163751e85d970524fb1b63--
