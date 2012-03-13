Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fe1-00012a-Dp
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:17 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cgTC004618 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:42 GMT
X-Quarantine-ID: <44qGRv6HyCeL>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 44qGRv6HyCeL
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:42 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0ca21004551
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:37 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVU-0002em-Cl
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:28 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:21 +0000
Message-Id: <a5b8067f4d8c4b2aa230d8c998f4188d7b43895b.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 14/17] bluez4: Ensure the plugins directory is packaged to avoid warnings
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:19 -0000

This makes sense in this case even if its empty since this package is the
correct owner for it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bluez/bluez4_4.98.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.98.bb b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
index 9a4c682..5df3241 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.98.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
@@ -22,7 +22,7 @@ RDEPENDS_${PN}-dev = "bluez-hcidump"
 PACKAGES =+ "libasound-module-bluez"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${base_libdir}/systemd/"
+FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${base_libdir}/systemd/"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
-- 
1.7.5.4



