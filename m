Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UMsCu-0000Ho-Qg
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 05:48:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r323VERC012835
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Apr 2013 20:31:15 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Apr 2013 20:31:15 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Apr 2013 11:31:22 +0800
Message-ID: <d7a977bc5d6c7a2b23b5c4923686789f45f4c3ea.1364872107.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1364872107.git.Qi.Chen@windriver.com>
References: <cover.1364872107.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 2/2] rootfs_rpm.bbclass: make rpm-postinsts installed on target
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
X-List-Received-Date: Tue, 02 Apr 2013 03:48:25 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Override ROOTFS_BOOTSTAP_INSTALL to make rpm-postinsts installed on
target regardless of 'package-management' image feature.

[YOCTO #4160]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index d373dab..9a06a7d 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -4,6 +4,7 @@
 
 ROOTFS_PKGMANAGE = "rpm smartpm"
 ROOTFS_PKGMANAGE_BOOTSTRAP = "rpm-postinsts"
+ROOTFS_BOOTSTRAP_INSTALL = "${ROOTFS_PKGMANAGE_BOOTSTRAP}"
 
 # Add 50Meg of extra space for Smart
 IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "smartpm", " + 51200", "" ,d)}"
-- 
1.7.9.5



