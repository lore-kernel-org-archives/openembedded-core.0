Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACB678651
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:54:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAE0sAXT025438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:54:10 -0800
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 16:54:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 01:58:47 +0800
Message-ID: <cab3ae38309712b2ada3aa9c3c699cc1437c3d49.1510595883.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] logrotate: 3.12.3 -> 3.13.0
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
X-List-Received-Date: Tue, 14 Nov 2017 00:54:09 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../logrotate/{logrotate_3.12.3.bb => logrotate_3.13.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.12.3.bb => logrotate_3.13.0.bb} (95%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.12.3.bb b/meta/recipes-extended/logrotate/logrotate_3.13.0.bb
similarity index 95%
rename from meta/recipes-extended/logrotate/logrotate_3.12.3.bb
rename to meta/recipes-extended/logrotate/logrotate_3.13.0.bb
index 620b208..990cf91 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.12.3.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.13.0.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "a560c57fac87c45b2fc17406cdf79288"
-SRC_URI[sha256sum] = "2e6a401cac9024db2288297e3be1a8ab60e7401ba8e91225218aaf4a27e82a07"
+SRC_URI[md5sum] = "78ef24d6fddcc4df8e412dd75c551b4c"
+SRC_URI[sha256sum] = "3222ca032f99be8d7a4a8c6ad69f3dcc49b9511bfe384bd5a271ebcd9bd3e52c"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-- 
2.7.4


