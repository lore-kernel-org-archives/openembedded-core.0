Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U9u2M-0001oH-QY
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 10:08:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2013 00:51:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,733,1355126400"; d="scan'208";a="267146818"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2013 00:51:35 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 25 Feb 2013 08:51:30 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.108]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.144]) with mapi id
	14.01.0355.002; Mon, 25 Feb 2013 08:51:30 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH V2] connman: enable connman client
Thread-Index: AQHOEzUE2iKuVfbinEmGBsVPApBjE5iKQ6bw
Date: Mon, 25 Feb 2013 08:51:29 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16205C3C@IRSMSX102.ger.corp.intel.com>
References: <1361782141-18273-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1361782141-18273-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH V2] connman: enable connman client
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
X-List-Received-Date: Mon, 25 Feb 2013 09:08:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Changes from V1:
	- connman client is explicitly enabled
	- ${B} is used instead of ${S} (in this specific case are the same, it wil=
l be changed later on)

-----Original Message-----
From: Iorga, Cristian=20
Sent: Monday, February 25, 2013 10:49 AM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH V2] connman: enable connman client

connmanctl is now included when connman is installed

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-c=
onnectivity/connman/connman.inc
index b61e2af..b0ede60 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
=20
-INC_PR =3D "r17"
+INC_PR =3D "r18"
=20
 TIST =3D "--enable-tist"
 TIST_powerpc =3D ""
@@ -38,7 +38,7 @@ EXTRA_OECONF +=3D "\
     --enable-tools \
     --enable-test \
     --disable-polkit \
-    --disable-client \
+    --enable-client \
     --enable-fake \
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=
=3D${systemd_unitdir}/system/', '', d)} \  "
@@ -73,6 +73,7 @@ do_install_append() {
 	install -d ${D}${bindir}
 	install -m 0755 ${S}/tools/*-test ${D}${bindir}
 	install -m 0755 ${S}/tools/wispr ${D}${bindir}
+	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
=20
 	# We don't need to package an empty directory
 	rmdir ${D}${libdir}/connman/scripts
--
1.7.10.4



