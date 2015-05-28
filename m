Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0056C75714
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:57:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9vSvj016905
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:57:28 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:57:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:57:20 -0700
Message-ID: <a3f18321f37c2eefd94665973bcda5a0ad01d4a8.1432805258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432805258.git.liezhi.yang@windriver.com>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] git: 2.3.7 -> 2.4.2
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
X-List-Received-Date: Thu, 28 May 2015 09:57:29 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../git/{git_2.3.7.bb => git_2.4.2.bb}             |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.3.7.bb => git_2.4.2.bb} (41%)

diff --git a/meta/recipes-devtools/git/git_2.3.7.bb b/meta/recipes-devtools/git/git_2.4.2.bb
similarity index 41%
rename from meta/recipes-devtools/git/git_2.3.7.bb
rename to meta/recipes-devtools/git/git_2.4.2.bb
index 61248c0..0bb92a2 100644
--- a/meta/recipes-devtools/git/git_2.3.7.bb
+++ b/meta/recipes-devtools/git/git_2.4.2.bb
@@ -1,9 +1,9 @@
 require git.inc
 
-SRC_URI[tarball.md5sum] = "370cc33cc0a77a1242b95cc703228162"
-SRC_URI[tarball.sha256sum] = "250ebf19c758bcf848f23f42bc632282ba8828b8965a306ad006bfb36ac1499a"
-SRC_URI[manpages.md5sum] = "4c3b585c74bd937b80e04cba6db71da2"
-SRC_URI[manpages.sha256sum] = "079fcd6b8dad124960578fe91964a1185c99cdf024149ad50bde141600b21628"
+SRC_URI[tarball.md5sum] = "80e127b1bde921479d1a6c3fa697e385"
+SRC_URI[tarball.sha256sum] = "8edd564051fb776a41b4c475ed2d6105de82b674b8903a9efafe8a0633e4876e"
+SRC_URI[manpages.md5sum] = "b52251e6f859a54bf5d5a3b7682fbfbf"
+SRC_URI[manpages.sha256sum] = "114b22518dd71cc1a16018b0ff198a5ee1e6b2239381dfd6a6b9994f3da89661"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


