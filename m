Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F705766E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:15:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LAFNEL027227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:15:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 21 Aug 2015 03:15:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 03:15:18 -0700
Message-ID: <88fe4ea23f47fed346881f3cbd20cba1c6e67e9c.1440145857.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440145857.git.liezhi.yang@windriver.com>
References: <cover.1440145857.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] gnu-efi: 3.0.2 -> 3.0.3
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
X-List-Received-Date: Fri, 21 Aug 2015 10:15:22 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnu-efi/{gnu-efi_3.0.2.bb => gnu-efi_3.0.3.bb} |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.2.bb => gnu-efi_3.0.3.bb} (93%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
similarity index 93%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
index 9ad258e..8cc22ca 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
@@ -18,8 +18,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
           "
-SRC_URI[md5sum] = "a9db2cabc01a2674715bd6aea2911f01"
-SRC_URI[sha256sum] = "194b580ecdb1fad0e41914845ba064c279afb687855960b58693459e5537b4d7"
+
+SRC_URI[md5sum] = "15a4bcbc18a9a5e8110ed955970622e6"
+SRC_URI[sha256sum] = "c530f21a15fd9c214dd92d29a6caa20fac989289267512020b6da1f5e6f5b4cb"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
-- 
1.7.9.5


