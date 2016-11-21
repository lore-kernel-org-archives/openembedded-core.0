Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB7A719F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 20:17:40 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id h201so49719948qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=FVfpTlEEX5u0uBPsIIRXddFcz7ByIq+eWzTpfVELFoo=;
	b=Pz8gkWAus/CNF/0rEyR7lXNIu2evjptpBFkwwKW38JQnBMq7o39C2xkrUZPCeZMd6w
	xGrsf4uQ5c58tK0BY6ORpQ3g2KFmOqit/XFlnjHlIG6+luTwshXlJ0QHgNPBVKxvArKA
	zqAi0S5CL3s/7HrEhSYWF9y3Kbde5RxOtpi4xE23MHpMa1rvNk8Go7FhO4jCaUVtsFAD
	a4LJW6uyzeork82lWx2sKtdV9iPEFhI9RnDN7KghDPdRw86n5b2p96cGpZ6+K60kjrlx
	PKPqtxskuXYzPNIFQdRLtmPz1my/DrfS552aZiglE096X1HWCVPfG2TGd5exp7N6WHv/
	n5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=FVfpTlEEX5u0uBPsIIRXddFcz7ByIq+eWzTpfVELFoo=;
	b=WSLpUkE9IyH/APR2pdqh25lyl5FHi/TpwPh1uP/FEBBP10S850G37fK6FI/yxXVAzl
	ZEyTI945wJMaQ1uqK7r4rr/MLmgrcjy+NyLH8+VT0L/w8t0khwO/q5Kg9TMLNrlsHiiD
	5FYrMad4krd5t6W+kuQaD/mbTExFjd3RE0E6KfMKOIgBodBoWnBrqJN5ZiW76TFBSSNB
	sA3/xdhxe+gBrIaAxtQZlwWoCNyqu8yasKAU7MrVAc1L7NChe/HMm3opbHL+2ib99QBw
	oV2W+3nLTHM+C8XNUHXEh30rgj0ppz23Vj+VokDhJXsfBslwzwi2MrROXC7AukiN5cSc
	Wvww==
X-Gm-Message-State: AKaTC02PJOHB/mMKISuFpil37vdeLB6JfVjwfV6wTqQQns9mMLL+W+sXWRUFV2Ll9wIIKQ==
X-Received: by 10.233.223.196 with SMTP id t187mr19270375qkf.135.1479759461459;
	Mon, 21 Nov 2016 12:17:41 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id 1sm12042704qte.46.2016.11.21.12.17.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Nov 2016 12:17:40 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 18:17:24 -0200
Message-Id: <1479759444-5833-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] nettle: Update to version 3.3
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
X-List-Received-Date: Mon, 21 Nov 2016 20:17:43 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-support/nettle/{nettle_3.2.bb => nettle_3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nettle/{nettle_3.2.bb => nettle_3.3.bb} (75%)

diff --git a/meta/recipes-support/nettle/nettle_3.2.bb b/meta/recipes-support/nettle/nettle_3.3.bb
similarity index 75%
rename from meta/recipes-support/nettle/nettle_3.2.bb
rename to meta/recipes-support/nettle/nettle_3.3.bb
index 2b79779..c723e27 100644
--- a/meta/recipes-support/nettle/nettle_3.2.bb
+++ b/meta/recipes-support/nettle/nettle_3.3.bb
@@ -7,5 +7,5 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6
                     file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
                     file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e"
 
-SRC_URI[md5sum] = "afb15b4764ebf1b4e6d06c62bd4d29e4"
-SRC_URI[sha256sum] = "ea4283def236413edab5a4cf9cf32adf540c8df1b9b67641cfc2302fca849d97"
+SRC_URI[md5sum] = "10f969f78a463704ae73529978148dbe"
+SRC_URI[sha256sum] = "46942627d5d0ca11720fec18d81fc38f7ef837ea4197c1f630e71ce0d470b11e"
-- 
2.1.4


