Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DD4C77F3A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 08:26:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,329,1559491200"; d="scan'208";a="72580552"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2019 16:26:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D263A4CDDAE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 16:26:20 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 31 Jul 2019 16:26:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2019 16:25:39 +0800
Message-ID: <20190731082539.27000-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: D263A4CDDAE4.AB0E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] kexec-tools:upgrade 2.0.19 -> 2.0.20
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
X-List-Received-Date: Wed, 31 Jul 2019 08:26:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../kexec/{kexec-tools_2.0.19.bb => kexec-tools_2.0.20.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.19.bb => kexec-tools_2.0.20.bb} (95%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
similarity index 95%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
index 3439899..1167cfa 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
@@ -20,8 +20,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
     file://0005-Disable-PIE-during-link.patch \
 "
 
-SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
-SRC_URI[sha256sum] = "913c8dee918e5855a4ba60d609371390978144b4c8d15d6446ca0057b7bc5e58"
+SRC_URI[md5sum] = "46724b67f32501c5d3e778161347cad9"
+SRC_URI[sha256sum] = "cb16d79818e0c9de3bb3e33ede5677c34a1d28c646379c7ab44e0faa3eb57a16"
 
 inherit autotools update-rc.d systemd
 
-- 
2.7.4




