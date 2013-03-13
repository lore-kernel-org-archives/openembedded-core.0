Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UFjiY-0005Y4-6b
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 12:19:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2013 04:02:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,836,1355126400"; d="scan'208";a="305449617"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2013 04:02:51 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 13 Mar 2013 11:02:50 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.245]) with mapi id
	14.01.0355.002; Wed, 13 Mar 2013 11:02:50 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] alsa-tools: Update autotools.patch
Thread-Index: AQHOH4/gsrFWvEgGHEO0+ofzIJhh7pijdPAw
Date: Wed, 13 Mar 2013 11:02:50 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16216497@IRSMSX102.ger.corp.intel.com>
References: <1363140541-13440-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
In-Reply-To: <1363140541-13440-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH] alsa-tools: Update autotools.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 11:19:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Nobuhiro-san,

Can you please explain your patch?
As far as I know, the alsa-tools present as targets were all buildable.
This was verified by me at last update.

Regards,
Cristian

-----Original Message-----
From: Nobuhiro Iwamatsu [mailto:iwamatsu@nigauri.org] On Behalf Of Nobuhiro=
 Iwamatsu
Sent: Wednesday, March 13, 2013 4:09 AM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian; Nobuhiro Iwamatsu
Subject: [PATCH] alsa-tools: Update autotools.patch

envy24control, rmedigicontrol and echomixer require gtk+-2.0.
Remove envy24control rmedigicontrol and echomixer from list of tools.

CC: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 .../alsa/alsa-tools/autotools.patch                |    6 +++---
 .../recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta=
/recipes-multimedia/alsa/alsa-tools/autotools.patch
index 294e970..08dd9de 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
@@ -26,9 +26,9 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1=
.0.24.1/Makefile
 -	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
 -	  us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 \
 -	  hwmixvolume hdajackretask hda-verb
-+SUBDIRS =3D ac3dec as10k1 envy24control \
-+	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
-+	  us428control usx2yloader vxloader echomixer \
++SUBDIRS =3D ac3dec as10k1 \
++	  mixartloader pcxhrloader sb16_csp seq sscape_ctl \
++	  us428control usx2yloader vxloader \
 +	  hwmixvolume hda-verb
 =20
  all:
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/rec=
ipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index 0fe4bee..4b4f29b 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -5,7 +5,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPLv2 & LGPLv2+"
 DEPENDS =3D "alsa-lib ncurses"
=20
-PR =3D "r0"
+PR =3D "r1"
=20
 LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D94d55d512a9ba36caa9b=
7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=3D7fbc338309ac38fefcd64b=
04bb903e34"
--=20
1.7.9.5



