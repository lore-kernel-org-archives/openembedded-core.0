Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1671B72850
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 21:03:37 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so2726871wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 13:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=GhUcIlrV6Rqgy2RYbIE8cHNja3RR9jGGLy1zaTwbeM0=;
	b=tFQCQNn4QTRcTlxaoW5c5Cr+vkxtF9QKNvUfA6hLgJ6cF274XCBMzyY/JOMDYMI/dq
	2eJDDSkVefhjzUy5wumRzeqFvVKImKYsX0p+MaMw1OrVXI4R7X0QX15wRRer6casr5LA
	jhgkk3Enn5t3mAt2Uw8O0nwo71t6Uja567iJGi2aN86Kd1XdpsCBwpGU8cHCrEJt8cAq
	0hedNYl0+U45yBAyUUP5u8H7V6UkbUq1bRwIrcSRXgFau/oIF59PDbw/zbrx1MF8ABg1
	4LyaXtON6TbhP2ztdRdcKgm/WdB8COSr6tW9a34AQ0v/BOxzRA2q9NEL0ALbO2fD6ZDq
	RFFw==
X-Received: by 10.180.211.34 with SMTP id mz2mr8617482wic.56.1418936618177;
	Thu, 18 Dec 2014 13:03:38 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id 18sm10293638wjr.46.2014.12.18.13.03.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 13:03:37 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Dec 2014 21:03:30 +0000
Message-Id: <1418936610-31640-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] opkg-utils: Update SRCREV
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
X-List-Received-Date: Thu, 18 Dec 2014 21:03:44 -0000

The new upstream commit incorporates the following fix to update-alternatives
from Chen Qi <Qi.Chen@windriver.com>:

    update-alternatives: avoid double slash problem

    The link path stored by update-alternatives should always be absolute and so we
    do not need to add an additional slash when joining to $OPKG_OFFLINE_ROOT.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 6fa54d6..2800a5d 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 PROVIDES += "virtual/update-alternatives"
 
-SRCREV = "127b371319974b0c585969c234f85b2d5c860e34"
+SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
 PV = "0.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils"
-- 
1.9.1


