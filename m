Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1EEF76B4F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 14:52:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Aug 2013 07:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,833,1367996400"; d="scan'208";a="377525049"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2013 07:52:06 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2013 17:53:47 +0300
Message-Id: <f1339cda511a9f943f6163215cbd1de1e2a04c0f.1375887108.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375887108.git.cristian.iorga@intel.com>
References: <cover.1375887108.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375887108.git.cristian.iorga@intel.com>
References: <cover.1375887108.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] net-tools: upgrade to v1.60-25
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
X-List-Received-Date: Wed, 07 Aug 2013 14:52:12 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../net-tools/{net-tools-1.60-24.2 => net-tools}/net-tools-config.h  | 0
 .../{net-tools-1.60-24.2 => net-tools}/net-tools-config.make         | 0
 .../net-tools/{net-tools_1.60-24.2.bb => net-tools_1.60-25.bb}       | 5 ++---
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/net-tools/{net-tools-1.60-24.2 => net-tools}/net-tools-config.h (100%)
 rename meta/recipes-extended/net-tools/{net-tools-1.60-24.2 => net-tools}/net-tools-config.make (100%)
 rename meta/recipes-extended/net-tools/{net-tools_1.60-24.2.bb => net-tools_1.60-25.bb} (94%)

diff --git a/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.h b/meta/recipes-extended/net-tools/net-tools/net-tools-config.h
similarity index 100%
rename from meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.h
rename to meta/recipes-extended/net-tools/net-tools/net-tools-config.h
diff --git a/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.make b/meta/recipes-extended/net-tools/net-tools/net-tools-config.make
similarity index 100%
rename from meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.make
rename to meta/recipes-extended/net-tools/net-tools/net-tools-config.make
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
similarity index 94%
rename from meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
rename to meta/recipes-extended/net-tools/net-tools_1.60-25.bb
index 4040e1a..bd72acc 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
@@ -5,7 +5,6 @@ BUGTRACKER = "http://bugs.debian.org/net-tools"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
-PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=no;name=patch \
@@ -17,8 +16,8 @@ S = "${WORKDIR}/net-tools-1.60"
 SRC_URI[tarball.md5sum] = "ecaf37acb5b5daff4bdda77785fd916d"
 SRC_URI[tarball.sha256sum] = "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc9aa3095d5c591f302c2de0f5"
 
-SRC_URI[patch.md5sum] = "524658bb8df5ff92c4a991f5edcaf240"
-SRC_URI[patch.sha256sum] = "170cc024fcb34329f4c25fd88b5f160a06be5d6d3eaf0bc976650fd1b1a6235d"
+SRC_URI[patch.md5sum] = "5ab1e2184d0fa6518031291138f2fc51"
+SRC_URI[patch.sha256sum] = "1bddcd96ac60e794978cb20fb7ea4c2e77258c56c042c9ac8b6ec2b2033bc56f"
 
 inherit gettext
 
-- 
1.8.1.2


