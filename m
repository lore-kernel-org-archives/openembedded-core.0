Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 88D8065D99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 22:11:37 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sat, 26 Apr 2014 00:11:32 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-01-01.atm.binero.net (Postfix) with ESMTPSA id D2A231A4DA;
	Sat, 26 Apr 2014 00:11:31 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Apr 2014 00:11:20 +0200
Message-Id: <039dd277887300080a5f094804910932d9f0eb42.1398462168.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <b9ff9866b658eef7f8798f2d449e92930250640b.1398462168.git.petter@technux.se>
References: <b9ff9866b658eef7f8798f2d449e92930250640b.1398462168.git.petter@technux.se>
In-Reply-To: <cover.1398462168.git.petter@technux.se>
References: <cover.1398462168.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 2/2] x-load: remove usage of FILESPATH
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
X-List-Received-Date: Fri, 25 Apr 2014 22:11:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
However in x-load a better solution is to use a path that exists in
FILESPATH by default.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../0001-Change-omap3530beagle-target-name.patch   |    0
 meta/recipes-bsp/x-load/x-load_git.bb              |    2 --
 2 files changed, 2 deletions(-)
 rename meta/recipes-bsp/x-load/{x-load-git => x-load}/beaglebone/0001-Change-omap3530beagle-target-name.patch (100%)

diff --git a/meta/recipes-bsp/x-load/x-load-git/beaglebone/0001-Change-omap3530beagle-target-name.patch b/meta/recipes-bsp/x-load/x-load/beaglebone/0001-Change-omap3530beagle-target-name.patch
similarity index 100%
rename from meta/recipes-bsp/x-load/x-load-git/beaglebone/0001-Change-omap3530beagle-target-name.patch
rename to meta/recipes-bsp/x-load/x-load/beaglebone/0001-Change-omap3530beagle-target-name.patch
diff --git a/meta/recipes-bsp/x-load/x-load_git.bb b/meta/recipes-bsp/x-load/x-load_git.bb
index 5112349..e5d9400 100644
--- a/meta/recipes-bsp/x-load/x-load_git.bb
+++ b/meta/recipes-bsp/x-load/x-load_git.bb
@@ -1,7 +1,5 @@
 require x-load.inc
 
-FILESPATH = "${FILE_DIRNAME}/x-load-git/${MACHINE}:${FILE_DIRNAME}/x-load-git/"
-
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=25;md5=ef08d08cb99057bbb5b9d6d0c5a4396f"
 
-- 
1.7.9.5


