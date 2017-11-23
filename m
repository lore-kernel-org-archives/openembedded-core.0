Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6014F786D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 04:11:31 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id l24so12996770pfj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 20:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0tx8fY2DksqjyAiSdydwQfXLtUbcrX4qinJnY4KCFcE=;
	b=k5aKVxSQBECtsWoarnGYkK8vtGQo5hj3YhGwkeswZe5wqYtBkVicBlbYdsQ6m3HO5R
	cFoJc4vL2//idRnQFikE9v4no6AaTT6n9Uh81veu4ZG2/meDYzvAipT9RUCCVH4kRm0s
	ylpVq1dTuDgpucICsryf6XfVphCmLojRqpJXG8kLtUDIuy4PYTV8oHBpILle5pFhXBVD
	qfnZDFEb6vYwwCAe0tYn7gVfMFgyrLAmujvOcyn0SBBlOwcVNvNfEr4FuFVZGVybmc0a
	27C2qSUlAXbz01ZELP+d4HRfGXeGHxAsUAgnffBjDWyP/qJJB48tGAaoiVAPW/objDCL
	WQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0tx8fY2DksqjyAiSdydwQfXLtUbcrX4qinJnY4KCFcE=;
	b=BW5DCCUTDOyFSVQSP94sE7D7qpFf7q6MJOHyuK0QU3QVgzmKgm1MT5LPwzHxIEG1ON
	i9mYchiSchsv4nJiQKKVjbGDmkaCn4OOaCYbaCo421Ukmrf0TESKzUbTSn3zOIqInU46
	J/NHR6xr+CIfStuf0upn97axUvPcl6Oa87TW8xcTXw3e63FMJ0LdF3Bd+/6XTiimunyi
	cTpJxVYtuCMhewX/b6GAoDmYwzhva75SOSntLN5C5QkcLBxjsvTvcUPByGc8PV680Noo
	Go4QiQeG/4Fedcii0KpEgy2ZuYAdhgxWjW9ka2D6FUENuN5gY0es3O32XVhFrpTWT3qM
	7e4A==
X-Gm-Message-State: AJaThX7mb6zyXVAW6vWW6QH5pwpEZeobewHvDkKY1UFbySLZSCd0s9oK
	vCaz8qCknAOz2cKTNBfa3AA=
X-Google-Smtp-Source: AGs4zMZa54Mf/UfQVZXvSp74L4Tu296WB4Hhv8uKk6BwMV2s9HqxlZROfmFPZQgQlt/E66dBQRacTg==
X-Received: by 10.98.59.139 with SMTP id w11mr21804585pfj.188.1511410293460;
	Wed, 22 Nov 2017 20:11:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:844b:1cda:e660:cce8])
	by smtp.gmail.com with ESMTPSA id
	h69sm16917150pfe.107.2017.11.22.20.11.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Nov 2017 20:11:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 20:11:31 -0800
Message-Id: <1511410291-31861-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [V2][PATCH] glibc: Security fix CVE-2017-15670
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
X-List-Received-Date: Thu, 23 Nov 2017 04:11:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

The GNU C Library (aka glibc or libc6) before 2.27 contains an off-by-one error leading to a heap-based buffer overflow in the glob function in glob.c, related to the processing of home directories using the ~ operator followed by a long string.

Affects: glibc < 2.27

v2]
capitlize "signed-off-by" in patch

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-15670.patch | 61 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15670.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-15670.patch b/meta/recipes-core/glibc/glibc/CVE-2017-15670.patch
new file mode 100644
index 0000000..ae050a5
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-15670.patch
@@ -0,0 +1,61 @@
+From a76376df7c07e577a9515c3faa5dbd50bda5da07 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Fri, 20 Oct 2017 18:41:14 +0200
+Subject: [PATCH] CVE-2017-15670: glob: Fix one-byte overflow [BZ #22320]
+
+(cherry picked from commit c369d66e5426a30e4725b100d5cd28e372754f90)
+
+Upstream-Status: Backport
+CVE: CVE-2017-15670
+Affects: glibc < 2.27
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog    | 6 ++++++
+ NEWS         | 5 +++++
+ posix/glob.c | 2 +-
+ 3 files changed, 12 insertions(+), 1 deletion(-)
+
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -206,6 +206,11 @@ Security related changes:
+ * A use-after-free vulnerability in clntudp_call in the Sun RPC system has been
+   fixed (CVE-2017-12133).
+ 
++  CVE-2017-15670: The glob function, when invoked with GLOB_TILDE,
++  suffered from a one-byte overflow during ~ operator processing (either
++  on the stack or the heap, depending on the length of the user name).
++  Reported by Tim Rühsen.
++
+ The following bugs are resolved with this release:
+ 
+   [984] network: Respond to changed resolv.conf in gethostbyname
+Index: git/posix/glob.c
+===================================================================
+--- git.orig/posix/glob.c
++++ git/posix/glob.c
+@@ -843,7 +843,7 @@ glob (const char *pattern, int flags, in
+ 		  *p = '\0';
+ 		}
+ 	      else
+-		*((char *) mempcpy (newp, dirname + 1, end_name - dirname))
++		*((char *) mempcpy (newp, dirname + 1, end_name - dirname - 1))
+ 		  = '\0';
+ 	      user_name = newp;
+ 	    }
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,9 @@
++2017-10-20  Paul Eggert <eggert@cs.ucla.edu>
++
++       [BZ #22320]
++       CVE-2017-15670
++       * posix/glob.c (__glob): Fix one-byte overflow.
++
+ 2017-08-02  Siddhesh Poyarekar  <siddhesh@sourceware.org>
+ 
+ 	* version.h (RELEASE): Set to "stable"
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 135ec4f..ed4ea4f 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
+           file://CVE-2017-15670.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


