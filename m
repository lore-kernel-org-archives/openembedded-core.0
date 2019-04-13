Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E509F7D3D4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 05:39:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,344,1549900800"; d="scan'208";a="59178371"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Apr 2019 13:39:53 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 546EE4CD8183
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 13:39:55 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 13 Apr 2019 13:39:54 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 13 Apr 2019 22:36:54 +0800
Message-ID: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 546EE4CD8183.A82E0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] toolchain-scripts: make rpm work in toolchain
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
X-List-Received-Date: Sat, 13 Apr 2019 05:39:53 -0000
Content-Type: text/plain

Rpm need to read the arch info, but $script did not provide it, so add it.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/classes/toolchain-scripts.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 1a2ec4f..de50b7e 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -101,6 +101,7 @@ toolchain_shared_env_script () {
 	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
 	echo 'export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
+	echo 'export MACHINE_ARCH=${MACHINE_ARCH}' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
 	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
-- 
1.8.3.1




