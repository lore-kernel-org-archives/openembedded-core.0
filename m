Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id DCCC460017
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 19:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6284A208E0;
	Tue,  9 May 2017 19:31:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xtvG2W5k6Mde; Tue,  9 May 2017 19:31:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3EAAD20873;
	Tue,  9 May 2017 19:31:56 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B77C31624B1;
	Tue,  9 May 2017 15:31:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 May 2017 15:31:54 -0400
Message-Id: <1494358314-53536-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] python3-nose: rename ${bindir}/nosetests into ${bindir}/nosetests3
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
X-List-Received-Date: Tue, 09 May 2017 19:31:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

This resolves a conflict when both python-nose and python3-nose are pulled
into an image and try to install ${bindir}/nosetests binary.

This matches with how other distros are solving this problem, e.g. Debian:
https://packages.debian.org/jessie/all/python3-nose/filelist

Also, other packages like python3-setuptools are already doing the same with
their binaries.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-devtools/python/python3-nose_1.3.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
index 99bba44..1e2ff74 100644
--- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
+++ b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
@@ -17,6 +17,10 @@ S = "${WORKDIR}/nose-${PV}"
 
 inherit setuptools3
 
+do_install_append() {
+    mv ${D}${bindir}/nosetests ${D}${bindir}/nosetests3
+}
+
 RDEPENDS_${PN}_class-target = "\
   python3-unittest \
   "
-- 
2.7.4


