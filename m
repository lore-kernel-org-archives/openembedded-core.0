Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 643436E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 10:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4HA0Yr8013005 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 11:00:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UeOKXiqZbLh7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 11:00:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4HA0Vcx013001
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 11:00:32 +0100
Message-ID: <1463479231.4578.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 11:00:31 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] yocto-uninative: Update to 1.0 tarball (new version of glibc)
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
X-List-Received-Date: Tue, 17 May 2016 10:00:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since we have a new version of glibc, upgrade to a new version of
the uninative tarball to ensure we work on recent distributions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 85e613a..2f7fd6d 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,6 +6,6 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_URL = "http://downloads.yoctoproject.org/releases/uninative/0.95/"
-UNINATIVE_CHECKSUM[i686] ?= "5f27d7e0f4dd2ed80a7ff6a0d88af107b08e00765b31ed3aa180cc5ce15b0811"
-UNINATIVE_CHECKSUM[x86_64] ?= "26d46c61ad88cc245e31c88549717c0092a838d111b93ec169d88b08cc027581"
+UNINATIVE_URL = "http://downloads.yoctoproject.org/releases/uninative/1.0/"
+UNINATIVE_CHECKSUM[i686] ?= "94a4693ec2df05d326e13dc1b613b7810ec7eeb5c9ce61d107c672cba49ac51a"
+UNINATIVE_CHECKSUM[x86_64] ?= "d3f2153800a730f647d0e06b76be5321ca400a076ffcf90d5512b72098406a61"



