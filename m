Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 68E57719C4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 07:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u957tE77025798 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2016 08:55:14 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6SnCTKOYJtFN
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 08:55:14 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u957tBte025779
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2016 08:55:12 +0100
Message-ID: <1475654111.30475.487.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2016 08:55:11 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] pigz: Update SRC_URI
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
X-List-Received-Date: Wed, 05 Oct 2016 07:55:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upstream have released a new tarball and removed the old one. Revert to
the Yocto Project source mirror instead, preserving the upstream version 
check.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/pigz/pigz_2.3.3.bb b/meta/recipes-extended/pigz/pigz_2.3.3.bb
index 080be2b..9e97273 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.3.bb
+++ b/meta/recipes-extended/pigz/pigz_2.3.3.bb
@@ -1,6 +1,8 @@
 require pigz.inc
 LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
 
+UPSTREAM_CHECK_URI := "${SRC_URI}"
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz"
 SRC_URI += "file://link-order.patch"
 
 SRC_URI[md5sum] = "01d7a16cce77929cc1a78aa1bdfb68cb"



