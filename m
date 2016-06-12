Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5ACF96FF5B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 02:20:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C2KqPP008570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2016 19:20:52 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.144) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 11 Jun 2016 19:20:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 10:21:06 +0800
Message-ID: <0697af9f91f8222fd87b37330aced6f93cb74f09.1465697985.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1465697985.git.Qi.Chen@windriver.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] pciutils: upgrade to 3.5.1
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
X-List-Received-Date: Sun, 12 Jun 2016 02:20:51 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/pciutils/{pciutils_3.4.1.bb => pciutils_3.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.4.1.bb => pciutils_3.5.1.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.4.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.1.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.5.1.bb
index 33be525..a84efd9 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "35763bb1eab7bc9bf6eb6efb72cbc8a1"
-SRC_URI[sha256sum] = "865554cc5604d1644bd8da38d94845405e2a319a6d5acabc6a0296417684a82a"
+SRC_URI[md5sum] = "0879a8f7ac51f4e874cfc6b3521a13cc"
+SRC_URI[sha256sum] = "2bf3a4605a562fb6b8b7673bff85a474a5cf383ed7e4bd8886b4f0939013d42f"
 
 inherit multilib_header
 
-- 
1.9.1


