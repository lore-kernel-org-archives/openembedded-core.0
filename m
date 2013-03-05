Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UCwMT-0007cB-I4
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 19:13:14 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2013 18:56:40 +0100
Message-Id: <1362506200-26334-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libpcap: fix description variable
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
X-List-Received-Date: Tue, 05 Mar 2013 18:13:16 -0000

* The variable name was truncated.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/libpcap/libpcap.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index b9c3640..3a08afe 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -1,5 +1,5 @@
 SUMMARY = "Interface for user-level network packet capture"
-DESCRIPT = "Libpcap provides a portable framework for low-level network \
+DESCRIPTION = "Libpcap provides a portable framework for low-level network \
 monitoring.  Libpcap can provide network statistics collection, \
 security monitoring and network debugging."
 HOMEPAGE = "http://www.tcpdump.org/"
@@ -14,7 +14,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth',
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 
-- 
1.7.10.4



