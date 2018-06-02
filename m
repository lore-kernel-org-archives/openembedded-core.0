Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B944D78A3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 02:00:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41003840"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jun 2018 10:00:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 61DCA4B41E96
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 10:00:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Wed, 13 Jun 2018 10:00:24 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Jun 2018 14:04:03 -0700
Message-ID: <1527973443-39251-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 61DCA4B41E96.AD0AD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] Fix build error when enable archiver.
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
X-List-Received-Date: Wed, 13 Jun 2018 02:00:29 -0000
Content-Type: text/plain

The error is as fllowing:
ERROR: Task do_deploy_archives in virtual:native:/yocto/poky/meta/recipes-extended/newt/libnewt_0.52.20.bb depends upon non-existent task do_package_write_rpm in virtual:native:/yocto/poky/meta/recipes-extended/newt/libnewt_0.52.20.bb
ERROR: Command execution failed: 1

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/classes/nopackages.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 559f507..d9ddfac 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -10,3 +10,4 @@ deltask do_package_write_ipk_setscene
 deltask do_package_write_deb_setscene
 deltask do_package_qa_setscene
 deltask do_packagedata_setscene
+deltask do_deploy_archives
-- 
1.9.1




