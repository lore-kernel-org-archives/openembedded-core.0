Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DC9977FA24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znM05g5lz3w
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280300;
	bh=AxdkNyJgvMfejfmFRsC/QpZQhqf2dJvbBZ1mQS49cM0=;
	h=From:To:Subject:Date:From;
	b=LJEc6Kikr6xe+1NhiTu3a5+IXB6VfiiNzGs8XKEsy1i7WwncTNnIXtTMYnUGYbTbT
	0nmzA8SNNd23DCDKp4aDd9IFrUuF0pqhzy1OCOJ+yYhraN2sf21Zf7kCozOQsfpNMZ
	lXXr9K614PZoTHPnnzKn+GtMgjA6jQMQ6VLTCaRH1nCY6pCM/0VhACm2648UrGTHXM
	D3xudZUWOh0NNmrTs06jvcT9nxvYJiCW54hb4dLxkoJX9AxsrK7J1RQsyQfG7evdBX
	4cwPK0nNXS7Lj7sBg4lka3C8VI+agvhsbxJ10nGWaceJd60ASlTamZRmSU3Rzo0Fjk
	t9/jdVsFIx1ChaWPXFR9b7kwSWzE2kLKv8Lcm2s7Bdh1zHyHUOB1jyAf53fuihmOB4
	rPSRKKEvCOvgvZAdBQWE+IPkdi4B0uI08mf/rmYsZQqEsRoqjctHa+NzwccjzyXCpd
	lcWSTNhiALH6QFOfDQUtsD3v3XcvmzLcjyoNNI1At9tGi/i4hzUY3VI2Sf7NCg6gaO
	BN52My5a4eOf+I2jYs8DL1XoqA1n7UETihK8w+MHppSA8tv4LmR6yZmQtFRY6kKgc8
	zMs4NY4iOID0BWO5SotQ2UBj+3bPBk98MwEAO3IdktkIt14GF6usO/Ai+vjO1WOVOK
	pSAfAtE+1RYE5+bqaMMf0nmg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 18:58:13 +0200
Message-Id: <20200117165819.2542-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] systemd: Whitelist CVE-2018-21029 CVE-2019-3843 CVE-2019-3844
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
X-List-Received-Date: Fri, 17 Jan 2020 16:58:22 -0000

One does not strictly apply to 241, for the other two a fix
was already backported to the 241 branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 2b9c291959..cb41ac5b22 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,6 +14,13 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
+# DNSOverTLS strict mode was added in 243
+# https://github.com/systemd/systemd/issues/9397
+CVE_CHECK_WHITELIST += "CVE-2018-21029"
+
+# Commit dc903ec516cb on the 241 branch
+CVE_CHECK_WHITELIST += "CVE-2019-3843 CVE-2019-3844"
+
 SRCREV = "511646b8ac5c82f210b16920044465756913d238"
 SRCBRANCH = "v241-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
-- 
2.17.1


