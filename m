Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fdx-00011S-1t
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:13 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0ccF2004574 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:38 GMT
X-Quarantine-ID: <ciWRudUHfTyj>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ciWRudUHfTyj
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:37 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cYPP004523
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:35 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVS-0002eF-MZ
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:26 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:10 +0000
Message-Id: <c5f4a9261d582a52429cf5a115efed61987b0dd8.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/17] sato-screenshot: Remove unneeded .la file
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

This resolves the QA warning:

WARNING: For recipe sato-screenshot, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/matchbox-panel/libscreenshot.la

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sato-screenshot/sato-screenshot_git.bb         |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index 8a113b3..ff92142 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "matchbox-panel-2"
 SRCREV = "c792e4edc758bab21e0b01814979eacf0b1af945"
 PV = "0.1+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=git \
            file://fix_ldadd_order.patch"
@@ -21,3 +21,7 @@ inherit autotools pkgconfig
 
 FILES_${PN} += "${libdir}/matchbox-panel/*.so"
 FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
+
+do_install_append () {
+	rm ${D}${libdir}/matchbox-panel/*.la
+}
-- 
1.7.5.4



