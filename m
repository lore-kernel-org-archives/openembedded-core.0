Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1S6Ohq-0003YL-Lr
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 16:59:42 +0100
Received: by mail-vx0-f175.google.com with SMTP id fl13so2686138vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2012 07:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1h8Xi6mk6Wg7nGa8XS9lW2lCjmh5FeSHb/kf/8Th5PU=;
	b=zYU6OFFJvT3HGqVZx6BCUciL+38Q7hXncV4gonAMKkn/VJlGBUZXE0fl9RYPqgVOg8
	4dTs+7G/Z2TiJq0SZi4pd5zFrarLVMByC1ZO7uuvQUWf4jUYuIbEv+1gOvupqSzTIRoP
	38miFKt6gcafkTrZjAbTik97PT6R9CYaljKglbiuaKliGfTuM6OAsoJ14g5c1Qce3DFt
	FTqhGBLz8ysgjE0KaIOHOsZRmf6lkZ1qhrScOz5V0casC1OwHN8cuPYO8vkm+dyXICUo
	Csg4ysqgMdFWOD++KaJdQU8oKiXWnxYvB9d45ddTNaCtkrmoMsjUl8TNSILtSfRaT/kt
	esSg==
MIME-Version: 1.0
Received: by 10.52.180.7 with SMTP id dk7mr9787975vdc.25.1331394663905; Sat,
	10 Mar 2012 07:51:03 -0800 (PST)
Received: by 10.52.112.39 with HTTP; Sat, 10 Mar 2012 07:51:03 -0800 (PST)
Date: Sat, 10 Mar 2012 16:51:03 +0100
Message-ID: <CAHod+GfF4MTBB9SyBPX7H=8mX94B_rCsWk61CZj-L01O1JvVNA@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] Split xcb-util into separate packages.
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
X-List-Received-Date: Sat, 10 Mar 2012 15:59:42 -0000
Content-Type: multipart/alternative; boundary=bcaec5196509ff7a3404bae57916

--bcaec5196509ff7a3404bae57916
Content-Type: text/plain; charset=ISO-8859-1

Add recipe for xcb-util-keysyms.


diff --git a/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bbb/meta/recipes-graphics/xcb/
xcb-util-keysyms_0.3.8.bb
new file mode 100644
index 0000000..ed1eb7a
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bb
@@ -0,0 +1,11 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM =
"file://keysyms/keysyms.c;endline=30;md5=2f8de023ed823bb92f0b47900574ea9e \
+ "
+PR = "r0"
+
+SRC_URI[md5sum] = "c75bb20e709093580a67eaf263251b50"
+SRC_URI[sha256sum] =
"913d32f7afe380c580da7636ee13f2728790237bb5c03def536363f552686121"
+
+

--bcaec5196509ff7a3404bae57916
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Add recipe for xcb-util-keysyms.<div><br></div><div><br></div><div><div>dif=
f --git a/meta/recipes-graphics/xcb/<a href=3D"http://xcb-util-keysyms_0.3.=
8.bb">xcb-util-keysyms_0.3.8.bb</a> b/meta/recipes-graphics/xcb/<a href=3D"=
http://xcb-util-keysyms_0.3.8.bb">xcb-util-keysyms_0.3.8.bb</a></div>
<div>new file mode 100644</div><div>index 0000000..ed1eb7a</div><div>--- /d=
ev/null</div><div>+++ b/meta/recipes-graphics/xcb/<a href=3D"http://xcb-uti=
l-keysyms_0.3.8.bb">xcb-util-keysyms_0.3.8.bb</a></div><div>@@ -0,0 +1,11 @=
@</div>
<div>+require xcb-util.inc</div><div>+</div><div>+LICENSE =3D &quot;MIT&quo=
t;</div><div>+LIC_FILES_CHKSUM =3D &quot;file://keysyms/keysyms.c;endline=
=3D30;md5=3D2f8de023ed823bb92f0b47900574ea9e \</div><div>+<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">					</span>&quot;</div>
<div>+PR =3D &quot;r0&quot;</div><div>+</div><div>+SRC_URI[md5sum] =3D &quo=
t;c75bb20e709093580a67eaf263251b50&quot;</div><div>+SRC_URI[sha256sum] =3D =
&quot;913d32f7afe380c580da7636ee13f2728790237bb5c03def536363f552686121&quot=
;</div>
<div>+</div><div>+</div></div>

--bcaec5196509ff7a3404bae57916--
