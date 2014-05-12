Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 5465E60167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:28:31 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 16:28:22 +0200 (CEST)
Received: from localhost.localdomain
	(host-90-236-245-133.mobileonline.telia.com [90.236.245.133])
	(Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id 27F2C3A227;
	Mon, 12 May 2014 15:55:46 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 15:55:32 +0200
Message-Id: <3f449f6a2f45365dc12ac6cb345f813152e6e1d3.1399868537.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
References: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
In-Reply-To: <cover.1399868537.git.petter@technux.se>
References: <cover.1399868537.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv3 07/13] qemu: remove unused FILESPATH
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
X-List-Received-Date: Mon, 12 May 2014 14:28:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
However in nativesdk-qemu-helper no FILESPATH additions are currently needed so
instead it should be removed.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../qemu/nativesdk-qemu-helper_1.0.bb              |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index fe03b82..51d1c59 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -3,7 +3,6 @@ LICENSE = "GPLv2"
 RDEPENDS_${PN} = "nativesdk-qemu"
 PR = "r9"
 
-FILESPATH = "${FILE_DIRNAME}/qemu-helper"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/tunctl.c;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999 \
                     file://${COREBASE}/scripts/runqemu;endline=18;md5=77fbe442a88b1bcdc29c3ba67733b21b"
-- 
1.7.9.5


