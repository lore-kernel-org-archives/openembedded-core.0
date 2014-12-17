Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 885957262B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 06:58:50 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y18ZP-0004l8-5C from Awais_Belal@mentor.com ;
	Tue, 16 Dec 2014 22:58:51 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.03.0181.006; Wed, 17 Dec 2014 06:58:50 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] [Dizzy] gstreamer1.0-libav: specify proper cross-prefix
Thread-Index: AQHQGcboeHV3UqmTIkiemTfv5ph1yQ==
Date: Wed, 17 Dec 2014 06:58:49 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FE2FBA@EU-MBX-03.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [PATCH] [Dizzy] gstreamer1.0-libav: specify proper cross-prefix
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
X-List-Received-Date: Wed, 17 Dec 2014 06:58:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,=0A=
=0A=
This has been merged to master and is applicable to Dizzy as well.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Awais Belal [awais.belal@gmail.com]=0A=
Sent: Friday, December 05, 2014 4:40 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: Belal, Awais; Moseley, Drew=0A=
Subject: [PATCH] gstreamer1.0-libav: specify proper cross-prefix=0A=
=0A=
This avoids a compile failure locating ranlib by providing=0A=
the correct cross-prefix for build.=0A=
=0A=
Signed-off-by: Drew Moseley <drew_moseley@mentor.com>=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 .../gstreamer/gstreamer1.0-libav_1.4.1.bb          |    3 ++-=0A=
 .../gstreamer/gstreamer1.0-libav_git.bb            |    3 ++-=0A=
 2 files changed, 4 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb=0A=
index 8bba831..f962ff0 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb=0A=
@@ -18,7 +18,8 @@ SRC_URI[sha256sum] =3D "fc125521187fa84f3210269a0eecc51f8=
a856802f1ca4bb251f118dab9=0A=
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG =3D "--target-os=3Dlinux \=0A=
   --cc=3D'${CC}' --as=3D'${CC}' --ld=3D'${CC}' --nm=3D'${NM}' --ar=3D'${AR=
}' \=0A=
   --ranlib=3D'${RANLIB}' \=0A=
-  ${GSTREAMER_1_0_DEBUG}"=0A=
+  ${GSTREAMER_1_0_DEBUG} \=0A=
+  --cross-prefix=3D'${HOST_PREFIX}'"=0A=
=0A=
 S =3D "${WORKDIR}/gst-libav-${PV}"=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb=0A=
index 5ce28cc..aa2de69 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb=0A=
@@ -18,7 +18,8 @@ SRCREV =3D "127202d6f65584891dabf92be031f0d170b0e7f1"=0A=
=0A=
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG =3D "--target-os=3Dlinux \=0A=
   --cc=3D'${CC}' --as=3D'${CC}' --ld=3D'${CC}' --nm=3D'${NM}' --ar=3D'${AR=
}' \=0A=
-  ${GSTREAMER_1_0_DEBUG}"=0A=
+  ${GSTREAMER_1_0_DEBUG} \=0A=
+  --cross-prefix=3D'${HOST_PREFIX}'"=0A=
=0A=
 do_configure() {=0A=
        ./autogen.sh --noconfigure=0A=
--=0A=
1.7.9.5=0A=
=0A=

