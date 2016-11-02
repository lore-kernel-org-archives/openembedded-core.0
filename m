Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id DDCE671A89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 12:32:06 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t79so34151604wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=aQnCB3k3FC8pXf8kon3JTG9V+wTrTP7E3BjWK9H3MLs=;
	b=EFX29DKSS0+hwWYjbxWcs8B5mlFd0wxk4B89yGLDrRzfjDmbZrzLWp38d7QmO821qK
	nKGf7ABPYcavz2TZ8De65Q0r3J9o3W9MgkbkKSKGgyoSZ0WCzNw+FbhsF3dVb5/HSJfZ
	k0XM6lpbsiSCfvL2Znd/7r2xY+ZZCzs3FDl3mdSsNNKm046SwzrZeWTa+HyR4z4YHYbc
	I6xU+sZXN33B4hX7bPOES5peMDdY7y8pSBrxamRUFWt01paFcLE3JZQW3P05PsBwnmAO
	wZLlIhs+eQQ1msQR7B3hsMT6i+YWouyf4ybxXo5+Pv8PH13E6kiGKn9SxYAA25CSDeye
	yRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aQnCB3k3FC8pXf8kon3JTG9V+wTrTP7E3BjWK9H3MLs=;
	b=BvN0BTtGMVbcy0LE0LgVwQHyg8npjkEIqytd8RJUs6N11PYizYvw9B5sATYCO30eyc
	9Cvhie5Rc4/rWZMgxBj0LolX/QhwoQ4QDYkP20GJ1rscwm+Ms/vkkIGBJkW2PONMYrCf
	1k3YIhha/g4c/VfD+kT9TSHk78aXuGb/dEhWKmEl1b9IQO/84QpWcj8mA/PQ4J6qAeBw
	4ASJts3+71a5J3jsQKADxnRynUOvgXHzi1IOW3HAvxSH6TJEqYIjYtOcDgyDblrrHTpo
	RZIdsfo+zgpJpDFxJaLBQsjVP5iHf0d8+Lt5NIMnnIMOZTrzQv1mRKstnrbpJ4lOzatp
	DVHQ==
X-Gm-Message-State: ABUngvdTbaLt1IevO/tMMsohYc6xd/JowxJZC2H0RZn8aBBYl685uFFM76yEVFYazk8UQRQO
X-Received: by 10.28.199.6 with SMTP id x6mr2849998wmf.116.1478089927400;
	Wed, 02 Nov 2016 05:32:07 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	125sm2982550wmh.14.2016.11.02.05.32.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Nov 2016 05:32:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 12:31:59 +0000
Message-Id: <1478089919-19920-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] guilt: remove
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
X-List-Received-Date: Wed, 02 Nov 2016 12:32:08 -0000

This was used by the kernel tooling but has since been replaced by kgit-s2q.  As
there are no other users in oe-core, and this was just a native recipe, remove
it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/guilt/files/guilt-bash.patch | 288 ---------------------
 meta/recipes-devtools/guilt/guilt-native_git.bb    |  23 --
 2 files changed, 311 deletions(-)
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-bash.patch
 delete mode 100644 meta/recipes-devtools/guilt/guilt-native_git.bb

