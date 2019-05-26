Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id EB0C17E214
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 14:24:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c6so8034154pfa.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=f8F5t1fxjZbpdCZEDpSQhbYzAVgvLDy3RxWpO5z5Uto=;
	b=ktdMe0d/WKSWQ78lRJznPH/KP6amH278b113ohekF8PRrzMvDNRz3IlnVjCvwrMCA1
	CTKQuScS18XqMg4dRuRp5O2yQ3/9Tn9mhHyDENGGdlkLO7Jo3Juutw0pcqMIkioZ/t+3
	8aCulI5P6kkKNhK2znwhXDqqH511+2jWaEx3/KiTrsvYnshNUdZnl7gksheM+7/EaQJ/
	H1I+va2adfcbhAyISyrayPnZnPyWbFHgWONmFhaPEowWNW+XMsrfSSbTvQJA0mHd1fCP
	5n/159uD3EZyXZw9oZG9c2lG5cWK19Ssm87P5uTO+zzgpw+iP4jfjN/WWjXBkuuy+KcX
	lV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f8F5t1fxjZbpdCZEDpSQhbYzAVgvLDy3RxWpO5z5Uto=;
	b=sEettco9zo1cjHGoYAZVYK78A6y8/IAqjha5EpIElKBmZQL36WGmSN/JBiW+IlC3xP
	YZNy4q1zXYmEImHpbM6KZh3tcCki/tIydThS6bSZdJdNA1+lsA8TQaA3uRLSXZYREJNP
	HVEaOp70W9qkVP/uanBeFiB7XPZq6yOdtl1FgM573tc1nljN+KkNQmiN+hWE7y3/V/81
	pmJBFb7w5LttOyWU/p7WCOA8cewqDDhQsJ1lSEOWJXss0371DJIfbwUk5Wfukc+LCJ2h
	n3hYJ+KRHyJ1CYz6zcM2GRO+NaptuYdISNXt3rnPziOhlttaAjNZIl5lZwRiWIoyKA8o
	WZzw==
X-Gm-Message-State: APjAAAXLd46H0ksLtXI8g9d9gKtM3W60Oq36avk3x6dAWMURnHuBAjx8
	29s/mpMhTOFfeIZUXiXd8WhgR62U
X-Google-Smtp-Source: APXvYqxVS05YmJ3IhpvcgB5wLtL6SeYnTXKV4YMH9kLO26HgxN+ixf9b+4rCPBzhXOU59wBWUKUOFA==
X-Received: by 2002:a63:5014:: with SMTP id e20mr116916751pgb.2.1558880646654; 
	Sun, 26 May 2019 07:24:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8c20:a770:5243:e558])
	by smtp.gmail.com with ESMTPSA id
	79sm9416292pfz.144.2019.05.26.07.24.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 May 2019 07:24:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2019 07:24:04 -0700
Message-Id: <1558880644-32314-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH] glibc: Security fix CVE-2019-9169
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
X-List-Received-Date: Sun, 26 May 2019 14:24:06 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch | 63 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb             |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
new file mode 100644
index 0000000..14cfaa3
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
@@ -0,0 +1,63 @@
+From 583dd860d5b833037175247230a328f0050dbfe9 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 21 Jan 2019 11:08:13 -0800
+Subject: [PATCH] regex: fix read overrun [BZ #24114]
+
+Problem found by AddressSanitizer, reported by Hongxu Chen in:
+https://debbugs.gnu.org/34140
+* posix/regexec.c (proceed_next_node):
+Do not read past end of input buffer.
+
+Upstream-Status: Backport 
+https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=583dd860d5b833037175247230a328f0050dbfe9
+
+CVE: CVE-2019-9169
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog       | 10 +++++++++-
+ posix/regexec.c |  6 ++++--
+ 2 files changed, 13 insertions(+), 3 deletions(-)
+
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,11 @@
++2019-01-31  Paul Eggert  <eggert@cs.ucla.edu>
++
++       regex: fix read overrun [BZ #24114]
++       Problem found by AddressSanitizer, reported by Hongxu Chen in:
++       https://debbugs.gnu.org/34140
++       * posix/regexec.c (proceed_next_node):
++       Do not read past end of input buffer.
++
+ 2018-09-30  Martin Jansa  <Martin.Jansa@gmail.com>
+ 	Partial fix for [BZ #23716]
+ 	* locale/weight.h: Fix build with -Os.
+@@ -10917,7 +10925,7 @@
+ 	(CFLAGS-wcstof_l.c): Likewise.
+ 	(CPPFLAGS-tst-wchar-h.c): Likewise.
+ 	(CPPFLAGS-wcstold_l.c): Likewise.
+----
++
+ 2017-12-11  Paul A. Clarke  <pc@us.ibm.com>
+ 
+ 	* sysdeps/ieee754/flt-32/s_cosf.c: New implementation.
+Index: git/posix/regexec.c
+===================================================================
+--- git.orig/posix/regexec.c
++++ git/posix/regexec.c
+@@ -1289,8 +1289,10 @@ proceed_next_node (const re_match_contex
+ 	      else if (naccepted)
+ 		{
+ 		  char *buf = (char *) re_string_get_buffer (&mctx->input);
+-		  if (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
+-			      naccepted) != 0)
++		  if (mctx->input.valid_len - *pidx < naccepted
++		      || (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
++				  naccepted)
++			  != 0))
+ 		    return -1;
+ 		}
+ 	    }
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 72cee04..1bcec3e 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -47,6 +47,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch \
            file://0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0034-inject-file-assembly-directives.patch \
+           file://CVE-2019-9169.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


