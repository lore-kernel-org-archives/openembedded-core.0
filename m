Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6B17280D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:42:55 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id puin1p00C0BVjqb01uiwWB; Sun, 08 Feb 2015 11:42:56 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:42:21 -0600
Message-Id: <8fdca0d22db503e2948d895c41d50040dc729210.1423420390.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
Subject: [PATCHv3 09/10] libpcap: select distro preference for bluez provider
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
X-List-Received-Date: Sun, 08 Feb 2015 18:42:58 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index a12eb16..979665c 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -10,8 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
-PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
+inherit bluetooth
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
+PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
 PACKAGECONFIG[libnl] = "--with-libnl,--without-libnl,libnl"
 
-- 
1.9.1


