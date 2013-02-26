Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1UATHA-00057J-M3
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:45:47 +0100
Received: from mail17-am1-R.bigfish.com (10.3.201.229) by
	AM1EHSOBE012.bigfish.com (10.3.207.134) with Microsoft SMTP Server id
	14.1.225.23; Tue, 26 Feb 2013 21:58:56 +0000
Received: from mail17-am1 (localhost [127.0.0.1])	by mail17-am1-R.bigfish.com
	(Postfix) with ESMTP id 566DE400073	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 21:58:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275ch17326ah8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1155h)
Received: from mail17-am1 (localhost.localdomain [127.0.0.1]) by mail17-am1
	(MessageSwitch) id 1361915935237704_29246;
	Tue, 26 Feb 2013 21:58:55 +0000 (UTC)
Received: from AM1EHSMHS008.bigfish.com (unknown [10.3.201.246])	by
	mail17-am1.bigfish.com (Postfix) with ESMTP id 37A6B360272	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 21:58:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS008.bigfish.com
	(10.3.207.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 26 Feb 2013 21:58:47 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 26 Feb 2013 21:58:36 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r1QLwier007813 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 14:58:45 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 15:58:43 -0600
Message-ID: <1361915924-23046-3-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1361915924-23046-1-git-send-email-msm@freescale.com>
References: <1361915924-23046-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 3/4] libpfm4_4.3.0.bb: use compatible host to limit arches
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
X-List-Received-Date: Tue, 26 Feb 2013 22:46:01 -0000
Content-Type: text/plain

This is only test with powerpc64 currently, even though
it should work on other arches such as x86 and sparc. When
thos are testing and working this COMPATIBLE_HOST should
be updated

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
index 460029f..98852f6 100644
--- a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
+++ b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de488f3bd4424e308e2e399cb99c788"
 
 SECTION = "devel"
 
+PR = "r1"
+COMPATIBLE_HOST = "powerpc64"
+
 SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/libpfm4/libpfm-4.3.0.tar.gz"
 
 SRC_URI[md5sum] = "0ab272dbdbb759b852ba8bd06db030ef"
-- 
1.7.9.7




