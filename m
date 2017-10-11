Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9247971ADD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945777"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:39 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:10 +0300
Message-Id: <505cec490afd930e9a1a03dbecd7477be2be02bb.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/50] dnf: update to 2.7.3
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:39 -0000

Drop upstreamed patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...eck-conf.releasever-instead-of-releasever.patch | 31 ----------------------
 .../dnf/{dnf_2.6.3.bb => dnf_2.7.3.bb}             |  3 +--
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
 rename meta/recipes-devtools/dnf/{dnf_2.6.3.bb => dnf_2.7.3.bb} (95%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch b/meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
deleted file mode 100644
index 05f31415174..00000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 166833a88a928a574bf9143b9b65f544be482c77 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 18 Aug 2017 15:55:15 +0300
-Subject: [PATCH] Check conf.releasever instead of releasever
-
-The substitutions may actually set the conf.releasever correctly,
-and so the check should use that instead of the passed-in function
-parameter.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf/pull/901]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/cli/cli.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index 2d63420c..167943b8 100644
---- a/dnf/cli/cli.py
-+++ b/dnf/cli/cli.py
-@@ -914,7 +914,7 @@ class Cli(object):
-         conf.releasever = releasever
-         subst = conf.substitutions
-         subst.update_from_etc(conf.installroot)
--        if releasever is None:
-+        if conf.releasever is None:
-             logger.warning(_("Unable to detect release version (use '--releasever' to specify "
-                              "release version)"))
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/dnf/dnf_2.6.3.bb b/meta/recipes-devtools/dnf/dnf_2.7.3.bb
similarity index 95%
rename from meta/recipes-devtools/dnf/dnf_2.6.3.bb
rename to meta/recipes-devtools/dnf/dnf_2.7.3.bb
index 3ed6a74570f..77631aab34f 100644
--- a/meta/recipes-devtools/dnf/dnf_2.6.3.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.7.3.bb
@@ -10,10 +10,9 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-Do-not-prepend-installroot-to-logdir.patch \
            file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
-           file://0001-Check-conf.releasever-instead-of-releasever.patch \
            "
 
-SRCREV = "be2585183ec4485ee4d5e121f242d8669296f065"
+SRCREV = "77c8874f2a7a543aea82ed694b02d60293b5cf0c"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.14.1


