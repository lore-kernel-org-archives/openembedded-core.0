Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD2E7720D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 13:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8DDugDg017321 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:56:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id whDqZWmyo6Gt
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:56:50 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8DDumuZ017369
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:56:49 +0100
Message-ID: <1473775008.7207.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2016 14:56:48 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] eudev: Add missing pkgconfig dependencies
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
X-List-Received-Date: Tue, 13 Sep 2016 13:56:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Building eudev from scratch in an sstate build results in configure errors
since the pkg-config macros can't be found. Add in a missing pkg-config
dependency using the appropriate class to avoid such failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/udev/eudev_3.2.bb b/meta/recipes-core/udev/eudev_3.2.bb
index 6270617..8e229fc 100644
--- a/meta/recipes-core/udev/eudev_3.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.bb
@@ -23,7 +23,7 @@ UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
 SRC_URI[md5sum] = "9eb477cc8718db272b5d24dff1126b04"
 SRC_URI[sha256sum] = "37829d37f4beb7e358ca33abc1ad0907d87f917ce157777aeaeebeacae24efdc"
 
-inherit autotools update-rc.d qemu
+inherit autotools update-rc.d qemu pkgconfig
 
 EXTRA_OECONF = " \
     --sbindir=${base_sbindir} \



