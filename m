Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A4A1977DE5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 17:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v37H16wQ014668; 
	Fri, 7 Apr 2017 18:01:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q4mPyPORAZmv; Fri,  7 Apr 2017 18:01:06 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v37GfqRY011514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 17:41:53 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cwWxM-0000QG-SD; Fri, 07 Apr 2017 17:41:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 17:41:49 +0100
Message-Id: <1491583311-1551-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491583311-1551-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1491583311-1551-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] no-static-libs: Add entry for ncurses
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
X-List-Received-Date: Fri, 07 Apr 2017 17:01:07 -0000

Yes, the option to disable static libraries in boost really is
"--without-normal". Add this for ncurses and its variants.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/no-static-libs.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 54f34a7..f8d8c09 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -33,3 +33,7 @@ DISABLE_STATIC_pn-libusb1-native = ""
 EXTRA_OECONF_append = "${DISABLE_STATIC}"
 
 EXTRA_OECMAKE_append_pn-libical = " -DSHARED_ONLY=True"
+
+EXCONFIG_ARGS_append_pn-ncurses = " --without-normal"
+EXCONFIG_ARGS_append_pn-ncurses-native = " --without-normal"
+EXCONFIG_ARGS_append_pn-nativesdk-ncurses = " --without-normal"
-- 
2.7.4


