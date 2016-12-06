Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8199071A6E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:15 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 0247FB8B28D; Tue,  6 Dec 2016 12:49:54 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:51 +0100
Message-Id: <1481024991-5882-34-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 33/33] apt: dselect depends on perl
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:15 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt_1.2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index 5dc50a4..0b640f9 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -110,7 +110,7 @@ do_install_append_class-target() {
 PACKAGES =+ "${PN}-dselect ${PN}-transport-https ${PN}-utils lib${PN}-inst lib${PN}-pkg"
 
 RDEPENDS_${PN} = "dpkg debianutils"
-RDEPENDS_${PN}-dselect = "bash"
+RDEPENDS_${PN}-dselect = "bash perl"
 
 RRECOMMENDS_${PN} = "gnupg"
 RRECOMMENDS_${PN}_class-native = ""
-- 
2.7.4


