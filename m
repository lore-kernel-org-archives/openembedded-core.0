Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 95CA77DF61
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:22 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id q5so8818465pfg.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=htESYFGphsXkSOB9saTx0Gj77IW6ASg4r6myMWrcnW8=;
	b=Ly7UBEEyFok738vbhj/fYniREEgCKujprw8XbNeQlXAuxdUaMwFwHcQJ9TIsXIP0P0
	E/oWOSBeovombAU9pe6kBfok24L3ytq43qGbPSNAaVtTFqKLg+ILEdEccE33Z4Qqrain
	XcWdu62ySEQzuR0JYh7Osc8ivVuH4MFKWq1glCjz6c/bKhyEWAkTiDyRT+vo7PzvwYIb
	CHGJZH0rvyPn8wuKUlpOAJqpuVyFGtKlloOz/5kFNiAhLHAX3K9NviMGYl+XAotgAJdu
	tY1c1fhrCuWiU2fTD7BCzKxuMcHDK7PJvZuD+ZdgKl7N8T/4UOf4qSs6y0s6dOClkzDj
	wlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=htESYFGphsXkSOB9saTx0Gj77IW6ASg4r6myMWrcnW8=;
	b=lcx6q3LY+xc/8sqgP8LQLaUZJtcQuL5FG4AqCGCk3NxRQ6xTV4C5CMAJEqGhe6Kxt1
	Yoe6J9Cz8vVNY13IE2EodEl/yHzCx9fiedLX2vmN9NJoHleDcNr8M0UbgQsma9EjglfK
	tqHOQQX0Y7eP76MWOp1Ss3d2mHQ6FgSwS+6Q2kYZ84XQjuscxYmPzDNg5sTGMdiRd8zp
	bYuNAvcTgnO6cWOK2yiDApG0gzwK8BmPd7624XdXsnpcqftME6fiT6NX9gKZ+dYxi9Tb
	St0WIMpx1JNq9rag1vbhoK02ZWTMwyvFg6HybGKDPl0NdeF67f7zTvztScziCs/7oKgb
	auJg==
X-Gm-Message-State: APjAAAWunPJTXdOExsXYhtBcqv+jQElJB/kScXNlucxsbL9WWl8cm79O
	wegsqtLydhpvduPPY1YPBxnixBVxTnY=
X-Google-Smtp-Source: APXvYqwXWN5QmQnzdF9/qCdED6dULUn8HYiVcSUXAD4yp7fg7gomFC9CZwUrB7iqFFg7eLwTRM+hbQ==
X-Received: by 2002:a17:90a:ae0e:: with SMTP id
	t14mr34197493pjq.48.1570461083365; 
	Mon, 07 Oct 2019 08:11:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:53 -0700
Message-Id: <109e8420c8a4e94dccb3c83e2b0b7fc6ceb66b04.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 16/26] dhcp: drop lost patch
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:22 -0000

From: Ruslan Bilovol <ruslan.bilovol@gmail.com>

Commit 7cb42ae87ef9 "dhcp: update 4.4.1" dropped
0008-tweak-to-support-external-bind.patch
from recipe, but left the patch itself in source tree.
Remove this patch since nobody uses it.

Cc: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dhcp/0008-tweak-to-support-external-bind.patch | 117 ---------------------
 1 file changed, 117 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
deleted file mode 100644
index 006d18a..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 92875f5cc44914515e50c11c503a09cec90497b2 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 Jun 2016 22:51:44 -0400
-Subject: [PATCH 08/11] tweak to support external bind
-
-Tweak the external bind to oe-core's sysroot rather than
-external bind source build.
-
-Upstream-Status: Inappropriate <oe-core specific>
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- client/Makefile.am       | 2 +-
- client/tests/Makefile.am | 2 +-
- common/tests/Makefile.am | 2 +-
- dhcpctl/Makefile.am      | 2 +-
- omapip/Makefile.am       | 2 +-
- relay/Makefile.am        | 2 +-
- server/Makefile.am       | 2 +-
- server/tests/Makefile.am | 2 +-
- 8 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/client/Makefile.am b/client/Makefile.am
-index 4730bb3..84d8131 100644
---- a/client/Makefile.am
-+++ b/client/Makefile.am
-@@ -4,7 +4,7 @@
- # production code. Sadly, we are not there yet.
- SUBDIRS = . tests
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
- 	      -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
-diff --git a/client/tests/Makefile.am b/client/tests/Makefile.am
-index 5031d0c..a8dfd26 100644
---- a/client/tests/Makefile.am
-+++ b/client/tests/Makefile.am
-@@ -1,6 +1,6 @@
- SUBDIRS = .
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
- AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
-diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
-index f6a43e4..2f98d22 100644
---- a/common/tests/Makefile.am
-+++ b/common/tests/Makefile.am
-@@ -1,6 +1,6 @@
- SUBDIRS = .
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = $(ATF_CFLAGS) -I$(top_srcdir)/includes
- 
-diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
-index ba8dd8b..9b2486e 100644
---- a/dhcpctl/Makefile.am
-+++ b/dhcpctl/Makefile.am
-@@ -1,4 +1,4 @@
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
- 
-diff --git a/omapip/Makefile.am b/omapip/Makefile.am
-index dd1afa0..e4a8599 100644
---- a/omapip/Makefile.am
-+++ b/omapip/Makefile.am
-@@ -1,4 +1,4 @@
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- AM_CPPFLAGS = -I$(top_srcdir)/includes
- 
- lib_LIBRARIES = libomapi.a
-diff --git a/relay/Makefile.am b/relay/Makefile.am
-index 6d652f6..b3bf578 100644
---- a/relay/Makefile.am
-+++ b/relay/Makefile.am
-@@ -1,4 +1,4 @@
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
- 
-diff --git a/server/Makefile.am b/server/Makefile.am
-index 3990b9c..b5d8c2d 100644
---- a/server/Makefile.am
-+++ b/server/Makefile.am
-@@ -4,7 +4,7 @@
- # production code. Sadly, we are not there yet.
- SUBDIRS = . tests
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
- 
-diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
-index a87c5e7..9821081 100644
---- a/server/tests/Makefile.am
-+++ b/server/tests/Makefile.am
-@@ -1,6 +1,6 @@
- SUBDIRS = .
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
- AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
--- 
-1.8.3.1
-
-- 
2.7.4


