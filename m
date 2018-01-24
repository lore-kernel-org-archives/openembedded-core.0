Return-Path: <hainsvdbosch@ziggo.nl>
X-Greylist: delayed 1005 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 Jan 2018 10:26:07 UTC
Received: from smtpq4.tb.mail.iss.as9143.net (smtpq4.tb.mail.iss.as9143.net
	[212.54.42.167])
	by mail.openembedded.org (Postfix) with ESMTP id 42791786E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 10:26:07 +0000 (UTC)
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
	by smtpq4.tb.mail.iss.as9143.net with esmtp (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>) id 1eeHzs-0001m4-9M
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Jan 2018 11:09:36 +0100
Received: from 524978c1.cm-4-2b.dynamic.ziggo.nl ([82.73.120.193]
	helo=localhost.localdomain)
	by smtp7.tb.mail.iss.as9143.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>)
	id 1eeHzs-0005fh-6I; Wed, 24 Jan 2018 11:09:36 +0100
From: Hains van den Bosch <hainsvdbosch@ziggo.nl>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jan 2018 11:08:55 +0100
Message-Id: <20180124100855.4551-2-hainsvdbosch@ziggo.nl>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180124100855.4551-1-hainsvdbosch@ziggo.nl>
References: <20180124100855.4551-1-hainsvdbosch@ziggo.nl>
X-SourceIP: 82.73.120.193
X-Authenticated-Sender: hainsvdbosch@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=JJMVTfCb c=1 sm=1 tr=0
	a=Q7YWMR2eS1SS1617XCK1UA==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19
	a=RgaUWeydRksA:10 a=_HefgGF2nv_A8RK-Hg8A:9 none
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Subject: [meta-oe][PATCH 2/2] libcdio: update to version 2.0.0
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
X-List-Received-Date: Wed, 24 Jan 2018 10:26:08 -0000

---
 .../recipes-multimedia/libcdio/{libcdio_0.93.bb => libcdio_2.0.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libcdio/{libcdio_0.93.bb => libcdio_2.0.0.bb} (86%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.0.0.bb
similarity index 86%
rename from meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio_2.0.0.bb
index 99e6a84bc..6bf64d663 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.0.0.bb
@@ -5,8 +5,9 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "d154476feaac5a7b5f180e83eaf3d689"
-SRC_URI[sha256sum] = "4972cd22fd8d0e8bff922d35c7a645be0db0ab0e7b3dfaecc9cd8272429d6975"
+
+SRC_URI[md5sum] = "0cb25905113b930e4539d2f4eb6574b0"
+SRC_URI[sha256sum] = "1b481b5da009bea31db875805665974e2fc568e2b2afa516f4036733657cf958"
 
 inherit autotools pkgconfig
 
-- 
2.15.1


