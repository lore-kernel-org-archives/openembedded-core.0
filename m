Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE5F768AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 19:08:45 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so61628043qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=41XSdaDiEoyWVMrz8F26IH2QNhR7MlMagnHcCDU7i6I=;
	b=YWXnG8d09pSynSJCEiBrfOvpKQRl7kh/QtdRJZfupTRTnRLjHVOdW5TzlBGzGBB2ud
	TBAnHent+t+ZopWkeg7znc1YRo+VjeLbjLgfjmwxcM73CCdzEpWQbgr0z19jJb+1ytIw
	XGp4M8hXfKi5mVxNljcrUXfJMMcgIZkOQpLR9I8aDXTw66V2CFueX4Nyp3doegJ9pXkj
	H7APwzkVQM2jjoHsnfJHrUZ+kobtlUmoWM4wc3y2AckRtWGKedF2DV+X3ybGJTmKgkoq
	3bgM8NilG3mWY4bua2o8cyVFWsTd+kPKlkKmE9+t5k1UZOmU/LKTJ+dpzJv2Ow+8dWon
	4dhw==
X-Received: by 10.55.19.98 with SMTP id d95mr40175969qkh.71.1439233725482;
	Mon, 10 Aug 2015 12:08:45 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	z33sm2974840qkg.44.2015.08.10.12.08.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Aug 2015 12:08:44 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 10 Aug 2015 16:08:39 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 16:08:36 -0300
Message-Id: <1439233716-14766-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.5.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] wpa-supplicant: Fix CVE-2015-4142
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
X-List-Received-Date: Mon, 10 Aug 2015 19:08:47 -0000

The original commit "wpa-supplicant: Fix CVE-2015-4142" included the
patch file but didn't apply it into the recipe, so the backport has
not been effective.

Reported-by: Adam Moore <adam.moore@savantsystems.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
index 0186c2b..a124cf2 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
+           file://0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch \
            file://0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch \
            file://0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch \
            file://0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch \
-- 
2.5.0


