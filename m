Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U2nKB-0002xA-EA
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 19:32:56 +0100
Received: from mail40-db3-R.bigfish.com (10.3.81.244) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.23; Tue, 5 Feb 2013 17:46:58 +0000
Received: from mail40-db3 (localhost [127.0.0.1])	by mail40-db3-R.bigfish.com
	(Postfix) with ESMTP id F001334078B	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:46:57 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail40-db3 (localhost.localdomain [127.0.0.1]) by mail40-db3
	(MessageSwitch) id 1360086416729055_31937;
	Tue,  5 Feb 2013 17:46:56 +0000 (UTC)
Received: from DB3EHSMHS008.bigfish.com (unknown [10.3.81.237])	by
	mail40-db3.bigfish.com (Postfix) with ESMTP id AECBC801E9	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:46:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS008.bigfish.com
	(10.3.87.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 5 Feb 2013 17:46:55 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 5 Feb 2013 17:46:53 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r15Hkj8B032069	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Feb 2013 10:46:50 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Feb 2013 11:46:45 -0600
Message-ID: <1360086408-29832-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1360086408-29832-1-git-send-email-msm@freescale.com>
References: <1360086408-29832-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/5] quota_4.01.bb: add e2fsprogs in DEPENDS
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
X-List-Received-Date: Tue, 05 Feb 2013 18:32:56 -0000
Content-Type: text/plain

Fixes:

| /local/home/mattsm/git/poky/build-master/tmp/sysroots/x86_64-linux/usr/libexec/ppce300c3-poky-linux/gcc/powerpc-poky-linux/4.7.2/ld: cannot find -lext2fs

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-extended/quota/quota_4.01.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index 1cb6650..80159a9 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD & GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad24027f0651028ec \
                     file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
 
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "a36300bbc126b79b745bf937245092808b4585aa3309ef3335d4ab9d87
 
 S = "${WORKDIR}/quota-tools"
 
-DEPENDS = "gettext-native"
+DEPENDS = "gettext-native e2fsprogs"
 
 inherit autotools gettext
 
-- 
1.7.9.7




