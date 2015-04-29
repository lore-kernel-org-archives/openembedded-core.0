Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA2773D5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:09:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T89e8M004282
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 01:09:40 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 29 Apr 2015 01:09:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 16:09:38 +0800
Message-ID: <1430294978-24756-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] dpkg: upgrade to 1.17.25
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
X-List-Received-Date: Wed, 29 Apr 2015 08:09:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

upgrade to fix two CVE defects: CVE-2014-8625 and CVE-2015-0840

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8625

Multiple format string vulnerabilities in the parse_error_msg
function in parsehelp.c in dpkg before 1.17.22 allow remote attackers
to cause a denial of service (crash) and possibly execute arbitrary
code via format string specifiers in the (1) package or (2)
architecture name.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-0840

The dpkg-source command in Debian dpkg before 1.16.16 and 1.17.x before
1.17.25 allows remote attackers to bypass signature verification
via a crafted Debian source control file (.dsc).

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.17.21.bb => dpkg_1.17.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.17.21.bb => dpkg_1.17.25.bb} (81%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
similarity index 81%
rename from meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
index ebb8671..74b1dd0 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
@@ -15,6 +15,6 @@ SRC_URI += "file://noman.patch \
             file://add_armeb_triplet_entry.patch \
            "
 
-SRC_URI[md5sum] = "765a96fd0180196613bbfa3c4aef0775"
-SRC_URI[sha256sum] = "3ed776627181cb9c1c9ba33f94a6319084be2e9ec9c23dd61ce784c4f602cf05"
+SRC_URI[md5sum] = "e48fcfdb2162e77d72c2a83432d537ca"
+SRC_URI[sha256sum] = "07019d38ae98fb107c79dbb3690cfadff877f153b8c4970e3a30d2e59aa66baa"
 
-- 
2.1.0


