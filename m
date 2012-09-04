Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T8w4l-0005Wu-71
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:34:07 +0200
Received: by bkcik5 with SMTP id ik5so3398310bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=TD1DJ1CusnMQB046MB3z0q/xeSLLOShmrSUHVwuolN4=;
	b=PupXb0bSlNjlmValG9Yr1HW/1ZebXmGXEHMkIsn63vRWi9XIPO+lOjtuZupR87GOQe
	lIiKZ0bRFCOaP9DmbRdHj9k8C8IVsedEXx3Dh3k/5P2RpFUHZlvrFrfLhfkqiyc0YatR
	wKOSIsEvpqyuFHC4xp15ITQNCb4LzRwKJPceSdrmF2rBCadR1/nw56SacwAu1RZcVLox
	C01LEjKSwe7L0G9sPe4TQXY95ovoA/523/VrHxW+BfObCz9bnWVodxLB5rcT/pDY1d6H
	BbL3tHXplOL0SrxQEhElepRkO9JrNhizRPY/B+ejOGoDHLk1VVFQjFFJYLEx8+f3yLiJ
	DzZQ==
Received: by 10.204.157.143 with SMTP id b15mr8241062bkx.75.1346775705445;
	Tue, 04 Sep 2012 09:21:45 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id 25sm10894982bkx.9.2012.09.04.09.21.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 09:21:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Tue,  4 Sep 2012 18:20:58 +0200
Message-Id: <1346775658-23370-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1346775658-23370-1-git-send-email-schnitzeltony@googlemail.com>
References: <1346775658-23370-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-ti 2/2] libgles-omap3: fix for latest oe-core mesa changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 16:34:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* add virtual/libgles1 virtual/libgles2 to PROVIDES
* add RREPLACES_{PN}* for mesa's libegl* libgles1* libgles2*

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-graphics/libgles/libgles-omap3.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 6137097..ac9d5df 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,13 +3,17 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r31"
+PR = "r32"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
 DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
 
-PROVIDES += "virtual/egl"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin \
 		   file://cputype \
-- 
1.7.6.5



