Return-Path: <Mikhail_Durnev@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE3D6E88D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 07:40:45 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1W83Hq-0000Xk-LD from Mikhail_Durnev@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jan 2014 23:40:46 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 27 Jan 2014 23:40:46 -0800
Received: from workstation.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Mon, 27 Jan 2014 23:39:59 -0800
From: <Mikhail_Durnev@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jan 2014 18:40:35 +1100
Message-ID: <1390894836-8800-1-git-send-email-Mikhail_Durnev@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginalArrivalTime: 28 Jan 2014 07:40:46.0719 (UTC)
	FILETIME=[41D488F0:01CF1BFC]
Subject: [PATCH] wpa-supplicant: Add dependency on openssl
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
X-List-Received-Date: Tue, 28 Jan 2014 07:40:45 -0000
Content-Type: text/plain

From: Mikhail Durnev <Mikhail_Durnev@mentor.com>

Building of wpa-supplicant failed due to missing dependency on openssl:
crypto_openssl.c:10:30: fatal error: openssl/opensslv.h: No such file or directory

Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
---
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 9b722cb..f9c5ea7 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -6,7 +6,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
                     file://README;md5=5cb758942d25f6f61fd4ac388fd446fa \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=cba4fa09fa364da845ca546f21008909"
-DEPENDS = "gnutls dbus libnl"
+DEPENDS = "gnutls dbus libnl openssl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 inherit systemd
-- 
1.7.9.5


