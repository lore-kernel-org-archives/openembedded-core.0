Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUb-0002YD-2B
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540464"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:17 -0700
Message-Id: <9766f7e01ae63f24ee4c168ae781b1f22cb4042c.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/28] libgcrypt: Update to 1.5.0
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb |    6 ------
 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb |    7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
deleted file mode 100644
index aef616c..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libgcrypt.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "bfd45922eefb8a24d598af77366220d4"
-SRC_URI[sha256sum] = "996d2874643318c9df835777034a8b7a923d3cd0bee593bab1780305f9de872d"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
new file mode 100644
index 0000000..7e05c7a
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
@@ -0,0 +1,7 @@
+require libgcrypt.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "78f8f8bec4580f75b25816f7896d0389"
+SRC_URI[sha256sum] = "cc98b1f64c9ae3b0185099cef4ac6c436a849095edf87f34157f0bb10e187990"
+
-- 
1.7.6.2



