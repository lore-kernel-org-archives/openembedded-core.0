Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49F276C133
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 17:36:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAFHaP15029181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:36:25 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 15 Nov 2018 09:36:25 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 12:36:23 -0500
Message-ID: <20181115173623.8388-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] valgrind: update upstream patch status
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
X-List-Received-Date: Thu, 15 Nov 2018 17:36:25 -0000
Content-Type: text/plain

Two recent patches are now marked as reported in the
valgrind bugzilla.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch       | 2 +-
 ...1-Make-local-functions-static-to-avoid-assembler-error.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
index 3efe65a940..81ab29f3be 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
@@ -3,7 +3,7 @@ From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Fri, 19 Oct 2018 10:31:12 -0400
 Subject: [PATCH] Guard against __GLIBC_PREREQ for musl libc
 
-Upstream-Status: Pending
+Upstream-Status: Submitted https://bugs.kde.org/show_bug.cgi?id=400162
 
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
index 45e5ea3e74..8d2ca5733e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
@@ -18,7 +18,7 @@ and more importantly also avoid an assembler error:
 /tmp/cce22iiw.s:915: Error: symbol `exit_0' is already defined
 /tmp/cce22iiw.s:917: Error: symbol `exit' is already defined
 
-Upstream-Status: Pending
+Upstream-Status: Submitted https://bugs.kde.org/show_bug.cgi?id=400164
 
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
-- 
2.17.0


