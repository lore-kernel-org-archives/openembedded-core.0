Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D0EF7771BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 11:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14BWRiC016144 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Feb 2016 11:32:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rWPEmgH-5G2x
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 11:32:27 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14BWPoA016141
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Feb 2016 11:32:27 GMT
Message-ID: <1454585545.27087.237.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Feb 2016 11:32:25 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] util-linux: Change ALTERNATIVE_PRIORITY above busybox
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
X-List-Received-Date: Thu, 04 Feb 2016 11:32:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=8de5315bd519c21a114bc88b88c6caff32831c03

changed util-linux priority to match busybox (50) which means sometimes
one and sometimes the other wins in image installs (depending on the 
installation order which is package manager specific). We want 
util-linux to win compared to busybox.

The old level (100) does conflict with other utils so pick 80 as a
good intermediate value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f57284b..08ca040 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -184,7 +184,7 @@ do_install_append_class-native () {
 	rm -f ${D}${base_sbindir}/nologin
 }
 
-ALTERNATIVE_PRIORITY = "50"
+ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last lastb logger mesg renice wall"



