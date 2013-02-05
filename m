Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U2n5c-0007qq-HE
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 19:17:57 +0100
Received: from mail98-db3-R.bigfish.com (10.3.81.225) by
	DB3EHSOBE004.bigfish.com (10.3.84.24) with Microsoft SMTP Server id
	14.1.225.23; Tue, 5 Feb 2013 17:46:58 +0000
Received: from mail98-db3 (localhost [127.0.0.1])	by mail98-db3-R.bigfish.com
	(Postfix) with ESMTP id F41F0200123	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:46:57 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275ch177df4h17326ah8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail98-db3 (localhost.localdomain [127.0.0.1]) by mail98-db3
	(MessageSwitch) id 1360086415953866_20905;
	Tue,  5 Feb 2013 17:46:55 +0000 (UTC)
Received: from DB3EHSMHS011.bigfish.com (unknown [10.3.81.244])	by
	mail98-db3.bigfish.com (Postfix) with ESMTP id E486FA00A6	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:46:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS011.bigfish.com
	(10.3.87.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 5 Feb 2013 17:46:55 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 5 Feb 2013 17:46:54 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r15Hkj8C032069	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Feb 2013 10:46:53 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Feb 2013 11:46:46 -0600
Message-ID: <1360086408-29832-3-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1360086408-29832-1-git-send-email-msm@freescale.com>
References: <1360086408-29832-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 3/5] libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc
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
X-List-Received-Date: Tue, 05 Feb 2013 18:18:01 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb

diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
new file mode 100644
index 0000000..460029f
--- /dev/null
+++ b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Monitoring tools exploiting the performance monitoring events"
+DESCRIPTION = "This package provides a library, called libpfm4 which is used to develop \
+monitoring tools exploiting the performance monitoring events such as those \
+provided by the Performance Monitoring Unit (PMU) of modern processors."
+HOMEPAGE = "http://perfmon2.sourceforge.net/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=144822&atid=759953&source=navbar"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0de488f3bd4424e308e2e399cb99c788"
+
+SECTION = "devel"
+
+SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/libpfm4/libpfm-4.3.0.tar.gz"
+
+SRC_URI[md5sum] = "0ab272dbdbb759b852ba8bd06db030ef"
+SRC_URI[sha256sum] = "a23eb9affbff279e13563a39317c0ad71c4de28908d4243c8bc109138430cc3b"
+
+EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCONFIG=\"true\""
+EXTRA_OEMAKE_append_powerpc = " ARCH=\"powerpc\""
+EXTRA_OEMAKE_append_powerpc64 = " ARCH=\"powerpc\" BITMODE=\"64\""
+
+S = "${WORKDIR}/libpfm-${PV}"
+
+do_install () {
+	oe_runmake install
+}
-- 
1.7.9.7




