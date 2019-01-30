Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5CADE6BF33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:34:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43qJ8v1wRXz4v
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548840847;
	bh=z0YzgoN1xsj2hjhTe/RvTor3FmPeHattz9zumRTHRmY=;
	h=From:To:Subject:Date:From;
	b=knBWoF91tGjQRE3/4gJEhZWggborR1vNNJEy+lPB0HzGoAKm0Kv0524X9HLBqxgns
	s6HZGNQI0drkjmYgSEmgA/1VfTXbwS9KjRk7MjQbhDeZu4TMOeutOV0qqXWRNbGenu
	P5t2opSX4f3Da3xeZA/hJixtYLSAWf4yA1X/Hn35jiGsQPcSij+hjjUNr/6E8nATpX
	3AXOyyHfP/pBsDSysq5Ivtm19fhuhJPMRqO8RMn1YCtzlR2VhZpOY7X9Xh0NcKVkcz
	xVB5XKHAhBE4omzKopSg3aDM07Q6PdmJb2bIjUpNpYsJTbtfdAVaPgDbm6/D4GAetA
	3Zkyww2gyBmpVTSjVPNRVD38Tg7EAEIGeOTA8uoJeYek6nB4FTJxAx7sYTRmrNbNXM
	Z/4mvAhLKWAvBWmIub38PYqyIp5AkMsQRHQZL2Tkdh20XyYYGbuy1xsBqMdeLTEACG
	pmTeoYaRHxz+zU8Gl4reo+R6A/omcEWnfAuqxhR4LqL6IpPV7nfvKHD9i03Y2+8rAR
	jVSTFpdwQxGkUSbQVrOyiRtq2X+IJZaecjwxHsFxGjup91QkT8aCj9K0aey3r35KRr
	iCr9dsYSRln+gkvYXzdujMM/oIpTOM7nkuM1VlEAkLTDmPqHqKn93G4cVvb/LxEH3N
	yyeIUVltL6/7nPQ4Rk2g4FXo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:34:05 +0200
Message-Id: <20190130093406.10391-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] busybox: add devmem
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
X-List-Received-Date: Wed, 30 Jan 2019 09:34:07 -0000

This is a tiny but pretty useful tool.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index d11707abc3..1519159a49 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -791,7 +791,7 @@ CONFIG_DC=y
 # CONFIG_DEVFSD_FG_NP is not set
 # CONFIG_DEVFSD_VERBOSE is not set
 # CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
+CONFIG_DEVMEM=y
 # CONFIG_EJECT is not set
 # CONFIG_FEATURE_EJECT_SCSI is not set
 # CONFIG_FBSPLASH is not set
-- 
2.11.0


