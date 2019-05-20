Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id F31727DF42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s17so14819579wru.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xmz5fYitOQ3PvE31EYQMdVi/gtSXRVicRku/+YT9zN0=;
	b=nU8cfz4ELJQX79UhsQET92duWGCfqGUyIIJH+6SSSaCk2GGMQZRrz1GayIZT3SbOUl
	J/OtNnOn/yz62Cmd00J37PWiEvTTuQkgwH7JWn314RPQNCIQWDYyT/AxhUQolXXFGTUV
	kttk+rxa9vqMripVRNMHZspE46034sOxvDEj5mo0rtbmxgx/bqo4gSmHYFIpGbmZTIDT
	UQk4EUWxGH5S8eamOFj2mIUe5U17jDKvEvRMd2F3WSNFNWk026qyK67/AWn0qh0c7K22
	QCnm6yFoPWcyhc+gg6HKBq+3N6advJ1n8UEF9DdpGxS4XIK0UrcRra2miPDKyLF6HPX0
	DiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xmz5fYitOQ3PvE31EYQMdVi/gtSXRVicRku/+YT9zN0=;
	b=q4KJGRwkWaeBjeghXKELZJrMoP0R3xgvWpBF3vahx35Bqc3GZu+PHp9ICusE6fLBUk
	y5776VPDaCbH4Q684i2DV1RjBIDD/ZiXcoKqWyGutaNO9fAshCWrP8HUtPb2lBsFzrBg
	jUwTa92NZB8j56kYTtoAxIohM37tehC5Fkau3u6yyIJZdtE3124Rbjxkr/u/WhAcGy9c
	HMsYS2EgkV8RksajaWXRef0AsyJ1pv4pDXs40a7dA3hna6D3QMBJwFNc8QVfjG5HDgYN
	piW8uz9VjqgxMcFMoYCcsjPhFeLhe0kBl0vEszzu6f1ad0p8fpQ2EpaUTStPAjA1hrpa
	Uu2w==
X-Gm-Message-State: APjAAAVgWcvIlTYa8a8qllFTKixm+drda/i6zTfQvyEhwPwPf230wg3U
	QbaN1UF52hHhpiasoXah3Zld9dFP
X-Google-Smtp-Source: APXvYqxj4MA/lCqfufqBnUYFGJCneKwfxCVeW2ZXBK8QZUXIWozasK0rVxWSrurn7KsLKKpv43pWvg==
X-Received: by 2002:a5d:4cc4:: with SMTP id c4mr33940043wrt.164.1558361499564; 
	Mon, 20 May 2019 07:11:39 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:50 +0200
Message-Id: <20190520141125.10805-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/42] piglit: upgrade to latest revision
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
X-List-Received-Date: Mon, 20 May 2019 14:11:39 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...UPWARD-only-if-its-defined-in-fenv.h.patch | 75 -------------------
 .../piglit/piglit/format-fix.patch            | 69 -----------------
 meta/recipes-graphics/piglit/piglit_git.bb    |  4 +-
 3 files changed, 1 insertion(+), 147 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/format-fix.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
