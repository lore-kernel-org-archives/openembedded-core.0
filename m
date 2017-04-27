Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2C55771C70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884556"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:28:01 +0300
Message-Id: <76314a789fb0ce3e4e430cc1d74056323881b9f2.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/13] bmap-tools: switch to taking source from git
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:25 -0000

This is where new development happens; in particular Python 3.x support
will first appear here:
https://github.com/01org/bmap-tools/issues/14

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
index e10f5fd341d..30150f3775b 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
@@ -4,14 +4,15 @@ bmap. Bmaptool is a generic tool for creating the block map (bmap) for a file, \
 and copying files using the block map. The idea is that large file containing \
 unused blocks, like raw system image files, can be copied or flashed a lot \
 faster with bmaptool than with traditional tools like "dd" or "cp"."
-HOMEPAGE = "http://git.infradead.org/users/dedekind/bmap-tools.git"
+HOMEPAGE = "https://github.com/01org/bmap-tools"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${PV}.tgz"
-SRC_URI[md5sum] = "92cdad1cb4dfa0cca7176c8e22752616"
-SRC_URI[sha256sum] = "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02bf2d434"
+SRC_URI = "git://github.com/01org/bmap-tools.git"
+SRCREV = "96702a869220ab20830db916ec4ac595e1d97f92"
+
+S = "${WORKDIR}/git"
 
 RDEPENDS_${PN} = "python-core python-compression"
 
-- 
2.11.0


