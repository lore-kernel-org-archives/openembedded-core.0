Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC49D71DAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 02:32:02 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id x86so10604802ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 19:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sJwTrxtkavMSlzTlQRdeDXrV8hl/+JGnEFJDBXx7neA=;
	b=tx/qDxzEjvFB0zLW+nG1mN303TCGABxOtdFktJHz1lkpFAv0d2xGqKCBAM1Xc9CbTN
	FU8paeH1O9lbg/U9OGw3DGcIaE4S9K8D9n3dHW0Pj+UDPdsfnKunGFMG3TbTuUmo75BJ
	dvAxwv9pg0HvSJOvRzh4V1wlJ+n/AZ7yYS7qEsDV4WofP3XgpdaI53CNc4O7fnNNImhz
	lsI9cobwEQsq4J2+uxUw9alzypSTUgle/9ikH30dcKufQFgrH4jAKe/vrwovfqulmDdG
	9Yq0hxkKSEtlzY+2IoRUdtJH2v0/x+bEk2uYJNn5r3fLc+ILfxauqv/hPoY3MxsdBKXO
	DDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sJwTrxtkavMSlzTlQRdeDXrV8hl/+JGnEFJDBXx7neA=;
	b=DSehCusYEhDK166EY3uT2oQ7P2cqlNU5Gh2m46TSJ9cJNxy15CDKPV8uwXicKLBr6Z
	Z8aNaxG5H72WV524sXCvqp7GdkPk0BtSvmNUxJ79UzY9pwuvA+dEnj6w9o57/a5QaGI4
	yXf8Y5EeBC5cGaD+7tKNWnqiBVetwZ+sqWkVAas8pbYX3BgAqEjC8t8Yfw9WN0+Va56a
	x4duz6qrEdYJI8ORf45//9VnsKC5LYdYURkn+1U0ehihJkobxLtXg3m4GmOKE17od0tD
	qDntIO1SSWdN5rcGrTvGXxeWYqQXtgeCba2GLpSCDEnt0WGoNq79NzQQE9huItI70Vk5
	oprQ==
X-Gm-Message-State: AN3rC/5ussh9DwO6uCgU/RzYh1s1gx573QoWpfd4wiTowonn/K8wueTA
	Qnx6V5zCfJjQUg==
X-Received: by 10.98.25.69 with SMTP id 66mr5961561pfz.84.1492655524444;
	Wed, 19 Apr 2017 19:32:04 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r73sm6790312pfa.65.2017.04.19.19.32.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 19:32:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 19:31:46 -0700
Message-Id: <20170420023147.1868-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170420023147.1868-1-raj.khem@gmail.com>
References: <20170420023147.1868-1-raj.khem@gmail.com>
Subject: [PATCH 4/5] aspell: Fix build with gcc7
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
X-List-Received-Date: Thu, 20 Apr 2017 02:32:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/aspell/aspell/gcc7.patch  | 40 ++++++++++++++++++++++++++
 meta/recipes-support/aspell/aspell_0.60.6.1.bb |  4 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/aspell/aspell/gcc7.patch

diff --git a/meta/recipes-support/aspell/aspell/gcc7.patch b/meta/recipes-support/aspell/aspell/gcc7.patch
new file mode 100644
index 00000000000..6ffd0772fa1
--- /dev/null
+++ b/meta/recipes-support/aspell/aspell/gcc7.patch
@@ -0,0 +1,40 @@
+From 8089fa02122fed0a6394eba14bbedcb1d18e2384 Mon Sep 17 00:00:00 2001
+From: Kevin Atkinson <kevina@gnu.org>
+Date: Thu, 29 Dec 2016 00:50:31 -0500
+Subject: [PATCH] Compile Fixes for GCC 7.
+
+Closes #519.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ modules/filter/tex.cpp | 2 +-
+ prog/check_funs.cpp    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/modules/filter/tex.cpp b/modules/filter/tex.cpp
+index a979539..19ab63c 100644
+--- a/modules/filter/tex.cpp
++++ b/modules/filter/tex.cpp
+@@ -174,7 +174,7 @@ namespace {
+ 
+     if (c == '{') {
+ 
+-      if (top.in_what == Parm || top.in_what == Opt || top.do_check == '\0')
++      if (top.in_what == Parm || top.in_what == Opt || *top.do_check == '\0')
+ 	push_command(Parm);
+ 
+       top.in_what = Parm;
+diff --git a/prog/check_funs.cpp b/prog/check_funs.cpp
+index db54f3d..89ee09d 100644
+--- a/prog/check_funs.cpp
++++ b/prog/check_funs.cpp
+@@ -647,7 +647,7 @@ static void print_truncate(FILE * out, const char * word, int width) {
+     }
+   }
+   if (i == width-1) {
+-    if (word == '\0')
++    if (*word == '\0')
+       put(out,' ');
+     else if (word[len] == '\0')
+       put(out, word, len);
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index 5a23754b74b..19a7155d66a 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 PR = "r1"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
+           file://gcc7.patch \
+          "
 SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
 SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
 
-- 
2.12.2


