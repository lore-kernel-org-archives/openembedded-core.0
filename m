Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7AB78890
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 13:40:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FDeIMY015917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 13:40:21 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7B-0002OW-Gk; Thu, 15 Mar 2018 06:40:17 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:40:13 -0700
Message-Id: <1521121214-9149-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521121214-9149-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521121214-9149-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [rocko][PATCH 4/5] yocto-uninative: Upgrade to 1.8 version with glibc 2.27
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
X-List-Received-Date: Thu, 15 Mar 2018 13:40:23 -0000

Now distros are starting to ship glibc 2.27 we need a uninatve version
which contains glibc 2.27 which is in the 1.8 version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 839c19a..b3f8c24 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,6 +6,6 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.7/"
-UNINATIVE_CHECKSUM[i686] ?= "d7c341460035936c19d63fe02f354ef1bc993c62d694ae3a31458d1c6997f0c5"
-UNINATIVE_CHECKSUM[x86_64] ?= "ed033c868b87852b07957a4400f3b744c00aef5d6470346ea1a59b6d3e03075e"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.8/"
+UNINATIVE_CHECKSUM[i686] ?= "427ce522ec97f65c75fd89587d90ef789e8cbca4a617abc4b5822abb01c2d0ae"
+UNINATIVE_CHECKSUM[x86_64] ?= "de4947e98e09e1432d069311cc2093974ecb9138a714fd5466f73524de66a693"
-- 
2.7.4


