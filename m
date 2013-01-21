Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxHA4-0008Dw-U0
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 14:11:46 +0100
Received: from mail-bk0-f72.google.com ([209.85.214.72])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:56:10 -0800
Received: by mail-bk0-f72.google.com with SMTP id jf3so6607808bkc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=HYVkvWRbWBQ2SFUBRLYcfGO31d6DgXZ9qU7hlQ9r/LA=;
	b=XIU2N0Np6HMEJneVSGEjknuHvkbA2FuOWwyZbkqXpEnHyd+Edy8qESacspZI1Pmr2C
	xnwO4Z2yCE1ffBTnsxG6XDM0rKEu6S+1eWOJv5pRIx+e5sd0rU8YA2y+EzOj9s4SeXHn
	9oU/7sJkeh1KBYXAvJR9IFtzaOXskLMzCqihKbkGJUL0LuIpfJbSi6Shqsij2sffnuNG
	9so+ie5JJNMPIdfJdolSDyFwvh5Qj4drd+qWwjEtULzS9cW0N74M7uHqsCc2b8xEFJAl
	PYtKXEoxIbb2e7GKYPZze+rYgYtGTH69a+z3aGmkpX0RDZYrorVi6jZ7Csa4BsqPuq2n
	U8hQ==
X-Received: by 10.180.39.143 with SMTP id p15mr15121533wik.14.1358772967160;
	Mon, 21 Jan 2013 04:56:07 -0800 (PST)
X-Received: by 10.180.39.143 with SMTP id p15mr15121513wik.14.1358772966979;
	Mon, 21 Jan 2013 04:56:06 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id i2sm16763551wiw.3.2013.01.21.04.56.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 04:56:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 12:54:08 +0000
Message-Id: <1358772848-9474-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlGjt5g9Z478FDgvaZMXz0GumyKH1nn1uRJBRUvj5zHnZYC+2nmv5ruLdTiPjsKCAlneBRIQ6Yq5IXRu++MqW1xIdEQ9fguLBZMt3j7uJR54Js8RN1FXZPFzkmdPBcNWZWhN+y3Wabg2Y+9C5zj4oePDGTqAUQlvMYgmdKxzQPdEYJxGAAMDgIi6AYUzqJGikYNZ3N3
Subject: [PATCH] systemd: update uclibc patch headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 13:11:47 -0000

Discussion has revealed that upstream has formally rejected patches to support
uclibc, so mark this in the headers.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch     |    4 ++--
 .../systemd/systemd/systemd-pam-configure-check-uclibc.patch       |    2 +-
 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch    |    2 +-
 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch  |    2 +-
 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch |    2 +-
 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch   |    2 +-
 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch   |    2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch b/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
index 35f1467..2063268 100644
--- a/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
+++ b/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
@@ -1,9 +1,9 @@
 on uclibc secure_getenv is not available
 therefore default to using getenv instead
 
-Singed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Denied [no desire for uclibc support]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Pending
 Index: git/src/shared/missing.h
 ===================================================================
 --- git.orig/src/shared/missing.h	2012-09-22 18:46:44.141282145 -0700
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch b/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
index c69a8ab..d096983 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- systemd-185.orig/configure.ac	2012-06-04 14:15:16.000000000 -0400
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
index 1ed4d30..1d4f273 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/src/nspawn/nspawn.c
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
index 8bc7a6f..7cf9626 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/src/journal/journal-file.c
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
index 8845624..533a239 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
@@ -1,6 +1,6 @@
 Prefer getty to agetty in console setup systemd units
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [configuration specific]
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 ---
  units/getty@.service.m4        |    2 +-
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
index be4d3e3..fb8443d 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/src/journal/journal-send.c
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
index cdf8d61..f3b1ace 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- systemd-pam-185/src/fsck/fsck.c.orig	2012-06-22 23:22:22.000000000 -0400
-- 
1.7.10.4



