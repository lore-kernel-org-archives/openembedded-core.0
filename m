Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5DECC6093E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 21:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8RLOB1E009593 for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 22:24:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XpCuPB7DfEWx
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 22:24:11 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8RLO9dL009590
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 22:24:11 +0100
Message-ID: <1475011449.30475.56.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Sep 2016 22:24:09 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] uninative: Upgrade to 1.4
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
X-List-Received-Date: Tue, 27 Sep 2016 21:24:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This adds the new version of patchelf which resolves issues some users
were seeing with older versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 0c0f75c..2f794f7 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,7 +6,6 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_URL = "http://downloads.yoctoproject.org/releases/uninative/1.3/"
-UNINATIVE_CHECKSUM[i686] ?= "ace5a6a0a91d5848de7bc8128379c2a987811454b6cb321ea9003ce91e6652d4"
-UNINATIVE_CHECKSUM[x86_64] ?= "8e8b3db668fcc5bfdfcd268c0999ba2f4e85148a9a147f856d7b684f802c9797"
-
+UNINATIVE_URL = "http://downloads.yoctoproject.org/releases/uninative/1.4/"
+UNINATIVE_CHECKSUM[i686] ?= "b4bc60511ce479736808273ffa043df4ed2a225407dd7ca150ae6220d9ce76d5"
+UNINATIVE_CHECKSUM[x86_64] ?= "101ff8f2580c193488db9e76f9646fb6ed38b65fb76f403acb0e2178ce7127ca"



