Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39F6E72120
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 06:04:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5464Fhj019584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Jun 2015 23:04:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 3 Jun 2015 23:04:15 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 4 Jun 2015 13:57:58 +0800
Message-ID: <1433397478-3927-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] alsa-tools: add dependency glib-2.0
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
X-List-Received-Date: Thu, 04 Jun 2015 06:04:17 -0000
Content-Type: text/plain

Add dependency glib-2.0 for alsa-tools. It is required by new added
sub-component hdajacksensetest.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
index 9133012..b5b9cc4 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
-DEPENDS = "alsa-lib ncurses"
+DEPENDS = "alsa-lib ncurses glib-2.0"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
-- 
1.9.1


