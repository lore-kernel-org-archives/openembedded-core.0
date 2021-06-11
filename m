Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.6037.1623403155600485423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 02:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15B9JDcX014359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 02:19:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 11 Jun 2021 02:19:13 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 11 Jun 2021 02:19:12 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] tcf-agent: change license to EPL/EDL
Date: Fri, 11 Jun 2021 17:16:55 +0800
Message-ID: <20210611091655.14935-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Joe Slater <joe.slater@windriver.com>

cpudefs-mdep-mux.h contains a proprietary license notice.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../0001-Fixed-copyright-messages.patch       | 56 +++++++++++++++++++
 .../tcf-agent/tcf-agent_git.bb                |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/0001-Fixed-copyright-messages.patch

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/0001-Fixed-copyright-messages.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/0001-Fixed-copyright-messages.patch
new file mode 100644
index 0000000000..ed73808e99
--- /dev/null
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/0001-Fixed-copyright-messages.patch
@@ -0,0 +1,56 @@
+From 20ac1f939a8a97b03abec55d865050fdaa0f343a Mon Sep 17 00:00:00 2001
+From: Eugene Tarassov <eugenet@xilinx.com>
+Date: Tue, 8 Jan 2019 21:56:16 -0800
+Subject: [oe-core][PATCH 1/1] Fixed copyright messages
+
+Upstream-Status: Backport [https://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/commit/?id=20ac1f939a8a97b03abec55d865050fdaa0f343a]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ agent/tcf/framework/channel_lws.c      |  2 +-
+ agent/tcf/framework/cpudefs-mdep-mux.h | 19 +++++++++++++------
+ 2 files changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/agent/tcf/framework/channel_lws.c b/agent/tcf/framework/channel_lws.c
+index 0cb9585..d9352f3 100644
+--- a/tcf/framework/channel_lws.c
++++ b/tcf/framework/channel_lws.c
+@@ -1,5 +1,5 @@
+ /*******************************************************************************
+- * Copyright (c) 2016-2017 Wind River Systems, Inc.
++ * Copyright (c) 2016-2018 Wind River Systems, Inc. and others.
+  * All rights reserved. This program and the accompanying materials
+  * are made available under the terms of the Eclipse Public License v1.0
+  * and Eclipse Distribution License v1.0 which accompany this distribution.
+diff --git a/agent/tcf/framework/cpudefs-mdep-mux.h b/agent/tcf/framework/cpudefs-mdep-mux.h
+index c9e0db7..0397a6a 100644
+--- a/tcf/framework/cpudefs-mdep-mux.h
++++ b/tcf/framework/cpudefs-mdep-mux.h
+@@ -1,10 +1,17 @@
+-/*
+- * Copyright (c) 2013 Wind River Systems, Inc.
++/*******************************************************************************
++ * Copyright (c) 2013 Wind River Systems, Inc. and others.
++ * All rights reserved. This program and the accompanying materials
++ * are made available under the terms of the Eclipse Public License v1.0
++ * and Eclipse Distribution License v1.0 which accompany this distribution.
++ * The Eclipse Public License is available at
++ * http://www.eclipse.org/legal/epl-v10.html
++ * and the Eclipse Distribution License is available at
++ * http://www.eclipse.org/org/documents/edl-v10.php.
++ * You may elect to redistribute this code under either of these licenses.
+  *
+- * The right to copy, distribute, modify or otherwise make use
+- * of this software may be licensed only pursuant to the terms
+- * of an applicable Wind River license agreement.
+- */
++ * Contributors:
++ *     Wind River Systems - initial API and implementation
++ *******************************************************************************/
+ 
+ #include <tcf/config.h>
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 854269a0fa..87369c47dd 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
+           file://0001-Fixed-copyright-messages.patch \
           "
 
 DEPENDS = "util-linux openssl"
-- 
2.17.1

