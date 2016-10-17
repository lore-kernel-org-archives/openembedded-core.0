Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1043871BC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:15:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 17 Oct 2016 08:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="180649304"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2016 08:15:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 18:12:48 +0300
Message-Id: <171ab29efb4f45f82ca63e98a6493438a809d99d.1476716907.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/23] pixz: enable optional building of manpages
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
X-List-Received-Date: Mon, 17 Oct 2016 15:15:32 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/pixz/pixz_1.0.6.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pixz/pixz_1.0.6.bb b/meta/recipes-extended/pixz/pixz_1.0.6.bb
index 0e51472..3032586 100644
--- a/meta/recipes-extended/pixz/pixz_1.0.6.bb
+++ b/meta/recipes-extended/pixz/pixz_1.0.6.bb
@@ -15,10 +15,11 @@ SRC_URI += "file://936d8068ae19d95260d3058f41dd6cf718101cd6.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/vasi/pixz/releases"
 
-EXTRA_OECONF += "--without-manpage"
+PACKAGECONFIG[manpages] = "--with-manpage, --without-manpage, asciidoc-native"
+
 CFLAGS_append_libc-musl = " -D_GNU_SOURCE"
 CACHED_CONFIGUREVARS += "ac_cv_file_src_pixz_1=no"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig manpages
 
 BBCLASSEXTEND = "native"
-- 
2.9.3


