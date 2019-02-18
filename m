Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 4B36D7C891
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 22:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BABB240BB1;
	Mon, 18 Feb 2019 22:49:22 +0000 (UTC)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pdqG1iJ4omOt; Mon, 18 Feb 2019 22:49:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B50E40B53;
	Mon, 18 Feb 2019 22:49:21 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 22A1216B4D1;
	Mon, 18 Feb 2019 17:49:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 17:49:03 -0500
Message-Id: <db40582b90645c4f89fa527108eac7c9b1a2fecb.1550529998.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/6] lzip: upgrade 1.20 -> 1.21
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
X-List-Received-Date: Mon, 18 Feb 2019 22:57:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/lzip/{lzip_1.20.bb => lzip_1.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lzip/{lzip_1.20.bb => lzip_1.21.bb} (88%)

diff --git a/meta/recipes-extended/lzip/lzip_1.20.bb b/meta/recipes-extended/lzip/lzip_1.21.bb
similarity index 88%
rename from meta/recipes-extended/lzip/lzip_1.20.bb
rename to meta/recipes-extended/lzip/lzip_1.21.bb
index ed648e8..bb3d2a6 100644
--- a/meta/recipes-extended/lzip/lzip_1.20.bb
+++ b/meta/recipes-extended/lzip/lzip_1.21.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     file://decoder.cc;beginline=3;endline=16;md5=db09fe3f9573f94d0076f7f07959e6e1"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[md5sum] = "21c1517da2ace9689fd953918660b3c3"
-SRC_URI[sha256sum] = "c93b81a5a7788ef5812423d311345ba5d3bd4f5ebf1f693911e3a13553c1290c"
+SRC_URI[md5sum] = "c0061730d017ea593a09308edc547128"
+SRC_URI[sha256sum] = "e48b5039d3164d670791f9c5dbaa832bf2df080cb1fbb4f33aa7b3300b670d8b"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.7.4


