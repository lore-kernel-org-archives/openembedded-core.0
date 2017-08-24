Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6B780782E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:15:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7OEFNr2023824
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 24 Aug 2017 15:15:24 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dksup-0007CL-FY; Thu, 24 Aug 2017 15:15:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 15:15:20 +0100
Message-Id: <1503584121-27629-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 24 Aug 2017 15:15:24 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/2] debianutils: Add a native version (for run-parts)
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
X-List-Received-Date: Thu, 24 Aug 2017 14:15:25 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/debianutils/debianutils_4.8.1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb b/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
index d41bf98..1857d4b 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
@@ -33,7 +33,7 @@ PACKAGES =+ "${PN}-run-parts"
 FILES_${PN}-run-parts = "${base_bindir}/run-parts.debianutils"
 
 RDEPENDS_${PN} += "${PN}-run-parts"
-
+RDEPENDS_${PN}_class-native = ""
 
 ALTERNATIVE_PRIORITY="30"
 ALTERNATIVE_${PN} = "add-shell installkernel remove-shell savelog tempfile which"
@@ -51,3 +51,5 @@ ALTERNATIVE_LINK_NAME[run-parts]="${base_bindir}/run-parts"
 ALTERNATIVE_LINK_NAME[savelog]="${bindir}/savelog"
 ALTERNATIVE_LINK_NAME[tempfile]="${base_bindir}/tempfile"
 ALTERNATIVE_LINK_NAME[which]="${bindir}/which"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


