Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.42])
	by mail.openembedded.org (Postfix) with ESMTP id 051AC65CB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:13:50 +0000 (UTC)
Received: from 1apvKP-00012Y-T4 by out11c.electric.net with emc1-ok (Exim 4.85)
	(envelope-from <sona.sarmadi@enea.com>) id 1apvKP-00012t-TM
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2016 03:13:49 -0700
Received: by emcmailer; Tue, 12 Apr 2016 03:13:49 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11c.electric.net with smtp (Exim 4.85)
	(envelope-from <sona.sarmadi@enea.com>) id 1apvKP-00012Y-T4
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2016 03:13:49 -0700
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 12 Apr 2016 12:13:48 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Apr 2016 12:13:45 +0200
Message-ID: <1460456025-30856-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH] bind: Upgrade 9.10.3-P3 -> 9.10.3-P4
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
X-List-Received-Date: Tue, 12 Apr 2016 10:13:53 -0000
Content-Type: text/plain

The upgrade addresses following vulnerabilities:
   CVE-2016-1285
   CVE-2016-1286
   CVE-2016-2088

Fixes [YOCTO #9400 and #9438].

References:
https://kb.isc.org/article/AA-01352
https://kb.isc.org/article/AA-01353
https://kb.isc.org/article/AA-01351

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../bind/{bind_9.10.3-P3.bb => bind_9.10.3-P4.bb}                   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.10.3-P4.bb} (94%)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P4.bb
similarity index 94%
rename from meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
rename to meta/recipes-connectivity/bind/bind_9.10.3-P4.bb
index fa057d5..cc124a9 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0a95f52a0ab6c5f52dedc9a45e7abb3f"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=98ba6d57f5b0e3d7819990c4166b3e52"
 
 DEPENDS = "openssl libcap"
 
@@ -23,8 +23,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
            "
 
-SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
-SRC_URI[sha256sum] = "690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83"
+SRC_URI[md5sum] = "173ce5e83e9ba31f8368367ee1ff7807"
+SRC_URI[sha256sum] = "2ac044b5fbdf45fb45107af0df961b3b7cb5262a3bf1948ed3fe7a170dd13e3e"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
-- 
1.9.1


