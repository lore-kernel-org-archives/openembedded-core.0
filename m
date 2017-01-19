Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8A80471DDE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrQhu005703; Thu, 19 Jan 2017 22:53:26 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FA-QNV5LXggU; Thu, 19 Jan 2017 22:53:26 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrNMJ005665
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:24 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa7-0004iK-QT; Thu, 19 Jan 2017 22:53:23 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:52:59 +0000
Message-Id: <1484866395-17971-17-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 17/33] nss: Add PACKAGE_WRITE_DEPS
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:35 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

nss-native is required in postinst. It's also needed during
build so not removed from DEPENDS.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/nss/nss_3.27.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/nss/nss_3.27.1.bb b/meta/recipes-support/nss/nss_3.27.1.bb
index 2a4f4d6..9aad5bd 100644
--- a/meta/recipes-support/nss/nss_3.27.1.bb
+++ b/meta/recipes-support/nss/nss_3.27.1.bb
@@ -207,6 +207,7 @@ do_install_append_class-target() {
     rm ./empty_password
 }
 
+PACKAGE_WRITE_DEPS += "nss-native"
 pkg_postinst_${PN} () {
     if [ -n "$D" ]; then
         for I in $D${libdir}/lib*.chk; do
-- 
2.7.4


