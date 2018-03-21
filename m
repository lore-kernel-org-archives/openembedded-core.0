Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91C3B77E88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 08:36:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2L8aSjP031214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 01:36:29 -0700
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 21 Mar 2018 01:36:27 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2018 16:36:22 +0800
Message-ID: <1521621384-24620-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 1/3] logrotate: update to 3.14.0
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
X-List-Received-Date: Wed, 21 Mar 2018 08:36:28 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../logrotate/{logrotate_3.13.0.bb => logrotate_3.14.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.13.0.bb => logrotate_3.14.0.bb} (95%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.13.0.bb b/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
similarity index 95%
rename from meta/recipes-extended/logrotate/logrotate_3.13.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.14.0.bb
index 990cf91..8a6d407 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.13.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "78ef24d6fddcc4df8e412dd75c551b4c"
-SRC_URI[sha256sum] = "3222ca032f99be8d7a4a8c6ad69f3dcc49b9511bfe384bd5a271ebcd9bd3e52c"
+SRC_URI[md5sum] = "1c0f6e6e490c4bcac0a1e77ad1310683"
+SRC_URI[sha256sum] = "4703bdc0e2df3b322f9dff0aafc99aa9172c9e4acae28b7c924cc7d4e5b29d55"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-- 
2.7.4


