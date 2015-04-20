Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECB2273D0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:09:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89P0p029752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:09:25 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:09:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:09:21 -0700
Message-ID: <947d1f44fb9889b159bb426b5ed3dffbcb1d0711.1429517334.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429517334.git.liezhi.yang@windriver.com>
References: <cover.1429517334.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] liberror-perl: 0.17022 -> 0.17023
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:24 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...or-perl_0.17022.bb => liberror-perl_0.17023.bb} |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17022.bb => liberror-perl_0.17023.bb} (83%)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17022.bb b/meta/recipes-devtools/perl/liberror-perl_0.17023.bb
similarity index 83%
rename from meta/recipes-devtools/perl/liberror-perl_0.17022.bb
rename to meta/recipes-devtools/perl/liberror-perl_0.17023.bb
index 071f4b7..87684e1 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17022.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17023.bb
@@ -12,8 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
 DEPENDS += "perl"
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
-SRC_URI[md5sum] = "f4d825f4be915ae90bf2e0d66734956b"
-SRC_URI[sha256sum] = "cab74f04fb3af7088cefc2f6f96800ee52d34b82928bbb35ca51a0e5b5f9f7ef"
+
+SRC_URI[md5sum] = "98524ffbd268013e00697a5826a83d37"
+SRC_URI[sha256sum] = "af48e19077d8837c6377d8a9ba2ce473c100caf5eeb7b53606c3f78a0e8b5d37"
 
 S = "${WORKDIR}/Error-${PV}"
 
-- 
1.7.9.5


