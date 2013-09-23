Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9977610D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 21:42:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8NLgbt3011224
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 14:42:37 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.103]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0347.000;
	Mon, 23 Sep 2013 14:42:36 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] vala.bbclass: add dependency on vala
Thread-Index: Ac64pavVRhufcE/xSJuCfzJD91ae6w==
Date: Mon, 23 Sep 2013 21:42:36 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF843C51988E@ALA-MBB.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Subject: [PATCH 1/1] vala.bbclass: add dependency on vala
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
X-List-Received-Date: Mon, 23 Sep 2013 21:42:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Joe Slater [mailto:jslater@windriver.com]=20
Sent: Monday, September 23, 2013 1:53 PM
To: MacLeod, Randy; Polk, Jeffrey
Cc: lpd-eng-rr
Subject: [PATCH 1/1] vala.bbclass: add dependency on vala

This class points the inheritor to directories in
the target sysroot, so we want to be sure things
like .vapi files are there.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/vala.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
index c7db08c..0a98dab 100644
--- a/meta/classes/vala.bbclass
+++ b/meta/classes/vala.bbclass
@@ -1,9 +1,9 @@
 # Vala has problems with multiple concurrent invocations
 PARALLEL_MAKE =3D ""
=20
-# Vala needs vala-native
-DEPENDS +=3D "vala-native"
-DEPENDS_virtclass-native +=3D "vala-native"
+# Vala needs vala-native (and we need vala)
+DEPENDS +=3D "vala-native vala"
+DEPENDS_class-native +=3D "vala-native"
=20
 # Our patched version of Vala looks in STAGING_DATADIR for .vapi files
 export STAGING_DATADIR
--=20
1.7.3.4


