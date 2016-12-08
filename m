Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF9D71C81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:08 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 3C28DB87E84; Thu,  8 Dec 2016 22:47:58 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:36 +0100
Message-Id: <1481233677-27298-13-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 12/33] apt: use default packaging rules for -dev package
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:08 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt_1.2.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index ec93eb8..c531a49 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -5,7 +5,6 @@ require apt.inc
 PACKAGES =+ "${PN}-utils"
 FILES_${PN} += "${libdir}/dpkg"
 FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
-FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
 
 do_install () {
 	set -x
-- 
2.7.4


