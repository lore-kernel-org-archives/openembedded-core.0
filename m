Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC72370D4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:06:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I66eZ2029480
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:06:40 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:06:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:06:36 -0700
Message-ID: <2cff03cf50457fb1f1603a5d3da65c9b7842b96c.1408341623.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408341623.git.liezhi.yang@windriver.com>
References: <cover.1408341623.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] valgrind/oprofile/systemd: no need bash in run-ptest
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
X-List-Received-Date: Mon, 18 Aug 2014 06:06:41 -0000
Content-Type: text/plain

There is no bashism in the scripts, so use /bin/sh.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/systemd/systemd/run-ptest       |    2 ++
 meta/recipes-devtools/valgrind/valgrind/run-ptest |    3 ++-
 meta/recipes-kernel/oprofile/oprofile/run-ptest   |    3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-core/systemd/systemd/run-ptest
index 2f6bd93..a2d61c2 100644
--- a/meta/recipes-core/systemd/systemd/run-ptest
+++ b/meta/recipes-core/systemd/systemd/run-ptest
@@ -1,3 +1,5 @@
+#!/bin/sh
+
 tar -C test -xJf test/sys.tar.xz
 make test/rules-test.sh.log
 make test/udev-test.pl.log
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 7d0584a..f9a72ec 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -1,4 +1,5 @@
-#!/bin/bash
+#!/bin/sh
+
 # run-ptest - 'ptest' test infrastructure shell script that
 #   wraps the valgrind regression script vg_regtest. 
 #   Must be run in the /usr/lib/valgrind/ptest directory. 
diff --git a/meta/recipes-kernel/oprofile/oprofile/run-ptest b/meta/recipes-kernel/oprofile/oprofile/run-ptest
index 583ee1b..4814be6 100644
--- a/meta/recipes-kernel/oprofile/oprofile/run-ptest
+++ b/meta/recipes-kernel/oprofile/oprofile/run-ptest
@@ -1,4 +1,5 @@
-#!/bin/bash
+#!/bin/sh
+
 saved_dir=$PWD
 for dir in */tests ; do
 	cd $dir
-- 
1.7.9.5


