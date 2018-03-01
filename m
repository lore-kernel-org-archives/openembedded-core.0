Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id D96867887B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:06:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 06:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35134127"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 06:06:54 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:00:45 +0200
Message-Id: <20180301140052.1388-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/15] strace: use strace.io as the tarball location
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
X-List-Received-Date: Thu, 01 Mar 2018 14:06:54 -0000

As explained here:
https://sourceforge.net/projects/strace/files/

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/strace/strace_4.20.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_4.20.bb b/meta/recipes-devtools/strace/strace_4.20.bb
index d5df25eba8f..869c12f65a7 100644
--- a/meta/recipes-devtools/strace/strace_4.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.20.bb
@@ -1,10 +1,10 @@
 SUMMARY = "System call tracing tool"
-HOMEPAGE = "http://strace.sourceforge.net"
+HOMEPAGE = "http://strace.io"
 SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f132b4d2adfccc63da4139a609367711"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
+SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://disable-git-version-gen.patch \
            file://more-robust-test-for-m32-mx32-compile-support.patch \
            file://update-gawk-paths.patch \
-- 
2.15.1


