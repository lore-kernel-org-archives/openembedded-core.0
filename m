Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 23D5460670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 11:08:17 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bahes-0002OK-1Y from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2016 04:08:18 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Fri, 19 Aug 2016 12:08:16 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 16:08:13 +0500
Message-ID: <1471604893-5003-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] asciidoc-native: add dependency on docbook-xml-dtd4-native
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
X-List-Received-Date: Fri, 19 Aug 2016 11:08:18 -0000
Content-Type: text/plain

During the compilation phase asciidoc runs a2x for validation
of some xmls which in turn invokes xmllint with --nonet
parameter that requires DTDs to be available locally in order
to succeed otherwise the do_compile fails.
We now add a direct dependency on docbook-xml-dtd4 so the
DTDs are always available locally.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index 1500b0a..7597c0e 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -16,5 +16,6 @@ SRC_URI[sha256sum] = "78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323ca
 inherit distutils autotools-brokensep
 
 export DESTDIR = "${D}"
+DEPENDS_class-native = "docbook-xml-dtd4-native"
 RDEPENDS_${PN} += "python" 
 BBCLASSEXTEND = "native"
-- 
1.9.1


