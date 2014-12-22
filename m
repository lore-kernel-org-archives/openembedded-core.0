Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 123F072697
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 13:56:04 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y33Sv-0003Q3-5Q from Awais_Belal@mentor.com ;
	Mon, 22 Dec 2014 05:56:05 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0181.006; Mon, 22 Dec 2014 13:56:04 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-* use gitsm style SRC_URI for
	git	recipes
Thread-Index: AQHQHe6y/7FlLIRdpEiDOmyiDBvBdJyboeuQ
Date: Mon, 22 Dec 2014 13:56:03 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FE5369@EU-MBX-03.mgc.mentorg.com>
References: <1419256380-6483-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1419256380-6483-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [PATCH] gstreamer1.0-* use gitsm style SRC_URI for git	recipes
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
X-List-Received-Date: Mon, 22 Dec 2014 13:56:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This applies to [dizzy] as well.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Monday, December 22, 2014 6:53 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH] gstreamer1.0-* use gitsm style SRC_URI for git  =
     recipes=0A=
=0A=
All gstreamer components when fetched through git have a git=0A=
submodule type repo rather than a main repo style. This=0A=
will make builds fail when there's no network connection=0A=
while the source is already downloaded.=0A=
We fix this by explicitly using the gitsm styled SRC_URI for=0A=
these submodules.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 .../gstreamer/gstreamer1.0-libav_git.bb            |    2 +-=0A=
 .../gstreamer/gstreamer1.0-omx_git.bb              |    2 +-=0A=
 .../gstreamer/gstreamer1.0-plugins.inc             |    2 +-=0A=
 .../gstreamer/gstreamer1.0_git.bb                  |    2 +-=0A=
 4 files changed, 4 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb=0A=
index bf1b87e..376a7c4 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb=0A=
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \=0A=
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=3Dbd7a4=
43320af8c812e4c18d1b79df004 \=0A=
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=3De6a600f=
d5e1d9cbde2d983680233ad02"=0A=
=0A=
-SRC_URI =3D "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=3Dma=
ster"=0A=
+SRC_URI =3D "gitsm://anongit.freedesktop.org/gstreamer/gst-libav;branch=3D=
master"=0A=
 S =3D "${WORKDIR}/git"=0A=
=0A=
 SRCREV =3D "127202d6f65584891dabf92be031f0d170b0e7f1"=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/me=
ta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb=0A=
index 931a7fc..df7c58c 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb=0A=
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd2559=
51079008b364516c \=0A=
                     file://omx/gstomx.h;beginline=3D1;endline=3D21;md5=3D5=
c8e1fca32704488e76d2ba9ddfa935f"=0A=
=0A=
 SRC_URI =3D " \=0A=
-    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=3Dmaster \=0A=
+    gitsm://anongit.freedesktop.org/gstreamer/gst-omx;branch=3Dmaster \=0A=
     file://0001-omx-fixed-type-error-in-printf-call.patch \=0A=
     "=0A=
 S =3D "${WORKDIR}/git"=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc=0A=
index 687aa2f..d857a40 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc=0A=
@@ -43,7 +43,7 @@ def get_gst_srcuri(d):=0A=
     branch =3D d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)=0A=
=0A=
     if pv =3D=3D "git":=0A=
-        s =3D "git://anongit.freedesktop.org/gstreamer/%s;branch=3D%s" % (=
gstpkg_basename, branch)=0A=
+        s =3D "gitsm://anongit.freedesktop.org/gstreamer/%s;branch=3D%s" %=
 (gstpkg_basename, branch)=0A=
     else:=0A=
         s =3D "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gs=
tpkg_basename, gstpkg_basename, pv)=0A=
     return s=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0_git.bb=0A=
index cb00d31..a8d3731 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb=0A=
@@ -5,7 +5,7 @@ include gstreamer1.0.inc=0A=
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ead0=
d \=0A=
                     file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059=
138481205ee2c6fc1c079c016d0d"=0A=
=0A=
-SRC_URI =3D "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=3Dma=
ster"=0A=
+SRC_URI =3D "gitsm://anongit.freedesktop.org/gstreamer/gstreamer;branch=3D=
master"=0A=
 S =3D "${WORKDIR}/git"=0A=
=0A=
 SRCREV =3D "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"=0A=
--=0A=
1.7.9.5=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

