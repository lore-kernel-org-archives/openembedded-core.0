Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDD96212F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 05:49:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4833106"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Mar 2016 13:48:53 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0B6E7408D260
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 13:48:52 +0800 (CST)
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 22 Mar 2016 13:48:51 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Mar 2016 08:48:35 +0300
Message-ID: <1458625715-1813-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
X-yoursite-MailScanner-ID: 0B6E7408D260.AEA5A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gcc-cross-canadian.inc: add INSANE_SKIP_ to avoid build warning.
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
X-List-Received-Date: Tue, 22 Mar 2016 05:49:07 -0000
Content-Type: text/plain

WARNING: QA Issue: gcc-cross-canadian-i586-dbg: found library in wrong location:
/PATH/sysroots/x86_64-oesdk-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/5.2.0/.debug/libcc1.so.0.0.0

This warning is introduced by commit f6e47aa(gcc-target 5.1: fix for libcc1)

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index ec1d281..1286179 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -83,6 +83,8 @@ FILES_${PN} = "\
     ${prefix}/${TARGET_SYS}/usr/include/* \
 "
 INSANE_SKIP_${PN} += "dev-so"
+INSANE_SKIP_${PN} += "libdir"
+INSANE_SKIP_${PN}-dbg += "libdir"
 
 FILES_${PN}-doc = "\
     ${infodir} \
-- 
1.8.4.2




