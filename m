Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 32A7177368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 03:40:16 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.266.1;
	Wed, 24 Feb 2016 04:40:12 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 9DF5728BA24;
	Wed, 24 Feb 2016 04:40:12 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2016 04:40:07 +0100
Message-ID: <1456285208-24670-2-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456285208-24670-1-git-send-email-tudor.florea@enea.com>
References: <1456285208-24670-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 2/3] lttng-ust: add support for aarch64_be
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
 .../lttng-ust-add-support-for-aarch64_be.patch          | 17 +++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_git.bb              |  4 +++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-add-support-for-aarch64_be.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-add-support-for-aarch64_be.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-add-support-for-aarch64_be.patch
new file mode 100644
index 0000000..9b37a4a
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-add-support-for-aarch64_be.patch
@@ -0,0 +1,17 @@
+lttng-ust: add support for aarch64_be
+
+Upstream-Status: Pending
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
+diff --ruN a/configure.ac b/configure.ac
+--- a/configure.ac	2016-02-18 14:54:54.651713647 +0100
++++ b/configure.ac	2016-02-18 14:56:11.057865297 +0100
+@@ -240,6 +240,7 @@
+ 	s390x) NO_UNALIGNED_ACCESS=1 ;;
+         arm*) NO_UNALIGNED_ACCESS=1 ;;
+ 	aarch64) NO_UNALIGNED_ACCESS=1 ;;
++        aarch64_be) NO_UNALIGNED_ACCESS=1 ;;
+ 	mips*) NO_UNALIGNED_ACCESS=1 ;;
+ 	tile*) NO_UNALIGNED_ACCESS=1 ;;
+ 	*)
diff --git a/meta/recipes-kernel/lttng/lttng-ust_git.bb b/meta/recipes-kernel/lttng/lttng-ust_git.bb
index 9ffe9bc..15d925d 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
@@ -23,7 +23,9 @@ PE = "2"
 PV = "2.7.1+git${SRCPV}"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.7 \
-           file://lttng-ust-doc-examples-disable.patch"
+           file://lttng-ust-doc-examples-disable.patch \
+           file://lttng-ust-add-support-for-aarch64_be.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


