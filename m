Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1S6OgC-0003Vk-3T
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 16:58:00 +0100
Received: by vcbfl13 with SMTP id fl13so2684987vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2012 07:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=BHaDE2sDcdcN5mRUoHI+yp6qreUwRMNcPDhIUG6lN+w=;
	b=BhcPUsvyjq1YU2qxuRAVPZoqKJwC/yDXH3U7CH1lTV/7rULXRN3oNMYh4c1Wr5lFBR
	xOM/M2qODNCRXcU1z0LIlRM4VMTeuqeIzbsrpKZ80l+VXnQ9SwfNVtlVWFf+W1vPDtVG
	J2wyqm8sUKbsLMl99AeM86zs0ywk3ouQo3C5rxkOqVtMFUzFYAvGILIjr57u/QmCC/Vh
	7iA/Dh7HUnyA6ypJG6sTR2J9tOij2jNICgK7kuR6dYMMMRIdR8YdfG+XjdZeUX0xr/jQ
	5efCBy19PHZSP3ugOJbdZ4oGtYJhms0eBhvFXj9vQTILxHIzOrLzcsnruYrvvv6RxVbY
	+YTw==
MIME-Version: 1.0
Received: by 10.52.95.3 with SMTP id dg3mr9744975vdb.127.1331394559132; Sat,
	10 Mar 2012 07:49:19 -0800 (PST)
Received: by 10.52.112.39 with HTTP; Sat, 10 Mar 2012 07:49:19 -0800 (PST)
Date: Sat, 10 Mar 2012 16:49:19 +0100
Message-ID: <CAHod+Ge8QmNp5TXhoKnqLR_2s+eGg=jOWLG2keAoCYFjTs3ByA@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] Split xcb-util into separate packages.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Mar 2012 15:58:00 -0000
Content-Type: multipart/alternative; boundary=20cf3071cc50c0c5a604bae573ec

--20cf3071cc50c0c5a604bae573ec
Content-Type: text/plain; charset=ISO-8859-1

xcb-util was split into separate packages during the 0.3.6 -> 0.3.8
transition.
Change xcb-util.inc to reflect that.



diff --git a/meta/recipes-graphics/xcb/xcb-util.inc
b/meta/recipes-graphics/xcb/xcb-util.inc
index cd9923d..5e77a22 100644
--- a/meta/recipes-graphics/xcb/xcb-util.inc
+++ b/meta/recipes-graphics/xcb/xcb-util.inc
@@ -18,20 +18,6 @@ DEPENDS += "gperf-native"

 PARALLEL_MAKE = ""

-SRC_URI = "http://xcb.freedesktop.org/dist/xcb-util-${PV}.tar.bz2"
-
-PACKAGES =+ "libxcbatom libxcbaux libxcbevent libxcbicccm \
-             libxcbimage libxcbkeysyms libxcbproperty \
-             libxcbreply libxcbwm"
-
-FILES_libxcbatom = "${libdir}/libXCBAtom.so.*"
-FILES_libxcbaux = "${libdir}/libXCBAux.so.*"
-FILES_libxcbevent = "${libdir}/libXCBEvent.so.*"
-FILES_libxcbicccm = "${libdir}/libXCBICCCM.so.*"
-FILES_libxcbimage = "${libdir}/libXCBImage.so.*"
-FILES_libxcbkeysyms = "${libdir}/libXCBKeysyms.so.*"
-FILES_libxcbproperty = "${libdir}/libXCBProperty.so.*"
-FILES_libxcbreply = "${libdir}/libXCBReply.so.*"
-FILES_libxcbwm = "${libdir}/libXCBWM.so.*"
+SRC_URI = "http://xcb.freedesktop.org/dist/${PN}-${PV}.tar.bz2"

 inherit autotools pkgconfig

--20cf3071cc50c0c5a604bae573ec
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>xcb-util was split into separate packages during the 0.3.6 -&gt; 0.3.8=
 transition.</div><div>Change xcb-util.inc to reflect that.</div><div><br><=
/div><div><br></div><div><br></div><div><div>diff --git a/meta/recipes-grap=
hics/xcb/xcb-util.inc b/meta/recipes-graphics/xcb/xcb-util.inc</div>
<div>index cd9923d..5e77a22 100644</div><div>--- a/meta/recipes-graphics/xc=
b/xcb-util.inc</div><div>+++ b/meta/recipes-graphics/xcb/xcb-util.inc</div>=
<div>@@ -18,20 +18,6 @@ DEPENDS +=3D &quot;gperf-native&quot;</div><div>=A0=
</div>
<div>=A0PARALLEL_MAKE =3D &quot;&quot;</div><div>=A0</div><div>-SRC_URI =3D=
 &quot;<a href=3D"http://xcb.freedesktop.org/dist/xcb-util-${PV}.tar.bz2">h=
ttp://xcb.freedesktop.org/dist/xcb-util-${PV}.tar.bz2</a>&quot;</div><div>-=
</div>
<div>-PACKAGES =3D+ &quot;libxcbatom libxcbaux libxcbevent libxcbicccm \</d=
iv><div>- =A0 =A0 =A0 =A0 =A0 =A0 libxcbimage libxcbkeysyms libxcbproperty =
\</div><div>- =A0 =A0 =A0 =A0 =A0 =A0 libxcbreply libxcbwm&quot;</div><div>=
-</div><div>-FILES_libxcbatom =3D &quot;${libdir}/libXCBAtom.so.*&quot;</di=
v>
<div>-FILES_libxcbaux =3D &quot;${libdir}/libXCBAux.so.*&quot;</div><div>-F=
ILES_libxcbevent =3D &quot;${libdir}/libXCBEvent.so.*&quot;</div><div>-FILE=
S_libxcbicccm =3D &quot;${libdir}/libXCBICCCM.so.*&quot;</div><div>-FILES_l=
ibxcbimage =3D &quot;${libdir}/libXCBImage.so.*&quot;</div>
<div>-FILES_libxcbkeysyms =3D &quot;${libdir}/libXCBKeysyms.so.*&quot;</div=
><div>-FILES_libxcbproperty =3D &quot;${libdir}/libXCBProperty.so.*&quot;</=
div><div>-FILES_libxcbreply =3D &quot;${libdir}/libXCBReply.so.*&quot;</div=
><div>
-FILES_libxcbwm =3D &quot;${libdir}/libXCBWM.so.*&quot;</div><div>+SRC_URI =
=3D &quot;<a href=3D"http://xcb.freedesktop.org/dist/${PN}-${PV}.tar.bz2">h=
ttp://xcb.freedesktop.org/dist/${PN}-${PV}.tar.bz2</a>&quot;</div><div>=A0<=
/div>
<div>=A0inherit autotools pkgconfig</div></div>

--20cf3071cc50c0c5a604bae573ec--
