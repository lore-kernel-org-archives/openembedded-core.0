Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjCNl-0003fq-3a
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 17:38:49 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JFYhMi027827
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 10:34:43 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 08:34:44 -0700
Message-Id: <a4db9dde2c23737e147090589ebaf286f316a610.1311089204.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311089204.git.tom_rini@mentor.com>
References: <cover.1311089204.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311089204.git.tom_rini@mentor.com>
References: <cover.1311089204.git.tom_rini@mentor.com>
Subject: [PATCH 3/4] iptuils: Add sgmlspl-native to DEPENDS
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
X-List-Received-Date: Tue, 19 Jul 2011 15:38:49 -0000

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
1.7.0.4



