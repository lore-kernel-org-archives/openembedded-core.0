Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SAYBL-0000lg-06
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 03:55:19 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1900I8QMCZE9N2@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 21:46:12 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AFA7C2016D; Wed,
	21 Mar 2012 22:46:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:46:04 -0400
Message-id: <1332384365-32497-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.5
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] rt-tests: replace dependency on eglibc with virtual/libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 02:55:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

That is to support alternative providers of libc, such as glibc, uclibc
or even an external binary toolchain.
No PR bump is necessary here.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
index 6425027..1a91e86 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Real-Time preemption testcases"
 HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
 SECTION = "tests"
-DEPENDS = "linux-libc-headers eglibc"
+DEPENDS = "linux-libc-headers virtual/libc"
 LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
-- 
1.7.8.5



