Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 72EF1731EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:33:14 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 35AA31AA33B;
	Wed, 10 Feb 2016 13:33:13 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>,
	Randy MacLeod <randy.macleod@windriver.com>, Tanu Kaskinen <tanuk@iki.fi>
Date: Wed, 10 Feb 2016 13:32:50 +0100
Message-Id: <1455107576-8931-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 1/7] systemd: move bash completion into separate package
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
X-List-Received-Date: Wed, 10 Feb 2016 12:33:15 -0000

Inherit bash-completion for automatic systemd-bash-completion package.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta/recipes-core/systemd/systemd_228.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index a110f0cdeaac7e46b5691a89aea237974e4114b3..cd793d7cba802dbba60a77df49e9d9695c8cf7b7 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -22,7 +22,7 @@ DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl rea
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
+inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion
 
 SRCREV = "dd050decb6ad131ebdeabb71c4f9ecb4733269c0"
 
@@ -290,13 +290,11 @@ CONFFILES_${PN} = "${sysconfdir}/machine-id \
                 ${sysconfdir}/systemd/user.conf"
 
 FILES_${PN} = " ${base_bindir}/* \
-                ${datadir}/bash-completion \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
                 ${datadir}/polkit-1 \
                 ${datadir}/${BPN} \
                 ${datadir}/factory \
-                ${sysconfdir}/bash_completion.d/ \
                 ${sysconfdir}/dbus-1/ \
                 ${sysconfdir}/machine-id \
                 ${sysconfdir}/modules-load.d/ \
-- 
2.5.0


