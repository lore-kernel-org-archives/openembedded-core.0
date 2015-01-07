Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80F0B71440
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 15:02:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t07F29Qt014784
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jan 2015 07:02:09 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 07:02:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jan 2015 07:02:06 -0800
Message-ID: <ba69175dd7821d94e3d340379751c629a6984852.1420642796.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420642796.git.liezhi.yang@windriver.com>
References: <cover.1420642796.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] git: upgrade to 2.2.1
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
X-List-Received-Date: Wed, 07 Jan 2015 15:02:12 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../git/{git_2.2.0.bb => git_2.2.1.bb}             |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.2.0.bb => git_2.2.1.bb} (61%)

diff --git a/meta/recipes-devtools/git/git_2.2.0.bb b/meta/recipes-devtools/git/git_2.2.1.bb
similarity index 61%
rename from meta/recipes-devtools/git/git_2.2.0.bb
rename to meta/recipes-devtools/git/git_2.2.1.bb
index 7341d98..2d47cda 100644
--- a/meta/recipes-devtools/git/git_2.2.0.bb
+++ b/meta/recipes-devtools/git/git_2.2.1.bb
@@ -1,7 +1,7 @@
 require git.inc
 
-SRC_URI[md5sum] = "2d5bbcc3e887cc4ba499f80420e2d5f7"
-SRC_URI[sha256sum] = "bea9548f5a39daaf7c3873b6a5be47d7f92cbf42d32957e1be955a2e0e7b83b4"
+SRC_URI[md5sum] = "ff41fdb094eed1ec430aed8ee9b9849c"
+SRC_URI[sha256sum] = "367a77d0b10a5070b02a0fb0e942f26f25af61793128e0ddfd5c5c474de93589"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


