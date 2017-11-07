Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27BC971B99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 13:25:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA7DPAHf012206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 7 Nov 2017 13:25:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eC3sM-00023b-5a; Tue, 07 Nov 2017 13:25:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Nov 2017 13:25:09 +0000
Message-Id: <1510061109-7869-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] bind: Convert from ftp to https urls
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
X-List-Received-Date: Tue, 07 Nov 2017 13:25:13 -0000

The ftp protocol is dated and problematic. Since https is available, lets
use that instead, making new users chances of successful builds higher.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bind/bind_9.10.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
index 7a35390..7718195 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
 
 DEPENDS = "openssl libcap"
 
-SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
            file://make-etc-initd-bind-stop-work.patch \
            file://dont-test-on-host.patch \
@@ -26,7 +26,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"
 SRC_URI[sha256sum] = "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d1e0d050fdf47e69d"
 
-UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/bind9/"
+UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
 
 
-- 
2.7.4


