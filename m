Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 086F26B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 07:29:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Aug 2013 00:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,867,1367996400"; d="scan'208";a="361795647"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 13 Aug 2013 00:29:19 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.157]) with mapi id
	14.03.0123.003; Tue, 13 Aug 2013 08:29:18 +0100
From: "Voicu, Cristiana" <cristiana.voicu@intel.com>
To: "Voicu, Cristiana" <cristiana.voicu@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH_V2] systemtap: upgrade to 2.3
Thread-Index: AQHOl/PXwNo+p05ExkWRvuUZ8b8yv5mSva0Q
Date: Tue, 13 Aug 2013 07:29:17 +0000
Message-ID: <BE68E9C8E0850C43B0F0B0B7D57FA5AE2E7F92C2@IRSMSX105.ger.corp.intel.com>
References: <06a01304db7ca6bc605947b809400868dfe72b67.1375969277.git.cristiana.voicu@intel.com>
	<1376377844-11929-1-git-send-email-cristiana.voicu@intel.com>
In-Reply-To: <1376377844-11929-1-git-send-email-cristiana.voicu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH_V2] systemtap: upgrade to 2.3
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
X-List-Received-Date: Tue, 13 Aug 2013 07:29:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just saw that there is a little change for systemtap on master and this pat=
ch will fail.
I will send a new version.
Cristiana

-----Original Message-----
From: Voicu, Cristiana=20
Sent: Tuesday, August 13, 2013 10:11 AM
To: openembedded-core@lists.openembedded.org
Cc: Voicu, Cristiana
Subject: [PATCH_V2] systemtap: upgrade to 2.3

Disabled javac and jar.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb  |    6 +++---
 meta/recipes-kernel/systemtap/systemtap_git.inc |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-=
kernel/systemtap/systemtap_git.bb
index 9bba5a9..2a42086 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -10,11 +10,11 @@ RDEPENDS_${PN} +=3D "python bash"
 RDEPENDS_${PN}_class-native +=3D "python-native"
 RDEPENDS_${PN}_class-nativesdk +=3D "python-native"
=20
-PR =3D "r1"
-
 EXTRA_OECONF +=3D "--with-libelf=3D${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi \
-            --disable-server --disable-grapher "
+            --disable-server --disable-grapher \
+            ac_cv_prog_have_javac=3Dno \
+            ac_cv_prog_have_jar=3Dno "
=20
 STAP_DOCS ?=3D "--disable-docs --disable-publican --disable-refdocs"
=20
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes=
-kernel/systemtap/systemtap_git.inc
index 7be6c2b..0632746 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,8 +1,8 @@
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
=20
-SRCREV =3D "addec813fed4c712d6ea752f6e4f23e602b87fad"
-PV =3D "2.1+git${SRCPV}"
+SRCREV =3D "e58138572ebddac9498b93c76770eeca7d45e3b1"
+PV =3D "2.3+git${SRCPV}"
=20
 SRC_URI =3D "git://sourceware.org/git/systemtap.git;protocol=3Dgit \
            file://docproc-build-fix.patch \
--=20
1.7.9.5


