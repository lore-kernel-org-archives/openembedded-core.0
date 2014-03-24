Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id BF3AA6FB00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 00:17:38 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id lf10so4664468pab.41
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Mar 2014 17:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=x2t5Obj+J1M5HWiUXia7bj8SrFP/xcyhmzNRAbW6w5Y=;
	b=bSRUMch2m2TawNgwrvBMkCbxM65k/+TIPMRKRVvEecNuRn6Ke9oaU6WHyJqCpFPlEh
	xWBd0s9OKfucLQXc2hpiqfmkVULSiBZanJWPtdVjtBYrOc1hWFTlp57ST7mWwRQXZM6o
	6i41WOA6awE2cZYpArJZibeQRmbUYRC8Yeschtrt2WSM69UAfPyIEmGpaBsURCf/L72+
	AlmEM8Vfu4Sh7QTsAKeBafORNXjxwf41XTZKD4zLZ+DeTNTLEFRKeV+nZrAN1BgjwDZl
	dZ19g2FgNXfpQyAS2qU3EHIvS98oNQJgbufvADQe5wBxUNOFMIbcaOermhDhl2yrpNv3
	/sjA==
X-Received: by 10.66.66.202 with SMTP id h10mr67926211pat.70.1395620258749;
	Sun, 23 Mar 2014 17:17:38 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	pe3sm28812668pbc.23.2014.03.23.17.17.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Mar 2014 17:17:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2014 11:23:02 +1100
Message-Id: <1395620582-11671-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] connman: upgrade to 1.22
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
X-List-Received-Date: Mon, 24 Mar 2014 00:17:39 -0000

Highlights:
- If VPN is split routed and not the default service, then allow
  DNS queries also to be sent to VPN DNS server.
- Session API fixes
- Memory leak fixes
- Crash fixes
- NTP kiss-of-death packet support
- Support for full USB gadget networking. Now USB gadget network can
  be used without tethering.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-connectivity/connman/{connman_1.21.bb => connman_1.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.21.bb => connman_1.22.bb} (68%)

diff --git a/meta/recipes-connectivity/connman/connman_1.21.bb b/meta/recipes-connectivity/connman/connman_1.22.bb
similarity index 68%
rename from meta/recipes-connectivity/connman/connman_1.21.bb
rename to meta/recipes-connectivity/connman/connman_1.22.bb
index 48ed20e..4bd986f 100644
--- a/meta/recipes-connectivity/connman/connman_1.21.bb
+++ b/meta/recipes-connectivity/connman/connman_1.22.bb
@@ -5,7 +5,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             "
-SRC_URI[md5sum] = "483633162b819c8b99fec970f92e311d"
-SRC_URI[sha256sum] = "e80f4e9c639ef016e9c497c122c349dbc9e6dc78a9976f986134739ee208c08a"
+SRC_URI[md5sum] = "4f45ab2035d1028a287d14427ce61774"
+SRC_URI[sha256sum] = "64d9a8ab83c99943514bb64984142fef409177a93c64e1aace84eaf13c7bddde"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
1.9.0


