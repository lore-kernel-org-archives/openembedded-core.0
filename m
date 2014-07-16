Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BA2F4705F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQTjP011065; Wed, 16 Jul 2014 17:26:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XgidekfhwftN; Wed, 16 Jul 2014 17:26:30 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQRW5011043
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:28 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2A-0004NR-7D; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:06 +0100
Message-Id: <aa447141bda2901f8aa09d3504e819af48fc03d7.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/19] powertop: Upgrade 2.5 -> 2.6.1
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:14 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/powertop/{powertop_2.5.bb => powertop_2.6.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.5.bb => powertop_2.6.1.bb} (85%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.5.bb b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
similarity index 85%
rename from meta/recipes-kernel/powertop/powertop_2.5.bb
rename to meta/recipes-kernel/powertop/powertop_2.6.1.bb
index 86a7f60..58216c2 100644
--- a/meta/recipes-kernel/powertop/powertop_2.5.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "806bbcbd44fcea1f807c9582fc1f7d3e"
-SRC_URI[sha256sum] = "8b2c08a555d79e1c428863470c41cb023971d74ba4801d80a05e35adeec23c0b"
+SRC_URI[md5sum] = "4391e7b0af854ecf722cdf712f24b631"
+SRC_URI[sha256sum] = "034cde6d5bb433fe0d29251d5cde5d4c2948abf05fe29ef10966b659331b20e4"
 
 inherit autotools gettext pkgconfig
 
@@ -21,6 +21,7 @@ EXTRA_LDFLAGS_libc-uclibc = "-lintl"
 do_configure_prepend() {
     # configure.ac checks for delwin() in "ncursesw ncurses" so let's drop first one
     sed -i -e "s/ncursesw//g" ${S}/configure.ac
+    mkdir -p ${B}/src/tuning/
 }
 
 inherit update-alternatives
-- 
1.9.2


