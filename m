Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D298571D70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:04 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878644"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:11 +0300
Message-Id: <8a2e74a18036458e64b6d0712e504ebdf015c0e7.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 08/26] pixz: enable optional building of manpages
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:05 -0000

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


