Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9813271C87
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:14 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 2CC5FB8731B; Thu,  8 Dec 2016 22:47:59 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:43 +0100
Message-Id: <1481233677-27298-20-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 19/33] apt: recommend gnupg
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:14 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt_1.2.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index 2c4f11d..4d781a2 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -109,6 +109,9 @@ PACKAGES =+ "${PN}-dselect ${PN}-transport-https ${PN}-utils lib${PN}-inst lib${
 RDEPENDS_${PN} = "dpkg debianutils"
 RDEPENDS_${PN}-dselect = "bash"
 
+RRECOMMENDS_${PN} = "gnupg"
+RRECOMMENDS_${PN}_class-native = ""
+
 FILES_${PN} += "${libdir}/dpkg"
 FILES_${PN}-dselect = "${libdir}/dpkg/methods/apt"
 FILES_${PN}-transport-https = "${libdir}/apt/methods/https"
-- 
2.7.4


