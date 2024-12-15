Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09439E77199
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.33340.1734254975608843039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=abHbbzq3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CBgIJSuM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193c9a6f094-ea9eaa72-f546-48b6-b226-41ea833d750c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1G+qNi7EaMa07dpbfP61iRfiUznwvI48dGkO2lYDSng=;
	b=abHbbzq3OsTEIfh30PXbcGGNQAoW5U8343dV4A9MJPkmanSQ5+wnNTqWNzIrH7m9
	bUSnr6WSOlqcoo8ATIGx1/bn+nJWRwr4b+a53wpnPAIIQXAWAQO2NwguPmEMlnfSQ2H
	Eu6PMNF5x77wQeJ+0cTZgN8lfsR6nBEv1sfF5GiA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1G+qNi7EaMa07dpbfP61iRfiUznwvI48dGkO2lYDSng=;
	b=CBgIJSuMSNsgn1D1khpFOJHVB57vYchrAt+8RfgVL0W1wd4o7K4wBo33Xy6eyIvh
	vSGsZA+ux0tcKSsBgJZS/vFiYQvAGyFGy1YLbqlt8Zl6rBwXvOddK4q7qCXmYkYKaHV
	UjwCuRMuSYVebt4Y3ihKmkMNIU5rd47Mc4Dr7Kj4=
Content-Type: multipart/mixed; boundary="===============8229661410306200170=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.8.2 SUCCEEDED
Message-ID: <01010193c9a6f094-ea9eaa72-f546-48b6-b226-41ea833d750c-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208710

--===============8229661410306200170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nfs-utils* to *2.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nfs-utils-upgrade-2.8.1-2.8.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 931e38190035c51d5c3da0928fba14f88d961b48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 06:59:28 +0000
Subject: [PATCH] nfs-utils: upgrade 2.8.1 -> 2.8.2

---
 ...-fix-undefined-function-for-libnsm.a.patch | 258 ++----------------
 ...t-Makefile.am-Do-not-use-build-flags.patch |   7 +-
 .../bugfix-adjust-statd-service-name.patch    |   6 +-
 .../nfs-utils/nfs-utils/clang-warnings.patch  |   3 +-
 .../nfs-utils-debianize-start-statd.patch     |  12 +-
 ...{nfs-utils_2.8.1.bb => nfs-utils_2.8.2.bb} |   2 +-
 6 files changed, 32 insertions(+), 256 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.1.bb => nfs-utils_2.8.2.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
index 7603eb680d..b7e4666600 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
@@ -1,4 +1,4 @@
-From 690a90a5b7786e40b5447ad7c5f19a7657d27405 Mon Sep 17 00:00:00 2001
+From 04ce5a767db00f790328c4357d8b0869fbc2b684 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 14 Dec 2018 17:44:32 +0800
 Subject: [PATCH] Makefile.am: fix undefined function for libnsm.a
@@ -27,11 +27,11 @@ Rebase it.
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- support/misc/Makefile.am |   2 +-
- support/misc/file.c      | 115 ---------------------------------------------------------------------------------------------------------------
- support/misc/misc.c      | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- support/nsm/Makefile.am  |   2 +-
- 4 files changed, 113 insertions(+), 117 deletions(-)
+ support/misc/Makefile.am        | 2 +-
+ support/misc/{file.c => misc.c} | 4 ----
+ support/nsm/Makefile.am         | 2 +-
+ 3 files changed, 2 insertions(+), 6 deletions(-)
+ rename support/misc/{file.c => misc.c} (98%)
 
 diff --git a/support/misc/Makefile.am b/support/misc/Makefile.am
 index f9993e3..8b0e9db 100644
@@ -46,244 +46,24 @@ index f9993e3..8b0e9db 100644
  		    nfsd_path.c workqueue.c xstat.c
  
  MAINTAINERCLEANFILES = Makefile.in
-diff --git a/support/misc/file.c b/support/misc/file.c
-deleted file mode 100644
-index 06f6bb2..0000000
+diff --git a/support/misc/file.c b/support/misc/misc.c
+similarity index 98%
+rename from support/misc/file.c
+rename to support/misc/misc.c
+index 06f6bb2..e7c3819 100644
 --- a/support/misc/file.c
-+++ /dev/null
-@@ -1,115 +0,0 @@
--/*
-- * Copyright 2009 Oracle.  All rights reserved.
-- * Copyright 2017 Red Hat, Inc.  All rights reserved.
-- *
-- * This file is part of nfs-utils.
-- *
-- * nfs-utils is free software; you can redistribute it and/or modify
-- * it under the terms of the GNU General Public License as published by
-- * the Free Software Foundation; either version 2 of the License, or
-- * (at your option) any later version.
-- *
-- * nfs-utils is distributed in the hope that it will be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- * GNU General Public License for more details.
-- *
-- * You should have received a copy of the GNU General Public License
-- * along with nfs-utils.  If not, see <http://www.gnu.org/licenses/>.
-- */
--
++++ b/support/misc/misc.c
+@@ -18,10 +18,6 @@
+  * along with nfs-utils.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
 -#ifdef HAVE_CONFIG_H
 -#include <config.h>
 -#endif
 -
