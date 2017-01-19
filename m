Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF2271E5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrQi7005703; Thu, 19 Jan 2017 22:53:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4FUh3UbxfF3V; Thu, 19 Jan 2017 22:53:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrOcf005677
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:25 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa8-0004jJ-0s; Thu, 19 Jan 2017 22:53:24 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:53:11 +0000
Message-Id: <1484866395-17971-29-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 29/33] gio-module-cache: Add PACKAGE_WRITE_DEPS for postinst
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:38 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

Qemu is used to run gio-querymodules on postinstall.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/gio-module-cache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index 39b7bef..a8190b7 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -1,4 +1,4 @@
-DEPENDS += "qemu-native"
+PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
 GIO_MODULE_PACKAGES ??= "${PN}"
-- 
2.7.4


