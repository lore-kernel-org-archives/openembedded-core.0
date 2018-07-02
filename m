Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2338771B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 05:47:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w625lMxE000788
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 22:47:22 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 22:47:22 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 13:57:06 +0800
Message-ID: <58e8aec6ab9ae366ba06b8358b7d1c19a81ed8b9.1530510873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530510873.git.hongxu.jia@windriver.com>
References: <cover.1530510873.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] gnupg: 2.2.5 -> 2.2.8
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
X-List-Received-Date: Mon, 02 Jul 2018 05:47:22 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.2.5.bb => gnupg_2.2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.5.bb => gnupg_2.2.8.bb} (92%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.5.bb b/meta/recipes-support/gnupg/gnupg_2.2.8.bb
similarity index 92%
rename from meta/recipes-support/gnupg/gnupg_2.2.5.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.8.bb
index f6d5dad..35a033c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.8.bb
@@ -18,8 +18,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch"
 
 
-SRC_URI[md5sum] = "567cd2d41fa632903066fde73d2005cb"
-SRC_URI[sha256sum] = "3fa189a32d4fb62147874eb1389047c267d9ba088f57ab521cb0df46f08aef57"
+SRC_URI[md5sum] = "0db6d8ec569e260435a7d2bfb2ecfe5c"
+SRC_URI[sha256sum] = "777b4cb8ced21965a5053d4fa20fe11484f0a478f3d011cef508a1a49db50dcd"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.7.4


