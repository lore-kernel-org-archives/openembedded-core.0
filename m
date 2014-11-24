Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 161077147B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 07:50:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAO7oAVF026328
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Nov 2014 23:50:11 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 23 Nov 2014 23:50:09 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Nov 2014 15:49:32 +0800
Message-ID: <e1a13f3bd793182dcbf53493d91fa475ec78648d.1416815305.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416815305.git.Chong.Lu@windriver.com>
References: <cover.1416815305.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] dbus: Upgrade to 1.8.10
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
X-List-Received-Date: Mon, 24 Nov 2014 07:50:12 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-core/dbus/dbus_1.8.10.bb | 4 ++++
 meta/recipes-core/dbus/dbus_1.8.2.bb  | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.10.bb
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb

diff --git a/meta/recipes-core/dbus/dbus_1.8.10.bb b/meta/recipes-core/dbus/dbus_1.8.10.bb
new file mode 100644
index 0000000..250ea21
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.8.10.bb
@@ -0,0 +1,4 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "6be5ef99ae784de9d04589eb067fe038"
+SRC_URI[sha256sum] = "10bf87fdb68815edd01d53885101dbcdd80dacad7198912cca61a4fa22dfaf8e"
diff --git a/meta/recipes-core/dbus/dbus_1.8.2.bb b/meta/recipes-core/dbus/dbus_1.8.2.bb
deleted file mode 100644
index 37ebed2..0000000
--- a/meta/recipes-core/dbus/dbus_1.8.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include dbus.inc
-
-SRC_URI[md5sum] = "d6f709bbec0a022a1847c7caec9d6068"
-SRC_URI[sha256sum] = "5689f7411165adc953f37974e276a3028db94447c76e8dd92efe910c6d3bae08"
-- 
1.9.1


