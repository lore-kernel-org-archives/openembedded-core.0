Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id BBA1B762AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 12:01:30 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so52564938wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 04:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JcnTd68XXF38BffxOs0lgJseL0iHa0tRsjmmxn0BCLI=;
	b=L6HgEwkNn6AvPHIGB/y5F8pO7PmKfVQBi2MVmmXE6dHiYg8aQXrfw/0OJeCuwy92vv
	K+G2s6uIG4N8aJLU+/gYcsCPyqJLQky+IlIMvUFqKNG/QuBZfRRJDdj9xPQ2p3cHInUb
	87G1ZLc0FZrlUo8R+ZeLu5QAcO4cIZzh/T7178KmwomGpEJihuMurtNJu9u+ph+eHXXu
	mbYb3cJe0vmRYubfQaMXCnnk2+9VmVi0hWFE+uHfczMRzAfsx9AftgnLqmOUYNLj5IeS
	xP/OwBCVaqx3Qqnh3J3Kx4geCfnVdOoJNmscrg6f8F4XrsSh9fSf+GXXdh4lf9a8QPQG
	BiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JcnTd68XXF38BffxOs0lgJseL0iHa0tRsjmmxn0BCLI=;
	b=RY8e4VjKBAwFcszC9cep7BGqBSWaqikNHYiytObpD5fPfdCk88vHNg4fltKR2KtpPF
	vNQ5UcXZbXkeLLovQMpYSx+7TYAyU8leaBIsQwpDg0g/qucLZIIcn8zipV1Z5hnn9PF1
	++k++uxfmhKiCzkdJf+4Uz4CqGzAtBGvdEEAjnyLpSO3+GN5bwCMG8iLSlJpZa2+Lir/
	E/36q5JEj4cxk9pbZi4ZZUGvu0IoMEFJs1IxvdXF6WEUJUXczUkf7iqwVL2dk5e1fbNJ
	0IyXAL5T8qcfGX1J637PU+Sjv5wTxR/LlNE3RwbZyfBzpb7qaSD88yNathgj1lqXiDi3
	JBaw==
X-Gm-Message-State: ALoCoQksWttXyRSqJrlh9HMluzu/DwtEtSf9bS+aZfcHAouk3J+JGWjUzoS1JPYJAm7ihG34sRJC
X-Received: by 10.194.186.196 with SMTP id fm4mr11470332wjc.152.1447243289881; 
	Wed, 11 Nov 2015 04:01:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v192sm8131895wmv.5.2015.11.11.04.01.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 04:01:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 11:53:10 +0000
Message-Id: <1447242791-5023-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] weston: delete unused patch
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
X-List-Received-Date: Wed, 11 Nov 2015 12:01:34 -0000

This patch was dropped from the recipe in the 1.8.0 upgrade.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../weston/disable-wayland-scanner-pkg-check.patch      | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch

diff --git a/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch b/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
deleted file mode 100644
index 68ba38b..0000000
--- a/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -501,12 +501,6 @@ if test "x$have_lcms" = xyes; then
- fi
- AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" = xyes])
- 
--AC_PATH_PROG([wayland_scanner], [wayland-scanner])
--if test x$wayland_scanner = x; then
--	PKG_CHECK_MODULES(WAYLAND_SCANNER, [wayland-scanner])
--	wayland_scanner=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
--fi
--
- AC_CONFIG_FILES([Makefile src/version.h src/weston.pc])
- 
- AM_CONDITIONAL([HAVE_GIT_REPO], [test -f $srcdir/.git/logs/HEAD])
-- 
2.1.4


