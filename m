Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 387347E34F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:50:41 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a23so1690813pff.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f8F5t1fxjZbpdCZEDpSQhbYzAVgvLDy3RxWpO5z5Uto=;
	b=nWpi1XRuvEolVSkEYhk0fH24zSrLwCumU9C6pk6Nr+850v4XHpmnwr+cxb1DDEMMlt
	loXTXVmjx6aF6zm5sb7ngeYSPqujnpul7uD8MzZlIkUDIYPSTIgIi2yfW6GbIlwPY0ZZ
	XctTkJOMasrFEqbjiY2og6QJdS+AEznLHgBd4C+GlkG9l1Vyify9OgjWfV2wRrr7gPNO
	36xPx6W5vvLtCYqqbUwAEOc9MEPdOCNNCYbBmZ/cNyQcbPIq/lUVSu4IoToubgDBLTqF
	IlEZ3VM2urBRu1NWmomqJpQWoaTpFWIBA7wEpIBuQIwIrMowqkzNWXDjIB5T6+7goch9
	JK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f8F5t1fxjZbpdCZEDpSQhbYzAVgvLDy3RxWpO5z5Uto=;
	b=FFFD1vbdAWoYXVM+CoIyQGUkIgHzFUIYKmif75aHL4VHjknRDt44moMU0Osw3lsQpf
	gWQMsqudslTfZln7f4yTFcmfBaXToCk+nZIhvtXCP+DEkXYTC7l3QtZLrqQKKNAntyBp
	LumOL4lFhYM8DtQ/+y3OKu6rP/23V3LhR7I/Y+o8Xi/Mc4MjhIsSKZaFG3CG/BPPfc17
	Ej6oxniqBkuzC1rFYPDeSGTKB7ohTNxl20cmBzGzIk8Ckapq5ByjgOdrA+eu7ndW0Nny
	6m+DD9J+CkHkXG9GaaPAw8CB+j2WN8L+ipWH21cRk2gC6UQ/PBRKrbAlvhNsCU91M8DX
	G9zA==
X-Gm-Message-State: APjAAAWvlovGhV2ivkssMt1ac9HI6Jv/IlgKlbJ3sySd5yJzUBU7XkxX
	5pBmWlLOsimFKP/CTSDe1014umjo
X-Google-Smtp-Source: APXvYqwrmjFyHqL2bBkJGus36W5hxm8sqECMqIaIuHXS9SGJV1K8R/C8yRq+qWjDxBZsJ3yD4f0/bg==
X-Received: by 2002:aa7:9356:: with SMTP id 22mr48359122pfn.188.1559137842248; 
	Wed, 29 May 2019 06:50:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id r7sm5976891pjb.8.2019.05.29.06.50.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 06:50:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 06:50:30 -0700
Message-Id: <1559137838-8972-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 1/9] glibc: Security fix CVE-2019-9169
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
X-List-Received-Date: Wed, 29 May 2019 13:50:41 -0000

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


