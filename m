Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47C686DBF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 05:38:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAM5cfnG009022
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 21:38:43 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 21:38:41 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 13:39:02 +0800
Message-ID: <8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385098685.git.Qi.Chen@windriver.com>
References: <cover.1385098685.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: depends on virtual/kernel
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
X-List-Received-Date: Fri, 22 Nov 2013 05:38:43 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel
can get built by default. Otherwise, the kernel will not get built
unless it's required by other packages like v86d. As a result, if
we build 'core-image-minimal' for qemumips, the kernel is not built,
and we have 'bitbake linux-yocto' before we can use runqemu to start
the target.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index bc60f0d..ccb6bf3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -10,7 +10,7 @@ inherit gzipnative
 
 LICENSE = "MIT"
 PACKAGES = ""
-DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
+DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross virtual/kernel"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
 RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 
-- 
1.7.9.5


