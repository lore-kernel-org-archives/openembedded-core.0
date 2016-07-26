Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90C76606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 08:25:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6Q8PZok025456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 01:25:35 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jul 2016 01:25:34 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2016 16:22:40 +0800
Message-ID: <1469521360-16641-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] gcc-cross-canadian.inc: add INSANE_SKIP_ to avoid build warning
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
X-List-Received-Date: Tue, 26 Jul 2016 08:25:39 -0000
Content-Type: text/plain

WARNING: QA Issue: gcc-cross-canadian-i586-dbg: found library in wrong location:
/PATH/sysroots/x86_64-oesdk-linux/usr/libexec/i586-oe-linux/gcc/
i586-oe-linux/5.2.0/.debug/libcc1.so.0.0.0

This warning is introduced by commit f6e47aa(gcc-target 5.1: fix for libcc1)

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core jethro rev: 62c51c4178fb66341498c71c74ce42652568c7fa)
Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
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
2.8.1


