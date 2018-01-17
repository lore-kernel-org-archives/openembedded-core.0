Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AF4BE7855C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 02:59:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35393985"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2018 10:59:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8A40E48AEA17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 10:59:41 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 17 Jan 2018 10:59:40 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 10:59:36 +0800
Message-ID: <1516157978-837-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 8A40E48AEA17.A7E69
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] systemtap: 3.1 -> 3.2
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
X-List-Received-Date: Wed, 17 Jan 2018 02:59:44 -0000
Content-Type: text/plain

Upgrade systemtap from 3.1 to 3.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 547b3c1..c938760 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "45d0e7a09a15a21078d0ebf2db5175ed9e87014e"
-PV = "3.1"
+SRCREV = "4051c70c9318c837981384cbb23f3e9eb1bd0892"
+PV = "3.2"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://system_map_location.patch \
-- 
2.7.4




