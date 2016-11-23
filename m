Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1953671AB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:43 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id DDFC2B861FBF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:40 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 23 Nov 2016 13:47:43 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2016 13:47:31 +0000
Message-ID: <20161123134733.38276-6-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
References: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 5/7] gmp: Disable assembly for MIPS R6
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
X-List-Received-Date: Wed, 23 Nov 2016 13:47:43 -0000
Content-Type: text/plain

gmplib has some assembly routines. These have not been optimized
for MIPS R6 yet. Add --disable-assembly so that the C implementation
is used.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-support/gmp/gmp_6.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gmp/gmp_6.1.1.bb b/meta/recipes-support/gmp/gmp_6.1.1.bb
index 303c3ef..614d21a 100644
--- a/meta/recipes-support/gmp/gmp_6.1.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.1.bb
@@ -21,6 +21,7 @@ SRC_URI[sha256sum] = "a8109865f2893f1373b0a8ed5ff7429de8db696fc451b1036bd7bdf95b
 acpaths = ""
 
 EXTRA_OECONF += " --enable-cxx=detect"
+EXTRA_OECONF_mipsarchr6_append = " --disable-assembly"
 
 PACKAGES =+ "libgmpxx"
 FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
-- 
2.10.2


