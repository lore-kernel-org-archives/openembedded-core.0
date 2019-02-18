Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DBC3F7C69A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:16:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Feb 2019 21:16:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,383,1544515200"; d="scan'208";a="145117481"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.183])
	by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2019 21:16:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 13:16:17 +0800
Message-Id: <20190218051617.5413-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] cairo: fix UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Mon, 18 Feb 2019 05:16:19 -0000

Otherwise it matches versions for 'rcairo' as well.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index 3e176930cc..cdef023198 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -83,3 +83,5 @@ FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
 FILES_${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = "cairo-(?P<pver>\d+(\.\d+)+).tar.xz"
-- 
2.17.1


