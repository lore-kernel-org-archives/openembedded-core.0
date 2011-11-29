Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RVJMx-0007AY-7W
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:48:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAT8gBua015764
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 00:42:12 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 29 Nov 2011 00:42:11 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 16:39:02 +0800
Message-ID: <fac0655c4196ef515e14ffcca14fcb9de4cb0505.1322554339.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322554339.git.wenzong.fan@windriver.com>
References: <cover.1322554339.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] task-sdk-host-nativesdk: add autotools nativesdk to meta-toolchain
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
X-List-Received-Date: Tue, 29 Nov 2011 08:48:51 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

[YOCTO #1603]

Add automake-nativesdk and autoconf-nationsdk into meta-toolchain.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/tasks/task-sdk-host-nativesdk.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb b/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb
index 5ec40b1..920f359 100644
--- a/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb
+++ b/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Host packages for the standalone SDK or external toolchain"
-PR = "r10"
+PR = "r11"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
@@ -22,6 +22,8 @@ RDEPENDS_${PN} = "\
     unfs-server-nativesdk \
     opkg-nativesdk \
     libtool-nativesdk \
+    autoconf-nativesdk \
+    automake-nativesdk \
     "
 
 RDEPENDS_${PN}_darwin8 = "\
-- 
1.7.0.4



