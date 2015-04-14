Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 184586E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:07:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3E97F8Q010244
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:07:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:07:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:07:09 -0700
Message-ID: <7405e9a882ce0c0b33e4f90f9f848c474b6b5446.1429002381.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002381.git.liezhi.yang@windriver.com>
References: <cover.1429002381.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] gnu-efi: 3.0.1 -> 3.0.2
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
X-List-Received-Date: Tue, 14 Apr 2015 09:07:14 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnu-efi/{gnu-efi_3.0.1.bb => gnu-efi_3.0.2.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.1.bb => gnu-efi_3.0.2.bb} (93%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
similarity index 93%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
index ad7f2e3..2b4f3f3 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
@@ -17,8 +17,8 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=9;md5=2240d
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
           "
-SRC_URI[md5sum] = "c4099c443b6b0c2b04dedc33e7814ec0"
-SRC_URI[sha256sum] = "e2e8d5940347eebfb00eaaeef107a8ba59e7838e40bc716c74d9a36fff648f1f"
+SRC_URI[md5sum] = "a9db2cabc01a2674715bd6aea2911f01"
+SRC_URI[sha256sum] = "194b580ecdb1fad0e41914845ba064c279afb687855960b58693459e5537b4d7"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
-- 
1.7.9.5


