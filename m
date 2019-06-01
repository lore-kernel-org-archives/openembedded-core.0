Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1E47B7E626
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 21:58:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45GZvQ6D48z6p
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 23:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559426307;
	bh=NcwtkeWi8W++XnwH1xv2dPjrG26iY1CCmTljSgsnXt4=;
	h=From:To:Subject:Date:From;
	b=q4iGqi+wFiKGXVeo1hiIAoMOgKJic4xIC0EIdGi5gN2rPtl1d5U4eY5rAdvRZTUCU
	fFnhAwj4jC5nifH9rzEE9AU3awbBHk/SyzXTviCNlVzLOe3wIyfN6ATyxhE2Hoe2tt
	D+TXT92N71rJOI+0OmipfqqiwU0ks/cM12I4vijzfNrcYo542Axe2IUUmq/c/GEE6m
	FRylBH+xiv6oUg2vbnpShVldJAHGrUndndGNuXZFBOTCMD3/FyHHSzts7JrbGbOYB+
	P9tGVO2BUDbumPQ4RBw9ZQp/Xb99LIftbp4TD2pBONk2ed1qd2B9mIykPWZ/BbOC+c
	S/UmDV4n2wdNrLD2XpZnyLFRjpyHQZS/RDklJmisIyGJr0N/94lcS20GnTJgwtZjif
	EvpZMhugO/7SKRa3NO1hXgsLtB8dh8AHtx1TUy0uRLhW0zKfiw0f86HXTM28eIIvxl
	RBX7K4BddQtdnrnIJtwUA14hxom3+29sBqmjaSSoZKm9qthTuVA6EYP6PsPRk7kXv5
	bvEVHs+Uih/E1yqYspZARkdMbxw8beTwND18Am+gfGVxtXNCxKc5p1uiyt93uCC/em
	mIMjEqnOvfIjhofHPsTgfci9ploW6w63PuLHVd3dCWz43mUyMqIg1difYzdW4v8AAC
	qvZvAMB4fkftaoQf7yaKLj4I=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Jun 2019 00:58:24 +0300
Message-Id: <20190601215825.24862-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lrzsz: Add implicit declaration fixes from Debian
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
X-List-Received-Date: Sat, 01 Jun 2019 21:58:27 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../lrzsz/lrzsz-0.12.20/include.patch         | 23 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
new file mode 100644
index 0000000000..3925fc8c86
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
@@ -0,0 +1,23 @@
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Upstream-Status: Inappropriate [upstream is dead]
+
+--- lrzsz-0.12.21.orig/lib/long-options.c
++++ lrzsz-0.12.21/lib/long-options.c
+@@ -22,6 +22,7 @@
+ #endif
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <getopt.h>
+ #include "long-options.h"
+ 
+--- lrzsz-0.12.21.orig/src/lsyslog.c
++++ lrzsz-0.12.21/src/lsyslog.c
+@@ -22,6 +22,7 @@
+ #ifdef ENABLE_SYSLOG
+ #include "zglobal.h"
+ #include <pwd.h>
++#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #endif
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 002c774c6d..34556b2c29 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 	   file://lrzsz_fix_for_automake-1.12.patch \
            file://lrzsz-check-locale.h.patch \
            file://cve-2018-10195.patch \
+           file://include.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
-- 
2.17.1