--#include <sys/stat.h>
--
--#include <string.h>
--#include <libgen.h>
--#include <stdio.h>
--#include <errno.h>
--#include <dirent.h>
--#include <stdlib.h>
--#include <stdbool.h>
--#include <limits.h>
--
--#include "xlog.h"
--#include "misc.h"
--
--/*
-- * Returns a dynamically allocated, '\0'-terminated buffer
-- * containing an appropriate pathname, or NULL if an error
-- * occurs.  Caller must free the returned result with free(3).
-- */
--__attribute__((__malloc__))
--char *
--generic_make_pathname(const char *base, const char *leaf)
--{
--	size_t size;
--	char *path;
--	int len;
--
--	size = strlen(base) + strlen(leaf) + 2;
--	if (size > PATH_MAX)
--		return NULL;
--
--	path = malloc(size);
--	if (path == NULL)
--		return NULL;
--
--	len = snprintf(path, size, "%s/%s", base, leaf);
--	if ((len < 0) || ((size_t)len >= size)) {
--		free(path);
--		return NULL;
--	}
--
--	return path;
--}
--
--
--/**
-- * generic_setup_basedir - set up basedir
-- * @progname: C string containing name of program, for error messages
-- * @parentdir: C string containing pathname to on-disk state, or NULL
-- * @base: character buffer to contain the basedir that is set up
-- * @baselen: size of @base in bytes
-- *
-- * This runs before logging is set up, so error messages are directed
-- * to stderr.
-- *
-- * Returns true and sets up our basedir, if @parentdir was valid
-- * and usable; otherwise false is returned.
-- */
--_Bool
--generic_setup_basedir(const char *progname, const char *parentdir, char *base,
--		      const size_t baselen)
--{
--	static char buf[PATH_MAX];
--	struct stat st;
--	char *path;
--
--	/* First: test length of name and whether it exists */
--	if ((strlen(parentdir) >= baselen) || (strlen(parentdir) >= PATH_MAX)) {
--		(void)fprintf(stderr, "%s: Directory name too long: %s",
--				progname, parentdir);
--		return false;
--	}
--	if (lstat(parentdir, &st) == -1) {
--		(void)fprintf(stderr, "%s: Failed to stat %s: %s",
--				progname, parentdir, strerror(errno));
--		return false;
--	}
--
--	/* Ensure we have a clean directory pathname */
--	strncpy(buf, parentdir, sizeof(buf)-1);
--	path = dirname(buf);
--	if (*path == '.') {
--		(void)fprintf(stderr, "%s: Unusable directory %s",
--				progname, parentdir);
--		return false;
--	}
--
--	xlog(D_CALL, "Using %s as the state directory", parentdir);
--	strcpy(base, parentdir);
--	return true;
--}
-diff --git a/support/misc/misc.c b/support/misc/misc.c
-new file mode 100644
-index 0000000..e7c3819
---- /dev/null
-+++ b/support/misc/misc.c
-@@ -0,0 +1,111 @@
-+/*
-+ * Copyright 2009 Oracle.  All rights reserved.
-+ * Copyright 2017 Red Hat, Inc.  All rights reserved.
-+ *
-+ * This file is part of nfs-utils.
-+ *
-+ * nfs-utils is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * nfs-utils is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with nfs-utils.  If not, see <http://www.gnu.org/licenses/>.
-+ */
-+
-+#include <sys/stat.h>
-+
-+#include <string.h>
-+#include <libgen.h>
-+#include <stdio.h>
-+#include <errno.h>
-+#include <dirent.h>
-+#include <stdlib.h>
-+#include <stdbool.h>
-+#include <limits.h>
-+
-+#include "xlog.h"
-+#include "misc.h"
-+
-+/*
-+ * Returns a dynamically allocated, '\0'-terminated buffer
-+ * containing an appropriate pathname, or NULL if an error
-+ * occurs.  Caller must free the returned result with free(3).
-+ */
-+__attribute__((__malloc__))
-+char *
-+generic_make_pathname(const char *base, const char *leaf)
-+{
-+	size_t size;
-+	char *path;
-+	int len;
-+
-+	size = strlen(base) + strlen(leaf) + 2;
-+	if (size > PATH_MAX)
-+		return NULL;
-+
-+	path = malloc(size);
-+	if (path == NULL)
-+		return NULL;
-+
-+	len = snprintf(path, size, "%s/%s", base, leaf);
-+	if ((len < 0) || ((size_t)len >= size)) {
-+		free(path);
-+		return NULL;
-+	}
-+
-+	return path;
-+}
-+
-+
-+/**
-+ * generic_setup_basedir - set up basedir
-+ * @progname: C string containing name of program, for error messages
-+ * @parentdir: C string containing pathname to on-disk state, or NULL
-+ * @base: character buffer to contain the basedir that is set up
-+ * @baselen: size of @base in bytes
-+ *
-+ * This runs before logging is set up, so error messages are directed
-+ * to stderr.
-+ *
-+ * Returns true and sets up our basedir, if @parentdir was valid
-+ * and usable; otherwise false is returned.
-+ */
-+_Bool
-+generic_setup_basedir(const char *progname, const char *parentdir, char *base,
-+		      const size_t baselen)
-+{
-+	static char buf[PATH_MAX];
-+	struct stat st;
-+	char *path;
-+
-+	/* First: test length of name and whether it exists */
-+	if ((strlen(parentdir) >= baselen) || (strlen(parentdir) >= PATH_MAX)) {
-+		(void)fprintf(stderr, "%s: Directory name too long: %s",
-+				progname, parentdir);
-+		return false;
-+	}
-+	if (lstat(parentdir, &st) == -1) {
-+		(void)fprintf(stderr, "%s: Failed to stat %s: %s",
-+				progname, parentdir, strerror(errno));
-+		return false;
-+	}
-+
-+	/* Ensure we have a clean directory pathname */
-+	strncpy(buf, parentdir, sizeof(buf)-1);
-+	path = dirname(buf);
-+	if (*path == '.') {
-+		(void)fprintf(stderr, "%s: Unusable directory %s",
-+				progname, parentdir);
-+		return false;
-+	}
-+
-+	xlog(D_CALL, "Using %s as the state directory", parentdir);
-+	strcpy(base, parentdir);
-+	return true;
-+}
+ #include <sys/stat.h>
+ 
+ #include <string.h>
 diff --git a/support/nsm/Makefile.am b/support/nsm/Makefile.am
 index 8f5874e..68f1a46 100644
 --- a/support/nsm/Makefile.am
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
index 351407ddcd..a4bc1109ca 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
@@ -1,4 +1,4 @@
-From 9efa7a0d37665d9bb0f46d2407883a5ab42c2b84 Mon Sep 17 00:00:00 2001
+From 065c06ee64de56b54eff85628aeaf1946a2480b1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 24 Jul 2023 20:39:16 -0700
 Subject: [PATCH] locktest: Makefile.am: Do not use build flags
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
-index e8914655..2fd36971 100644
+index e891465..2fd3697 100644
 --- a/tools/locktest/Makefile.am
 +++ b/tools/locktest/Makefile.am
 @@ -2,8 +2,5 @@
@@ -31,6 +31,3 @@ index e8914655..2fd36971 100644
 -testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
  
  MAINTAINERCLEANFILES = Makefile.in
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
index f13d7b380c..a6e24c8db6 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
@@ -1,7 +1,7 @@
-From 398fed3bb0350cb1229e54e7020ae0e044c206d1 Mon Sep 17 00:00:00 2001
+From 08fbcc191800e2844e39a0bb19c952db917f1e78 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
 Date: Wed, 17 Feb 2016 08:33:45 +0100
-Subject: bugfix: adjust statd service name
+Subject: [PATCH] bugfix: adjust statd service name
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -21,7 +21,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/utils/statd/start-statd b/utils/statd/start-statd
-index af5c950..df9b9be 100755
+index 4bcbb60..3d3a8c8 100755
 --- a/utils/statd/start-statd
 +++ b/utils/statd/start-statd
 @@ -28,10 +28,10 @@ fi
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
index fde99b599e..80992348dd 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
@@ -1,4 +1,4 @@
-From 1ab0c326405c6daa06f1a7eb4b0b60bf4e0584c2 Mon Sep 17 00:00:00 2001
+From 075ad791be83b7162624bd0fadf37aca48a8899d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 31 Dec 2019 08:15:34 -0800
 Subject: [PATCH] Detect warning options during configure
