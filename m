Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1S6Oj8-00040g-55
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 17:01:02 +0100
Received: by vcbfl13 with SMTP id fl13so2688088vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2012 07:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=heMvvSmIrKnYOpndKmnIdPJNL53MBDlYBZklEZv7FRg=;
	b=Sc4ero2ldNx52qzl+IqrxUjO5IXOxxRKnRhJsKJGil095EEZ/Yc46MyNdFf1C5uQVr
	Czjf0um1JQcMQBnrUHTArhhis40JIBeRjA4519uj9mV6IvfOPI5rmTqvGgna6/FtOpgf
	nVL+TLVn9/27axufD8pfMcfXu6qFRjbJMjvrDjv+IxdO2wju7k5tH96iMejr1frPWP89
	2dHvI6wtb2yS5Ang6CO1vaNer2v2L6q9XIZ8l9aSAv/7mCcr3RjZymTo8Lx/4KQBnewd
	PUtJCGiAZ9uGjplwLfV0TIzJfa5zp+FsaXPFX3/L+1Fdx3y1wd028jqHsDdIbwN81yYN
	A+7g==
MIME-Version: 1.0
Received: by 10.52.93.74 with SMTP id cs10mr9738761vdb.42.1331394741120; Sat,
	10 Mar 2012 07:52:21 -0800 (PST)
Received: by 10.52.112.39 with HTTP; Sat, 10 Mar 2012 07:52:21 -0800 (PST)
Date: Sat, 10 Mar 2012 16:52:21 +0100
Message-ID: <CAHod+GfPVhg9h4Z6zdbWEARTTy4Ko8onfU=DVszD3y2ORL9iDg@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] Split xcb-util into separate packages.
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
X-List-Received-Date: Sat, 10 Mar 2012 16:01:02 -0000
Content-Type: multipart/alternative; boundary=bcaec501673999af5d04bae57e05

--bcaec501673999af5d04bae57e05
Content-Type: text/plain; charset=ISO-8859-1

Add recipe for xcb-util-wm.


diff --git a/meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bbb/meta/recipes-graphics/xcb/
xcb-util-wm_0.3.8.bb
new file mode 100644
index 0000000..91f9a81
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bb
@@ -0,0 +1,12 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM =
"file://ewmh/ewmh.c;endline=27;md5=63fd80552d7dc886f4eb267610d5bb9d \
+ file://ewmh/xcb_ewmh.h;startline=4;endline=30;md5=7bcd2d64f5615707f95ea8826a93561f
\
+ file://icccm/icccm.c;endline=28;md5=e2b3240a0c197e8977adde2a5cf18d50 \
+ file://icccm/xcb_icccm.h;startline=4;endline=31;md5=0af3f37474085b0517dbbae4cb4ce13c
\
+ "
+PR = "r0"
+
+SRC_URI[md5sum] = "dda47289bc846a6a3e07824e9ec3aef8"
+SRC_URI[sha256sum] =
"c557abbe4c7d45268f0541ee3d8f9a1a8799692fcc28aa33f39db93cc2e65007"

--bcaec501673999af5d04bae57e05
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Add recipe for xcb-util-wm.<div><br></div><div><br></div><div><div>diff --g=
it a/meta/recipes-graphics/xcb/<a href=3D"http://xcb-util-wm_0.3.8.bb">xcb-=
util-wm_0.3.8.bb</a> b/meta/recipes-graphics/xcb/<a href=3D"http://xcb-util=
-wm_0.3.8.bb">xcb-util-wm_0.3.8.bb</a></div>
<div>new file mode 100644</div><div>index 0000000..91f9a81</div><div>--- /d=
ev/null</div><div>+++ b/meta/recipes-graphics/xcb/<a href=3D"http://xcb-uti=
l-wm_0.3.8.bb">xcb-util-wm_0.3.8.bb</a></div><div>@@ -0,0 +1,12 @@</div><di=
v>
+require xcb-util.inc</div><div>+</div><div>+LICENSE =3D &quot;MIT&quot;</d=
iv><div>+LIC_FILES_CHKSUM =3D &quot;file://ewmh/ewmh.c;endline=3D27;md5=3D6=
3fd80552d7dc886f4eb267610d5bb9d \</div><div>+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">					</span>file://ewmh/xcb_ewmh.h;startline=3D4=
;endline=3D30;md5=3D7bcd2d64f5615707f95ea8826a93561f \</div>
<div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">					</span>=
file://icccm/icccm.c;endline=3D28;md5=3De2b3240a0c197e8977adde2a5cf18d50 \<=
/div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">					</=
span>file://icccm/xcb_icccm.h;startline=3D4;endline=3D31;md5=3D0af3f3747408=
5b0517dbbae4cb4ce13c \</div>
<div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">					</span>=
&quot;</div><div>+PR =3D &quot;r0&quot;</div><div>+</div><div>+SRC_URI[md5s=
um] =3D &quot;dda47289bc846a6a3e07824e9ec3aef8&quot;</div><div>+SRC_URI[sha=
256sum] =3D &quot;c557abbe4c7d45268f0541ee3d8f9a1a8799692fcc28aa33f39db93cc=
2e65007&quot;</div>
</div>

--bcaec501673999af5d04bae57e05--
