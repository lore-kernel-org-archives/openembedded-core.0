Return-Path: <jef.driesen@niko.eu>
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	by mail.openembedded.org (Postfix) with ESMTP id EC3B4779C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 14:06:53 +0000 (UTC)
Received: from barracuda.home.lan ([81.82.26.5])
	by michel.telenet-ops.be with bizsmtp
	id FS6s1w00q06cLrV06S6shi; Fri, 29 Sep 2017 16:06:52 +0200
Received: from w7pt-jdi.ipw71bu.lan (84-199-78-189.ifiber.telenet-ops.be
	[84.199.78.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by barracuda.home.lan (Postfix) with ESMTPSA id 2C01C40766;
	Fri, 29 Sep 2017 16:06:52 +0200 (CEST)
From: Jef Driesen <jef.driesen@niko.eu>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Sep 2017 16:06:35 +0200
Message-Id: <1506693995-11520-1-git-send-email-jef.driesen@niko.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506691942-10820-1-git-send-email-jef.driesen@niko.eu>
References: <1506691942-10820-1-git-send-email-jef.driesen@niko.eu>
Subject: [PATCH v3] initscripts: Remove empty packages
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
X-List-Received-Date: Fri, 29 Sep 2017 14:06:54 -0000

Because the initscripts recipe contains only some shell scripts, the standard
packages (e.g. ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc, etc) are all
empty and can be removed.

Signed-off-by: Jef Driesen <jef.driesen@niko.eu>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index fea4f22..b8b33b7 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -47,7 +47,7 @@ inherit update-alternatives
 DEPENDS_append = " update-rc.d-native"
 PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 
-PACKAGES =+ "${PN}-functions ${PN}-sushell"
+PACKAGES = "${PN}-functions ${PN}-sushell ${PN}"
 RDEPENDS_${PN} = "${PN}-functions \
                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
 		 "
-- 
2.7.4


