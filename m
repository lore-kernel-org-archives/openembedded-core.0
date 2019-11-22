Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C27AC7FC84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 03:45:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,228,1571673600"; d="scan'208";a="78894368"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Nov 2019 11:45:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9FAE84CE1BF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:37:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 22 Nov 2019 11:45:35 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2019 02:51:38 -0800
Message-ID: <1574419898-23699-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574419898-23699-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1574419898-23699-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 9FAE84CE1BF2.AA1C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] kexec-tools: upgrade 2.0.19 -> 2.0.20
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
X-List-Received-Date: Fri, 22 Nov 2019 03:45:33 -0000
Content-Type: text/plain

---
 .../kexec/{kexec-tools_2.0.19.bb => kexec-tools_2.0.20.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.19.bb => kexec-tools_2.0.20.bb} (95%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
similarity index 95%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
index c3f7435..b79e33b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
@@ -21,8 +21,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
     file://0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch \
 "
 
-SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
-SRC_URI[sha256sum] = "913c8dee918e5855a4ba60d609371390978144b4c8d15d6446ca0057b7bc5e58"
+SRC_URI[md5sum] = "46724b67f32501c5d3e778161347cad9"
+SRC_URI[sha256sum] = "cb16d79818e0c9de3bb3e33ede5677c34a1d28c646379c7ab44e0faa3eb57a16"
 
 inherit autotools update-rc.d systemd
 
-- 
2.7.4




