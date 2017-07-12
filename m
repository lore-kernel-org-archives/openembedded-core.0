Return-Path: <Zubair.Kakakhel@imgtec.com>
X-Greylist: delayed 936 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Jul 2017 15:27:40 UTC
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF8278199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 15:27:40 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 4879FECC94C7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 16:12:00 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 12 Jul 2017 16:12:03 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 16:11:56 +0100
Message-ID: <20170712151156.34292-1-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Morty] gmp: Fix Disable assembly for MIPS R6
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
X-List-Received-Date: Wed, 12 Jul 2017 15:27:41 -0000
Content-Type: text/plain

The miparchr6 option was introduced pyro onwards and doesn't exist
for morty. Disable assembly the old fashioned way for MIPS R6

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-support/gmp/gmp_6.1.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gmp/gmp_6.1.1.bb b/meta/recipes-support/gmp/gmp_6.1.1.bb
index 614d21a..8679461 100644
--- a/meta/recipes-support/gmp/gmp_6.1.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.1.bb
@@ -21,7 +21,10 @@ SRC_URI[sha256sum] = "a8109865f2893f1373b0a8ed5ff7429de8db696fc451b1036bd7bdf95b
 acpaths = ""
 
 EXTRA_OECONF += " --enable-cxx=detect"
-EXTRA_OECONF_mipsarchr6_append = " --disable-assembly"
+EXTRA_OECONF_mipsisa32r6_append   = " --disable-assembly"
+EXTRA_OECONF_mipsisa32r6el_append = " --disable-assembly"
+EXTRA_OECONF_mipsisa64r6_append   = " --disable-assembly"
+EXTRA_OECONF_mipsisa64r6el_append = " --disable-assembly"
 
 PACKAGES =+ "libgmpxx"
 FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
-- 
2.10.2


