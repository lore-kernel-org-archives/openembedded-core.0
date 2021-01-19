Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8470.1611038797016909098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: nAbVGxDy/PiZBZzi/PSdlJCUZznKSeS8jv2He+dGS6CrnjdxEMDOK7M2lfkLt6kUUoQ9gTNBwH
 SeOnr48qpXiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035649"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035649"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:23 -0800
IronPort-SDR: FDaXVdm0SorwQ9QTzEHIRJc5Um0tGLANAAPqipNo2IeyvPYbcIOEJGR7mrOBaM3XFXV6IOLRAt
 zApf3+qBtDoA==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441694"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/30] piglit: upgrade to latest revision
Date: Tue, 19 Jan 2021 14:45:42 +0800
Message-Id: <20210119064552.115692-20-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...nder-ops.c-add-missing-format-string.patch | 24 -------------------
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +--
 2 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch b/meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch
deleted file mode 100644
index 261d98d8f6..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From e21e68f6aa0f5249fce613e8fd4ac0edbd5cb7b0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 22 Dec 2020 13:35:11 +0100
-Subject: [PATCH] render-ops.c: add missing format string
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/spec/ati_fragment_shader/render-ops.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/spec/ati_fragment_shader/render-ops.c b/tests/spec/ati_fragment_shader/render-ops.c
-index 131334ba2..19a353d67 100644
---- a/tests/spec/ati_fragment_shader/render-ops.c
-+++ b/tests/spec/ati_fragment_shader/render-ops.c
-@@ -393,7 +393,7 @@ piglit_display(void)
- 		bool ok = piglit_probe_rect_halves_equal_rgba(get_test_x(i), get_test_y(i),
- 							      w * 2, h);
- 		enum piglit_result sub_result = ok ? PIGLIT_PASS : PIGLIT_FAIL;
--		piglit_report_subtest_result(sub_result, test->name);
-+		piglit_report_subtest_result(sub_result, "%s", test->name);
- 		piglit_merge_result(&result, sub_result);
- 	}
- 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 442c1a3c62..484b59df00 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,11 +13,10 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            file://0001-serializer.py-make-.gz-files-reproducible.patch \
            file://0001-framework-profile.py-make-test-lists-reproducible.patch \
            file://0001-tests-shader.py-sort-the-file-list-before-working-on.patch \
-           file://0001-render-ops.c-add-missing-format-string.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "603deba4ab66e2a8948693a14d715e536caddcc5"
+SRCREV = "d3a6e1293c43a6d989d4bcd59132317195d420c6"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.29.2

