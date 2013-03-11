Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nG-00015W-Ow
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB4m7u005767
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:04:48 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:04:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:28 +0800
Message-ID: <f286b2b7465edf617d1c03e08fcd51d407f543ee.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362985569.git.hongxu.jia@windriver.com>
References: <cover.1362985569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/17] perl-rdepends_5.14.2.inc:fix perl File::Glob module is broken
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 11:21:51 -0000
Content-Type: text/plain

Update dependencies for perl modules again. When only install
perl-module-file-glob, run perl script with "require File::Glob;" will
fail. Update dependencies to fix that.

Cherry-pick commit c65e88b3f20627d7e49e0306f336eee3fb256d1e

[Yocto 3069]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
index 2707fe8..39972ca 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
@@ -13,8 +13,10 @@
 
 # Some additional dependencies that the above doesn't manage to figure out
 # Please take care that exporter depends exporter-heavy, not reverse
+RDEPENDS_${PN}-module-dynaloader += "${PN}-module-carp"
 RDEPENDS_${PN}-module-exporter += "${PN}-module-exporter-heavy"
 RDEPENDS_${PN}-module-file-glob += "${PN}-module-feature"
+RDEPENDS_${PN}-module-file-glob += "${PN}-module-file"
 RDEPENDS_${PN}-module-file-path += "${PN}-module-cwd"
 RDEPENDS_${PN}-module-file-spec += "${PN}-module-file-spec-unix"
 RDEPENDS_${PN}-module-file-stat += "${PN}-module-fcntl"
-- 
1.7.10.4