diff --git a/meta/recipes-devtools/guilt/files/guilt-bash.patch b/meta/recipes-devtools/guilt/files/guilt-bash.patch
deleted file mode 100644
index 70a439e..0000000
--- a/meta/recipes-devtools/guilt/files/guilt-bash.patch
+++ /dev/null
@@ -1,288 +0,0 @@
-guilt: explicitly call for bash
-
-Running complex guilt stacks of patches/commits can cause interesting
-failures after ~20m of processing, with errors like "Bad substitution".
-
-These have been traced back to having /bin/sh -->  /bin/dash on Ubuntu
-systems.  Putting a shell that actually *works* (such as /bin/bash)
-in as /bin/sh makes the problem go away.  So here we change the guilt
-scripts to explicitly call for bash to ensure we don't have a similar
-issue after deployment.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
----
- guilt               |    2 +-
- guilt-add           |    2 +-
- guilt-applied       |    2 +-
- guilt-branch        |    2 +-
- guilt-delete        |    2 +-
- guilt-diff          |    2 +-
- guilt-export        |    2 +-
- guilt-files         |    2 +-
- guilt-fold          |    2 +-
- guilt-fork          |    2 +-
- guilt-graph         |    2 +-
- guilt-header        |    2 +-
- guilt-help          |    2 +-
- guilt-import        |    2 +-
- guilt-import-commit |    2 +-
- guilt-init          |    4 ++--
- guilt-new           |    2 +-
- guilt-next          |    2 +-
- guilt-patchbomb     |    2 +-
- guilt-pop           |    2 +-
- guilt-prev          |    2 +-
- guilt-push          |    2 +-
- guilt-rebase        |    2 +-
- guilt-refresh       |    2 +-
- guilt-rm            |    2 +-
- guilt-series        |    2 +-
- guilt-status        |    2 +-
- guilt-top           |    2 +-
- guilt-unapplied     |    2 +-
- 29 files changed, 30 insertions(+), 30 deletions(-)
-
---- a/guilt
-+++ b/guilt
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006-2010
- #
---- a/guilt-add
-+++ b/guilt-add
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-applied
-+++ b/guilt-applied
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-branch
-+++ b/guilt-branch
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2007-2008
- #
---- a/guilt-delete
-+++ b/guilt-delete
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-diff
-+++ b/guilt-diff
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (C) 2007 Josef 'Jeff' Sipek <jeffpc@josefsipek.net>
- #
---- a/guilt-export
-+++ b/guilt-export
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Pierre Habouzit, 2007
- #
---- a/guilt-files
-+++ b/guilt-files
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (C) 2007 Yasushi SHOJI <yashi@atmark-techno.com>
- #
---- a/guilt-fold
-+++ b/guilt-fold
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-fork
-+++ b/guilt-fork
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2007
- #
---- a/guilt-graph
-+++ b/guilt-graph
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2007
- #
---- a/guilt-header
-+++ b/guilt-header
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006-2010
- #
---- a/guilt-help
-+++ b/guilt-help
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2007
- #
---- a/guilt-import
-+++ b/guilt-import
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2007
- #
---- a/guilt-import-commit
-+++ b/guilt-import-commit
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2007
- #
---- a/guilt-init
-+++ b/guilt-init
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
-@@ -31,7 +31,7 @@ touch "$GUILT_DIR/$branch/status"
- 
- mkdir -p "$GIT_DIR/hooks/guilt"
- cat > "$GIT_DIR/hooks/guilt/delete" <<EOF
--#!/bin/sh
-+#!/bin/bash
- # Usage: <script> <patch being removed>
- 
- echo "Removing patch '\$1'..."
---- a/guilt-new
-+++ b/guilt-new
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-next
-+++ b/guilt-next
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-patchbomb
-+++ b/guilt-patchbomb
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2007
- #
---- a/guilt-pop
-+++ b/guilt-pop
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-prev
-+++ b/guilt-prev
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-push
-+++ b/guilt-push
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-rebase
-+++ b/guilt-rebase
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2007
- #
---- a/guilt-refresh
-+++ b/guilt-refresh
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-rm
-+++ b/guilt-rm
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-series
-+++ b/guilt-series
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-status
-+++ b/guilt-status
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-top
-+++ b/guilt-top
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
---- a/guilt-unapplied
-+++ b/guilt-unapplied
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- #
- # Copyright (c) Josef "Jeff" Sipek, 2006, 2007
- #
diff --git a/meta/recipes-devtools/guilt/guilt-native_git.bb b/meta/recipes-devtools/guilt/guilt-native_git.bb
deleted file mode 100644
index b63c68c..0000000
--- a/meta/recipes-devtools/guilt/guilt-native_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "quilt-like tool for Git"
-LICENSE = "GPLv2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b6f3400dc1a01cebafe8a52b3f344135"
-
-inherit native
-
-SRC_URI = "git://repo.or.cz/guilt.git \
-           file://guilt-bash.patch \
-           "
-PV = "0.35+git${SRCPV}"
-SRCREV = "c2a5bae511c6d5354aa4e1cb59069c31df2b8eeb"
-
-S = "${WORKDIR}/git"
-
-# we don't compile, we just install
-do_compile() {
-	:
-}
-
-do_install() {
-	oe_runmake PREFIX=${D}/${prefix} install
-}
-- 
2.8.1


