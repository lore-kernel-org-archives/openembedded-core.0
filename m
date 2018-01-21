Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1295278650
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 17:59:55 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 136so5276015pgd.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 09:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sbm0EIalpOmR/etGuK/J9phA7iMg0Ve3xA/pBcxKbQw=;
	b=T5CRHtPs/nFGqtUEjKbqoyTMAyazyb8oIaESq80JCPMiR8hIsyuul0a+GpwRK2IdEQ
	1xumc2h4Nl2ll+uvdpqt29w9kS7R1QEiV1AWUNFL1oGzR/inVMwS6CY1Wry4udLel1Xv
	aI+6JCEPuE+xlLVaJvA+fzPS1O5FAepxT6mrtWlhe+uT/MiMo/cmycqdBIsIRmPDjMQ1
	1quSJWiO0LPw5843dwj7psMRV7mWjIFQqGYhWP4gB8ElZqsQ5pqkKvp/YBjI8mX/uZAF
	REbYrcMf7B0Ce8kluCanxEoYpROUoBlDgiuNTDWz/myFvidc9SRbHfoq9fxNocKTwwoK
	HvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sbm0EIalpOmR/etGuK/J9phA7iMg0Ve3xA/pBcxKbQw=;
	b=ZL3CpFBb9DYPfORZwAJKVB02r6AFC53xP8qNKSvDsmqOgvjvnxjaxbbTi72W02fJhV
	T4cAn+KgAFKkU9dg3uFO7QIdhFGGgLU1dQt5HYVEevSQ9bQebHtm0QPkYzGkhKJATTqH
	jtzS9zP0+sXnwgHF7uk1VfmO18C0a3I1LzUAnDbHsGoIAHQYIM7dHarPLfH41+vv4tpx
	LMOx7IvqsWrX8gTywqm2216SOO068fdKL7gT+ozk9chHm+3diLpoAULQeCDuFaKcjyKb
	EQOCVxweQM5PDm4BAnOI2LIYKoixPSANv2KWTzjGMKD0h3dU0LsqS2R8tYBX2/L9vroo
	LDVA==
X-Gm-Message-State: AKwxyteaeSC5vXIXwVC8LFLyxdMkk0ng8NPbNmPKbMQzfdIX9XJ/W7q0
	UGwpetHZ8mnMMYItrQHQt0H6wg==
X-Google-Smtp-Source: AH8x227LuAGB+Im3kK9PzQO4FiS5seLJmu93vbpQ/0TuWcGbsM7cSERSQM8dL2AvcyIGFIxY2Fqdsg==
X-Received: by 10.98.30.1 with SMTP id e1mr5886242pfe.37.1516557597164;
	Sun, 21 Jan 2018 09:59:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:a4cf:fc1a:2afa:5e49])
	by smtp.gmail.com with ESMTPSA id
	w83sm29167645pfi.56.2018.01.21.09.59.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 09:59:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 21 Jan 2018 09:59:54 -0800
Message-Id: <1516557595-17124-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc: Security fix CVE-2017-15671
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
X-List-Received-Date: Sun, 21 Jan 2018 17:59:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

affects glibc < 2.27
only glibc in current master hash: 77f921dac17c5fa99bd9e926d926c327982895f7

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch | 65 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-15671.patch b/meta/recipes-core/glibc/glibc/CVE-2017-15671.patch
new file mode 100644
index 0000000..9a08784
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-15671.patch
@@ -0,0 +1,65 @@
+From f1cf98b583787cfb6278baea46e286a0ee7567fd Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sun, 22 Oct 2017 10:00:57 +0200
+Subject: [PATCH] glob: Fix buffer overflow during GLOB_TILDE unescaping [BZ
+ #22332]
+
+(cherry picked from commit a159b53fa059947cc2548e3b0d5bdcf7b9630ba8)
+
+Upstream-Status: Backport
+CVE: CVE-2017-15671
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog    | 6 ++++++
+ NEWS         | 4 ++++
+ posix/glob.c | 4 ++--
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -20,6 +20,10 @@ Security related changes:
+   on the stack or the heap, depending on the length of the user name).
+   Reported by Tim Rühsen.
+ 
++  The glob function, when invoked with GLOB_TILDE and without
++  GLOB_NOESCAPE, could write past the end of a buffer while
++  unescaping user names.  Reported by Tim Rühsen.
++
+ The following bugs are resolved with this release:
+ 
+   [16750] ldd: Never run file directly.
+Index: git/posix/glob.c
+===================================================================
+--- git.orig/posix/glob.c
++++ git/posix/glob.c
+@@ -850,11 +850,11 @@ glob (const char *pattern, int flags, in
+ 		  char *p = mempcpy (newp, dirname + 1,
+ 				     unescape - dirname - 1);
+ 		  char *q = unescape;
+-		  while (*q != '\0')
++		  while (q != end_name)
+ 		    {
+ 		      if (*q == '\\')
+ 			{
+-			  if (q[1] == '\0')
++			  if (q + 1 == end_name)
+ 			    {
+ 			      /* "~fo\\o\\" unescape to user_name "foo\\",
+ 				 but "~fo\\o\\/" unescape to user_name
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,9 @@
++2017-10-22  Paul Eggert <eggert@cs.ucla.edu>
++
++       [BZ #22332]
++       * posix/glob.c (__glob): Fix buffer overflow during GLOB_TILDE
++       unescaping.
++
+ 2017-10-13  James Clarke  <jrtc27@jrtc27.com>
+ 
+ 	* sysdeps/powerpc/powerpc32/dl-machine.h (elf_machine_rela):
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 04d9773..0ba29e4 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
            file://0029-malloc-add-missing-arena-lock-in-malloc-info.patch \
+           file://CVE-2017-15671.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


