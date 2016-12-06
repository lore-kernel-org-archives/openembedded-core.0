Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id E9FC9719F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:49:56 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id A8C40B88DCE; Tue,  6 Dec 2016 12:49:52 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:24 +0100
Message-Id: <1481024991-5882-7-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 06/33] debianutils: Allow native builds
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
X-List-Received-Date: Tue, 06 Dec 2016 11:49:57 -0000

Apt has a runtime dependency on it.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-support/debianutils/debianutils_4.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.bb b/meta/recipes-support/debianutils/debianutils_4.8.bb
index d969fd3..cf4f382 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.bb
@@ -32,7 +32,7 @@ do_install_append() {
 PACKAGES =+ "${PN}-run-parts"
 FILES_${PN}-run-parts = "${base_bindir}/run-parts.debianutils"
 
-RDEPENDS_${PN} += "${PN}-run-parts"
+RDEPENDS_${PN}_class-target = "${PN}-run-parts"
 
 
 ALTERNATIVE_PRIORITY="30"
@@ -46,3 +46,5 @@ ALTERNATIVE_LINK_NAME[run-parts]="${base_bindir}/run-parts"
 ALTERNATIVE_LINK_NAME[savelog]="${bindir}/savelog"
 ALTERNATIVE_LINK_NAME[tempfile]="${base_bindir}/tempfile"
 ALTERNATIVE_LINK_NAME[which]="${bindir}/which"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


