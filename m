Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id D5D7C77371
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 18:04:46 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 684771848; Fri, 05 Feb 2016 13:04:46 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkO-000CYC-DQ; Fri, 05 Feb 2016 18:04:44 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkO-0002Em-Cx; Fri, 05 Feb 2016 18:04:44 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 18:04:29 +0000
Message-Id: <1454695470-8205-15-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
References: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 14/15] gtk-theme-torturer: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Fri, 05 Feb 2016 18:04:47 -0000

This recipe currently relies on EXTRA_OEMAKE having been set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make this
explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
index b67806d..edf8031 100644
--- a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
@@ -16,6 +16,8 @@ CFLAGS += "-Wl,-rpath-link,${STAGING_LIBDIR}"
 inherit distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 torturer ${D}${bindir}
-- 
2.1.4


