Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DE879719AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945728"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:00 +0300
Message-Id: <ffbca80ae3d519444881d935a93fef2323a099d3.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/50] dtc: update to 1.4.5
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:28 -0000

Also fix upstream check and disable newly added python2-only bindings
(as there is no clear need for them and python 2 is deprecated).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/dtc/dtc.inc                        | 3 ++-
 meta/recipes-kernel/dtc/{dtc_1.4.4.bb => dtc_1.4.5.bb} | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/dtc/{dtc_1.4.4.bb => dtc_1.4.5.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index d75994661a6..08c25ce305d 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -8,8 +8,9 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
 	  "
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
+EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/dtc/dtc_1.4.4.bb b/meta/recipes-kernel/dtc/dtc_1.4.5.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.4.4.bb
rename to meta/recipes-kernel/dtc/dtc_1.4.5.bb
index eadb7bab6f7..0e46cfbeb4f 100644
--- a/meta/recipes-kernel/dtc/dtc_1.4.4.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.4.5.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "558cd81bdd432769b59bff01240c44f82cfb1a9d"
+SRCREV = "22a65c5331c22979d416738eb756b9541672e00d"
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


