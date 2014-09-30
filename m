Return-Path: <noor_ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D121D6017E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 14:25:37 +0000 (UTC)
Received: from em-wv03.wv.mentorg.com ([147.34.98.30]
	helo=em-wv-03.wv.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1XYyN1-0006CF-FA from noor_ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Sep 2014 07:25:39 -0700
Received: from gemini.alm.mentorg.com ([134.86.102.153]) by
	em-wv-03.wv.mentorg.com (8.8.8/CF5.40R)
Received: from pkl-ahsann-ubuntu.pkl.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id s8UEPYfl011487; 
	Tue, 30 Sep 2014 09:25:35 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 19:25:04 +0500
Message-Id: <1412087104-1560-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] sysprof: Creats x11 PACKAGECONFIG.
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
X-List-Received-Date: Tue, 30 Sep 2014 14:25:39 -0000

From: Noor <noor_ahsan@mentor.com>

* gtk+ and libglade is required to have graphical version of sysprof.
  Created x11 packageconfig and added these two packages in that config
  and removed from DEPENDS.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-kernel/sysprof/sysprof_git.bb |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index ef1e270..d3fb97a 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -2,8 +2,6 @@ SUMMARY = "System-wide Performance Profiler for Linux"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ libglade"
-
 SRCREV = "cd44ee6644c3641507fb53b8a2a69137f2971219"
 PV = "1.2.0+git${SRCPV}"
 
@@ -18,3 +16,8 @@ SRC_URI_append_mips64 = " file://rmb-mips.patch"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+PACKAGECONFIG[x11] = ",,gtk+ libglade"
+
-- 
1.7.9.5


