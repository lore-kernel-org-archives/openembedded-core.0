Return-Path: <>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 643D47C407
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 13:00:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id n18so8801530lfh.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 05:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Xyy4CcDMi7X1p8bt2ZVp/S8NbuA96qEld8kLIyysZos=;
	b=Jr87r5c9yKAWPev3ZmAPuvX2NfviS5sCMFt4TSgD4qLIEp9RUG7IRSLtsjH/D+xp33
	qXEqO3K0p3WSYv+jwW5ZpPjc5/YF2jHWxcfG3QRZmttEYQ0YnGenhEnPf+gShagzjCi3
	rBNN1IJvCL9QNsIeEEg0k0y0Luha5Lm33KsQmeD5LlidUFJWHFm2Phg0joLD3U7L6LOL
	966cIj9/d5otdGqVBy/x0CwXNIEPqbGHsJ4KFO3jzPqT3y68mtxZVB36Q6OWuMNybwvN
	QN7+SPoEa17tGmeDNfxdr/H/pUntCtTlL6jfGJHTexWJT91D7ZE1lxG3ombRoJ67CvqW
	xeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xyy4CcDMi7X1p8bt2ZVp/S8NbuA96qEld8kLIyysZos=;
	b=LMsoMKyOZLxVql3TBmo+tEmsR6tl5sz/T6ayBKJe+PlK+jycmziNiEAxmvXF872V/U
	ss0WHQxYO51N9Riic3oVMtLN1f9yf/KgGNr5piFCztZVlruK4ylxkrvDS7UNa2dh0tQ1
	1uNKn819OFisqnApeoDc2RBr3WStY22FkKmbtydc/FDu/IGCzLY3FZmILpYau0ftSwvn
	JewS7d6iHblB0hV8ivx447Y58R8irM2JLehB0zvZyVWFtGmAdA9Sdq78IjTXEW/cCz5K
	RvB7e0C9nhx+vsYQe4arhBKMA2CmjxMJEViF2wRO2MFtbBEYqaHmcNvEyBPs7Selbbpf
	LILg==
X-Gm-Message-State: AJcUukcrJV4ovMYrVXAP4uL/+Z3EWCHztsXvh970aWj9J9ZridZIfHnx
	sa5nI5V7jlbE8LROlMquXXo=
X-Google-Smtp-Source: ALg8bN62wXDh5F/5sHenZsiIJN2iR31GMG1mieFWWpX9z7Kxanwb6X+0YKUgvzCtpslBLUpe0z3Aew==
X-Received: by 2002:a19:2106:: with SMTP id h6mr11253210lfh.29.1548507610810; 
	Sat, 26 Jan 2019 05:00:10 -0800 (PST)
Received: from localhost ([80.64.92.72]) by smtp.gmail.com with ESMTPSA id
	v19sm2063282lfe.69.2019.01.26.05.00.09
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 26 Jan 2019 05:00:10 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 14:57:57 +0200
Message-Id: <1548507480-22805-4-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
References: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
Subject: [PATCH 3/6] dhcp: drop lost patch
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
X-List-Received-Date: Sat, 26 Jan 2019 13:00:10 -0000

Commit 7cb42ae87ef9 "dhcp: update 4.4.1" dropped
0008-tweak-to-support-external-bind.patch
from recipe, but left the patch itself in source tree.
Remove this patch since nobody uses it.

Cc: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
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
1.9.1


