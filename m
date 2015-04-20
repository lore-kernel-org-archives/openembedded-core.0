Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E714073D60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:09:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89QwR029757
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:09:26 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:09:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:09:23 -0700
Message-ID: <ab181fcdc20ba4071ba7533e4de2be43e2e75b24.1429517334.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429517334.git.liezhi.yang@windriver.com>
References: <cover.1429517334.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] lz4: r127 -> r128
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:25 -0000
Content-Type: text/plain

* Add HOMEPAGE
* Use github as the SRC_URI since its HOMEPAGE says it is the source.
* The upgraded version is r128.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} (66%)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_git.bb
similarity index 66%
rename from meta/recipes-support/lz4/lz4_svn.bb
rename to meta/recipes-support/lz4/lz4_git.bb
index 363e439..ab57677 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_git.bb
@@ -1,16 +1,16 @@
 SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
+HOMEPAGE = "http://fastcompression.blogspot.com/p/lz4.html"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
+LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
-# Upstream names releases after SVN revs
-SRCREV = "127"
-PV = "r${SRCREV}"
+SRCREV = "160661c7a4cbf805f4af74d2e3932a17a66e6ce7"
+PV = "r128"
 
-SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
+SRC_URI = "git://github.com/Cyan4973/lz4.git"
 
-S = "${WORKDIR}/trunk"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
-- 
1.7.9.5


