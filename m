Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1To6zf-0002Pr-Ie
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 07:31:03 +0100
Received: from mail71-tx2-R.bigfish.com (10.9.14.254) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Thu, 27 Dec 2012 05:46:00 +0000
Received: from mail71-tx2 (localhost [127.0.0.1])	by mail71-tx2-R.bigfish.com
	(Postfix) with ESMTP id 5C00C3E0206	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 05:46:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1de0h1202h1e76h1d1ah1d2ahzz8275bh8275dh177df4h1954cbh17326ahz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1155h)
Received: from mail71-tx2 (localhost.localdomain [127.0.0.1]) by mail71-tx2
	(MessageSwitch) id 1356587158568182_16706;
	Thu, 27 Dec 2012 05:45:58 +0000 (UTC)
Received: from TX2EHSMHS041.bigfish.com (unknown [10.9.14.239])	by
	mail71-tx2.bigfish.com (Postfix) with ESMTP id 8745760067	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 05:45:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS041.bigfish.com
	(10.9.99.141) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 27 Dec 2012 05:45:58 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Thu, 27 Dec 2012 05:45:58 +0000
Received: from b28495.ap.freescale.net (udp143739uds.ap.freescale.net
	[10.192.208.202])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id qBR5jsn4004783;	Wed, 26 Dec 2012 22:45:55 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2012 13:45:53 +0800
Message-ID: <1356587153-23448-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [PATCH] cairo: add dependency on libxext
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
X-List-Received-Date: Thu, 27 Dec 2012 06:31:03 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-graphics/cairo/cairo.inc       |    2 +-
 meta/recipes-graphics/cairo/cairo_1.12.8.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 3059fae..a69f11a 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -11,7 +11,7 @@ BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
 X11DEPENDS = "virtual/libx11 libsm libxrender"
-DEPENDS = "libpng fontconfig pixman glib-2.0"
+DEPENDS = "libpng fontconfig pixman glib-2.0 libxext"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'gtk-directfb', 'gtk-directfb', '', d)}"
 PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
diff --git a/meta/recipes-graphics/cairo/cairo_1.12.8.bb b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
index 058854c..567a17f 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.8.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-- 
1.7.3.4




