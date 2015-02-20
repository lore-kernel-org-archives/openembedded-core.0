Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4476573594
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1K5bMFd006894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:37:22 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Feb 2015 21:37:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Feb 2015 21:37:18 -0800
Message-ID: <14afcafe7ad07b0d56b654dfbe06de7daf68fd5c.1424410597.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1424410597.git.liezhi.yang@windriver.com>
References: <cover.1424410597.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] git: 2.2.1 -> 2.3.0
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
X-List-Received-Date: Fri, 20 Feb 2015 05:37:26 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git.inc                  |    1 +
 .../git/{git_2.2.1.bb => git_2.3.0.bb}             |    8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.2.1.bb => git_2.3.0.bb} (41%)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index ddb1cee..4da4a27 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -1,4 +1,5 @@
 SUMMARY = "Distributed version control system"
+HOMEPAGE = "http://git-scm.com"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "openssl curl zlib expat"
diff --git a/meta/recipes-devtools/git/git_2.2.1.bb b/meta/recipes-devtools/git/git_2.3.0.bb
similarity index 41%
rename from meta/recipes-devtools/git/git_2.2.1.bb
rename to meta/recipes-devtools/git/git_2.3.0.bb
index d1fcb27..1611f64 100644
--- a/meta/recipes-devtools/git/git_2.2.1.bb
+++ b/meta/recipes-devtools/git/git_2.3.0.bb
@@ -1,9 +1,9 @@
 require git.inc
 
-SRC_URI[tarball.md5sum] = "ff41fdb094eed1ec430aed8ee9b9849c"
-SRC_URI[tarball.sha256sum] = "367a77d0b10a5070b02a0fb0e942f26f25af61793128e0ddfd5c5c474de93589"
-SRC_URI[manpages.md5sum] = "b5ddd262b608804ba4403f0f82d881d7"
-SRC_URI[manpages.sha256sum] = "69dcb3decdb33dd35491935e80f71c40c576b536df4223eb98d5f7ccd9643293"
+SRC_URI[tarball.md5sum] = "edf994cf34cd3354dadcdfa6b4292335"
+SRC_URI[tarball.sha256sum] = "ba2fe814e709a5d0f034ebe82083fce7feed0899b3a8c8b3adf1c5a85d1ce9ac"
+SRC_URI[manpages.md5sum] = "620797eb73b281d0706979ae8038bbd7"
+SRC_URI[manpages.sha256sum] = "8aa4d1e5d7bbf5641a9de92279369d9b20cc266ba7b2888104efa40e80b53559"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


