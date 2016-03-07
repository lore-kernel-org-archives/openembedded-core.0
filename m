Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 31C086FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 03:53:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4287514"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Mar 2016 11:53:12 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CE5CC42B4B09
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 11:53:10 +0800 (CST)
Received: from localhost.localdomain (10.167.226.72) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 7 Mar 2016 11:53:10 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Mar 2016 06:53:02 +0300
Message-ID: <1457322782-1973-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.72]
X-yoursite-MailScanner-ID: CE5CC42B4B09.A0C72
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] packagegroup-core-lsb.bb: remove Qt 3 library from packagegroup-core-lsb-desktop
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
X-List-Received-Date: Mon, 07 Mar 2016 03:53:17 -0000
Content-Type: text/plain

Since with this release of the LSB 5.0, the Qt 3 library has been removed
Ref: https://wiki.linuxfoundation.org/en/ReleaseNotes50#Qt_3_Removed

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index a29c3d7..ac88cfa 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -255,7 +255,6 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
     atk \
     libasound \
     ${@get_libqt4(d)} \
-    ${@get_libqt3(d)} \
 "
 
 RDEPENDS_packagegroup-core-lsb-runtime-add = "\
-- 
1.8.4.2




