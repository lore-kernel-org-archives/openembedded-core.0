Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 86F8F71B99
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:24 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id m9so17807828pls.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=f8F5t1fxjZbpdCZEDpSQhbYzAVgvLDy3RxWpO5z5Uto=;
	b=sQXheZgBbynVoD34sm/a17O8H8ty8JMhs0mgYETzbowp1iNdcEZSwpL4B6VNqOjhFz
	Crv/uLVB4lwaM6nObKv1+Mbx5hjjgyirgV/orPDgAzTk6Sk5U+ZiLAv+NeIK50oWC+XF
	z2m0zulbQN1XWJ4biD22Mxjf+MN+q7YhouB7inwMoo6sfkT8/I/z5IieXkmyIjuiUkCt
	58c8t8+dNcfWbfC7YqimUIY+y1by/d/I7lwuZ7RHyLuf3g557VVTtDrVo2Vl0mUsWUWu
	CVex2NzqSWqlWIlssnloVKsQzhcqCBAsxPgUkZlbGsLg+r6g6/+9rGrakdCH/uOYt2Gv
	tIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=f8F5t1fxjZbpdCZEDpSQhbYzAVgvLDy3RxWpO5z5Uto=;
	b=r6q9Q3BOFxcQWzgMdr98KpgyLGy92AoUxkU216gD8Karnf8UGMR3TCqc3gOVHI8b5f
	Tof78NvYupdOi2w+oG9YJx/qm4b8GZkVM1kF13mA39fdqz2HL39AXkwU/dUAqS+xn5sd
	pAyxnGiGsCgvZOq9fTl7yGkbQZOB/8QAgIg1JRu4n9MBGLzpDLl38u+5gkwQJ/dE9xGj
	jG4mkQ4MXF9zhkPybUvAb21uDdPEWs5XIP2saxYnLR6Z9N0n9UM59xUIj1ETEZWToK1s
	OZbyI72ZRES9JDanqfPUQyJv40Doo/9+/bB8fH1yEKQCU3anRht3ugyBTIPJJmT2xD2t
	0imw==
X-Gm-Message-State: APjAAAWD9kj19OqKhXO7vDrGzhW4a/JCo93u8Eg7/t81GKHF99lBcGEc
	M9lvD+ajUKUyHXKRBvwhgO0oeVXx
X-Google-Smtp-Source: APXvYqwrWv+ALibI/RWjwrqgbdpDaYqPXcMypLSuxZqhnk8X004akKT08VOtLK83nroRd7xTW4djXA==
X-Received: by 2002:a17:902:1102:: with SMTP id
	d2mr70122746pla.149.1563719125531; 
	Sun, 21 Jul 2019 07:25:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:24:50 -0700
Message-Id: <3103f407ff0c579c7e5887fd925d52d5c92c83f9.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 01/30] glibc: Security fix CVE-2019-9169
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:24 -0000

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


