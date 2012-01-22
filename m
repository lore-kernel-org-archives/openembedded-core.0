Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1s7-0002gO-MV
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:10:31 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jan 2012 10:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="114995289"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2012 10:02:34 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:19 +0800
Message-Id: <34bf2a760dc28ee4106d912de3f57950a68aca89.1327255446.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 14/18] ed: upgrade to 1.6
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
X-List-Received-Date: Sun, 22 Jan 2012 18:10:31 -0000

This patch is to upgrade ed to 1.6, and the change of license checksum is because

the diff between two ed.h files:

3c3,4
<     Copyright (C) 1993, 1994, 2006, 2007, 2008, 2009, 2010
---
>     Copyright (C) 1993, 1994 Andrew Moore, Talke Studio
>     Copyright (C) 2006, 2007, 2008, 2009, 2010, 2011, 2012

the diff between two main.c files:

2c2
<     Copyright (C) 1993, 1994, 2006, 2007, 2008, 2009, 2010
---
>     Copyright (C) 2006, 2007, 2008, 2009, 2010, 2011, 2012
46d45

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../ed/{ed-1.5 => ed-1.6}/ed-1.2-build.patch       |    0
 meta/recipes-extended/ed/{ed_1.5.bb => ed_1.6.bb}  |   10 +++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ed/{ed-1.5 => ed-1.6}/ed-1.2-build.patch (100%)
 rename meta/recipes-extended/ed/{ed_1.5.bb => ed_1.6.bb} (59%)

diff --git a/meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch b/meta/recipes-extended/ed/ed-1.6/ed-1.2-build.patch
similarity index 100%
rename from meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch
rename to meta/recipes-extended/ed/ed-1.6/ed-1.2-build.patch
diff --git a/meta/recipes-extended/ed/ed_1.5.bb b/meta/recipes-extended/ed/ed_1.6.bb
similarity index 59%
rename from meta/recipes-extended/ed/ed_1.5.bb
rename to meta/recipes-extended/ed/ed_1.6.bb
index d4e8a81..cc72588 100644
--- a/meta/recipes-extended/ed/ed_1.5.bb
+++ b/meta/recipes-extended/ed/ed_1.6.bb
@@ -4,11 +4,11 @@ BUGTRACKER = ""
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://ed.h;endline=20;md5=238781cd8e436dabb0e9f18443400066 \
-                    file://main.c;endline=24;md5=177fe82d0649e545591a13fdce5733e8"
+                    file://ed.h;endline=20;md5=c708cda1b2e8d723d458690b7db03878 \
+                    file://main.c;endline=24;md5=1bd039d59e04ee5f82adcc970144a2c3"
 
 SECTION = "base"
-PR = "r1"
+PR = "r0"
 
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
@@ -16,8 +16,8 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz \
            file://ed-1.2-build.patch"
 
-SRC_URI[md5sum] = "e66c03d7e4c67b025d5b6093ec678267"
-SRC_URI[sha256sum] = "97dd34a49ebc9c97e414b90a087d63eafc41377a340848c97e75a9cba187fba1"
+SRC_URI[md5sum] = "9a78593decccaa889523aa4bb555ed4b"
+SRC_URI[sha256sum] = "211c67b0c4aae277d34b1c5f842db1952e468e5905142868e4718ac838f08a65"
 
 do_configure() {
 	${S}/configure
-- 
1.7.6



