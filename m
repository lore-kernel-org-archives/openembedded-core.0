Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A15D7C041
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 07:21:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x097L6GV021904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 23:21:06 -0800 (PST)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 8 Jan 2019 23:21:06 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 15:19:41 +0800
Message-ID: <1547018383-19134-8-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
References: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 7/9] gnu-efi: upgrade 3.0.8 -> 3.0.9
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
X-List-Received-Date: Wed, 09 Jan 2019 07:21:05 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.8.bb => gnu-efi_3.0.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.8.bb => gnu-efi_3.0.9.bb} (95%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.8.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
similarity index 95%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.8.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
index dba4733..0667191 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.8.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://gcc46-compatibility.patch \
            "
 
-SRC_URI[md5sum] = "ae32011cfe6b1c40c0f244b9a49ba181"
-SRC_URI[sha256sum] = "76006d8ea8d67bcf72f35d09d43e9ef6a69400d6d5d4bf64baf1ab7434e2b722"
+SRC_URI[md5sum] = "32af17b917545a693e549af2439c4a99"
+SRC_URI[sha256sum] = "6715ea7eae1c7e4fc5041034bd3f107ec2911962ed284a081e491646b12277f0"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.7.4


