Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UQD85-0002Gl-Qt
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 10:45:29 +0200
Received: from mail149-co1-R.bigfish.com (10.243.78.225) by
	CO1EHSOBE025.bigfish.com (10.243.66.88) with Microsoft SMTP Server id
	14.1.225.23; Thu, 11 Apr 2013 08:27:49 +0000
Received: from mail149-co1 (localhost [127.0.0.1])	by
	mail149-co1-R.bigfish.com (Postfix) with ESMTP id 590AE5C0357	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 08:27:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail149-co1 (localhost.localdomain [127.0.0.1]) by mail149-co1
	(MessageSwitch) id 1365668822409163_21949;
	Thu, 11 Apr 2013 08:27:02 +0000 (UTC)
Received: from CO1EHSMHS007.bigfish.com (unknown [10.243.78.250])	by
	mail149-co1.bigfish.com (Postfix) with ESMTP id 61C61D0004A	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 08:27:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS007.bigfish.com
	(10.243.66.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 11 Apr 2013 08:27:02 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 11 Apr 2013 08:27:01 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r3B8QwfJ025275;
	Thu, 11 Apr 2013 01:26:59 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 16:31:28 +0800
Message-ID: <1365669088-18442-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: [oe-core master] wayland: add necessary dependencies to fix build error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 08:45:49 -0000
Content-Type: text/plain

add libffi into DEPENDS to fix following build error:
| checking for FFI... no
| configure: error: Package requirements (libffi) were not met:
|
| No package 'libffi' found

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/recipes-graphics/wayland/wayland_1.0.6.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.0.6.bb b/meta/recipes-graphics/wayland/wayland_1.0.6.bb
index 6385933..1585479 100644
--- a/meta/recipes-graphics/wayland/wayland_1.0.6.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.0.6.bb
@@ -10,6 +10,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
+PR = "r1"
+
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "936a2590aea69fa3c0cf234d54b9137c"
 SRC_URI[sha256sum] = "f52a012df699eff434b0f49e56000d6978b5f781048402ca8e0232242970fc49"
@@ -19,8 +21,8 @@ inherit autotools pkgconfig
 # We need wayland-native for the wayland-scanner utility
 BBCLASSEXTEND = "native"
 
-DEPENDS_virtclass-native = "expat-native"
-DEPENDS = "expat wayland-native"
+DEPENDS_virtclass-native = "expat-native libffi-native"
+DEPENDS = "expat libffi wayland-native"
 
 EXTRA_OECONF_virtclass-native = "--disable-documentation"
 EXTRA_OECONF = "--disable-documentation --disable-scanner"
-- 
1.7.9.5




