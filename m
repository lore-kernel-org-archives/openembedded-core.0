Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 939A27316D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 09:40:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S9ed1B011871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 02:40:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 02:40:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 02:40:28 -0700
Message-ID: <400de893b2f82c7c94ae2ef5131dcc9692d6e264.1459157937.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459157937.git.liezhi.yang@windriver.com>
References: <cover.1459157937.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] gcc-cross-canadian.inc: add INSANE_SKIP_ to avoid build warning
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
X-List-Received-Date: Mon, 28 Mar 2016 09:40:38 -0000
Content-Type: text/plain

From: Li Xin <lixin.fnst@cn.fujitsu.com>

WARNING: QA Issue: gcc-cross-canadian-i586-dbg: found library in wrong location:
/PATH/sysroots/x86_64-oesdk-linux/usr/libexec/i586-oe-linux/gcc/
i586-oe-linux/5.2.0/.debug/libcc1.so.0.0.0

This warning is introduced by commit f6e47aa(gcc-target 5.1: fix for libcc1)

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 54e4881..027c09a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -83,6 +83,8 @@ FILES_${PN} = "\
     ${prefix}/${TARGET_SYS}/usr/include/* \
 "
 INSANE_SKIP_${PN} += "dev-so"
+INSANE_SKIP_${PN} += "libdir"
+INSANE_SKIP_${PN}-dbg += "libdir"
 
 FILES_${PN}-dbg += " \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug \
-- 
2.7.4


