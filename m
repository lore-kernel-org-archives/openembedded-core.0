Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EF49560939
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 09:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8S9EFbT007615 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 10:14:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Syl2IfE5bdLS
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 10:14:15 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8S9EEBw007608
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 10:14:15 +0100
Message-ID: <1475054054.30475.65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2016 10:14:14 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa/sstatetests: Ensure we cover deb packaging backend for sstate test
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
X-List-Received-Date: Wed, 28 Sep 2016 09:14:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently we weren't testing the deb backaned for sstate correctness
and there was a bug that had crept in. Ensure we cover all package
backends with the test regardless of what the distro/conf sets.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 07212ac..a353f67 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -237,6 +237,7 @@ TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
 BUILD_ARCH = "x86_64"
 BUILD_OS = "linux"
 SDKMACHINE = "x86_64"
+PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
@@ -246,6 +247,7 @@ TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
 BUILD_ARCH = "i686"
 BUILD_OS = "linux"
 SDKMACHINE = "i686"
+PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-sato -S none")



