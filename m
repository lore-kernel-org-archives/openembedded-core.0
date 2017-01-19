Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5734D71C1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 16:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGCmfn002403; Thu, 19 Jan 2017 16:13:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6rf2yRgw74D5; Thu, 19 Jan 2017 16:13:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGD6J5002501
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 16:13:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUFKk-0000ko-6d; Thu, 19 Jan 2017 16:13:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:12:54 +0000
Message-Id: <1484842382-2821-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/11] systemd-boot: Add missing gperf-native DEPENDS
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
X-List-Received-Date: Thu, 19 Jan 2017 16:13:14 -0000

Configure searches for this and fails if its not present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/systemd-boot/systemd-boot_232.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/systemd-boot/systemd-boot_232.bb b/meta/recipes-bsp/systemd-boot/systemd-boot_232.bb
index 602052c..0471ce2 100644
--- a/meta/recipes-bsp/systemd-boot/systemd-boot_232.bb
+++ b/meta/recipes-bsp/systemd-boot/systemd-boot_232.bb
@@ -1,6 +1,6 @@
 require recipes-core/systemd/systemd.inc
 
-DEPENDS = "intltool-native libcap util-linux gnu-efi"
+DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
 
 SRC_URI += "file://0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch"
 
-- 
2.7.4


