Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5FF60079
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 17:19:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r82so18351576wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 10:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=nuCA5RcUDSTHgsHP97osLdecXDhB0oA7LTyUDJooPi0=;
	b=acicQeRlGYQKU6lqDshrVjY/8SqUQFAxuxCPX8DaZlGl8kN2e8IjZG1oibYDBGKSGh
	JGcnvMoqehiXDyaRwEdW5Hf08EEM7KGLiCOQOGKhL1P5HCUu4wsjIYvE4EXl1aflCk9x
	qcPTD+OiTwUmnzdaMnPjoDViemzHZGjjMCN4lsExwAvpgJkpFMwWuwYzOU5iecic3xah
	Vo2FUKPHN6uxO8EM8sjgjqE70k2EQQOB19ra5k+jA0yAg/Ne4Z9bRHtOWISAGrVu72By
	4VUzqY3crbhLlauweUwW4Qk+DNy2dNh+MO6H0uYZc/2f84JHhPNr9V286Rh5WClQaATv
	f1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nuCA5RcUDSTHgsHP97osLdecXDhB0oA7LTyUDJooPi0=;
	b=RNmeNTtI8QE6yt23pjqIKdhTr0r4vTI/V1BElCZhDXHLfF5+LweRWUMsu+GYcI5rcP
	vDLQ+Q/5UlWXrBWeKEneP//LGpXeHtUD3w4sNQFDAtL/cxjeq1G8Ge/6rdlrZNx4bJP3
	rIqsQUAa6RJBYXr4G8KHyUiFxM4Ehb/SJ/hgOd6HFgwwyXALhtaa05XBt53fLYRmPnu3
	g+4d3BxxbOs+RzUC2P/7zXuRt3Z3OK1X0I7mGhmbckskXGUsh3EWT8o5/pcdQ+gng8L8
	2IDMWP/ybYEd+1KfLGMjuSlB+lSRush5/PHA76eWF07e293594LeQ8TlgiQsuO8uHz08
	toeg==
X-Gm-Message-State: ALQs6tC3dIQM70UnVFraDsOe6hSRfO87Ib+YVOk0Pa5RtMVGMwFIgBKj
	z4M4BnOhBr1sQj2rMyHjD1tCbmwJ
X-Google-Smtp-Source: AIpwx4+LzHv+1r1bkSYcCx+IgEhmHdLrn0WO40snZqgjGQHeZIxj1gekUiIH77puCpfOTZuGAf6U9g==
X-Received: by 10.28.32.145 with SMTP id g139mr563257wmg.1.1523294357823;
	Mon, 09 Apr 2018 10:19:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e11sm1577257wma.4.2018.04.09.10.19.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 10:19:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 18:19:15 +0100
Message-Id: <20180409171915.11287-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] meta: add missing Signed-off-by and Upstream-Status tags
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
X-List-Received-Date: Mon, 09 Apr 2018 17:19:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch    | 2 ++
 .../0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch    | 2 ++
 .../perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch                 | 2 +-
 .../0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch      | 1 +
 meta/recipes-sato/webkit/webkitgtk/x32_support.patch                   | 3 +++
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
index 203c5850533..6b7ca7da3ee 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
@@ -7,6 +7,8 @@ Subject: [PATCH 1/2] Only use --sort=name on versions of tar which support it.
 
 Signed-off-by: Michael Hansen <michael.j.hansen@hp.com>
 Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Upstream-Status: Backport
+
 ---
  opkg-build | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
index 0a7403d6747..e338914b093 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
@@ -8,6 +8,8 @@ Subject: [PATCH 2/2] opkg-build: Use local time for build_date, since opkg
 
 Signed-off-by: Michael Hansen <michael.j.hansen@hp.com>
 Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Upstream-Status: Backport
+
 ---
  opkg-build | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch b/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
index bb6c573c9a4..ff3d6dc0997 100644
--- a/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
+++ b/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
@@ -5,7 +5,7 @@ Date:   Sat Jan 20 20:22:53 2018 +0100
     pp: Guard fix for really old bug in glibc libcrypt
 
 Upstream-Status: Pending
-Signed-off-by Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 diff --git a/pp.c b/pp.c
 index d50ad7ddbf..6510c7b15c 100644
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
index 2e04701699c..68b244698f8 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
@@ -4,6 +4,7 @@ Date: Thu, 1 Mar 2018 18:31:01 -0500
 Subject: [PATCH] if_ether: move muslc ethhdr protection to uapi file
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+Upstream-Status: Pending
 ---
  include/uapi/linux/if_ether.h | 6 ++++++
  1 file changed, 6 insertions(+)
diff --git a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
index f2454b98499..85d281e7f48 100644
--- a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
@@ -1,3 +1,6 @@
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-Status: Pending
+
 From 897563a0397266d8ceb058f172e16b06419b2593 Mon Sep 17 00:00:00 2001
 From: Daniel Schepler <dschepler@gmail.com>
 Date: Mon, 26 Mar 2018 17:48:34 +0300
-- 
2.11.0


