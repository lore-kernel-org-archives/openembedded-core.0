Return-Path: <Awais_Belal@mentor.com>
X-Greylist: delayed 1448 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Mar 2018 11:04:26 UTC
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 86E6F78267
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 11:04:26 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1f0PY4-00063U-5c from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2018 03:40:20 -0700
Received: from P7520.pkl.mentorg.com (147.34.91.1) by
	svr-orw-fem-04.mgc.mentorg.com (147.34.97.41) with Microsoft SMTP
	Server id 14.3.224.2; Mon, 26 Mar 2018 03:40:19 -0700
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2018 15:40:14 +0500
Message-ID: <1522060814-13140-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] matchbox-wm: fix QA issues with composite enabled
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
X-List-Received-Date: Mon, 26 Mar 2018 11:04:26 -0000
Content-Type: text/plain

If we try and enable composite support using --enable-composite
through EXTRA_OECONF the following warnings are seen
WARNING: matchbox-wm-1.2.1-r0 do_package_qa: QA Issue: matchbox-wm rdepends on libxcomposite, but it isn't a build dependency, missing libxcomposite in DEPENDS or PACKAGECONFIG? [build-deps]
WARNING: matchbox-wm-1.2.1-r0 do_package_qa: QA Issue: matchbox-wm rdepends on libxdamage, but it isn't a build dependency, missing libxdamage in DEPENDS or PACKAGECONFIG? [build-deps]
This fixes the above mentioned warnings.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index 815a75f..58e21a4 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
                     file://src/wm.c;endline=21;md5=8dc9d24477d87ef5dfbc2e4927146aab"
 
 SECTION = "x11/wm"
-DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
+DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes libxcomposite libxdamage"
 
 # SRCREV tagged 1.2.2
 SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
-- 
2.7.4


