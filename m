Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BD0926B25F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 07:27:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Mar 2014 00:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,668,1389772800"; d="scan'208";a="473938887"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2014 00:27:14 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.87]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.222]) with mapi id
	14.03.0123.003; Mon, 17 Mar 2014 07:26:44 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-multimedia][PATCH] musicpd: upgrade to 0.18.9
Thread-Index: AQHPPgKh6mF+eFAZu06xd7cYnsSq+Zrk6GEA
Date: Mon, 17 Mar 2014 07:26:43 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16D63376@IRSMSX105.ger.corp.intel.com>
References: <1394636069-6139-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1394636069-6139-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [meta-multimedia][PATCH] musicpd: upgrade to 0.18.9
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
X-List-Received-Date: Mon, 17 Mar 2014 07:27:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping!

-----Original Message-----
From: Iorga, Cristian=20
Sent: Wednesday, March 12, 2014 4:54 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [meta-multimedia][PATCH] musicpd: upgrade to 0.18.9

- Upgrade fixes a crash with libvorbis 1.3.4;
- Simplified SRC_URI;
- Reference for S no longer necessary.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.18.4.bb =3D> mpd_0.18.9.bb}  | 9 +++=
------
 1 file changed, 3 insertions(+), 6 deletions(-)  rename meta-multimedia/re=
cipes-multimedia/musicpd/{mpd_0.18.4.bb =3D> mpd_0.18.9.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb b/met=
a-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
index 77ccc1f..349ccbb 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
@@ -6,14 +6,11 @@ HOMEPAGE =3D"http://sourceforge.net/projects/musicpd"
 DEPENDS =3D "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ff=
mpeg curl sqlite bzip2 pulseaudio"
=20
 SRC_URI =3D " \
-    http://www.musicpd.org/download/${PN}/stable/${PN}-0.18.tar.xz \
+    http://www.musicpd.org/download/${PN}/stable/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-
-SRC_URI[md5sum] =3D "0d881fb32f9d31afcdb0bb13cb78b9ab"
-SRC_URI[sha256sum] =3D "6b171985f192603150c879d105dc4d05d701ac60a2db41630a=
4dce823e068388"
-
-S =3D "${WORKDIR}/${PN}-0.18"
+SRC_URI[md5sum] =3D "0e5156a831d4302d2032998bcfd5c36f"
+SRC_URI[sha256sum] =3D "0d4d3e6977cb607419abbb14c63d1e2b982acb84cd2be5346f=
19de5f699a68de"
=20
 inherit autotools useradd systemd
=20
--
1.8.3.2


