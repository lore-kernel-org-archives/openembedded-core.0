Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC5BF739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 10:04:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6DA4Yfg024098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 03:04:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 03:04:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 03:04:29 -0700
Message-ID: <71d3364f178ae013173f96a5066171fba808a616.1436781811.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436781811.git.liezhi.yang@windriver.com>
References: <cover.1436781811.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] git: remove invalid ac_cv_c_c99_format=yes
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
X-List-Received-Date: Mon, 13 Jul 2015 10:04:34 -0000
Content-Type: text/plain

There is no c_c99_format in configure, and there is no
ac_cv_c_c99_format in config.log after removed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.4.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git_2.4.4.bb b/meta/recipes-devtools/git/git_2.4.4.bb
index 1834310..f9c81ed 100644
--- a/meta/recipes-devtools/git/git_2.4.4.bb
+++ b/meta/recipes-devtools/git/git_2.4.4.bb
@@ -5,7 +5,7 @@ SRC_URI[tarball.sha256sum] = "a5d9e3e340a3e5a297092430752f61a9ae5b8b5e4ac042b034
 SRC_URI[manpages.md5sum] = "285b126907d59647248577a7df01c44c"
 SRC_URI[manpages.sha256sum] = "15afc42909078909ca7a48d73b7cb358b37f734b81fc3a0c6438be183f05480f"
 
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
-- 
1.7.9.5


