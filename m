Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0B18A6B6B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 01:12:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57635785"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Feb 2015 09:08:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1G1BTDN023339
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 09:11:29 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 16 Feb 2015 09:12:17 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Feb 2015 09:07:05 +0800
Message-ID: <1424048825-21819-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH] iputils: install clockdiff same as ubuntu and fedora
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
X-List-Received-Date: Mon, 16 Feb 2015 01:12:19 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/recipes-extended/iputils/iputils_s20121221.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20121221.bb b/meta/recipes-extended/iputils/iputils_s20121221.bb
index 46f8903..e87a32a 100644
--- a/meta/recipes-extended/iputils/iputils_s20121221.bb
+++ b/meta/recipes-extended/iputils/iputils_s20121221.bb
@@ -34,6 +34,7 @@ do_install () {
 	install -m 4555 ping ${D}${base_bindir}/ping
 	install -m 4555 ping6 ${D}${base_bindir}/ping6
 	install -m 4555 traceroute6 ${D}${base_bindir}/
+	install -m 4555 clockdiff ${D}${base_bindir}/
 	# Other programgs
 	for i in arping tracepath tracepath6; do
 	  install -m 0755 $i ${D}${base_bindir}/
@@ -54,10 +55,10 @@ ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 ALTERNATIVE_${PN}-ping6 = "ping6"
 ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
 
-PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6"
+PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
 
 ALLOW_EMPTY_${PN} = "1"
-RDEPENDS_${PN} += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6"
+RDEPENDS_${PN} += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
 
 FILES_${PN}	= ""
 FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
@@ -66,4 +67,5 @@ FILES_${PN}-arping = "${base_bindir}/arping"
 FILES_${PN}-tracepath = "${base_bindir}/tracepath"
 FILES_${PN}-tracepath6 = "${base_bindir}/tracepath6"
 FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
+FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
 FILES_${PN}-doc	= "${mandir}/man8"
-- 
1.9.1


