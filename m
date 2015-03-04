Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9DC7376C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:28:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t249STSp009136
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2015 01:28:29 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 01:28:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2015 01:28:27 -0800
Message-ID: <a642606a5758c68023918bacaac2d93b8098a745.1425461268.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425461268.git.liezhi.yang@windriver.com>
References: <cover.1425461268.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] git: 2.3.0 -> 2.3.1
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
X-List-Received-Date: Wed, 04 Mar 2015 09:28:30 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../git/{git_2.3.0.bb => git_2.3.1.bb}             |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.3.0.bb => git_2.3.1.bb} (41%)

diff --git a/meta/recipes-devtools/git/git_2.3.0.bb b/meta/recipes-devtools/git/git_2.3.1.bb
similarity index 41%
rename from meta/recipes-devtools/git/git_2.3.0.bb
rename to meta/recipes-devtools/git/git_2.3.1.bb
index 1611f64..ebece81 100644
--- a/meta/recipes-devtools/git/git_2.3.0.bb
+++ b/meta/recipes-devtools/git/git_2.3.1.bb
@@ -1,9 +1,9 @@
 require git.inc
 
-SRC_URI[tarball.md5sum] = "edf994cf34cd3354dadcdfa6b4292335"
-SRC_URI[tarball.sha256sum] = "ba2fe814e709a5d0f034ebe82083fce7feed0899b3a8c8b3adf1c5a85d1ce9ac"
-SRC_URI[manpages.md5sum] = "620797eb73b281d0706979ae8038bbd7"
-SRC_URI[manpages.sha256sum] = "8aa4d1e5d7bbf5641a9de92279369d9b20cc266ba7b2888104efa40e80b53559"
+SRC_URI[tarball.md5sum] = "a6673b9c297ff16cd573c4ff0bba34af"
+SRC_URI[tarball.sha256sum] = "a447b8912ab6e9efd05bdd2e4bbb1e7f55498b0d2b92e03319c06efea7b6e46f"
+SRC_URI[manpages.md5sum] = "aed07476a8323fa0be964a310f4be402"
+SRC_URI[manpages.sha256sum] = "89b4c81306fe77ea745292586efba42507bacced079e3ca015e85fbe244d13b8"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


