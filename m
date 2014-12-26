Return-Path: <holger@moiji-mobile.com>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE0460232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:16:49 +0000 (UTC)
Received: from sangmingze-mail.local (unknown
	[IPv6:2001:67c:20a1:1192:864b:f5ff:fe2a:8297])
	by mail.sysmocom.de (Postfix) with ESMTPSA id D98D895B9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:10:26 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=sangmingze-mail.local)
	by sangmingze-mail.local with esmtp (Exim 4.84)
	(envelope-from <holger@moiji-mobile.com>) id 1Y4Smj-0004v7-2d
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Dec 2014 12:10:21 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Dec 2014 12:08:59 +0100
Message-Id: <1419592139-18830-2-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419592139-18830-1-git-send-email-holger@moiji-mobile.com>
References: <1419592139-18830-1-git-send-email-holger@moiji-mobile.com>
Subject: [PATCH 2/2] m4: Disable searching for libsigsegv
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
X-List-Received-Date: Fri, 26 Dec 2014 11:16:56 -0000

When building GNU Smalltalk libsigsegv will be available and m4
will start to use it. This leads to the below warning:

WARNING: QA Issue: m4 rdepends on libsigsegv, but it isn't a build dependency? [build-deps]
---
 meta/recipes-devtools/m4/m4.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
index 4a83929..e473e23 100644
--- a/meta/recipes-devtools/m4/m4.inc
+++ b/meta/recipes-devtools/m4/m4.inc
@@ -5,6 +5,7 @@ GNU M4 also has built-in functions for including files, running shell commands,
 
 inherit autotools texinfo
 
+EXTRA_OECONF += "--without-libsigsegv-prefix"
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 LDFLAGS_prepend_libc-uclibc = " -lrt "
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
-- 
2.1.3


