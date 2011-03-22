Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q29m3-0005cL-Qf
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 23:10:00 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q29kH-0003CY-84 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 15:08:09 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 15:08:09 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 16:08:07 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:07:43 -0700
Message-Id: <9155bb5d7a418758bba14e970a20cf918c3bde54.1300831551.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1300831551.git.tom_rini@mentor.com>
References: <cover.1300831551.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 22 Mar 2011 22:08:08.0121 (UTC)
	FILETIME=[A0130A90:01CBE8DD]
Subject: [PATCH 6/7] Various: Switch to SOURCEFORGE_MIRROR
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
X-List-Received-Date: Tue, 22 Mar 2011 22:10:00 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-extended/lsb/lsb_1.4.bb           |    2 +-
 meta/recipes-extended/quota/quota_4.00-pre1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index a574c3b..17fb0e7 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -7,7 +7,7 @@ PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
-SRC_URI = "http://cdnetworks-kr-1.dl.sourceforge.net/project/lsb/lsb_release/${PV}/lsb-release-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/${PV}/lsb-release-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
diff --git a/meta/recipes-extended/quota/quota_4.00-pre1.bb b/meta/recipes-extended/quota/quota_4.00-pre1.bb
index 11651f7..849315e 100644
--- a/meta/recipes-extended/quota/quota_4.00-pre1.bb
+++ b/meta/recipes-extended/quota/quota_4.00-pre1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad2
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 PR = "r0"
 
-SRC_URI = "http://downloads.sourceforge.net/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "ef9d66e8a968ecffd2d9df648fa8ada2"
 SRC_URI[sha256sum] = "181a9b90b10bbffaaf9a18e7fef96a5752ab20f7b72d81c472166ab32e415994"
-- 
1.7.0.4



