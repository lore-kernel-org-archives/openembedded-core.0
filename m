Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso@secretlab.ca>) id 1QeBVV-0003rX-PH
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 21:42:05 +0200
Received: by mail-vw0-f47.google.com with SMTP id 2so5025767vws.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 12:38:18 -0700 (PDT)
Received: by 10.220.169.143 with SMTP id z15mr2979077vcy.10.1309894698371;
	Tue, 05 Jul 2011 12:38:18 -0700 (PDT)
Received: from localhost.localdomain ([189.191.130.176])
	by mx.google.com with ESMTPS id r5sm493275vcg.20.2011.07.05.12.38.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 12:38:17 -0700 (PDT)
From: Adrian Alonso <aalonso@secretlab.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 14:38:12 -0500
Message-Id: <1309894692-15230-4-git-send-email-aalonso@secretlab.ca>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1309894692-15230-1-git-send-email-aalonso@secretlab.ca>
References: <1309894692-15230-1-git-send-email-aalonso@secretlab.ca>
Subject: [PATCH 4/4] tclibc-glibc: add weak assigment to TARGET_OS
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
X-List-Received-Date: Tue, 05 Jul 2011 19:42:05 -0000

* Add weak assigment to TARGET_OS variable so it can be
  overrided to match external toolchain tripplets.
* Toolchain prefix is expanded from
  TARGET_SYS = TARGET_ARCH + TARGET_VENDOR + TARGET_OS

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/conf/distro/include/tclibc-glibc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index 5e7afc1..997fc11 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -2,7 +2,7 @@
 # glibc specific configuration
 #
 
-TARGET_OS = "linux"
+TARGET_OS ?= "linux"
 TARGET_OS_arm = "linux-gnueabi"
 TARGET_OS_armeb = "linux-gnueabi"
 TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in ['ppce500', 'ppce500v2']]}"
-- 
1.7.6



