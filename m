Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id EF8F86BF40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 23:59:15 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id c19-v6so3380403lja.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 15:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=njS/AJSLj7mbU3Xba5PreC0b4wCSWXbxVpFgXjFQ0IA=;
	b=0EC01IH+RW7NQRgM3AYoq03AQK/5LZ8T6kmNdXk1gcaD5ep0J1Uj2kyS59ULIRwOUF
	8i8HwHrjOOGOwBmLSIfV1uXNZrphxP3xAL+/9vNBVnYOQVlKkDvmEsZamhSVjThkzzlR
	ZQQUtt/lc92Fw/X9h5Z1zWoOXa7ZxslRhBqekL6K1sArlG25LQdsSxSXUvP+RD0QoXuq
	dBEtyHOxhwW5NDpUFEranqf4uU9taEZew9fm1RzPrBh9mvE/sybIPpEijFB124iIFZBc
	H5nmZPdRWfsA/h4D+M4PlqVPpry0XZFQ5G0ekKB+yCs5k/RnJ33aV/hBYUq/02zTEVd8
	jSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=njS/AJSLj7mbU3Xba5PreC0b4wCSWXbxVpFgXjFQ0IA=;
	b=M5QIpIkSNZW0W0KTsbwtZUxX9QNKS29xVI82jag7toU2akEEE9tj7HUQiSl1gXhL/I
	XT4up6dfOvctdytt31TYQPyXVWRcdmWMSMUgD57E3snnpXdT9S5x9Uezm6ZcGaSC76HE
	LNIJ9Ab8xmy/t8XvQI5/FcY0hGTX6Eps/E/N8JsZ3pX9sTF2tyUKxQih+FxFRWI/mW+O
	ZS6YqxY1LF7C4KiuWip9BPzq0zlVmsW490WKYEebZDnwY/gzcDeJ4hwpg0yfwIdeWO84
	WA9vULnlECo1NQGG3FMs11ZWp9REku09Kleun2gE0qbjie3o80pVTM8nMy5CaprUPu9E
	l6kA==
X-Gm-Message-State: AA+aEWb1KDiysoNOESNtpsPpW2uDRl4AH8HHiRpWqb/n6UBAaZUQ3sXG
	01inW3RlLMOat9+rfLeXOuX1HJvSgBecXg==
X-Google-Smtp-Source: AFSGD/UhOfLOt9C2d0mlGDpxlSwA2upTUoONRBJuAglp5tYg9yL8tb4SDb3o/yg9kmdICjMnw5BxLg==
X-Received: by 2002:a2e:750a:: with SMTP id
	q10-v6mr2621459ljc.39.1543535955829; 
	Thu, 29 Nov 2018 15:59:15 -0800 (PST)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id x11sm590736lfd.81.2018.11.29.15.59.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 15:59:15 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 00:58:31 +0100
Message-Id: <20181129235831.1361-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [PATCH] nano: upgrade to 3.2
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
X-List-Received-Date: Thu, 29 Nov 2018 23:59:16 -0000

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta-oe/recipes-support/nano/{nano_3.0.bb => nano_3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_3.0.bb => nano_3.2.bb} (79%)

diff --git a/meta-oe/recipes-support/nano/nano_3.0.bb b/meta-oe/recipes-support/nano/nano_3.2.bb
similarity index 79%
rename from meta-oe/recipes-support/nano/nano_3.0.bb
rename to meta-oe/recipes-support/nano/nano_3.2.bb
index 2c7fbd549..b96a79fd0 100644
--- a/meta-oe/recipes-support/nano/nano_3.0.bb
+++ b/meta-oe/recipes-support/nano/nano_3.2.bb
@@ -12,8 +12,8 @@ PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "74196427a09ec2f82a88facd220d2787"
-SRC_URI[sha256sum] = "e0a5bca354514e64762c987c200a8758b05e7bcced3b00b3e48ea0a2d383c8a0"
+SRC_URI[md5sum] = "2606dc0dc31a088f16c7d603b42d23d0"
+SRC_URI[sha256sum] = "d12773af3589994b2e4982c5792b07c6240da5b86c5aef2103ab13b401fe6349"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


