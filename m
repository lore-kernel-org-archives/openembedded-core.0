Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B98D878369
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 07:46:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6U7k0B4004400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 30 Jul 2017 08:46:01 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dbivI-000701-CS; Sun, 30 Jul 2017 08:46:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jul 2017 08:45:58 +0100
Message-Id: <1501400758-26866-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 30 Jul 2017 08:46:01 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] uninative: Update to 1.7 uninative release
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
X-List-Received-Date: Sun, 30 Jul 2017 07:46:03 -0000

This updates to a newer glibc and updates patchelf to include a bugfix
to work with gold.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 7c2151c..839c19a 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,6 +6,6 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.6/"
-UNINATIVE_CHECKSUM[i686] ?= "d9daf66785834f888b6f50a1d37a8120815f8380e0e267d311e1dfaf4bb5404e"
-UNINATIVE_CHECKSUM[x86_64] ?= "2b4fffa308d9f19e0742a1a404ff42495fb50c165e5ca0458cedca157372691a"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.7/"
+UNINATIVE_CHECKSUM[i686] ?= "d7c341460035936c19d63fe02f354ef1bc993c62d694ae3a31458d1c6997f0c5"
+UNINATIVE_CHECKSUM[x86_64] ?= "ed033c868b87852b07957a4400f3b744c00aef5d6470346ea1a59b6d3e03075e"
-- 
2.7.4


