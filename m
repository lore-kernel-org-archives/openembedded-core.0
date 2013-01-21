Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGop-0006f6-Ag
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:49:58 +0100
Received: from mail-wi0-f198.google.com ([209.85.212.198])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:33:05 -0800
Received: by mail-wi0-f198.google.com with SMTP id c10so7285419wiw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=N1cVhetV939+KLmgoMgDXyCcp23Q7JgKbYXAj1T3Mqg=;
	b=dSW1eXQXZjXdDxJ8+n/lKy4EwM/NuaYOCLPfTurNXd2jeyzNpRJ9r95XVwEEvf12BI
	Uf3ELDaL7G5sB5qRS/d2TLDltGG0Y2A+xEVpjYa2FbFWwnrqG3zMykjYJbA24to0fWm+
	jhfhVygIQhfdofH/2AU2b310ZM4127dGcDc2OTuKobfUZiWNkomO2RVp6hNN+Z7jqJUG
	wAEY/0GKfclR6hu1OUXBFiTaMbbulp7P9qA+3b6AEIEAO4Bb26ktHieHEEzU8smvWGL4
	sCDi0RxTys9UWEU4CcpEiSaQwGSLN92H2ASsp17H0kcJOONMnkFgLWTv5I/ClFn2FYf5
	rD8Q==
X-Received: by 10.180.19.99 with SMTP id d3mr15142121wie.4.1358771651496;
	Mon, 21 Jan 2013 04:34:11 -0800 (PST)
X-Received: by 10.180.19.99 with SMTP id d3mr15142112wie.4.1358771651409;
	Mon, 21 Jan 2013 04:34:11 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bz12sm18478543wib.5.2013.01.21.04.34.09
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 04:34:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 12:32:13 +0000
Message-Id: <1358771533-8863-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnB0TpGlproBBFJ1ItVDpE9hU9lYtEWziXpte5kSC/Af2yiuW47AxlorSTiIMxK3XvjqeHwsTZpAkLX7rNeyG+6EEVZB14ttNNK3hsXK/eEho59Q9ayMo2bqvJTClUgcBJBi1om/dfNrwWLLIU9zpRO/JuHw6xUVR5POb0ua76gQHIcBl+MLP644qosA4xXlcO+i9V8
Subject: [PATCH] systemd: add missing patch headers
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
X-List-Received-Date: Mon, 21 Jan 2013 12:50:06 -0000

The reverts were by Koen and are literal revert commits, the uclibc patches were
mostly introduced by Khem.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch |    3 +++
 .../0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch      |    3 +++
 .../systemd/systemd/systemd-pam-configure-check-uclibc.patch        |    3 +++
 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch     |    3 +++
 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch   |    3 +++
 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch  |    1 +
 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch    |    3 +++
 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch    |    3 +++
 8 files changed, 22 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch b/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
index 7de2705..1e208a2 100644
--- a/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Backport [revert]
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
 From 2003e63f48cee2f497de7b90b66284f98c1c9919 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 10 Dec 2012 12:24:32 +0100
diff --git a/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch b/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
index e5e8d7d..96ad323 100644
--- a/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
+++ b/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Backport [revert]
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
 From 8079db861b8ffdce69fa10a9ab9ef4740045187f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 10 Dec 2012 12:25:00 +0100
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch b/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
index 1bfc3bd..c69a8ab 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 --- systemd-185.orig/configure.ac	2012-06-04 14:15:16.000000000 -0400
 +++ systemd-pam-185/configure.ac	2012-06-21 22:57:10.000000000 -0400
 @@ -63,6 +63,23 @@
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
index 449c27f..1ed4d30 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Index: git/src/nspawn/nspawn.c
 ===================================================================
 --- git.orig/src/nspawn/nspawn.c	2012-09-22 17:57:05.000000000 -0700
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
index 089ba64..8bc7a6f 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Index: git/src/journal/journal-file.c
 ===================================================================
 --- git.orig/src/journal/journal-file.c	2012-09-02 09:49:15.126089594 -0700
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
index 3e5ea71..8845624 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
@@ -1,5 +1,6 @@
 Prefer getty to agetty in console setup systemd units
 
+Upstream-Status: Pending
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 ---
  units/getty@.service.m4        |    2 +-
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
index 8de9a3a..be4d3e3 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Index: git/src/journal/journal-send.c
 ===================================================================
 --- git.orig/src/journal/journal-send.c	2012-09-02 00:10:08.748768268 -0700
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
index ee63329..cdf8d61 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 --- systemd-pam-185/src/fsck/fsck.c.orig	2012-06-22 23:22:22.000000000 -0400
 +++ systemd-pam-185/src/fsck/fsck.c	2012-06-22 21:15:56.000000000 -0400
 @@ -36,6 +36,8 @@
-- 
1.7.10.4



