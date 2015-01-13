Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD6AA72B7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5iTQu021729
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:29 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:01 +0800
Message-ID: <9423a082fd3623a6b8e59611853bfaa966b9afb4.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421127484.git.hongxu.jia@windriver.com>
References: <cover.1421127484.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] libxml-parser-perl: upgrade to 2.43
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:36 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../perl/{libxml-parser-perl_2.41.bb => libxml-parser-perl_2.43.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.41.bb => libxml-parser-perl_2.43.bb} (88%)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.43.bb
similarity index 88%
rename from meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
rename to meta/recipes-devtools/perl/libxml-parser-perl_2.43.bb
index 26241e8..f0e5754 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.43.bb
@@ -8,8 +8,8 @@ DEPENDS += "expat expat-native"
 PR = "r3"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
-SRC_URI[md5sum] = "c320d2ffa459e6cdc6f9f59c1185855e"
-SRC_URI[sha256sum] = "b48197cd2265a26c5f016489f11a7b450d8833cb8b3d6a46ee15975740894de9"
+SRC_URI[md5sum] = "2c9ca46832d8e7578bcda99eba3a47f1"
+SRC_URI[sha256sum] = "e56ce06b516eff5335cb3b7e0bb268537c77991af1bfd86c39cebabc407f4549"
 
 S = "${WORKDIR}/XML-Parser-${PV}"
 
-- 
1.9.1


