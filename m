Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1S6OiV-0003yV-Fo
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 17:00:23 +0100
Received: by vcbfl13 with SMTP id fl13so2687531vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2012 07:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Zq2NHWEhglTjJQY3ggEdeGR3YaEoLCbMf3zteAe+ur8=;
	b=VW5QFOre103naJcjxrMpAn7w9uhJPWBICkzEJkVONgo9CSnDUzSLQrWOZhtDW8sguL
	bg91pAeJKPEZusaBFoNqaEKcX59waLhbJFBI/Wbegbc0uKD1+6BbymGlQKRH7lWoc5zf
	sTcJqFn+Ku7GW1h3vCiagrDB9b1vunkzUN8QcYt81vdrxJhuXLQhWIP0LM5hnJAp7Gj5
	s4WJR1SeVfevDD3R0+Zt4LJ5vtoiXaYx9OfNapqR0HBm/gSLDPxoitTPuByiMHTvL2fQ
	iS0N92+KN0pB4M9UPWrhImikq6XnKftu1juo5pesYvJtZbxqWs5Jc4LNKX8ubLJuPnZn
	3N5g==
MIME-Version: 1.0
Received: by 10.52.68.139 with SMTP id w11mr9630096vdt.110.1331394702414; Sat,
	10 Mar 2012 07:51:42 -0800 (PST)
Received: by 10.52.112.39 with HTTP; Sat, 10 Mar 2012 07:51:42 -0800 (PST)
Date: Sat, 10 Mar 2012 16:51:42 +0100
Message-ID: <CAHod+Ge2Tdy5bPJsbh3D6C6tNp8Vhgw=nbY95Am+Syjq3vushw@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] Split xcb-util into separate packages.
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
X-List-Received-Date: Sat, 10 Mar 2012 16:00:23 -0000
Content-Type: multipart/alternative; boundary=20cf307f37ee4b131b04bae57cb4

--20cf307f37ee4b131b04bae57cb4
Content-Type: text/plain; charset=ISO-8859-1

Add recipe for xcb-util-renderutil.


diff --git a/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bbb/meta/recipes-graphics/xcb/
xcb-util-renderutil_0.3.8.bb
new file mode 100644
index 0000000..c729db8
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb
@@ -0,0 +1,14 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM =
"file://renderutil/glyph.c;endline=24;md5=c517c483b8d726234ec94f9169236661 \
+ file://renderutil/util.c;endline=20;md5=6e0bfc44fb13298c0f4694eb70dc80d4 \
+ file://renderutil/xcb_renderutil.h;md5=c8732d30d204d3b55e956489f635cefb \
+ "
+PR = "r0"
+
+SRC_URI[md5sum] = "b346ff598ee093c141f836fbc0f8f721"
+SRC_URI[sha256sum] =
"9789a5c55728fa7bae374d9fdf1c61095869bdc68561911760879095644c7452"
+
+
+

--20cf307f37ee4b131b04bae57cb4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Add recipe for xcb-util-renderutil.<div><br></div><div><br></div><div><div>=
diff --git a/meta/recipes-graphics/xcb/<a href=3D"http://xcb-util-renderuti=
l_0.3.8.bb">xcb-util-renderutil_0.3.8.bb</a> b/meta/recipes-graphics/xcb/<a=
 href=3D"http://xcb-util-renderutil_0.3.8.bb">xcb-util-renderutil_0.3.8.bb<=
/a></div>
<div>new file mode 100644</div><div>index 0000000..c729db8</div><div>--- /d=
ev/null</div><div>+++ b/meta/recipes-graphics/xcb/<a href=3D"http://xcb-uti=
l-renderutil_0.3.8.bb">xcb-util-renderutil_0.3.8.bb</a></div><div>@@ -0,0 +=
1,14 @@</div>
<div>+require xcb-util.inc</div><div>+</div><div>+LICENSE =3D &quot;MIT&quo=
t;</div><div>+LIC_FILES_CHKSUM =3D &quot;file://renderutil/glyph.c;endline=
=3D24;md5=3Dc517c483b8d726234ec94f9169236661 \</div><div>+<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">					</span>file://renderutil/util.=
c;endline=3D20;md5=3D6e0bfc44fb13298c0f4694eb70dc80d4 \</div>
<div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">					</span>=
file://renderutil/xcb_renderutil.h;md5=3Dc8732d30d204d3b55e956489f635cefb \=
</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">					<=
/span>&quot;</div>
<div>+PR =3D &quot;r0&quot;</div><div>+</div><div>+SRC_URI[md5sum] =3D &quo=
t;b346ff598ee093c141f836fbc0f8f721&quot;</div><div>+SRC_URI[sha256sum] =3D =
&quot;9789a5c55728fa7bae374d9fdf1c61095869bdc68561911760879095644c7452&quot=
;</div>
<div>+</div><div>+</div><div>+</div></div>

--20cf307f37ee4b131b04bae57cb4--
