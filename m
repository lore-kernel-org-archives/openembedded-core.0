Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03ED77E905
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 01:38:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5E1cJg9003332
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 18:38:19 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 13 Jun 2019 18:38:13 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2019 21:38:10 -0400
Message-ID: <20190614013810.9726-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] qemu/qemu-system-native: depend bison-native
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
X-List-Received-Date: Fri, 14 Jun 2019 01:38:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add bison-native to DEPENDS of qemu and qemu-system-native to fix
compile warning:

|      BISON dtc-parser.tab.c
| make[1]: bison: Command not found

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu_4.0.0.bb               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
index 820883df65..964dcee524 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
@@ -5,7 +5,7 @@ require qemu-native.inc
 # As some of the files installed by qemu-native and qemu-system-native 
 # are the same, we depend on qemu-native to get the full installation set
 # and avoid file clashes
-DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native"
+DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
diff --git a/meta/recipes-devtools/qemu/qemu_4.0.0.bb b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
index 247e0311ed..f119215b21 100644
--- a/meta/recipes-devtools/qemu/qemu_4.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
@@ -2,7 +2,7 @@ BBCLASSEXTEND = "nativesdk"
 
 require qemu.inc
 
-DEPENDS = "glib-2.0 zlib pixman"
+DEPENDS = "glib-2.0 zlib pixman bison-native"
 
 RDEPENDS_${PN}_class-target += "bash"
 
-- 
2.20.0


