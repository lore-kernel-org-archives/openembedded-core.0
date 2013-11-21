Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ADEBF6D772
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:27:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7R0Xg014108
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:27:00 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:26:59 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:26:54 -0600
Message-ID: <1385018814-23985-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [dora][PATCH] nfs-utils: explicitly rdepend on bash
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
X-List-Received-Date: Thu, 21 Nov 2013 07:27:00 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Scripts in nfs-utils need bash as their interpreter, so if nfs-utils
doesn't explicitly rdepend on bash, we would experience build failures
if we add nfs-utils to glibc-small images.

Add bash to RDEPENDS to solve this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
index e3e8136..580755c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
 DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
-RDEPENDS_${PN} = "rpcbind"
+RDEPENDS_${PN} = "rpcbind bash"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
-- 
1.8.1.2.545.g2f19ada


