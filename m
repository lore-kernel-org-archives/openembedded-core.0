Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3396E77372
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 03:40:16 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.266.1;
	Wed, 24 Feb 2016 04:40:11 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 53E6628BA23;
	Wed, 24 Feb 2016 04:40:11 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2016 04:40:06 +0100
Message-ID: <1456285208-24670-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/3] liburcu: add support for aarch64_be
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
X-List-Received-Date: Wed, 24 Feb 2016 03:40:18 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../liburcu/liburcu/0002-Support-for-aarch64_be.patch | 19 +++++++++++++++++++
 meta/recipes-support/liburcu/liburcu_0.9.1.bb         |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-support/liburcu/liburcu/0002-Support-for-aarch64_be.patch

diff --git a/meta/recipes-support/liburcu/liburcu/0002-Support-for-aarch64_be.patch b/meta/recipes-support/liburcu/liburcu/0002-Support-for-aarch64_be.patch
new file mode 100644
index 0000000..a10ccd7
--- /dev/null
+++ b/meta/recipes-support/liburcu/liburcu/0002-Support-for-aarch64_be.patch
@@ -0,0 +1,19 @@
+liburcu: add support for aarch64_be
+
+Upstream-Status: Pending
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
+diff --git a/configure.ac b/configure.ac
+index 8ebfa8b..fe1c55d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -121,7 +121,7 @@ AS_CASE([$host_cpu],
+ 	[alpha*], [ARCHTYPE="alpha"],
+ 	[ia64], [ARCHTYPE="ia64"],
+ 	[arm*], [ARCHTYPE="arm"],
+-	[aarch64], [ARCHTYPE="aarch64"],
++	[aarch64*], [ARCHTYPE="aarch64"],
+ 	[mips*], [ARCHTYPE="mips"],
+ 	[nios2*], [ARCHTYPE="nios2"],
+ 	[tile*], [ARCHTYPE="tile"],
diff --git a/meta/recipes-support/liburcu/liburcu_0.9.1.bb b/meta/recipes-support/liburcu/liburcu_0.9.1.bb
index dccc05c..aadc32f 100644
--- a/meta/recipes-support/liburcu/liburcu_0.9.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.9.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 SRC_URI = " \
 	http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
 	file://0001-Support-for-NIOS2-architecture.patch \
+        file://0002-Support-for-aarch64_be.patch \
 	"
 
 SRC_URI[md5sum] = "124eaeea06863271c0bdf2a0cc1d8e4b"
-- 
1.9.1


