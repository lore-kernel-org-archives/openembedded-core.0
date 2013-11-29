Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5AD6DDB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:47:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rATClv4h028281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:47:57 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 04:47:57 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 20:48:13 +0800
Message-ID: <d0d10a144b1c47c3e49257f5347612607ce5bd0a.1385728901.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385728901.git.Qi.Chen@windriver.com>
References: <cover.1385728901.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/18] lsb: de-bash scripts to remove bash dependency
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
X-List-Received-Date: Fri, 29 Nov 2013 12:47:58 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

De-bash some script in lsb to make it not dependent on bash.

[YOCTO #5555]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/lsb/lsb/lsb_killproc     |    2 +-
 meta/recipes-extended/lsb/lsb/lsb_log_message  |    2 +-
 meta/recipes-extended/lsb/lsb/lsb_pidofproc    |    2 +-
 meta/recipes-extended/lsb/lsb/lsb_start_daemon |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb/lsb_killproc b/meta/recipes-extended/lsb/lsb/lsb_killproc
index e1121e4..866c1a9 100755
--- a/meta/recipes-extended/lsb/lsb/lsb_killproc
+++ b/meta/recipes-extended/lsb/lsb/lsb_killproc
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 . /etc/init.d/functions
 
diff --git a/meta/recipes-extended/lsb/lsb/lsb_log_message b/meta/recipes-extended/lsb/lsb/lsb_log_message
index 9daa9c8..a716518 100755
--- a/meta/recipes-extended/lsb/lsb/lsb_log_message
+++ b/meta/recipes-extended/lsb/lsb/lsb_log_message
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 . /etc/init.d/functions
 
diff --git a/meta/recipes-extended/lsb/lsb/lsb_pidofproc b/meta/recipes-extended/lsb/lsb/lsb_pidofproc
index ffc17bb..6d1fd0f 100755
--- a/meta/recipes-extended/lsb/lsb/lsb_pidofproc
+++ b/meta/recipes-extended/lsb/lsb/lsb_pidofproc
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 . /etc/init.d/functions
 
diff --git a/meta/recipes-extended/lsb/lsb/lsb_start_daemon b/meta/recipes-extended/lsb/lsb/lsb_start_daemon
index 05b6371..de62c23 100755
--- a/meta/recipes-extended/lsb/lsb/lsb_start_daemon
+++ b/meta/recipes-extended/lsb/lsb/lsb_start_daemon
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 . /etc/init.d/functions
 
-- 
1.7.9.5


