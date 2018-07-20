Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 370C97458C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 07:19:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42809871"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jul 2018 15:19:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0A88F4B69E12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 15:19:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 30 Jul 2018 15:19:38 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2018 11:33:30 -0700
Message-ID: <1532111610-3052-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 0A88F4B69E12.AE730
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH master, sumo] sysprof: Enable for aarch64.
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
X-List-Received-Date: Mon, 30 Jul 2018 07:19:53 -0000
Content-Type: text/plain

It can be compiled for aarch64, so deleted the limit for aarch64.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-kernel/sysprof/sysprof_3.26.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb b/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
index 1989b52..7ea11b8 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
@@ -25,9 +25,6 @@ FILES_SOLIBSDEV = ""
 
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
 
-# We do not yet work for aarch64.
-COMPATIBLE_HOST = "^(?!aarch64).*"
-
 FILES_${PN} += " \
                ${datadir}/dbus-1/system-services \
                ${datadir}/dbus-1/system.d \
-- 
1.9.1




