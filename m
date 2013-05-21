Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id A057F62235
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 15:08:52 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 76B87952D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 16:08:53 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 16:08:40 +0100
Message-Id: <1369148923-20676-2-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH 1/4] clutter.bbclass: removed unused function
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
X-List-Received-Date: Tue, 21 May 2013 15:08:52 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

Clutter and cogl no longer use --with-fpu configure option, so we no longer
require the get_fpu_settings() function.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/classes/clutter.bbclass |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes/clutter.bbclass b/meta/classes/clutter.bbclass
index 184fb44..0dc4850 100644
--- a/meta/classes/clutter.bbclass
+++ b/meta/classes/clutter.bbclass
@@ -13,11 +13,6 @@ VERMINOR = "${@get_minor_dir("${PV}")}"
 REALNAME = "${@get_real_name("${BPN}")}"
 FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${REALNAME}-${PV}", "${FILE_DIRNAME}/${REALNAME}-${VERMINOR}", "${FILE_DIRNAME}/${REALNAME}", "${FILE_DIRNAME}/files"], d)}"
 
-def get_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
-        return "--without-fpu"
-    return ""
-
 CLUTTER_SRC_FTP = "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.tar.xz;name=archive"
 
 CLUTTER_SRC_GIT = "git://git.gnome.org/${REALNAME};protocol=git"
-- 
1.7.10.4


