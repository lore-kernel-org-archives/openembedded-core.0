Return-Path: <>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF1E7C423
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 13:00:16 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x85-v6so10594317ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 05:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gv+YOR2O7HL+rm3raGKqCCpMjVIkJIO48TtoFzhB15k=;
	b=iirSl/RcYcDH6G+AYTnxMdkz7ElUpbb3bzfgKgZSTY5qmaXByLEokYQgGLs6eSDSgR
	PEl/4PU/L/vTVxm+hA4Jsa/AgmTgfIBDKWHHwLvfQYk4gzWPo/Va6HItMmRB9JLQQbJu
	F5JGR+diPbtKcyFIIn72FjiCswoMjA6TSvCYX1QrJ6cO++ELYqUzQsXnwC15LkUQNorU
	WCYWUACg8FLSRV1xRlYf/zeMc56BG4m7tTVwr91+dcjqg/GYksoc0uheVB/WGgmsG9gI
	ZfyzOTEqtWqmpcFi1Na9fS73btmzSpkkJNBBM4RbHEeZkFg6xZIa1AjCfEDfTFpt3WSr
	2UNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gv+YOR2O7HL+rm3raGKqCCpMjVIkJIO48TtoFzhB15k=;
	b=Sh52/bSbk4eLrRAxgizEnrOR5ly5HiDJvclqo1SISh8czQP1/nOtwV281H/UFTrpWe
	k4G0BUnK2P4ilAO3kZQuToZfrr44dXFui8dG2h1bO508qJfcBqHRu5kcJUkyNibfj5qW
	7sNd+dU0E3hpgLRSeQ59WscrTeLj62hEaiBHv6/qRZUlBsxn0VMp6mF+/6FJAb3/H3WK
	j1+UZvjlwgiebXsNL+1cZgeBYiMd24XwmUNx5NCApOaj+MBO7ELJIAMfULDccMlyOLR4
	EMXrmengHPcu59TEIShJsnnapQKv0GdiJe+guvjR2bHAAv+JN18x7jUlJMRWG0CG+Fq2
	LmsQ==
X-Gm-Message-State: AJcUukcGqto+aqTYTcgoE5SIF9N9VJnGW0t9UyURhbv694ay+SnzPfPd
	pHtYfkfOGZnvC6FCMy/1jFQ=
X-Google-Smtp-Source: ALg8bN6F3/9r4IX43Bm/KFh/RX9Rc7KDZ//1NHHBTW2cf6CT7/8GRJh4uDtxvC3QDVVXe4xnbuui4w==
X-Received: by 2002:a2e:5109:: with SMTP id
	f9-v6mr12010626ljb.52.1548507617002; 
	Sat, 26 Jan 2019 05:00:17 -0800 (PST)
Received: from localhost ([80.64.92.72]) by smtp.gmail.com with ESMTPSA id
	h82sm2093566lfg.94.2019.01.26.05.00.16
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 26 Jan 2019 05:00:16 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 14:57:59 +0200
Message-Id: <1548507480-22805-6-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
References: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
Subject: [PATCH 5/6] subversion: drop lost patch
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
X-List-Received-Date: Sat, 26 Jan 2019 13:00:17 -0000

Commit 5bb47984af79 "subversion: 1.9.7 -> 1.10.0" dropped
serf.m4-Regex-modified-to-allow-D-in-paths.patch
from recipe, but left the patch itself in source tree.
Remove this patch since nobody uses it.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 ...erf.m4-Regex-modified-to-allow-D-in-paths.patch | 32 ----------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/serf.m4-Regex-modified-to-allow-D-in-paths.patch

diff --git a/meta/recipes-devtools/subversion/subversion/serf.m4-Regex-modified-to-allow-D-in-paths.patch b/meta/recipes-devtools/subversion/subversion/serf.m4-Regex-modified-to-allow-D-in-paths.patch
deleted file mode 100644
index 9fed3cf..0000000
--- a/meta/recipes-devtools/subversion/subversion/serf.m4-Regex-modified-to-allow-D-in-paths.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f1b6e49f12a18eabe88eb732b578a16281d09499 Mon Sep 17 00:00:00 2001
-From: Jose Lamego <jose.a.lamego@linux.intel.com>
-Date: Thu, 2 Jul 2015 11:37:43 +0000
-Subject: [PATCH] serf.m4: Regex modified to allow '-D' in paths
-
-Upstream-Status: Accepted
-
-The patch is merged by subversion upstream with replacing '[[:space:]]' with ' '.
-
-http://svn.apache.org/viewvc/subversion/trunk/build/ac-macros/serf.m4?r1=1594156&r2=1689824  
-
-Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
----
- build/ac-macros/serf.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/ac-macros/serf.m4 b/build/ac-macros/serf.m4
-index ae11e75..ff8cbae 100644
---- a/build/ac-macros/serf.m4
-+++ b/build/ac-macros/serf.m4
-@@ -168,7 +168,7 @@
-         if $PKG_CONFIG $serf_pc_arg --atleast-version=$serf_check_version; then
-           AC_MSG_RESULT([yes])
-           serf_found=yes
--          SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_pc_arg --cflags | $SED -e 's/-D[^ ]*//g'`]
-+          SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_pc_arg --cflags | $SED -e 's/ -D[^ ]*//g' -e 's/^-D[^ ]*//g'`]
-           SVN_SERF_LIBS=`$PKG_CONFIG $serf_pc_arg --libs-only-l` 
-           dnl don't use --libs-only-L because then we might miss some options
-           LDFLAGS=["$LDFLAGS `$PKG_CONFIG $serf_pc_arg --libs | $SED -e 's/-l[^ ]*//g'`"]
--- 
-1.8.4.5
-
-- 
1.9.1


