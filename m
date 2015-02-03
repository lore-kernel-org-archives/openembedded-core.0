Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CAA76E64C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t131CTVw013020
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:29 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:12:15 -0800
Message-ID: <0728df234376dace55c49360f9dbc6ea41b83e13.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 21/21] m4-native 1.4.9: remove it
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:28 -0000
Content-Type: text/plain

Its do_compile would be failed once our autoconf-naitve is built:
| /path/to/m4-native/1.4.9-r2/m4-1.4.9/missing: line 54: aclocal-1.10: command not found
| WARNING: `aclocal-1.10' is missing on your system.  You should only need it if
|          you modified `acinclude.m4' or `configure.ac'.  You might want
|          to install the `Automake' and `Perl' packages.  Grab them from

Also:
| /path/to/m4-native/1.4.9-r2/m4-1.4.9/missing: line 54: automake-1.10: command not found

We don't need keep a native GPLv2 recipe, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/m4/m4-native_1.4.9.bb |   12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta/recipes-devtools/m4/m4-native_1.4.9.bb

diff --git a/meta/recipes-devtools/m4/m4-native_1.4.9.bb b/meta/recipes-devtools/m4/m4-native_1.4.9.bb
deleted file mode 100644
index 23a21d0..0000000
--- a/meta/recipes-devtools/m4/m4-native_1.4.9.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require m4-${PV}.inc
-
-INHIBIT_AUTOTOOLS_DEPS = "1"
-DEPENDS += "gnu-config-native"
-
-do_configure()  {
-	install -m 0644 ${STAGING_DATADIR}/gnu-config/config.sub .
-	install -m 0644 ${STAGING_DATADIR}/gnu-config/config.guess .
-	oe_runconf
-}
-
-inherit native
-- 
1.7.9.5


