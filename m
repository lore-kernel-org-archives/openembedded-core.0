Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C24373D0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:09:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89OYt029748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:09:24 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:09:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:09:19 -0700
Message-ID: <2b2fd363280e05c92bf0a948e2ecb5eb19d1cc8c.1429517334.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429517334.git.liezhi.yang@windriver.com>
References: <cover.1429517334.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] dbus-glib: 0.102 -> 0.104
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:23 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/dbus/dbus-glib_0.102.bb |    5 -----
 meta/recipes-core/dbus/dbus-glib_0.104.bb |    4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.102.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.104.bb

diff --git a/meta/recipes-core/dbus/dbus-glib_0.102.bb b/meta/recipes-core/dbus/dbus-glib_0.102.bb
deleted file mode 100644
index d798ebf..0000000
--- a/meta/recipes-core/dbus/dbus-glib_0.102.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require dbus-glib.inc
-
-
-SRC_URI[md5sum] = "f76b8558fd575d0106c3a556eaa49184"
-SRC_URI[sha256sum] = "6964ed585bb8149a14ab744b5ded5e77cf71ec5446e6dcc5fcf5eebcc52df29c"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.104.bb b/meta/recipes-core/dbus/dbus-glib_0.104.bb
new file mode 100644
index 0000000..c1263c0
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib_0.104.bb
@@ -0,0 +1,4 @@
+require dbus-glib.inc
+
+SRC_URI[md5sum] = "5497d2070709cf796f1878c75a72a039"
+SRC_URI[sha256sum] = "bfc1f1a82bfc3ec3ecafe04d0e87bab7e999f50dce4f4a34d0b89caf6bd821f6"
-- 
1.7.9.5


