Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 12D5A787AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="13509594"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2018 06:04:11 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 106C45800D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:10 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:43 +0200
Message-Id: <1516716352-32735-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 03/12] ofono: upgrade to version 1.22
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:10 -0000

In ver 1.22:
        Fix issue with GPIO handling and Nokia modems.
        Fix issue with SIM state callback and AT modems.
        Fix issue with data mode and DCD for U-Blox modems.
        Fix issue with SMS receive on QMI based Quectel EC21.
        Fix issue with HFP support and last call dialed request.
        Fix issue with PIM retires handling and Gemalto modems.
        Fix issue with atom registration and SIM state handling.
        Add support for handling SIM card AID session management.
        Add support for handling GSM/UMTS and IMS authentication.
        Add support for IP Multimedia Subsystem (IMS) atom.
        Add support for MBIM based modems.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/ofono/ofono_1.21.bb | 8 --------
 meta/recipes-connectivity/ofono/ofono_1.22.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.21.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.22.bb

diff --git a/meta/recipes-connectivity/ofono/ofono_1.21.bb b/meta/recipes-connectivity/ofono/ofono_1.21.bb
deleted file mode 100644
index 1f0e31d..0000000
--- a/meta/recipes-connectivity/ofono/ofono_1.21.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-"
-SRC_URI[md5sum] = "bc2b818f6fe5725d0dd8591aff6640d7"
-SRC_URI[sha256sum] = "a6b021cda0b444b772897cd637d5f455857fb5819b62c279a8302b44f9c7f2c3"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.22.bb b/meta/recipes-connectivity/ofono/ofono_1.22.bb
new file mode 100644
index 0000000..fd7ee15
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.22.bb
@@ -0,0 +1,8 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+"
+SRC_URI[md5sum] = "2a683ab8e98448ad8bc5dc9868d2893e"
+SRC_URI[sha256sum] = "8e34a6696c300c9841b55e8dff640bd3096e49f5dbe55bbebaa69a71676f687e"
-- 
2.4.0


