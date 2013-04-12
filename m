Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UQXfR-00057i-Mt
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 08:41:04 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3C6NasH029287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 23:23:36 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.147) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 23:23:35 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Apr 2013 14:23:29 +0800
Message-ID: <4298644470a269564bd52245e57f53e567f7519a.1365732443.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365732443.git.hongxu.jia@windriver.com>
References: <cover.1365732443.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] xserver-nodm-init: Add xuser to disk group
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
X-List-Received-Date: Fri, 12 Apr 2013 06:41:05 -0000
Content-Type: text/plain

Add xuser to disk group, so it could have permissions to access disk storage.

[YOCTO #4004]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/x11-common/xserver-nodm-init.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index d2797a9..204a53d 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r31"
+PR = "r32"
 RDEPENDS_${PN} = "sudo"
 
 SRC_URI = "file://xserver-nodm \
@@ -34,6 +34,6 @@ INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 # USERADD_PARAM is in sync with the one in connman.inc
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--create-home \
-                       --groups video,tty,audio,input \
+                       --groups video,tty,audio,input,disk \
                        --user-group xuser"
 
-- 
1.7.10.4



