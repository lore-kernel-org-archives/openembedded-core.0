Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4611C6E00C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:37:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2014 08:37:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="490064822"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2014 08:37:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 16:37:21 +0000
Message-Id: <960b57328b098894ba9d552ac9586408f16940e8.1393605405.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] augeas: upgrade to 1.2.0
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
X-List-Received-Date: Fri, 28 Feb 2014 16:37:30 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/augeas/augeas_1.1.0.bb | 6 ------
 meta/recipes-extended/augeas/augeas_1.2.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/augeas/augeas_1.1.0.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_1.2.0.bb

diff --git a/meta/recipes-extended/augeas/augeas_1.1.0.bb b/meta/recipes-extended/augeas/augeas_1.1.0.bb
deleted file mode 100644
index 5eebcc6..0000000
--- a/meta/recipes-extended/augeas/augeas_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require augeas.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "520ce983457ff9ffa3816bc41a9f328b"
-SRC_URI[sha256sum] = "9d81e4228329e2d5cccb018ab06bc8b734fb2dede2c4d9b5c02303d4a690b76b"
diff --git a/meta/recipes-extended/augeas/augeas_1.2.0.bb b/meta/recipes-extended/augeas/augeas_1.2.0.bb
new file mode 100644
index 0000000..67b3941
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas_1.2.0.bb
@@ -0,0 +1,5 @@
+require augeas.inc
+
+
+SRC_URI[md5sum] = "dce2f52cbd20f72c7da48e014ad48076"
+SRC_URI[sha256sum] = "f4aeb28ebe0b0921920fe1c9b4c016739c25261a15de04cb97db02d669f481e0"
-- 
1.8.5.3


