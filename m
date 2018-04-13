Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1C674608
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 15:58:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3DFwQKP010559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 13 Apr 2018 16:58:28 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f715m-0001Zz-UH; Fri, 13 Apr 2018 16:58:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2018 16:58:25 +0100
Message-Id: <1523635105-6033-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: [PATCH] yocto-uninative: Update to version 1.9 (fedora28 compatible)
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
X-List-Received-Date: Fri, 13 Apr 2018 15:58:29 -0000

This includes the libxcrypt change which allows uninative to work on fedora28.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index cd5fc0b..a8e82cb 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,6 +8,6 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.27"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.8/"
-UNINATIVE_CHECKSUM[i686] ?= "427ce522ec97f65c75fd89587d90ef789e8cbca4a617abc4b5822abb01c2d0ae"
-UNINATIVE_CHECKSUM[x86_64] ?= "de4947e98e09e1432d069311cc2093974ecb9138a714fd5466f73524de66a693"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.9/"
+UNINATIVE_CHECKSUM[i686] ?= "83a4f927da81d9889ef0cbe5c12cb782e21c6cc11e6155600b94ff0c99576dce"
+UNINATIVE_CHECKSUM[x86_64] ?= "c26622a1f27dbf5b25de986b11584b5c5b2f322d9eb367f705a744f58a5561ec"
-- 
2.7.4


