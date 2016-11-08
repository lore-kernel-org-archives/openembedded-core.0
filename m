Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 24166719EF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:46 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 3872C313620BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:43 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 8 Nov 2016 17:12:46 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Nov 2016 17:12:30 +0000
Message-ID: <20161108171235.41837-10-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch v2 09/14] mmc-utils: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Tue, 08 Nov 2016 17:12:46 -0000
Content-Type: text/plain

Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
variable is defined

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 2cba860..7858819 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -13,8 +13,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branc
 S = "${WORKDIR}/git"
 
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
-CFLAGS_append_mips64 = " -D__SANE_USERSPACE_TYPES__"
-CFLAGS_append_mips64n32 = " -D__SANE_USERSPACE_TYPES__"
+CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
+CFLAGS_append_mipsarchn32 = " -D__SANE_USERSPACE_TYPES__"
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.10.2


