Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1T4liF-0001gN-4G
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 06:41:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7O4TVIB024891
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Aug 2012 21:29:31 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 23 Aug 2012 21:29:30 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 12:28:22 +0800
Message-ID: <0159b53838f4553a34612073f5e2812f77a99fd7.1345782105.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1345782105.git.sen.zhang@windriver.com>
References: <cover.1345782105.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libxpm: inherit gettext
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
X-List-Received-Date: Fri, 24 Aug 2012 04:41:39 -0000
Content-Type: text/plain

libxpm requires the xgettext command to build.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
index 9eaa212..f84a239 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
@@ -1,5 +1,8 @@
 require xorg-lib-common.inc
 
+# libxpm requires xgettext to build
+inherit gettext
+
 SUMMARY = "Xpm: X Pixmap extension library"
 
 DESCRIPTION = "libXpm provides support and common operation for the XPM \
@@ -10,7 +13,7 @@ protocol."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
 DEPENDS += "libxext libsm libxt"
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXpm"
-- 
1.7.11.4



