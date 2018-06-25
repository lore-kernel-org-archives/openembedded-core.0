Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E51FF745A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 03:18:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5P3Iob4019857
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jun 2018 20:18:50 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Sun, 24 Jun 2018 20:18:49 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Jun 2018 20:18:49 -0700
Message-ID: <20180625031849.116287-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [V2][PATCH] findutils: update the patch to avoid patch fuzz warning
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
X-List-Received-Date: Mon, 25 Jun 2018 03:18:50 -0000
Content-Type: text/plain

Regenerate the patch to avoid patch fuzz warning.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...-honour-the-ignore_readdir_race-opti.patch | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
index 420e10da02..b9a8c08e4b 100644
--- a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
+++ b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
@@ -37,22 +37,22 @@ Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
  4 files changed, 46 insertions(+), 1 deletion(-)
 
 diff --git a/NEWS b/NEWS
-index 88cf17d..9809bf4 100644
+index 660c241..b86ec1e 100644
 --- a/NEWS
 +++ b/NEWS
-@@ -42,6 +42,10 @@
-
- ** Bug Fixes
-
+@@ -42,6 +42,10 @@ Updated the Danish translation.
+ 
+ ** Bug Fixes:
+ 
 +#52981: find: the '-delete' action no longer complains about disappeared files
 +        when the '-ignore_readdir_race' option is given, too.  That action will
 +        also returns true in such a case now.
 +
  Applied patch #8688: Spelling fixes.
-
+ 
  * Major changes in release 4.5.18, 2015-12-27
 diff --git a/doc/find.texi b/doc/find.texi
-index 3580be7..0089193 100644
+index fdeb841..247c19a 100644
 --- a/doc/find.texi
 +++ b/doc/find.texi
 @@ -1418,7 +1418,15 @@ gives a significant increase in search speed.
@@ -85,11 +85,11 @@ index 3580be7..0089193 100644
  
  @node Adding Tests
 diff --git a/find/find.1 b/find/find.1
-index 0437cd8..0d44c37 100644
+index 7b141b8..0eec41c 100644
 --- a/find/find.1
 +++ b/find/find.1
-@@ -479,6 +479,17 @@ this option on and part of it with this option off
- (if you need to do that, you will need to issue two \fBfind\fR commands
+@@ -479,6 +479,17 @@ one part of the filesystem with this option on and part of it with this option
+ off (if you need to do that, you will need to issue two \fBfind\fR commands
  instead, one with the option and one without it).
  
 +Furthermore,
-- 
2.17.1


