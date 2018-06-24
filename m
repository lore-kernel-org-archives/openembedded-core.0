Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id A1803607DF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:09:03 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id g20-v6so5772574plq.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=soCFswPBjYC7WoewS8Y+kYIFfp2tMIGNGpOIaJAYN8g=;
	b=mOjXxK2CRMDvyQIXr3bVdN6tA2gGKBKGku/eizLp9kRnZTPTo5p5Mx+e30zXxnD7Np
	Y+ZPqDJuPCyf5VSDMLGHM4/cRHdymVyD2MMVst4xe/dzH6lOyp+xCqaDaod6TlKH/eq1
	nNPwOjZjGlBCnUH/TntVxWfv0VPy62oKT9Sn0Bi8vcQNOxhiWMmHDIRNWffUU501lRoj
	nuN8BS0IzifqnccLIClfzzaWGfC19jBL8dGuthIIE8+Gnis028xQG29x6zYBzMLVm4uQ
	1vfBa2AJUlgBHH1r7+kHg/wVXhxccV+P4w6AVHm5f0Az/WNuuy14yq0iNmxHVV2jkeJZ
	lkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=soCFswPBjYC7WoewS8Y+kYIFfp2tMIGNGpOIaJAYN8g=;
	b=LRnDxMvIySigjtwA+2TyCGT14wtsZtc2+G4iC1GnyDWXPx3DOvwHXe7uh63pqZmDz6
	a0goETIP5w9W9b39eFURdfd+QCAjl2ZSacoREGZ965hxBvcyrarfKoUKYMSwhRavH22l
	XH/O9QnWLvZEW2VYlXt13Iz8nTwg+2v6yRKsd5bSraa942/SDaWwVO/bsopKJWL93YDS
	bv1+q1bt1BXiCzsMHbOTjQs183EchSXTbklEI/hZgSPKNbmqy4MkZAKV4iOaZY4O18dt
	cFmuPDzWTRNGo9xoA9tojNi+BECvqSXwv35ML8F35uV8s+cJXIjnRnGm89aVe546EhGZ
	DodQ==
X-Gm-Message-State: APt69E0S36X5rFb+3JwtFKoCxVlxxfEXNm4Z8KBZa/QbUbCgBMoyxL7p
	XRJKLA3T1SoHPbDzgS/dyn7a6g==
X-Google-Smtp-Source: ADUXVKIrVz3feL3xyVhClYMuc20zsm6TMJnhWAO3LuIvCCbJ2sHLJgX1trMhVEIpEDB5sfSyDO9TMw==
X-Received: by 2002:a17:902:52a6:: with SMTP id
	a35-v6mr2335536pli.131.1529867344311; 
	Sun, 24 Jun 2018 12:09:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	p73-v6sm32336117pfa.142.2018.06.24.12.09.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:09:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:09:06 -0700
Message-Id: <20180624190906.44063-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] findutils: Refresh patches with devtool
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
X-List-Received-Date: Sun, 24 Jun 2018 19:09:03 -0000

We get fuzz warnings when applying these patches and devtool
reports it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...charset_alias-when-building-for-musl.patch | 15 +++++-----
 ...-honour-the-ignore_readdir_race-opti.patch | 29 +++++++++----------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
index 8729e1b447..6064d18854 100644
--- a/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -1,4 +1,4 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From 86db2a5f3b7ef8113e5384b4e02d2b299c87a047 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Apr 2015 17:02:13 -0700
 Subject: [PATCH] Unset need_charset_alias when building for musl
@@ -11,15 +11,16 @@ coreutils
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- lib/gnulib.mk | 2 +-
+ gl/lib/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: findutils-4.5.14/gl/lib/Makefile.am
-===================================================================
---- findutils-4.5.14.orig/gl/lib/Makefile.am
-+++ findutils-4.5.14/gl/lib/Makefile.am
-@@ -1220,7 +1220,7 @@ install-exec-localcharset: all-local
+diff --git a/gl/lib/Makefile.am b/gl/lib/Makefile.am
+index a9e2fe4..1c6ea9c 100644
+--- a/gl/lib/Makefile.am
++++ b/gl/lib/Makefile.am
+@@ -1234,7 +1234,7 @@ install-exec-localcharset: all-local
  	  case '$(host_os)' in \
  	    darwin[56]*) \
  	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
index 420e10da02..a570473ccb 100644
--- a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
+++ b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
@@ -1,7 +1,7 @@
-From 0afb2efada7e435ae18ef7d3db0758464189f44f Mon Sep 17 00:00:00 2001
+From a3f4821c4a3f723d21c9298d54bee8a656bfd7fb Mon Sep 17 00:00:00 2001
 From: Bernhard Voelker <mail@bernhard-voelker.de>
 Date: Tue, 30 Jan 2018 23:30:09 +0100
-Subject: find: make -delete honour the -ignore_readdir_race option
+Subject: [PATCH] find: make -delete honour the -ignore_readdir_race option
 
 * find/pred.c (pred_delete): Return true when the -ignore_readdir_race
 option is active and unlinkat() came back with ENOENT.
@@ -29,6 +29,7 @@ https://savannah.gnu.org/bugs/?52981
 
 Upstream-Status: Backport
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
 ---
  NEWS          |  4 ++++
  doc/find.texi | 15 ++++++++++++++-
@@ -37,22 +38,22 @@ Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
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
@@ -85,11 +86,11 @@ index 3580be7..0089193 100644
  
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
@@ -125,7 +126,7 @@ index 0437cd8..0d44c37 100644
  Execute \fIcommand\fR; true if 0 status is returned.  All following
  arguments to
 diff --git a/find/pred.c b/find/pred.c
-index 7e2a7bd..af3bacb 100644
+index 32938fb..431f065 100644
 --- a/find/pred.c
 +++ b/find/pred.c
 @@ -324,6 +324,12 @@ pred_delete (const char *pathname, struct stat *stat_buf, struct predicate *pred
@@ -141,5 +142,3 @@ index 7e2a7bd..af3bacb 100644
  	  if (EISDIR == errno)
  	    {
  	      if ((flags & AT_REMOVEDIR) == 0)
---
-cgit v1.0-41-gc330
-- 
2.18.0


