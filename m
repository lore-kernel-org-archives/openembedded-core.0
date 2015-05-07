Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7078872A85
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 01:58:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t471wHkg012315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 May 2015 18:58:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 6 May 2015 18:58:16 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 May 2015 09:54:08 +0800
Message-ID: <1430963648-6219-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1] dbus: upgrade to 1.8.16
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
X-List-Received-Date: Thu, 07 May 2015 01:58:19 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Upgrade to fix CVE-2015-0245

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-core/dbus/dbus_1.8.10.bb | 4 ----
 meta/recipes-core/dbus/dbus_1.8.16.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.10.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.16.bb

diff --git a/meta/recipes-core/dbus/dbus_1.8.10.bb b/meta/recipes-core/dbus/dbus_1.8.10.bb
deleted file mode 100644
index 250ea21..0000000
--- a/meta/recipes-core/dbus/dbus_1.8.10.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include dbus.inc
-
-SRC_URI[md5sum] = "6be5ef99ae784de9d04589eb067fe038"
-SRC_URI[sha256sum] = "10bf87fdb68815edd01d53885101dbcdd80dacad7198912cca61a4fa22dfaf8e"
diff --git a/meta/recipes-core/dbus/dbus_1.8.16.bb b/meta/recipes-core/dbus/dbus_1.8.16.bb
new file mode 100644
index 0000000..b549651
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.8.16.bb
@@ -0,0 +1,4 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "020824a38850501e7d6ba8307a7c5ac3"
+SRC_URI[sha256sum] = "7f795268efd343ff0498786acb35097564390d40b1b6158daf1b4f742b522b07"
-- 
1.9.1


