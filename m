Return-Path: <tklauser@distanz.ch>
Received: from mail.zhinst.com (mail.zhinst.com [212.126.164.98])
	by mail.openembedded.org (Postfix) with ESMTP id 01B7C60438
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 12:33:56 +0000 (UTC)
X-Spam-Status: No, hits=0.0 required=5.0
	tests=AWL: 0.000,BAYES_00: -1.665,TOTAL_SCORE: -1.665,autolearn=ham
X-Spam-Level: 
Received: from ziws06.zhinst.com ([10.42.0.71])
	by mail.zhinst.com (Kerio Connect 8.3.0);
	Fri, 6 Jun 2014 14:33:55 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 14:33:55 +0200
Message-Id: <1402058035-11177-1-git-send-email-tklauser@distanz.ch>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] powertop: upgrade from 2.5 to 2.6.1
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
X-List-Received-Date: Fri, 06 Jun 2014 12:33:58 -0000

Upgrade powertop from 2.5 to 2.6.1. Also adjust to the new upstream
download URL.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 .../{powertop_2.5.bb => powertop_2.6.1.bb}         |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.5.bb => powertop_2.6.1.bb} (81%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.5.bb b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
similarity index 81%
rename from meta/recipes-kernel/powertop/powertop_2.5.bb
rename to meta/recipes-kernel/powertop/powertop_2.6.1.bb
index 86a7f60..6a293bc 100644
--- a/meta/recipes-kernel/powertop/powertop_2.5.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
@@ -6,10 +6,10 @@ DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
+SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "806bbcbd44fcea1f807c9582fc1f7d3e"
-SRC_URI[sha256sum] = "8b2c08a555d79e1c428863470c41cb023971d74ba4801d80a05e35adeec23c0b"
+SRC_URI[md5sum] = "4391e7b0af854ecf722cdf712f24b631"
+SRC_URI[sha256sum] = "034cde6d5bb433fe0d29251d5cde5d4c2948abf05fe29ef10966b659331b20e4"
 
 inherit autotools gettext pkgconfig
 
-- 
1.7.9.5



