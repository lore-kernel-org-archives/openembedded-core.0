Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 04C56767CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:27:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2015 07:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="779724788"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2015 07:27:52 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 17:28:46 +0300
Message-Id: <e9f8f02fb30802dab6da72cbf07ba3eeb2bda885.1438956967.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/7] stress: update checksums to match upstream tarball, use BPN and BP in SRC_URI
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
X-List-Received-Date: Fri, 07 Aug 2015 14:27:53 -0000

This is an update to an earlier commit:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=5f9d379fac16cfe6ca155077e6279242e72a92a9

After switching the tarball source from Fedora to upstream it was
found that the two tarballs are not identical: Fedora tarball has
a copy of GPLv3 in the COPYING file, but author's tarball has GPLv2.
Otherwise the tarballs are the same.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/stress/stress_1.0.4.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-extended/stress/stress_1.0.4.bb
index df96fc0..4b7e4ba 100644
--- a/meta/recipes-extended/stress/stress_1.0.4.bb
+++ b/meta/recipes-extended/stress/stress_1.0.4.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
 imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
 HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://people.seas.harvard.edu/~apw/stress/stress-${PV}.tar.gz \
+SRC_URI = "http://people.seas.harvard.edu/~apw/${BPN}/${BP}.tar.gz \
            file://texinfo.patch \
            "
 
-SRC_URI[md5sum] = "a607afa695a511765b40993a64c6e2f4"
-SRC_URI[sha256sum] = "369c997f65e8426ae8b318d4fdc8e6f07a311cfa77cc4b25dace465c582163c0"
+SRC_URI[md5sum] = "890a4236dd1656792f3ef9a190cf99ef"
+SRC_URI[sha256sum] = "057e4fc2a7706411e1014bf172e4f94b63a12f18412378fca8684ca92408825b"
 
 inherit autotools
-- 
2.1.4