@@ -14,7 +14,6 @@ Wdiscarded-qualifiers is gcc specific and this is no longer needed
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  support/nfs/xcommon.c | 3 +++
  1 file changed, 3 insertions(+)
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
index ede0dcefc4..547796b39d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
@@ -1,4 +1,7 @@
-[PATCH] nfs-utils: debianize start-statd
+From 3c5efd37c8bc5d1330fc8fdd1847e7195e65051c Mon Sep 17 00:00:00 2001
+From: Henrik Riomar <henrik.riomar@ericsson.com>
+Date: Mon, 29 Jun 2015 14:22:35 +0800
+Subject: [PATCH] [PATCH] nfs-utils: debianize start-statd
 
 Upstream-Status: Pending
 
@@ -13,7 +16,7 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/utils/statd/start-statd b/utils/statd/start-statd
-index 2fd6039..f591b34 100755
+index 67a2f4a..4bcbb60 100755
 --- a/utils/statd/start-statd
 +++ b/utils/statd/start-statd
 @@ -17,6 +17,14 @@ then
@@ -31,12 +34,9 @@ index 2fd6039..f591b34 100755
  # First try systemd if it's installed.
  if [ -d /run/systemd/system ]; then
      # Quit only if the call worked.
-@@ -25,4 +33,4 @@ fi
+@@ -30,4 +38,4 @@ fi
  
  cd /
  # Fall back to launching it ourselves.
 -exec rpc.statd --no-notify
 +exec rpc.statd --no-notify $STATDOPTS
--- 
-2.6.6
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index 488a1a7e70..543c68f7f5 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -33,7 +33,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            "
 
-SRC_URI[sha256sum] = "a0be95b08396908048583fcf6b34a7c1ab49d53e8a12eb28673ccfd2eff0c505"
+SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.44.1


--===============8229661410306200170==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-2.8.1-2.8.2.patch"

