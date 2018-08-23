Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83E7679520
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:00:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N80olW010226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:00:50 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 01:00:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:11:22 +0800
Message-ID: <11ec5b29e662de3e46b8bced7f46e56605ad8360.1535011774.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011774.git.liezhi.yang@windriver.com>
References: <cover.1535011774.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] pciutils: 3.6.1 -> 3.6.2
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
X-List-Received-Date: Thu, 23 Aug 2018 08:00:49 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/pciutils/{pciutils_3.6.1.bb => pciutils_3.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.6.1.bb => pciutils_3.6.2.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.6.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.6.1.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
index d71a29a..413421c 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.6.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
@@ -11,8 +11,8 @@ DEPENDS = "zlib kmod"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[md5sum] = "1adbcc258030ea92609100703f29c92c"
-SRC_URI[sha256sum] = "fcc0431cc951c3563f1e4f946d27c8e2161cfd81f25316e6bd783fa6118469e0"
+SRC_URI[md5sum] = "77963796d1be4f451b83e6da28ba4f82"
+SRC_URI[sha256sum] = "db452ec986edefd88af0d222d22f6102f8030a8633fdfe846c3ae4bde9bb93f3"
 
 inherit multilib_header pkgconfig
 
-- 
2.7.4


