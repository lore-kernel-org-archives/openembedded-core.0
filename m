Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QKoXx-0006h6-Gu
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 11:20:33 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 May 2011 02:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,363,1301900400"; 
   d="scan'208";a="1733933"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2011 02:17:43 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 13 May 2011 17:16:41 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 13 May 2011 17:16:41 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Fri, 13 May 2011 17:16:40 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 13 May 2011 17:16:39 +0800
Thread-Topic: [meta-intel] n450-audio.bb: ${POKYBASE} --> ${COREBASE}
Thread-Index: AcwRTodSEkbYqC9MSreNTbqGXRoalw==
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BDA0@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: [meta-intel] n450-audio.bb: ${POKYBASE} --> ${COREBASE}
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
X-List-Received-Date: Fri, 13 May 2011 09:20:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Currently n450 can't build due to the issue:

diff --git a/meta-n450/recipes-bsp/n450-audio/n450-audio.bb b/meta-n450/rec=
ipes-bsp/n450-audio/n450-audio.bb
index 90ec267..27904e3 100644
--- a/meta-n450/recipes-bsp/n450-audio/n450-audio.bb
+++ b/meta-n450/recipes-bsp/n450-audio/n450-audio.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Provide a basic init script to enable audio"
 DESCRIPTION =3D "Set the volume and unmute the Front mixer setting during =
boot."
 SECTION =3D "base"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3f40d7994397109285e=
c7b81fdeb3b58"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285e=
c7b81fdeb3b58"

 PR =3D "r4"

Thanks,
-- Dexuan
=20


