Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1RbDSX-0008Ab-LY
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 16:43:02 +0100
Received: from [62.99.145.21] (port=27524 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1RbDLp-0006Zs-Up
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 16:36:05 +0100
Received: from [83.64.51.210] (port=12111 helo=gateway1.hale)
	by smartmx-19.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1RbDLk-0002oc-PA for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 16:36:00 +0100
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id pBFFa29f021485
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 16:36:02 +0100
Received: from localhost.localdomain ([192.168.100.138]) by hale.at with
	MailEnable ESMTP; Thu, 15 Dec 2011 16:35:52 +0100
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 16:35:38 +0100
Message-Id: <1323963338-21505-1-git-send-email-Bernhard.Guillon@hale.at>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: pBFFa29f021485
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1324568163.19952@PzOzxXd6rHwoVG4QKeB1bw
X-Spam-Status: No
Subject: [PATCH] update-rc.d.bbclass: override UPDATERCD for nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2011 15:43:02 -0000

Override UPDATERCD for nativesdk.
Without, update-rc.d is installed to /usr/sbin/update-rc.d
with meta-toolchain if nativesdk recipe inherits update-rc.d. An
example recipe for this is dbus.

Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at>
---
 meta/classes/update-rc.d.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 492c5fb..304decf 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -3,6 +3,8 @@ UPDATERCPN ?= "${PN}"
 DEPENDS_append = " update-rc.d-native"
 UPDATERCD = "update-rc.d"
 UPDATERCD_virtclass-native = ""
+UPDATERCD_virtclass-nativesdk = ""
+
 RDEPENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
 
 INITSCRIPT_PARAMS ?= "defaults"
-- 
1.7.1



--
Scanned by MailScanner.



