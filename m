Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C35074DDC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:40:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P2e7Oe008167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:40:07 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:40:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:11 +0800
Message-ID: <5e17001bc93d4c8ba7eaa513080076cc1b382647.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/24] at: add libselinux to PACKAGECONFIG
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
X-List-Received-Date: Fri, 25 May 2018 02:40:06 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* add libselinux to PACKAGECONFIG for at

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/at/at_3.1.20.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/at/at_3.1.20.bb b/meta/recipes-extended/at/at_3.1.20.bb
index 8fe3b43..b76e83d 100644
--- a/meta/recipes-extended/at/at_3.1.20.bb
+++ b/meta/recipes-extended/at/at_3.1.20.bb
@@ -8,6 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 DEPENDS = "flex flex-native bison-native \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
+PACKAGECONFIG ?= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+"
+
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
+
 RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
 "
 
-- 
2.7.4


