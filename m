Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpabS-0000Nc-6T
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 08:43:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 23:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,327,1309762800"; d="scan'208";a="35941168"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 23:38:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 23:38:45 -0700
Message-Id: <7b86ee7d0f33c590c2ea0262025fdae25b1f830c.1312612601.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 9/9] lttng-control: Update to 0.89
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Aug 2011 06:43:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...lttng-control_0.88.bb => lttng-control_0.89.bb} |    4 +--
 meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |   30 --------------------
 2 files changed, 1 insertions(+), 33 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-control_0.88.bb => lttng-control_0.89.bb} (77%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.12.bb

diff --git a/meta/recipes-kernel/lttng/lttng-control_0.88.bb b/meta/recipes-kernel/lttng/lttng-control_0.89.bb
similarity index 77%
rename from meta/recipes-kernel/lttng/lttng-control_0.88.bb
rename to meta/recipes-kernel/lttng/lttng-control_0.89.bb
index dee960f..811a9df 100644
--- a/meta/recipes-kernel/lttng/lttng-control_0.88.bb
+++ b/meta/recipes-kernel/lttng/lttng-control_0.89.bb
@@ -7,12 +7,10 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 PR = "r0"
 
-LTTDATE = "09242010"
+LTTDATE = "05122011"
 
 SRC_URI = "http://lttng.org/files/lttng/ltt-control-${PV}-${LTTDATE}.tar.gz"
 
-SRC_URI[md5sum] = "ca81d874352756837518d74c9d1091a7"
-SRC_URI[sha256sum] = "89c625a4d1b0823954217df232a31f3cae31de7b6655c0d885a61bece0dfcd88"
 
 S = "${WORKDIR}/ltt-control-${PV}-${LTTDATE}"
 
diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.12.bb b/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
deleted file mode 100644
index 5fca949..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Linux Trace Toolkit Userspace Tracer"
-DESCRIPTION = "The LTTng Userspace Tracer (UST) is a library accompanied by a set of tools to trace userspace code"
-HOMEPAGE = "http://lttng.org/ust"
-BUGTRACKER = "n/a"
-
-LICENSE = "LGPLv2.1+ & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
-                    file://ustctl/ustctl.c;endline=16;md5=b50c6fa0307175bb1ce0db49d752c03b \
-                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
-
-DEPENDS = "liburcu"
-
-PR = "r0"
-
-SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz \
-           file://uclibc-sched_getcpu.patch \
-          "
-
-SRC_URI[md5sum] = "fae6e324a56016658c5b83ec14ba0043"
-SRC_URI[sha256sum] = "215b05f47d0c9e3a2934926a7d14fa9c67025db917c3a1f641df40b08314ab0c"
-
-S = "${WORKDIR}/ust-${PV}"
-
-inherit autotools
-
-# Due to liburcu not building on MIPS currently this recipe needs to
-# be limited also.
-# So here let us first suppport x86/arm/powerpc platforms now.
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
-
-- 
1.7.3.4



