Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C3E7760821
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 09:39:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5H9dX7q010758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2013 02:39:33 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 02:39:31 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 17:39:29 +0800
Message-ID: <1371461969-16134-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] dbus-wait: fix the help message typo
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
X-List-Received-Date: Mon, 17 Jun 2013 09:39:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../dbus-wait/dbus-wait/fix-dbus-wait-typo.patch   |   31 ++++++++++++++++++++
 meta/recipes-core/dbus-wait/dbus-wait_git.bb       |    6 ++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/dbus-wait/dbus-wait/fix-dbus-wait-typo.patch

diff --git a/meta/recipes-core/dbus-wait/dbus-wait/fix-dbus-wait-typo.patch b/meta/recipes-core/dbus-wait/dbus-wait/fix-dbus-wait-typo.patch
new file mode 100644
index 0000000..d31a59e
--- /dev/null
+++ b/meta/recipes-core/dbus-wait/dbus-wait/fix-dbus-wait-typo.patch
@@ -0,0 +1,31 @@
+From ccba3bf3aa1d311e27a3ef0bd5cf1ce826a22cc9 Mon Sep 17 00:00:00 2001
+From: Song.Li <Song.Li@windriver.com>
+Date: Wed, 9 Jan 2013 17:29:48 +0800
+Subject: [PATCH] fix dbus-wait typo
+
+fix the help message typo
+
+Upstream-Status: Submitted [ross.burton@intel.com]
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ dbus-wait.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/dbus-wait.c b/dbus-wait.c
+index b74c205..4d3e83a 100644
+--- a/dbus-wait.c
++++ b/dbus-wait.c
+@@ -56,7 +56,7 @@ main (int argc, char **argv)
+   char *match = NULL;
+
+   if (argc < 3 || argc > 4) {
+-    fprintf (stderr, "$ dbus-watch <INTERFACE> <MEMBER> [PATH]\n");
++    fprintf (stderr, "$ dbus-wait <INTERFACE> <MEMBER> [PATH]\n");
+     return EXIT_FAILURE;
+   }
+
+--
+1.7.1
+
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index fb31662..5e2b6e4 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -8,9 +8,11 @@ DEPENDS = "dbus"

 SRCREV = "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
 PV = "0.1+git${SRCPV}"
-PR = "r2"
+PR = "r3"

-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+           file://fix-dbus-wait-typo.patch \
+"

 S = "${WORKDIR}/git"

--
1.7.4.1


