Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 0FFFF60D0B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 08:06:20 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sat, 10 May 2014 10:06:13 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-09-01.atm.binero.net (Postfix) with ESMTPSA id BB0343A123;
	Sat, 10 May 2014 10:06:13 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 May 2014 10:05:56 +0200
Message-Id: <5d183a7f0121aa0fd2ab82d488dc32e6b13f02b4.1399671290.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
References: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
In-Reply-To: <cover.1399671290.git.petter@technux.se>
References: <cover.1399671290.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv2 03/13] gstreamer: remove unused FILESPATH
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
X-List-Received-Date: Sat, 10 May 2014 08:06:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
However in gstreamer no FILESPATH additions are currently needed so
instead it should be removed.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    2 --
 .../gstreamer/gstreamer1.0-plugins.inc             |    2 --
 2 files changed, 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index b2d3d3c..2697609 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -6,8 +6,6 @@ DEPENDS = "gstreamer"
 
 inherit autotools pkgconfig
 
-FILESPATH =. "${FILE_DIRNAME}/gst-plugins:"
-
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2"
 
 GSTREAMER_DEBUG ?= "--disable-debug"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 4ab8ea8..687aa2f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -6,8 +6,6 @@ DEPENDS = "gstreamer1.0"
 
 inherit autotools pkgconfig
 
-FILESPATH =. "${FILE_DIRNAME}/gst-plugins:"
-
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
 GSTREAMER_1_0_GIT_BRANCH ?= "master"
 EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_1_0_DEBUG} --disable-examples "
-- 
1.7.9.5


