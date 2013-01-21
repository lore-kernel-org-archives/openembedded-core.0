Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxM5A-0004JZ-5T
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 19:27:09 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 10:11:25 -0800
Received: by mail-lb0-f197.google.com with SMTP id gg6so5934129lbb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 10:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=HYVkvWRbWBQ2SFUBRLYcfGO31d6DgXZ9qU7hlQ9r/LA=;
	b=pypCX8Yr1KctoDgw1HPCUoNpK1K9OU5FVKraSWtVfszfyKR6NQxXrqgpRx+oRVL1+S
	A6wVwkZj6wYQTkEYXyEQFiT8CDY6YSvkPecnzrArHZ+0CGibNilyqldMAzi4HrIJI2J8
	D+CkgxNOrZHh5BE1P7fGoZahX7lBrMNaTpXjDY2DE9NUbvwN57/f1UPlFVeaTX80NIsN
	HfQ6GMhQF5mktgzl22NeUYKE2gcPJrseN8WjPaAjBufJ4/BBa001vhCgxbfe7FPU8BMI
	9NpJPb15vzsVlIv3JNswiTm3nwFgI01qA9wRqWUKe0uYkmsjqFzalUkwcwjAm9vJISjQ
	JLKg==
X-Received: by 10.180.84.131 with SMTP id z3mr16925322wiy.25.1358791883689;
	Mon, 21 Jan 2013 10:11:23 -0800 (PST)
X-Received: by 10.180.84.131 with SMTP id z3mr16925305wiy.25.1358791883431;
	Mon, 21 Jan 2013 10:11:23 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm19814796wiv.6.2013.01.21.10.11.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 10:11:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 18:09:18 +0000
Message-Id: <f386eed9181846f0e51aff0f128fc52291106b35.1358791697.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358791697.git.ross.burton@intel.com>
References: <cover.1358791697.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkp0Z4tgMUxm4YtPrayMx2HeGD2jbtrzpPsm9/3IjhoK/jpmAzP67/5VgnnCdFTTukQ3pBNZvWA+wC8tuAwrXf6uiQIMFXOUcQa81A/a3QosWKnUQ5bvGV+OqYQwvsEnPW1GC8arUeSxVBkzz5aN6KQbxT4TZtSFPbyPBiMMCrQgTMQ8Yswkkb1TXHxM9PmMKiL531D
Subject: [PATCH 1/4] systemd: update uclibc patch headers
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
X-List-Received-Date: Mon, 21 Jan 2013 18:27:14 -0000

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



