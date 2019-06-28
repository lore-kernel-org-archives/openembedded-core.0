Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFE467E686
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 12:00:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5SC09Ru019903
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:09 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 05:00:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2019 20:23:38 +0800
Message-ID: <b392ebb6d511e0ba395bd1294053d6939f5dbb89.1561724553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561724553.git.liezhi.yang@windriver.com>
References: <cover.1561724553.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] wic: python2 -> python3
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
X-List-Received-Date: Fri, 28 Jun 2019 12:00:08 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/lib/wic/__init__.py   | 2 +-
 scripts/lib/wic/ksparser.py   | 2 +-
 scripts/lib/wic/pluginbase.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/__init__.py b/scripts/lib/wic/__init__.py
index ba2d614..8556793 100644
--- a/scripts/lib/wic/__init__.py
+++ b/scripts/lib/wic/__init__.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python -tt
+#!/usr/bin/env python3
 #
 # Copyright (c) 2007 Red Hat, Inc.
 # Copyright (c) 2011 Intel, Inc.
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 6204821..3e67003 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python -tt
+#!/usr/bin/env python3
 #
 # Copyright (c) 2016 Intel, Inc.
 #
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index bfb73ca..f74d643 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python -tt
+#!/usr/bin/env python3
 #
 # Copyright (c) 2011 Intel, Inc.
 #
-- 
2.7.4


