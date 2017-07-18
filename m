Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C16EE77F85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 07:57:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I7v1DE000593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 00:57:01 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 00:57:00 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jul 2017 03:56:56 -0400
Message-ID: <0a0b6923687790434ef86f63c6f7417594afab62.1500364523.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500364523.git.dengke.du@windriver.com>
References: <cover.1500364523.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] at: reduce local pending patches
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
X-List-Received-Date: Tue, 18 Jul 2017 07:57:01 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../at/at/0001-remove-glibc-assumption.patch                 | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch b/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch
index 53ae28b..7fdecc7 100644
--- a/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch
+++ b/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch
@@ -1,6 +1,6 @@
-From 7f811d9c4ebc9444e613e251c31d6bf537a24dc1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 16:35:30 -0700
+From f446686916e503dfb9fb928252d1b72a07573b29 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 18 Jul 2017 03:42:56 -0400
 Subject: [PATCH] remove glibc assumption
 
 glibc time.h header has an undocumented __isleap macro
@@ -9,9 +9,11 @@ Since it is undocumented & does not appear
 on any other libc, stop using it and just define the macro in
 locally  instead.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [ https://lists.debian.org/debian-accessibility/2017/07/msg00044.html ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
  parsetime.y | 11 +++++++----
  1 file changed, 7 insertions(+), 4 deletions(-)
@@ -53,5 +55,5 @@ index 7005e88..324e6d3 100644
  			{
  			    yyerror("Error in day of month");
 -- 
-2.1.4
+2.8.1
 
-- 
2.8.1


