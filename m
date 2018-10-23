Return-Path: <jef.driesen@niko.eu>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Oct 2018 11:48:43 UTC
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	by mail.openembedded.org (Postfix) with ESMTP id 9699A7943F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 11:48:43 +0000 (UTC)
Received: from barracuda.home.lan ([81.82.27.10])
	by laurent.telenet-ops.be with bizsmtp
	id qzjh1y0110D50l501zjh3F; Tue, 23 Oct 2018 13:43:42 +0200
Received: from w7pt-jdi.1.0.0.1 (84-199-78-189.ifiber.telenet-ops.be
	[84.199.78.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by barracuda.home.lan (Postfix) with ESMTPSA id 6A4E8409FF;
	Tue, 23 Oct 2018 13:43:41 +0200 (CEST)
From: Jef Driesen <jef.driesen@niko.eu>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2018 13:43:24 +0200
Message-Id: <1540295004-26121-1-git-send-email-jef.driesen@niko.eu>
X-Mailer: git-send-email 2.7.4
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH] npm.bbclass: allow overriding NPM_INSTALL_DEV
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
X-List-Received-Date: Tue, 23 Oct 2018 11:48:44 -0000

Commit b1f10b18eaf6c8009e86863ca4a26f429de97082 added the NPM_INSTALL_DEV
variable. But due to the use of simple assignment, a recipe can't override its
value.

Signed-off-by: Jef Driesen <jef.driesen@niko.eu>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index c351ff0..a5b155a 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -22,7 +22,7 @@ def npm_oe_arch_map(target_arch, d):
     return target_arch
 
 NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'), d)}"
-NPM_INSTALL_DEV = "0"
+NPM_INSTALL_DEV ?= "0"
 
 npm_do_compile() {
 	# Copy in any additionally fetched modules
-- 
2.7.4


