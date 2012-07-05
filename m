Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SmqvJ-0006LF-Qj
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 20:37:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q65IQ0UA021164
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2012 11:26:00 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 5 Jul 2012 11:26:00 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2012 13:25:58 -0500
Message-ID: <7125f689903d818be255e6c439fa15cc34b0b2ac.1341512660.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1341512659.git.peter.seebach@windriver.com>
References: <cover.1341512659.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo: Update to 1.3.1 (fixing chroot crash)
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
X-List-Received-Date: Thu, 05 Jul 2012 18:37:06 -0000
Content-Type: text/plain

Yocto bug #2639.  If a chroot path was long, expanding absolute
paths within the chroot path could overrun a buffer.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_1.3.bb   |    8 --------
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
new file mode 100644
index 0000000..d64e0e5
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
@@ -0,0 +1,8 @@
+require pseudo.inc
+
+PR = "r11"
+
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "aa7dbe925d065187833e1171746e9a94"
+SRC_URI[sha256sum] = "dc896c06b0f5bc253faaeb21ed78157db7ef7553e3ecae15a1eb6faf64942110"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
deleted file mode 100644
index 187b46d..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require pseudo.inc
-
-PR = "r10"
-
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "5832bb70e6dce1a17b9b33a9c5c4b923"
-SRC_URI[sha256sum] = "2f30e2e9ec966cec3a321fc2ed80408ee77ad6c0cd73aaf36f88b98e008f8508"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1852fab..2f58072 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,8 +1,8 @@
 require pseudo.inc
 
-SRCREV = "f0375c9aaefbccfd41aebbf6d332bb4d9e8f980c"
-PV = "1.3+git${SRCPV}"
-PR = "r25"
+SRCREV = "2e0189ba5368b1e88d509d0ab82bccb15cfb3653"
+PV = "1.3.1+git${SRCPV}"
+PR = "r26"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.0.4



