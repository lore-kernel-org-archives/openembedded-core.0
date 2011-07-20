Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDE-0001aO-FH
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753271"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:02 -0700
Message-Id: <c8dae491639bce481c2598fe519cde0f61fc5fa6.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 15/50] iptuils: Add sgmlspl-native to DEPENDS
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:01 -0000

From: Tom Rini <tom_rini@mentor.com>

This is 4fc7d465d684d4952c52adafc1e7032b63039e53 in oe.dev.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-extended/iputils/iputils_s20101006.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20101006.bb
index a7ef40c..c97fce7 100644
--- a/meta/recipes-extended/iputils/iputils_s20101006.bb
+++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
                     file://arping.c;beginline=1;endline=10;md5=ada2a6d06acc90f943bddf40d15e0541 \
                     file://tftpd.c;beginline=1;endline=32;md5=28834bf8a91a5b8a92755dbee709ef96 "
 
-DEPENDS = "sysfsutils openssl docbook-utils-native"
+DEPENDS = "sysfsutils openssl docbook-utils-native sgmlspl-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/fix-dead-host-ping-stats.diff \
-- 
1.7.3.4



