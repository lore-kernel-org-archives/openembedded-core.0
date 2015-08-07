Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 27604767DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 19:33:13 +0000 (UTC)
Received: by qkdg63 with SMTP id g63so40539696qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 12:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=wN1exYzBt0c4aKpw2yl1gBf/AYywgZhfcTnuyPIdrlc=;
	b=NyfSN1iUg6i/cDQ8lfj6E1d6qqJqXR6hVYRixVQIoLBlPjjraot4aUa0aMpU4x65Mx
	NDy6nXEj25fMizgzFvF+tkAF/eyIOLVC+6uco5u1x3MBXP3CqRNrvYcEhKgdzAMQ5gXY
	Fol126ubdLnB/h4VDnw3/7aoZOgTRV7ej2mHmcL1GIyZkZBbAHp0b6bcH+UPG1lxJ+fl
	XlPq2SDNCAie3OBm+MToNCNQJMOwwqM5QYFYTy/u6nO2fDwMMGjuZyBpYxVXi6A02D83
	B0SB5uBhnMHftifkqefOqN/1XoEcB6bNj8znQBUlAfTpbUGbKFxJIv90hkxvONmfcv8i
	rkzg==
X-Received: by 10.55.25.131 with SMTP id 3mr16351039qkz.85.1438975993762;
	Fri, 07 Aug 2015 12:33:13 -0700 (PDT)
Received: from localhost ([179.105.243.19])
	by smtp.gmail.com with ESMTPSA id b37sm5450291qge.2.2015.08.07.12.33.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Aug 2015 12:33:12 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 07 Aug 2015 16:33:08 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  7 Aug 2015 16:33:07 -0300
Message-Id: <1438975987-1605-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.5.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] wpa-supplicant: Fix CVE-2015-4142
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
X-List-Received-Date: Fri, 07 Aug 2015 19:33:17 -0000

The original commit "wpa-supplicant: Fix CVE-2015-4142" included the
patch file but didn't apply it into the recipe, so the backport has
not been effective.

Reported-by: Adam Moore <adam.moore@savantsystems.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
index ebae239..fee8384 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch \
+           file://0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch \
           "
 SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"
 SRC_URI[sha256sum] = "058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"
-- 
2.5.0