deleted file mode 100644
index 57eda2e207b..00000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Upstream-Status: Submitted [mailing list]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 0e0a2a69261031d55d52b6045990e8982ea12912 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Jul 2016 07:52:19 +0000
-Subject: [PATCH] tests: only run rounding tests if FE_UPWARD is present
-
-On ARM, musl does not define FE_* when the architecture does not have VFP (which
-is the right interpretation).
-
-As these tests depend on calling fesetround(), skip the test if FE_UPWARD isn't
-available.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- tests/general/roundmode-getintegerv.c | 12 ++++++++----
- tests/general/roundmode-pixelstore.c  | 12 ++++++++----
- 2 files changed, 16 insertions(+), 8 deletions(-)
-
-diff --git a/tests/general/roundmode-getintegerv.c b/tests/general/roundmode-getintegerv.c
-index 28ecfaf55..aa99044a1 100644
---- a/tests/general/roundmode-getintegerv.c
-+++ b/tests/general/roundmode-getintegerv.c
-@@ -79,13 +79,17 @@ test(float val, int expect)
- void
- piglit_init(int argc, char **argv)
- {
--	int ret;
- 	bool pass = true;
--	ret = fesetround(FE_UPWARD);
--	if (ret != 0) {
--		printf("Couldn't set rounding mode\n");
-+
-+#ifdef FE_UPWARD
-+	if (fesetround(FE_UPWARD) != 0) {
-+		printf("Setting rounding mode failed\n");
- 		piglit_report_result(PIGLIT_SKIP);
- 	}
-+#else
-+	printf("Cannot set rounding mode\n");
-+	piglit_report_result(PIGLIT_SKIP);
-+#endif
- 
- 	pass = test(2.2, 2) && pass;
- 	pass = test(2.8, 3) && pass;
-diff --git a/tests/general/roundmode-pixelstore.c b/tests/general/roundmode-pixelstore.c
-index 8a029b257..57ec11c09 100644
---- a/tests/general/roundmode-pixelstore.c
-+++ b/tests/general/roundmode-pixelstore.c
-@@ -79,13 +79,17 @@ test(float val, int expect)
- void
- piglit_init(int argc, char **argv)
- {
--	int ret;
- 	bool pass = true;
--	ret = fesetround(FE_UPWARD);
--	if (ret != 0) {
--		printf("Couldn't set rounding mode\n");
-+
-+#ifdef FE_UPWARD
-+	if (fesetround(FE_UPWARD) != 0) {
-+		printf("Setting rounding mode failed\n");
- 		piglit_report_result(PIGLIT_SKIP);
- 	}
-+#else
-+	printf("Cannot set rounding mode\n");
-+	piglit_report_result(PIGLIT_SKIP);
-+#endif
- 
- 	pass = test(2.2, 2) && pass;
- 	pass = test(2.8, 3) && pass;
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/piglit/piglit/format-fix.patch b/meta/recipes-graphics/piglit/piglit/format-fix.patch
deleted file mode 100644
index 73d539fef27..00000000000
--- a/meta/recipes-graphics/piglit/piglit/format-fix.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Submitted [mailing list]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From f0c6981322807e179e39ce67aeebd42cf7a54d36 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 21 Nov 2018 12:44:36 +0000
-Subject: [PATCH] arb_texture_view: fix security format warnings
-
-If built with -Werror=format-security then Piglit fails to build:
-
-/tests/spec/arb_texture_view/rendering-layers-image.c:150:8:
-error: format not a string literal and no format arguments [-Werror=format-security]
-         (desc)); \
-         ^~~~~~
-
-In this case test->uniform_type is being turned into a string using snprintf()
-and then passed to piglit_report_subtest_result() which takes a format string,
-but GCC can't verify the format.
-
-As _subtest_report() takes a format string, we can just remove the snprintf()
-and let it construct the label.
-
-Also as X is used once and doesn't make the code clearer, just inline it.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- tests/spec/arb_texture_view/rendering-layers-image.c | 19 ++++++-------------
- 1 file changed, 6 insertions(+), 13 deletions(-)
-
-diff --git a/tests/spec/arb_texture_view/rendering-layers-image.c b/tests/spec/arb_texture_view/rendering-layers-image.c
-index 415b01657..86148075b 100644
---- a/tests/spec/arb_texture_view/rendering-layers-image.c
-+++ b/tests/spec/arb_texture_view/rendering-layers-image.c
-@@ -142,26 +142,19 @@ test_render_layers(const struct test_info *test)
- 	return pass;
- }
- 
--#define X(f, desc) \
--	do { \
--		const bool subtest_pass = (f); \
--		piglit_report_subtest_result(subtest_pass \
--						 ? PIGLIT_PASS : PIGLIT_FAIL, \
--						 (desc)); \
--		pass = pass && subtest_pass; \
--	} while (0)
--
- enum piglit_result
- piglit_display(void)
- {
- 	bool pass = true;
- 	for (int test_idx = 0; test_idx < ARRAY_SIZE(tests); test_idx++) {
- 		const struct test_info *test = &tests[test_idx];
--		char test_name[128];
--		snprintf(test_name, sizeof(test_name), "layers rendering of %s", test->uniform_type);
--		X(test_render_layers(test), test_name);
-+
-+		const bool subtest_pass = test_render_layers(test);
-+
-+		piglit_report_subtest_result(subtest_pass ? PIGLIT_PASS : PIGLIT_FAIL,
-+					     "layers rendering of %s", test->uniform_type);
-+		pass = pass && subtest_pass;
- 	}
--#undef X
- 	pass = piglit_check_gl_error(GL_NO_ERROR) && pass;
- 	return pass ? PIGLIT_PASS : PIGLIT_FAIL;
- }
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index b6542a191cf..9ce6c0998aa 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -4,14 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
-           file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
-           file://format-fix.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
 # From 2018-10-26
-SRCREV = "b9066c7717af1d169a616c9e61706b99ff8515b5"
+SRCREV = "ac955893c92591c4542439665cae2c3fb79de9dd"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.17.1


