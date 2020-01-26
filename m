Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 808D37FEEA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 18:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B15440BDA;
	Sun, 26 Jan 2020 18:24:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cEvIr0YVust6; Sun, 26 Jan 2020 18:24:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7102B40A4E;
	Sun, 26 Jan 2020 18:24:36 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2686D1743AA;
	Sun, 26 Jan 2020 13:24:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 13:23:35 -0500
Message-Id: <1580063015-21121-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] grep: upgrade 3.3 -> 3.4
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
X-List-Received-Date: Sun, 26 Jan 2020 18:24:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/grep/{grep_3.3.bb => grep_3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_3.3.bb => grep_3.4.bb} (89%)

diff --git a/meta/recipes-extended/grep/grep_3.3.bb b/meta/recipes-extended/grep/grep_3.4.bb
similarity index 89%
rename from meta/recipes-extended/grep/grep_3.3.bb
rename to meta/recipes-extended/grep/grep_3.4.bb
index 704a3ec..fb8dcec 100644
--- a/meta/recipes-extended/grep/grep_3.3.bb
+++ b/meta/recipes-extended/grep/grep_3.4.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "05d0718a1b7cc706a4bdf8115363f1ed"
-SRC_URI[sha256sum] = "b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514"
+SRC_URI[md5sum] = "111b117d22d6a7d049d6ae7505e9c4d2"
+SRC_URI[sha256sum] = "58e6751c41a7c25bfc6e9363a41786cff3ba5709cf11d5ad903cf7cce31cc3fb"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.7.4


