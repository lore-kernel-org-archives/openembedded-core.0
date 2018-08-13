Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36A6478F2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:55:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7D8tgxd017149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 01:55:42 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 01:55:41 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 17:06:12 +0800
Message-ID: <1534151172-28001-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] nfs-export-root: add it to nfs-server FEATURE_PACKAGES
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
X-List-Received-Date: Mon, 13 Aug 2018 08:55:42 -0000
Content-Type: text/plain

When we enable nfs-server feature, we should add the required file
/etc/exports installed by nfs-export-root.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/classes/core-image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index a9a2cec..9ea6d89 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -42,7 +42,7 @@ FEATURE_PACKAGES_eclipse-debug = "packagegroup-core-eclipse-debug"
 FEATURE_PACKAGES_tools-profile = "packagegroup-core-tools-profile"
 FEATURE_PACKAGES_tools-testapps = "packagegroup-core-tools-testapps"
 FEATURE_PACKAGES_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sdk-target"
-FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server"
+FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server nfs-export-root"
 FEATURE_PACKAGES_nfs-client = "packagegroup-core-nfs-client"
 FEATURE_PACKAGES_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
 FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh"
-- 
2.7.4


