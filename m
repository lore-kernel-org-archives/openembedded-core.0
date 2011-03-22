Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q29lq-0005Yp-KD
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 23:09:46 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q29k4-0003B6-1u from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 15:07:56 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 15:07:03 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 16:07:54 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:07:26 -0700
Message-Id: <5f741bbf135a5d8efadcbee26a88a8ec8ae226ff.1300831551.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1300831551.git.tom_rini@mentor.com>
References: <cover.1300831551.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 22 Mar 2011 22:07:54.0965 (UTC)
	FILETIME=[983B9850:01CBE8DD]
Subject: [PATCH 1/7] net-tools: Switch to using DEBIAN_MIRROR
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
X-List-Received-Date: Tue, 22 Mar 2011 22:09:46 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../net-tools/net-tools_1.60-23.bb                 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
index 28ca16e..41041aa 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://ifconfig.c;startline=11;endline=15;md5=da4c7bb79a5d0798faa99ef869721f4a"
 PR = "r0"
 
-SRC_URI = "ftp://ftp.debian.org/debian/pool/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
-           ftp://ftp.debian.org/debian/pool/main/n/net-tools/${PN}_${PV}.diff.gz;apply=no;name=patch \
+SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
+           ${DEBIAN_MIRROR}/main/n/net-tools/${PN}_${PV}.diff.gz;apply=no;name=patch \
            file://net-tools-config.h \
            file://net-tools-config.make" 
 
-- 
1.7.0.4



