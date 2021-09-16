Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.1423.1631814646685976783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 10:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.95])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 18GHohkW013220
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 12:50:45 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcf-agent: Move to the latest master version
Date: Thu, 16 Sep 2021 12:50:43 -0500
Message-Id: <20210916175043.78499-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

There has not been a release since 2018, the 1.7.0 release.  A number of
recent improvements around thumb and clang debugging prompted this move
to a newer version.

The patch is no longer necessary as it was a backport patch.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../0001-Fixed-copyright-messages.patch       | 56 -------------------
 .../tcf-agent/tcf-agent_git.bb                |  3 +-
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/0001-Fixed-copyright-messages.patch

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/0001-Fixed-copyright-messages.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/0001-Fixed-copyright-messages.patch
deleted file mode 100644
index ed73808e990..00000000000
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/0001-Fixed-copyright-messages.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 20ac1f939a8a97b03abec55d865050fdaa0f343a Mon Sep 17 00:00:00 2001
-From: Eugene Tarassov <eugenet@xilinx.com>
-Date: Tue, 8 Jan 2019 21:56:16 -0800
-Subject: [oe-core][PATCH 1/1] Fixed copyright messages
-
-Upstream-Status: Backport [https://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/commit/?id=20ac1f939a8a97b03abec55d865050fdaa0f343a]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- agent/tcf/framework/channel_lws.c      |  2 +-
- agent/tcf/framework/cpudefs-mdep-mux.h | 19 +++++++++++++------
- 2 files changed, 14 insertions(+), 7 deletions(-)
-
-diff --git a/agent/tcf/framework/channel_lws.c b/agent/tcf/framework/channel_lws.c
-index 0cb9585..d9352f3 100644
---- a/tcf/framework/channel_lws.c
-+++ b/tcf/framework/channel_lws.c
-@@ -1,5 +1,5 @@
- /*******************************************************************************
-- * Copyright (c) 2016-2017 Wind River Systems, Inc.
-+ * Copyright (c) 2016-2018 Wind River Systems, Inc. and others.
-  * All rights reserved. This program and the accompanying materials
-  * are made available under the terms of the Eclipse Public License v1.0
-  * and Eclipse Distribution License v1.0 which accompany this distribution.
-diff --git a/agent/tcf/framework/cpudefs-mdep-mux.h b/agent/tcf/framework/cpudefs-mdep-mux.h
-index c9e0db7..0397a6a 100644
---- a/tcf/framework/cpudefs-mdep-mux.h
-+++ b/tcf/framework/cpudefs-mdep-mux.h
-@@ -1,10 +1,17 @@
--/*
-- * Copyright (c) 2013 Wind River Systems, Inc.
-+/*******************************************************************************
-+ * Copyright (c) 2013 Wind River Systems, Inc. and others.
-+ * All rights reserved. This program and the accompanying materials
-+ * are made available under the terms of the Eclipse Public License v1.0
-+ * and Eclipse Distribution License v1.0 which accompany this distribution.
-+ * The Eclipse Public License is available at
-+ * http://www.eclipse.org/legal/epl-v10.html
-+ * and the Eclipse Distribution License is available at
-+ * http://www.eclipse.org/org/documents/edl-v10.php.
-+ * You may elect to redistribute this code under either of these licenses.
-  *
-- * The right to copy, distribute, modify or otherwise make use
-- * of this software may be licensed only pursuant to the terms
-- * of an applicable Wind River license agreement.
-- */
-+ * Contributors:
-+ *     Wind River Systems - initial API and implementation
-+ *******************************************************************************/
- 
- #include <tcf/config.h>
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 4ff309dd80d..e67eccc75ce 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | EDL-1.0"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "a022ef2f1acfd9209a1bf792dda14ae4b0d1b60f"
+SRCREV = "2735e3d6b7eccb05ab232825c618c837d27a5010"
 PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
@@ -15,7 +15,6 @@ SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
-           file://0001-Fixed-copyright-messages.patch \
           "
 
 DEPENDS = "util-linux openssl"
-- 
2.17.1

