Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id C616471A6A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 15:16:53 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id DC0691F32EE04;
	Mon,  7 Nov 2016 15:01:45 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Mon, 7 Nov 2016 15:01:48 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 15:01:34 +0000
Message-ID: <20161107150135.40266-13-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 12/13] mdadm: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Mon, 07 Nov 2016 15:16:54 -0000
Content-Type: text/plain

Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
variable is defined

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-extended/mdadm/mdadm_3.4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.4.bb
index 261054e..ee792e1 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.4.bb
@@ -34,8 +34,10 @@ EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
 # to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
 # int-ll64.h included
 CFLAGS_append_powerpc64 = ' -D__SANE_USERSPACE_TYPES__'
-CFLAGS_append_mips64 = ' -D__SANE_USERSPACE_TYPES__'
-CFLAGS_append_mips64n32 = ' -D__SANE_USERSPACE_TYPES__'
+CFLAGS_append_mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
+CFLAGS_append_mipsarchn64el = ' -D__SANE_USERSPACE_TYPES__'
+CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
+CFLAGS_append_mipsarchn32el = ' -D__SANE_USERSPACE_TYPES__'
 
 do_compile() {
 	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
-- 
2.10.2


