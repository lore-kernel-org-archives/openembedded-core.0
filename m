Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 085B16C1E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 09:27:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAC9RgXT013842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Nov 2018 01:27:43 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 12 Nov 2018 01:27:42 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <raj.khem@gmail.com>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 12 Nov 2018 01:27:42 -0800
Message-ID: <20181112092742.123289-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] x264: Disable asm on x86
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
X-List-Received-Date: Mon, 12 Nov 2018 09:27:46 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The previous commit as below only fixes the
textrel issue with musl on x86, update it also to
fix the issue such as with glibc on x86.
74ea4f280c1 x264: Disable asm on musl/x86

[YOCTO #11770]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 4174cb28196..842ea2547c3 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 inherit lib_package pkgconfig perlnative
 
 X264_DISABLE_ASM = ""
-X264_DISABLE_ASM_x86_libc-musl = "--disable-asm"
+X264_DISABLE_ASM_x86 = "--disable-asm"
 X264_DISABLE_ASM_armv4 = "--disable-asm"
 X264_DISABLE_ASM_armv5 = "--disable-asm"
 X264_DISABLE_ASM_powerpc = "${@bb.utils.contains("TUNE_FEATURES", "spe", "--disable-asm", "", d)}"
-- 
2.17.1