RnJvbSA5MzFlMzgxOTAwMzVjNTFkNWMzZGEwOTI4ZmJhMTRmODhkOTYxYjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDY6NTk6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZnMtdXRpbHM6IHVwZ3JhZGUgMi44LjEgLT4gMi44LjIKCi0tLQogLi4uLWZpeC11bmRlZmluZWQt
ZnVuY3Rpb24tZm9yLWxpYm5zbS5hLnBhdGNoIHwgMjU4ICsrLS0tLS0tLS0tLS0tLS0tLQogLi4u
dC1NYWtlZmlsZS5hbS1Eby1ub3QtdXNlLWJ1aWxkLWZsYWdzLnBhdGNoIHwgICA3ICstCiAuLi4v
YnVnZml4LWFkanVzdC1zdGF0ZC1zZXJ2aWNlLW5hbWUucGF0Y2ggICAgfCAgIDYgKy0KIC4uLi9u
ZnMtdXRpbHMvbmZzLXV0aWxzL2NsYW5nLXdhcm5pbmdzLnBhdGNoICB8ICAgMyArLQogLi4uL25m
cy11dGlscy1kZWJpYW5pemUtc3RhcnQtc3RhdGQucGF0Y2ggICAgIHwgIDEyICstCiAuLi57bmZz
LXV0aWxzXzIuOC4xLmJiID0+IG5mcy11dGlsc18yLjguMi5iYn0gfCAgIDIgKy0KIDYgZmlsZXMg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMjU2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL3tuZnMtdXRpbHNfMi44LjEuYmIgPT4gbmZz
LXV0aWxzXzIuOC4yLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDAxLU1ha2VmaWxlLmFtLWZpeC11bmRlZmluZWQt
ZnVuY3Rpb24tZm9yLWxpYm5zbS5hLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9u
ZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEtTWFrZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1mdW5jdGlv
bi1mb3ItbGlibnNtLmEucGF0Y2gKaW5kZXggNzYwM2ViNjgwZC4uYjdlNDY2NjYwMCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEt
TWFrZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1mdW5jdGlvbi1mb3ItbGlibnNtLmEucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEtTWFr
ZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1mdW5jdGlvbi1mb3ItbGlibnNtLmEucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDY5MGE5MGE1Yjc3ODZlNDBiNTQ0N2FkN2M1ZjE5YTc2NTdkMjc0MDUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA0Y2U1YTc2N2RiMDBmNzkwMzI4YzQzNTdk
OGIwODY5ZmJjMmI2ODQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUg
PE1pbmdsaS5ZdUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAxNCBEZWMgMjAxOCAxNzo0NDoz
MiArMDgwMAogU3ViamVjdDogW1BBVENIXSBNYWtlZmlsZS5hbTogZml4IHVuZGVmaW5lZCBmdW5j
dGlvbiBmb3IgbGlibnNtLmEKQEAgLTI3LDExICsyNywxMSBAQCBSZWJhc2UgaXQuCiAKIFNpZ25l
ZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPgogLS0tCi0g
c3VwcG9ydC9taXNjL01ha2VmaWxlLmFtIHwgICAyICstCi0gc3VwcG9ydC9taXNjL2ZpbGUuYyAg
ICAgIHwgMTE1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQotIHN1cHBvcnQvbWlzYy9taXNjLmMgICAgICB8IDExMSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKLSBzdXBwb3J0L25zbS9NYWtl
ZmlsZS5hbSAgfCAgIDIgKy0KLSA0IGZpbGVzIGNoYW5nZWQsIDExMyBpbnNlcnRpb25zKCspLCAx
MTcgZGVsZXRpb25zKC0pCisgc3VwcG9ydC9taXNjL01ha2VmaWxlLmFtICAgICAgICB8IDIgKy0K
KyBzdXBwb3J0L21pc2Mve2ZpbGUuYyA9PiBtaXNjLmN9IHwgNCAtLS0tCisgc3VwcG9ydC9uc20v
TWFrZWZpbGUuYW0gICAgICAgICB8IDIgKy0KKyAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKKyByZW5hbWUgc3VwcG9ydC9taXNjL3tmaWxlLmMgPT4gbWlz
Yy5jfSAoOTglKQogCiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9taXNjL01ha2VmaWxlLmFtIGIvc3Vw
cG9ydC9taXNjL01ha2VmaWxlLmFtCiBpbmRleCBmOTk5M2UzLi44YjBlOWRiIDEwMDY0NApAQCAt
NDYsMjQ0ICs0NiwyNCBAQCBpbmRleCBmOTk5M2UzLi44YjBlOWRiIDEwMDY0NAogIAkJICAgIG5m
c2RfcGF0aC5jIHdvcmtxdWV1ZS5jIHhzdGF0LmMKICAKICBNQUlOVEFJTkVSQ0xFQU5GSUxFUyA9
IE1ha2VmaWxlLmluCi1kaWZmIC0tZ2l0IGEvc3VwcG9ydC9taXNjL2ZpbGUuYyBiL3N1cHBvcnQv
bWlzYy9maWxlLmMKLWRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAotaW5kZXggMDZmNmJiMi4uMDAw
MDAwMAorZGlmZiAtLWdpdCBhL3N1cHBvcnQvbWlzYy9maWxlLmMgYi9zdXBwb3J0L21pc2MvbWlz
Yy5jCitzaW1pbGFyaXR5IGluZGV4IDk4JQorcmVuYW1lIGZyb20gc3VwcG9ydC9taXNjL2ZpbGUu
YworcmVuYW1lIHRvIHN1cHBvcnQvbWlzYy9taXNjLmMKK2luZGV4IDA2ZjZiYjIuLmU3YzM4MTkg
MTAwNjQ0CiAtLS0gYS9zdXBwb3J0L21pc2MvZmlsZS5jCi0rKysgL2Rldi9udWxsCi1AQCAtMSwx
MTUgKzAsMCBAQAotLS8qCi0tICogQ29weXJpZ2h0IDIwMDkgT3JhY2xlLiAgQWxsIHJpZ2h0cyBy
ZXNlcnZlZC4KLS0gKiBDb3B5cmlnaHQgMjAxNyBSZWQgSGF0LCBJbmMuICBBbGwgcmlnaHRzIHJl
c2VydmVkLgotLSAqCi0tICogVGhpcyBmaWxlIGlzIHBhcnQgb2YgbmZzLXV0aWxzLgotLSAqCi0t
ICogbmZzLXV0aWxzIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vciBtb2RpZnkKLS0gKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQotLSAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCi0tICogKGF0IHlvdXIg
b3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KLS0gKgotLSAqIG5mcy11dGlscyBpcyBkaXN0cmli
dXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAotLSAqIGJ1dCBXSVRIT1VU
IEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCi0tICog
TUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2Vl
IHRoZQotLSAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCi0t
ICoKLS0gKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZQotLSAqIGFsb25nIHdpdGggbmZzLXV0aWxzLiAgSWYgbm90LCBzZWUg
PGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgotLSAqLwotLQorKysrIGIvc3VwcG9ydC9t
aXNjL21pc2MuYworQEAgLTE4LDEwICsxOCw2IEBACisgICogYWxvbmcgd2l0aCBuZnMtdXRpbHMu
ICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgICovCisgCiAt
I2lmZGVmIEhBVkVfQ09ORklHX0gKIC0jaW5jbHVkZSA8Y29uZmlnLmg+CiAtI2VuZGlmCiAtCi0t
I2luY2x1ZGUgPHN5cy9zdGF0Lmg+Ci0tCi0tI2luY2x1ZGUgPHN0cmluZy5oPgotLSNpbmNsdWRl
IDxsaWJnZW4uaD4KLS0jaW5jbHVkZSA8c3RkaW8uaD4KLS0jaW5jbHVkZSA8ZXJybm8uaD4KLS0j
aW5jbHVkZSA8ZGlyZW50Lmg+Ci0tI2luY2x1ZGUgPHN0ZGxpYi5oPgotLSNpbmNsdWRlIDxzdGRi
b29sLmg+Ci0tI2luY2x1ZGUgPGxpbWl0cy5oPgotLQotLSNpbmNsdWRlICJ4bG9nLmgiCi0tI2lu
Y2x1ZGUgIm1pc2MuaCIKLS0KLS0vKgotLSAqIFJldHVybnMgYSBkeW5hbWljYWxseSBhbGxvY2F0
ZWQsICdcMCctdGVybWluYXRlZCBidWZmZXIKLS0gKiBjb250YWluaW5nIGFuIGFwcHJvcHJpYXRl
IHBhdGhuYW1lLCBvciBOVUxMIGlmIGFuIGVycm9yCi0tICogb2NjdXJzLiAgQ2FsbGVyIG11c3Qg
ZnJlZSB0aGUgcmV0dXJuZWQgcmVzdWx0IHdpdGggZnJlZSgzKS4KLS0gKi8KLS1fX2F0dHJpYnV0
ZV9fKChfX21hbGxvY19fKSkKLS1jaGFyICoKLS1nZW5lcmljX21ha2VfcGF0aG5hbWUoY29uc3Qg
Y2hhciAqYmFzZSwgY29uc3QgY2hhciAqbGVhZikKLS17Ci0tCXNpemVfdCBzaXplOwotLQljaGFy
ICpwYXRoOwotLQlpbnQgbGVuOwotLQotLQlzaXplID0gc3RybGVuKGJhc2UpICsgc3RybGVuKGxl
YWYpICsgMjsKLS0JaWYgKHNpemUgPiBQQVRIX01BWCkKLS0JCXJldHVybiBOVUxMOwotLQotLQlw
YXRoID0gbWFsbG9jKHNpemUpOwotLQlpZiAocGF0aCA9PSBOVUxMKQotLQkJcmV0dXJuIE5VTEw7
Ci0tCi0tCWxlbiA9IHNucHJpbnRmKHBhdGgsIHNpemUsICIlcy8lcyIsIGJhc2UsIGxlYWYpOwot
LQlpZiAoKGxlbiA8IDApIHx8ICgoc2l6ZV90KWxlbiA+PSBzaXplKSkgewotLQkJZnJlZShwYXRo
KTsKLS0JCXJldHVybiBOVUxMOwotLQl9Ci0tCi0tCXJldHVybiBwYXRoOwotLX0KLS0KLS0KLS0v
KioKLS0gKiBnZW5lcmljX3NldHVwX2Jhc2VkaXIgLSBzZXQgdXAgYmFzZWRpcgotLSAqIEBwcm9n
bmFtZTogQyBzdHJpbmcgY29udGFpbmluZyBuYW1lIG9mIHByb2dyYW0sIGZvciBlcnJvciBtZXNz
YWdlcwotLSAqIEBwYXJlbnRkaXI6IEMgc3RyaW5nIGNvbnRhaW5pbmcgcGF0aG5hbWUgdG8gb24t
ZGlzayBzdGF0ZSwgb3IgTlVMTAotLSAqIEBiYXNlOiBjaGFyYWN0ZXIgYnVmZmVyIHRvIGNvbnRh
aW4gdGhlIGJhc2VkaXIgdGhhdCBpcyBzZXQgdXAKLS0gKiBAYmFzZWxlbjogc2l6ZSBvZiBAYmFz
ZSBpbiBieXRlcwotLSAqCi0tICogVGhpcyBydW5zIGJlZm9yZSBsb2dnaW5nIGlzIHNldCB1cCwg
c28gZXJyb3IgbWVzc2FnZXMgYXJlIGRpcmVjdGVkCi0tICogdG8gc3RkZXJyLgotLSAqCi0tICog
UmV0dXJucyB0cnVlIGFuZCBzZXRzIHVwIG91ciBiYXNlZGlyLCBpZiBAcGFyZW50ZGlyIHdhcyB2
YWxpZAotLSAqIGFuZCB1c2FibGU7IG90aGVyd2lzZSBmYWxzZSBpcyByZXR1cm5lZC4KLS0gKi8K
LS1fQm9vbAotLWdlbmVyaWNfc2V0dXBfYmFzZWRpcihjb25zdCBjaGFyICpwcm9nbmFtZSwgY29u
c3QgY2hhciAqcGFyZW50ZGlyLCBjaGFyICpiYXNlLAotLQkJICAgICAgY29uc3Qgc2l6ZV90IGJh
c2VsZW4pCi0tewotLQlzdGF0aWMgY2hhciBidWZbUEFUSF9NQVhdOwotLQlzdHJ1Y3Qgc3RhdCBz
dDsKLS0JY2hhciAqcGF0aDsKLS0KLS0JLyogRmlyc3Q6IHRlc3QgbGVuZ3RoIG9mIG5hbWUgYW5k
IHdoZXRoZXIgaXQgZXhpc3RzICovCi0tCWlmICgoc3RybGVuKHBhcmVudGRpcikgPj0gYmFzZWxl
bikgfHwgKHN0cmxlbihwYXJlbnRkaXIpID49IFBBVEhfTUFYKSkgewotLQkJKHZvaWQpZnByaW50
ZihzdGRlcnIsICIlczogRGlyZWN0b3J5IG5hbWUgdG9vIGxvbmc6ICVzIiwKLS0JCQkJcHJvZ25h
bWUsIHBhcmVudGRpcik7Ci0tCQlyZXR1cm4gZmFsc2U7Ci0tCX0KLS0JaWYgKGxzdGF0KHBhcmVu
dGRpciwgJnN0KSA9PSAtMSkgewotLQkJKHZvaWQpZnByaW50ZihzdGRlcnIsICIlczogRmFpbGVk
IHRvIHN0YXQgJXM6ICVzIiwKLS0JCQkJcHJvZ25hbWUsIHBhcmVudGRpciwgc3RyZXJyb3IoZXJy
bm8pKTsKLS0JCXJldHVybiBmYWxzZTsKLS0JfQotLQotLQkvKiBFbnN1cmUgd2UgaGF2ZSBhIGNs
ZWFuIGRpcmVjdG9yeSBwYXRobmFtZSAqLwotLQlzdHJuY3B5KGJ1ZiwgcGFyZW50ZGlyLCBzaXpl
b2YoYnVmKS0xKTsKLS0JcGF0aCA9IGRpcm5hbWUoYnVmKTsKLS0JaWYgKCpwYXRoID09ICcuJykg
ewotLQkJKHZvaWQpZnByaW50ZihzdGRlcnIsICIlczogVW51c2FibGUgZGlyZWN0b3J5ICVzIiwK
LS0JCQkJcHJvZ25hbWUsIHBhcmVudGRpcik7Ci0tCQlyZXR1cm4gZmFsc2U7Ci0tCX0KLS0KLS0J
eGxvZyhEX0NBTEwsICJVc2luZyAlcyBhcyB0aGUgc3RhdGUgZGlyZWN0b3J5IiwgcGFyZW50ZGly
KTsKLS0Jc3RyY3B5KGJhc2UsIHBhcmVudGRpcik7Ci0tCXJldHVybiB0cnVlOwotLX0KLWRpZmYg
LS1naXQgYS9zdXBwb3J0L21pc2MvbWlzYy5jIGIvc3VwcG9ydC9taXNjL21pc2MuYwotbmV3IGZp
bGUgbW9kZSAxMDA2NDQKLWluZGV4IDAwMDAwMDAuLmU3YzM4MTkKLS0tLSAvZGV2L251bGwKLSsr
KyBiL3N1cHBvcnQvbWlzYy9taXNjLmMKLUBAIC0wLDAgKzEsMTExIEBACi0rLyoKLSsgKiBDb3B5
cmlnaHQgMjAwOSBPcmFjbGUuICBBbGwgcmlnaHRzIHJlc2VydmVkLgotKyAqIENvcHlyaWdodCAy
MDE3IFJlZCBIYXQsIEluYy4gIEFsbCByaWdodHMgcmVzZXJ2ZWQuCi0rICoKLSsgKiBUaGlzIGZp
bGUgaXMgcGFydCBvZiBuZnMtdXRpbHMuCi0rICoKLSsgKiBuZnMtdXRpbHMgaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQotKyAqIGl0IHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVk
IGJ5Ci0rICogdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBv
ZiB0aGUgTGljZW5zZSwgb3IKLSsgKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9u
LgotKyAqCi0rICogbmZzLXV0aWxzIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQg
d2lsbCBiZSB1c2VmdWwsCi0rICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2
ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVT
UyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCi0rICogR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KLSsgKgotKyAqIFlvdSBzaG91bGQgaGF2ZSBy
ZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCi0rICogYWxv
bmcgd2l0aCBuZnMtdXRpbHMuICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vu
c2VzLz4uCi0rICovCi0rCi0rI2luY2x1ZGUgPHN5cy9zdGF0Lmg+Ci0rCi0rI2luY2x1ZGUgPHN0
cmluZy5oPgotKyNpbmNsdWRlIDxsaWJnZW4uaD4KLSsjaW5jbHVkZSA8c3RkaW8uaD4KLSsjaW5j
bHVkZSA8ZXJybm8uaD4KLSsjaW5jbHVkZSA8ZGlyZW50Lmg+Ci0rI2luY2x1ZGUgPHN0ZGxpYi5o
PgotKyNpbmNsdWRlIDxzdGRib29sLmg+Ci0rI2luY2x1ZGUgPGxpbWl0cy5oPgotKwotKyNpbmNs
dWRlICJ4bG9nLmgiCi0rI2luY2x1ZGUgIm1pc2MuaCIKLSsKLSsvKgotKyAqIFJldHVybnMgYSBk
eW5hbWljYWxseSBhbGxvY2F0ZWQsICdcMCctdGVybWluYXRlZCBidWZmZXIKLSsgKiBjb250YWlu
aW5nIGFuIGFwcHJvcHJpYXRlIHBhdGhuYW1lLCBvciBOVUxMIGlmIGFuIGVycm9yCi0rICogb2Nj
dXJzLiAgQ2FsbGVyIG11c3QgZnJlZSB0aGUgcmV0dXJuZWQgcmVzdWx0IHdpdGggZnJlZSgzKS4K
LSsgKi8KLStfX2F0dHJpYnV0ZV9fKChfX21hbGxvY19fKSkKLStjaGFyICoKLStnZW5lcmljX21h
a2VfcGF0aG5hbWUoY29uc3QgY2hhciAqYmFzZSwgY29uc3QgY2hhciAqbGVhZikKLSt7Ci0rCXNp
emVfdCBzaXplOwotKwljaGFyICpwYXRoOwotKwlpbnQgbGVuOwotKwotKwlzaXplID0gc3RybGVu
KGJhc2UpICsgc3RybGVuKGxlYWYpICsgMjsKLSsJaWYgKHNpemUgPiBQQVRIX01BWCkKLSsJCXJl
dHVybiBOVUxMOwotKwotKwlwYXRoID0gbWFsbG9jKHNpemUpOwotKwlpZiAocGF0aCA9PSBOVUxM
KQotKwkJcmV0dXJuIE5VTEw7Ci0rCi0rCWxlbiA9IHNucHJpbnRmKHBhdGgsIHNpemUsICIlcy8l
cyIsIGJhc2UsIGxlYWYpOwotKwlpZiAoKGxlbiA8IDApIHx8ICgoc2l6ZV90KWxlbiA+PSBzaXpl
KSkgewotKwkJZnJlZShwYXRoKTsKLSsJCXJldHVybiBOVUxMOwotKwl9Ci0rCi0rCXJldHVybiBw
YXRoOwotK30KLSsKLSsKLSsvKioKLSsgKiBnZW5lcmljX3NldHVwX2Jhc2VkaXIgLSBzZXQgdXAg
YmFzZWRpcgotKyAqIEBwcm9nbmFtZTogQyBzdHJpbmcgY29udGFpbmluZyBuYW1lIG9mIHByb2dy
YW0sIGZvciBlcnJvciBtZXNzYWdlcwotKyAqIEBwYXJlbnRkaXI6IEMgc3RyaW5nIGNvbnRhaW5p
bmcgcGF0aG5hbWUgdG8gb24tZGlzayBzdGF0ZSwgb3IgTlVMTAotKyAqIEBiYXNlOiBjaGFyYWN0
ZXIgYnVmZmVyIHRvIGNvbnRhaW4gdGhlIGJhc2VkaXIgdGhhdCBpcyBzZXQgdXAKLSsgKiBAYmFz
ZWxlbjogc2l6ZSBvZiBAYmFzZSBpbiBieXRlcwotKyAqCi0rICogVGhpcyBydW5zIGJlZm9yZSBs
b2dnaW5nIGlzIHNldCB1cCwgc28gZXJyb3IgbWVzc2FnZXMgYXJlIGRpcmVjdGVkCi0rICogdG8g
c3RkZXJyLgotKyAqCi0rICogUmV0dXJucyB0cnVlIGFuZCBzZXRzIHVwIG91ciBiYXNlZGlyLCBp
ZiBAcGFyZW50ZGlyIHdhcyB2YWxpZAotKyAqIGFuZCB1c2FibGU7IG90aGVyd2lzZSBmYWxzZSBp
cyByZXR1cm5lZC4KLSsgKi8KLStfQm9vbAotK2dlbmVyaWNfc2V0dXBfYmFzZWRpcihjb25zdCBj
aGFyICpwcm9nbmFtZSwgY29uc3QgY2hhciAqcGFyZW50ZGlyLCBjaGFyICpiYXNlLAotKwkJICAg
ICAgY29uc3Qgc2l6ZV90IGJhc2VsZW4pCi0rewotKwlzdGF0aWMgY2hhciBidWZbUEFUSF9NQVhd
OwotKwlzdHJ1Y3Qgc3RhdCBzdDsKLSsJY2hhciAqcGF0aDsKLSsKLSsJLyogRmlyc3Q6IHRlc3Qg
bGVuZ3RoIG9mIG5hbWUgYW5kIHdoZXRoZXIgaXQgZXhpc3RzICovCi0rCWlmICgoc3RybGVuKHBh
cmVudGRpcikgPj0gYmFzZWxlbikgfHwgKHN0cmxlbihwYXJlbnRkaXIpID49IFBBVEhfTUFYKSkg
ewotKwkJKHZvaWQpZnByaW50ZihzdGRlcnIsICIlczogRGlyZWN0b3J5IG5hbWUgdG9vIGxvbmc6
ICVzIiwKLSsJCQkJcHJvZ25hbWUsIHBhcmVudGRpcik7Ci0rCQlyZXR1cm4gZmFsc2U7Ci0rCX0K
LSsJaWYgKGxzdGF0KHBhcmVudGRpciwgJnN0KSA9PSAtMSkgewotKwkJKHZvaWQpZnByaW50Zihz
dGRlcnIsICIlczogRmFpbGVkIHRvIHN0YXQgJXM6ICVzIiwKLSsJCQkJcHJvZ25hbWUsIHBhcmVu
dGRpciwgc3RyZXJyb3IoZXJybm8pKTsKLSsJCXJldHVybiBmYWxzZTsKLSsJfQotKwotKwkvKiBF
bnN1cmUgd2UgaGF2ZSBhIGNsZWFuIGRpcmVjdG9yeSBwYXRobmFtZSAqLwotKwlzdHJuY3B5KGJ1
ZiwgcGFyZW50ZGlyLCBzaXplb2YoYnVmKS0xKTsKLSsJcGF0aCA9IGRpcm5hbWUoYnVmKTsKLSsJ
aWYgKCpwYXRoID09ICcuJykgewotKwkJKHZvaWQpZnByaW50ZihzdGRlcnIsICIlczogVW51c2Fi
bGUgZGlyZWN0b3J5ICVzIiwKLSsJCQkJcHJvZ25hbWUsIHBhcmVudGRpcik7Ci0rCQlyZXR1cm4g
ZmFsc2U7Ci0rCX0KLSsKLSsJeGxvZyhEX0NBTEwsICJVc2luZyAlcyBhcyB0aGUgc3RhdGUgZGly
ZWN0b3J5IiwgcGFyZW50ZGlyKTsKLSsJc3RyY3B5KGJhc2UsIHBhcmVudGRpcik7Ci0rCXJldHVy
biB0cnVlOwotK30KKyAjaW5jbHVkZSA8c3lzL3N0YXQuaD4KKyAKKyAjaW5jbHVkZSA8c3RyaW5n
Lmg+CiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9uc20vTWFrZWZpbGUuYW0gYi9zdXBwb3J0L25zbS9N
YWtlZmlsZS5hbQogaW5kZXggOGY1ODc0ZS4uNjhmMWE0NiAxMDA2NDQKIC0tLSBhL3N1cHBvcnQv
bnNtL01ha2VmaWxlLmFtCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25m
cy11dGlscy9uZnMtdXRpbHMvMDAwMS1sb2NrdGVzdC1NYWtlZmlsZS5hbS1Eby1ub3QtdXNlLWJ1
aWxkLWZsYWdzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZz
LXV0aWxzLzAwMDEtbG9ja3Rlc3QtTWFrZWZpbGUuYW0tRG8tbm90LXVzZS1idWlsZC1mbGFncy5w
YXRjaAppbmRleCAzNTE0MDdkZGNkLi5hNGJjMTEwOWNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwMS1sb2NrdGVzdC1NYWtlZmls
ZS5hbS1Eby1ub3QtdXNlLWJ1aWxkLWZsYWdzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDAxLWxvY2t0ZXN0LU1ha2VmaWxlLmFtLURv
LW5vdC11c2UtYnVpbGQtZmxhZ3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDllZmE3YTBk
Mzc2NjVkOWJiMGY0NmQyNDA3ODgzYTVhYjQyYzJiODQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDA2NWMwNmVlNjRkZTU2YjU0ZWZmODU2MjhhZWFmMTk0NmEyNDgwYjEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0
ZTogTW9uLCAyNCBKdWwgMjAyMyAyMDozOToxNiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBsb2Nr
dGVzdDogTWFrZWZpbGUuYW06IERvIG5vdCB1c2UgYnVpbGQgZmxhZ3MKQEAgLTE5LDcgKzE5LDcg
QEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rvb2xzL2xvY2t0ZXN0L01h
a2VmaWxlLmFtIGIvdG9vbHMvbG9ja3Rlc3QvTWFrZWZpbGUuYW0KLWluZGV4IGU4OTE0NjU1Li4y
ZmQzNjk3MSAxMDA2NDQKK2luZGV4IGU4OTE0NjUuLjJmZDM2OTcgMTAwNjQ0CiAtLS0gYS90b29s
cy9sb2NrdGVzdC9NYWtlZmlsZS5hbQogKysrIGIvdG9vbHMvbG9ja3Rlc3QvTWFrZWZpbGUuYW0K
IEBAIC0yLDggKzIsNSBAQApAQCAtMzEsNiArMzEsMyBAQCBpbmRleCBlODkxNDY1NS4uMmZkMzY5
NzEgMTAwNjQ0CiAtdGVzdGxrX0xERkxBR1M9JChMREZMQUdTX0ZPUl9CVUlMRCkKICAKICBNQUlO
VEFJTkVSQ0xFQU5GSUxFUyA9IE1ha2VmaWxlLmluCi0tLSAKLTIuNDEuMAotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvYnVnZml4LWFk
anVzdC1zdGF0ZC1zZXJ2aWNlLW5hbWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L25mcy11dGlscy9uZnMtdXRpbHMvYnVnZml4LWFkanVzdC1zdGF0ZC1zZXJ2aWNlLW5hbWUucGF0
Y2gKaW5kZXggZjEzZDdiMzgwYy4uYTZlMjRjOGRiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzL2J1Z2ZpeC1hZGp1c3Qtc3RhdGQtc2Vy
dmljZS1uYW1lLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxz
L25mcy11dGlscy9idWdmaXgtYWRqdXN0LXN0YXRkLXNlcnZpY2UtbmFtZS5wYXRjaApAQCAtMSw3
ICsxLDcgQEAKLUZyb20gMzk4ZmVkM2JiMDM1MGNiMTIyOWU1NGU3MDIwYWUwZTA0NGMyMDZkMSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDhmYmNjMTkxODAwZTI4NDRlMzlhMGJiMTlj
OTUyZGI5MTdmMWU3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9V
bHJpY2g9MjA9QzM9OTZsbWFubj89IDx1Lm9lbG1hbm5AcGVuZ3V0cm9uaXguZGU+CiBEYXRlOiBX
ZWQsIDE3IEZlYiAyMDE2IDA4OjMzOjQ1ICswMTAwCi1TdWJqZWN0OiBidWdmaXg6IGFkanVzdCBz
dGF0ZCBzZXJ2aWNlIG5hbWUKK1N1YmplY3Q6IFtQQVRDSF0gYnVnZml4OiBhZGp1c3Qgc3RhdGQg
c2VydmljZSBuYW1lCiBNSU1FLVZlcnNpb246IDEuMAogQ29udGVudC1UeXBlOiB0ZXh0L3BsYWlu
OyBjaGFyc2V0PVVURi04CiBDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CkBAIC0yMSw3
ICsyMSw3IEBAIFNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2
ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS91dGlscy9zdGF0ZC9zdGFydC1zdGF0ZCBiL3V0aWxzL3N0YXRkL3N0
YXJ0LXN0YXRkCi1pbmRleCBhZjVjOTUwLi5kZjliOWJlIDEwMDc1NQoraW5kZXggNGJjYmI2MC4u
M2QzYThjOCAxMDA3NTUKIC0tLSBhL3V0aWxzL3N0YXRkL3N0YXJ0LXN0YXRkCiArKysgYi91dGls
cy9zdGF0ZC9zdGFydC1zdGF0ZAogQEAgLTI4LDEwICsyOCwxMCBAQCBmaQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzL2NsYW5nLXdhcm5p
bmdzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxz
L2NsYW5nLXdhcm5pbmdzLnBhdGNoCmluZGV4IGZkZTk5YjU5OWUuLjgwOTkyMzQ4ZGQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy9jbGFu
Zy13YXJuaW5ncy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGls
cy9uZnMtdXRpbHMvY2xhbmctd2FybmluZ3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFh
YjBjMzI2NDA1YzZkYWEwNmYxYTdlYjRiMGI2MGJmNGUwNTg0YzIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDA3NWFkNzkxYmU4M2I3MTYyNjI0YmQwZmFkZjM3YWNhNDhhODg5OWQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogVHVlLCAzMSBEZWMgMjAxOSAwODoxNTozNCAtMDgwMAogU3ViamVjdDogW1BBVENI
XSBEZXRlY3Qgd2FybmluZyBvcHRpb25zIGR1cmluZyBjb25maWd1cmUKQEAgLTE0LDcgKzE0LDYg
QEAgV2Rpc2NhcmRlZC1xdWFsaWZpZXJzIGlzIGdjYyBzcGVjaWZpYyBhbmQgdGhpcyBpcyBubyBs
b25nZXIgbmVlZGVkCiAKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLQogLS0tCiAgc3VwcG9ydC9uZnMveGNvbW1v
bi5jIHwgMyArKysKICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvbmZzLXV0aWxz
LWRlYmlhbml6ZS1zdGFydC1zdGF0ZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bmZzLXV0aWxzL25mcy11dGlscy9uZnMtdXRpbHMtZGViaWFuaXplLXN0YXJ0LXN0YXRkLnBhdGNo
CmluZGV4IGVkZTBkY2VmYzQuLjU0Nzc5NmIzOWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy9uZnMtdXRpbHMtZGViaWFuaXplLXN0YXJ0
LXN0YXRkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25m
cy11dGlscy9uZnMtdXRpbHMtZGViaWFuaXplLXN0YXJ0LXN0YXRkLnBhdGNoCkBAIC0xLDQgKzEs
NyBAQAotW1BBVENIXSBuZnMtdXRpbHM6IGRlYmlhbml6ZSBzdGFydC1zdGF0ZAorRnJvbSAzYzVl
ZmQzN2M4YmM1ZDEzMzBmYzhmZGQxODQ3ZTcxOTVlNjUwNTFjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbTogSGVucmlrIFJpb21hciA8aGVucmlrLnJpb21hckBlcmljc3Nvbi5jb20+CitE
YXRlOiBNb24sIDI5IEp1biAyMDE1IDE0OjIyOjM1ICswODAwCitTdWJqZWN0OiBbUEFUQ0hdIFtQ
QVRDSF0gbmZzLXV0aWxzOiBkZWJpYW5pemUgc3RhcnQtc3RhdGQKIAogVXBzdHJlYW0tU3RhdHVz
OiBQZW5kaW5nCiAKQEAgLTEzLDcgKzE2LDcgQEAgU2lnbmVkLW9mZi1ieTogV2Vuem9uZyBGYW4g
PHdlbnpvbmcuZmFuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdXRpbHMvc3RhdGQvc3RhcnQtc3Rh
dGQgYi91dGlscy9zdGF0ZC9zdGFydC1zdGF0ZAotaW5kZXggMmZkNjAzOS4uZjU5MWIzNCAxMDA3
NTUKK2luZGV4IDY3YTJmNGEuLjRiY2JiNjAgMTAwNzU1CiAtLS0gYS91dGlscy9zdGF0ZC9zdGFy
dC1zdGF0ZAogKysrIGIvdXRpbHMvc3RhdGQvc3RhcnQtc3RhdGQKIEBAIC0xNyw2ICsxNywxNCBA
QCB0aGVuCkBAIC0zMSwxMiArMzQsOSBAQCBpbmRleCAyZmQ2MDM5Li5mNTkxYjM0IDEwMDc1NQog
ICMgRmlyc3QgdHJ5IHN5c3RlbWQgaWYgaXQncyBpbnN0YWxsZWQuCiAgaWYgWyAtZCAvcnVuL3N5
c3RlbWQvc3lzdGVtIF07IHRoZW4KICAgICAgIyBRdWl0IG9ubHkgaWYgdGhlIGNhbGwgd29ya2Vk
LgotQEAgLTI1LDQgKzMzLDQgQEAgZmkKK0BAIC0zMCw0ICszOCw0IEBAIGZpCiAgCiAgY2QgLwog
ICMgRmFsbCBiYWNrIHRvIGxhdW5jaGluZyBpdCBvdXJzZWx2ZXMuCiAtZXhlYyBycGMuc3RhdGQg
LS1uby1ub3RpZnkKICtleGVjIHJwYy5zdGF0ZCAtLW5vLW5vdGlmeSAkU1RBVERPUFRTCi0tLSAK
LTIuNi42Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxz
L25mcy11dGlsc18yLjguMS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxz
L25mcy11dGlsc18yLjguMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHNfMi44LjEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18yLjguMi5i
YgppbmRleCA0ODhhMWE3ZTcwLi41NDNjNjhmN2Y1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHNfMi44LjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuOC4yLmJiCkBAIC0zMyw3ICsz
Myw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9uZnMtdXRp
bHMvJHtQVn0vbmZzLXV0aWxzLSR7UFZ9LnRhci54CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWxv
Y2t0ZXN0LU1ha2VmaWxlLmFtLURvLW5vdC11c2UtYnVpbGQtZmxhZ3MucGF0Y2ggXAogICAgICAg
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMGJlOTViMDgzOTY5MDgwNDg1ODNmY2Y2
YjM0YTdjMWFiNDlkNTNlOGExMmViMjg2NzNjY2ZkMmVmZjBjNTA1IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImEzOWJiZWE3NmFjMGFiOWU2ZTg2OTljYWYzYzMwOGI2YjMxMGMyMGQ0NThlOGZhODYw
NjE5NmQzNThlN2ZiMTUiCiAKICMgT25seSBrZXJuZWwtbW9kdWxlLW5mc2QgaXMgcmVxdWlyZWQg
aGVyZSAoYnV0IGNhbiBiZSBidWlsdC1pbikgIC0gdGhlIG5mc2QgbW9kdWxlIHdpbGwKICMgcHVs
bCBpbiB0aGUgcmVtYWluZGVyIG9mIHRoZSBkZXBlbmRlbmNpZXMuCi0tIAoyLjQ0LjEKCg==

--===============8229661410306200170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nfs-utils: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.1/nfs-utils-2.8.1.tar.xz file://nfsserver file://nfscommon file://nfs-utils.conf file://nfs-server.service file://nfs-mountd.service file://nfs-statd.service file://proc-fs-nfsd.mount file://nfs-utils-debianize-start-statd.patch file://bugfix-adjust-statd-service-name.patch file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch file://clang-warnings.patch file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch" to "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.2/nfs-utils-2.8.2.tar.xz file://nfsserver file://nfscommon file://nfs-utils.conf file://nfs-server.service file://nfs-mountd.service file://nfs-statd.service file://proc-fs-nfsd.mount file://nfs-utils-debianize-start-statd.patch file://bugfix-adjust-statd-service-name.patch file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch file://clang-warnings.patch file://0001-locktest-Make
 file.am-Do-not-use-build-flags.patch"
packages/core2-64-poky-linux/nfs-utils: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PKGSIZE changed from 2675088 to 2676056 (+0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dev: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PKGSIZE changed from 201864 to 202021 (+0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-locale: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-locale: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PKGSIZE changed from 961618 to 961706 (+0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-staticdev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-staticdev: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PV changed from "2.8.1" to "2.8.2"

--===============8229661410306200170==--

