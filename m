Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fdw-00011Q-TD
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:13 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cbtA004573 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:38 GMT
X-Quarantine-ID: <yGejSYzlpW52>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yGejSYzlpW52
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:37 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cYLi004522
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:35 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVS-0002eC-HQ
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:26 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:09 +0000
Message-Id: <fb1e1ca346c617598726609425406b5afc79270d.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/17] xf86-input-vmmouse: Package unpackaged files
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:13 -0000

This addresses the QA warnings:

WARNING: For recipe xf86-input-vmmouse, the following files/directories were installed but not shipped in any package:
WARNING:   /lib
WARNING:   /lib/udev
WARNING:   /lib/udev/rules.d
WARNING:   /lib/udev/rules.d/69-xorg-vmmouse.rules
WARNING:   /usr/share/X11
WARNING:   /usr/share/hal
WARNING:   /usr/share/X11/xorg.conf.d
WARNING:   /usr/share/X11/xorg.conf.d/50-vmmouse.conf
WARNING:   /usr/share/hal/fdi
WARNING:   /usr/share/hal/fdi/policy
WARNING:   /usr/share/hal/fdi/policy/20thirdparty
WARNING:   /usr/share/hal/fdi/policy/20thirdparty/11-x11-vmmouse.fdi
WARNING:   /usr/lib/hal
WARNING:   /usr/lib/hal/hal-probe-vmmouse

The hal files are simply deleted, we don't care about hal.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-driver/xf86-input-vmmouse_12.7.0.bb       |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
index 42e2b14..652169f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
@@ -1,7 +1,7 @@
 require xorg-driver-input.inc
 
 DESCRIPTION = "X.Org X server -- VMWare mouse input driver"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 RDEPENDS_${PN} += "xf86-input-mouse"
 
@@ -11,3 +11,11 @@ SRC_URI[md5sum] = "dc77181330f983c7d0ec1ea1592c2ca7"
 SRC_URI[sha256sum] = "00e5d527a0d97e6b2a6e8c519e1339427e66fa0a43af026858655c7c62bd9e35"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+do_install_append () {
+	# We don't care about hal
+	rm -rf ${D}${datadir}/hal/
+	rm -rf ${D}${libdir}/hal/
+}
+
+FILES_${PN} += "${base_libdir}/udev/ ${datadir}/X11/xorg.conf.d"
-- 
1.7.5.4



