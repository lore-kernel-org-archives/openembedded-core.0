Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20110605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 03:33:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T3XlRT005276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 20:33:47 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 28 Jul 2015 20:33:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 11:33:45 +0800
Message-ID: <4c8d6724caed69669952c242ecf4f8ac513fdfb5.1438140664.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438140664.git.Qi.Chen@windriver.com>
References: <cover.1438140664.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dbus: upgrade to 1.8.20
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
X-List-Received-Date: Wed, 29 Jul 2015 03:33:49 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/{dbus-test_1.8.18.bb => dbus-test_1.8.20.bb} | 4 ++--
 meta/recipes-core/dbus/dbus_1.8.18.bb                               | 4 ----
 meta/recipes-core/dbus/dbus_1.8.20.bb                               | 4 ++++
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.8.18.bb => dbus-test_1.8.20.bb} (93%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.18.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.20.bb

diff --git a/meta/recipes-core/dbus/dbus-test_1.8.18.bb b/meta/recipes-core/dbus/dbus-test_1.8.20.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.8.18.bb
rename to meta/recipes-core/dbus/dbus-test_1.8.20.bb
index e138f6e..704070b 100644
--- a/meta/recipes-core/dbus/dbus-test_1.8.18.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.8.20.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "83e607e9ccb1c921d5b6bbea2376a36c"
-SRC_URI[sha256sum] = "36f2eb9c777a3c71562573da36a147e900a642afcd44d2b0470d992a4898c4f2"
+SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
+SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
diff --git a/meta/recipes-core/dbus/dbus_1.8.18.bb b/meta/recipes-core/dbus/dbus_1.8.18.bb
deleted file mode 100644
index 2932b7a..0000000
--- a/meta/recipes-core/dbus/dbus_1.8.18.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include dbus.inc
-
-SRC_URI[md5sum] = "83e607e9ccb1c921d5b6bbea2376a36c"
-SRC_URI[sha256sum] = "36f2eb9c777a3c71562573da36a147e900a642afcd44d2b0470d992a4898c4f2"
diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb b/meta/recipes-core/dbus/dbus_1.8.20.bb
new file mode 100644
index 0000000..a8f2094
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.8.20.bb
@@ -0,0 +1,4 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
+SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
-- 
1.9.1


