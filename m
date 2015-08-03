Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2C96765BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 16:29:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2015 09:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,602,1432623600"; d="scan'208";a="618370931"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 03 Aug 2015 09:28:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 19:29:53 +0300
Message-Id: <fd641de4c497143e62a5f662584ff91c65bec9da.1438619216.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/7] stress: update checksums to match upstream tarball
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
X-List-Received-Date: Mon, 03 Aug 2015 16:29:12 -0000

COPYING checksum has changed because the previous upstream tarball
(taken from Fedora) had GPLv3 in it, but author's tarball has GPLv2.
Otherwise the tarballs are identical

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/stress/stress_1.0.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-extended/stress/stress_1.0.4.bb
index df96fc0..00d9940 100644
--- a/meta/recipes-extended/stress/stress_1.0.4.bb
+++ b/meta/recipes-extended/stress/stress_1.0.4.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
 imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
 HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://people.seas.harvard.edu/~apw/stress/stress-${PV}.tar.gz \
            file://texinfo.patch \
            "
 
-SRC_URI[md5sum] = "a607afa695a511765b40993a64c6e2f4"
-SRC_URI[sha256sum] = "369c997f65e8426ae8b318d4fdc8e6f07a311cfa77cc4b25dace465c582163c0"
+SRC_URI[md5sum] = "890a4236dd1656792f3ef9a190cf99ef"
+SRC_URI[sha256sum] = "057e4fc2a7706411e1014bf172e4f94b63a12f18412378fca8684ca92408825b"
 
 inherit autotools
-- 
2.1.4


