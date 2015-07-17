Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E54F07589F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 02:31:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H2Vnrg017243
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:31:49 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 16 Jul 2015 19:31:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 19:31:45 -0700
Message-ID: <672dd1856a39881dc3bd8e1a85e72f82f8425063.1437100265.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1437100265.git.liezhi.yang@windriver.com>
References: <cover.1437100265.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] lttng-ust: 2.6.1 -> 2.6.2
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
X-List-Received-Date: Fri, 17 Jul 2015 02:31:49 -0000
Content-Type: text/plain

* Remove add-aarch64.patch since it is already in the source.
* Rename lttng-ust_2.6.1.bb -> lttng-ust_git.bb

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../lttng/lttng-ust/add-aarch64.patch              |   19 -------------------
 .../lttng/{lttng-ust_2.6.1.bb => lttng-ust_git.bb} |    6 +++---
 2 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.6.1.bb => lttng-ust_git.bb} (91%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch b/meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch
deleted file mode 100644
index cec5410..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-lttng-ust: add aarch64 recognition
-
-Treat the same as "arm".
-
-Upstream-Status: Pending
-
-Signed-off-by: joe.slater@windriver.com
-
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -230,6 +230,7 @@ changequote([,])dnl
- 	s390) NO_UNALIGNED_ACCESS=1 ;;
- 	s390x) NO_UNALIGNED_ACCESS=1 ;;
-         arm*) NO_UNALIGNED_ACCESS=1 ;;
-+        aarch64) NO_UNALIGNED_ACCESS=1 ;;
- 	mips*) NO_UNALIGNED_ACCESS=1 ;;
- 	tile*) NO_UNALIGNED_ACCESS=1 ;;
- 	*) AC_MSG_ERROR([unable to detect alignment requirements (unsupported architecture ($host_cpu)?)]) ;;
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb b/meta/recipes-kernel/lttng/lttng-ust_git.bb
similarity index 91%
rename from meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_git.bb
index d083f86..ae4afd3 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
@@ -18,14 +18,14 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "369ee1a1b12338e5158d24f9c879f5dd52f1aba2"
+SRCREV = "c49ee9040ada6984c880756614e8a6f7fd645bd6"
 PE = "2"
+PV = "2.6.2+git${SRCPV}"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.6 \
            file://lttng-ust-doc-examples-disable.patch \
-           file://add-aarch64.patch \
            file://lttng-ust-Fix-live-timer-calculation-error.patch \
-	   "
+        "
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


