Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UAFv6-0007Bb-9T
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:30:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q8DFKG006935
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 00:13:15 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 26 Feb 2013 00:13:13 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 16:14:26 +0800
Message-ID: <2bc6e47a70bd6979234fc8cfb7ef9035ae4e7c0e.1361866257.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1361866256.git.kai.kang@windriver.com>
References: <cover.1361866256.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/5] rootfs_deb: remove run-postinsts from ROOTFS_PKGMANAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 08:30:31 -0000
Content-Type: text/plain

Remove package run-postinsts from ROOTFS_PKGMANAGE. run-postinsts has
already added in ROOTFS_PKGMANAGE_BOOTSTRAP and then added to rootfs
conditionally by checking image feature "package-management".

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/classes/rootfs_deb.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 92a6579..a3c3767 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -2,7 +2,7 @@
 # Copyright 2006-2007 Openedhand Ltd.
 #
 
-ROOTFS_PKGMANAGE = "run-postinsts dpkg apt"
+ROOTFS_PKGMANAGE = "dpkg apt"
 ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
-- 
1.7.5.4



