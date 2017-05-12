Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CF568600BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 02:12:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18768220"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 May 2017 10:12:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 97FC947B0CB7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 10:12:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 12 May 2017 10:12:14 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 May 2017 10:11:11 +0800
Message-ID: <1494555071-49386-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 97FC947B0CB7.A80B6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dtc: 1.4.2 -> 1.4.4
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
X-List-Received-Date: Fri, 12 May 2017 02:12:23 -0000
Content-Type: text/plain

Upgrade dtc from 1.4.2 to 1.4.4.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-kernel/dtc/{dtc_1.4.2.bb => dtc_1.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/dtc/{dtc_1.4.2.bb => dtc_1.4.4.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc_1.4.2.bb b/meta/recipes-kernel/dtc/dtc_1.4.4.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.4.2.bb
rename to meta/recipes-kernel/dtc/dtc_1.4.4.bb
index cc72adc..eadb7ba 100644
--- a/meta/recipes-kernel/dtc/dtc_1.4.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.4.4.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "ec02b34c05be04f249ffaaca4b666f5246877dea"
+SRCREV = "558cd81bdd432769b59bff01240c44f82cfb1a9d"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




