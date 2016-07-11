Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4447160797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:35:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Jul 2016 07:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,346,1464678000"; d="scan'208";a="1004642511"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2016 07:34:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 17:33:53 +0300
Message-Id: <1468247633-24172-8-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 8/8] recipes-sato: fix upstream version check
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
X-List-Received-Date: Mon, 11 Jul 2016 14:35:18 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb | 1 +
 meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb     | 1 +
 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb | 1 +
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb         | 1 +
 meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb       | 1 +
 5 files changed, 5 insertions(+)

diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index 3ca5989..b993a94 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -13,6 +13,7 @@ RDEPENDS_${PN} = "settings-daemon"
 SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://no-handed.patch"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
index e0a899c..4488191 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
@@ -12,6 +12,7 @@ SECTION = "x11/utils"
 #SRCREV tagged 0.1
 SRCREV = "3ad357db2302760b8a8817b5f4478dd87479442f"
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
index 8fc6bb3..7a043d3 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -3,5 +3,6 @@ require matchbox-theme-sato.inc
 # SRCREV tagged 0.2
 SRCREV = "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
 SRC_URI = "git://git.yoctoproject.org/matchbox-sato"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb
index 92f0ee1..ff91746 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb
@@ -12,6 +12,7 @@ DEPENDS = "matchbox-panel-2 gtk+3"
 # SRCREV tagged 0.2
 SRCREV = "5db2672fb857b2c80b949d8fce92e0f0029cc947"
 SRC_URI = "git://git.yoctoproject.org/screenshot"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index 56eb656..ceaecca 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.yoctoproject.org/xsettings-daemon \
            file://addsoundkeys.patch;apply=yes \
            file://70settings-daemon.sh \
            "
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
-- 
2.8.1


