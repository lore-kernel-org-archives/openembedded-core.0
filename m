Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 553707E79B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 23:17:23 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 205so11081393ljj.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 16:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=TIP1nQ+ks9kMQzn8w26h8zWAW26OuBK1LM6h7S4BkyQ=;
	b=sFV1Z+nV7osnpqbkQV9h4MYhI6+YaxiuhVhpE1FZt5tPO63I3Xqx8CiOTYcktKwUdH
	18FgsGcx336+cNXpm/gYc6Zgy7bqVDrR6CGlF9emKOqmTtYcApWjwx6RTPtUW6Y/kf1j
	18WR8oN5vtAFMoanijZSDhmnGcthBZAEEPZN+LQCSGj4Z4sQNUKHl+7rFBGmcouYyBlc
	aTTlVc4AdBs79gPMsTlnMJ6BUpYGWxaWDEgPc72XETcWMR0Vx/TwskV6dc6vaBWaWb9v
	oN+diQiC8oDcUbd3Y8C7ljP1qWS2xvrKsDQvqyt6+sUh2F3aQHvBAGPisGY7K3bsigE2
	YQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TIP1nQ+ks9kMQzn8w26h8zWAW26OuBK1LM6h7S4BkyQ=;
	b=p2rHu7rGTW/VgBYaVorqr9LPpnWssrVX19HfMhVJ8ymItA4fcBAJfJthR+2LLI1qvt
	/KckQrmnfBoYsX9QlZSVhSZbgwxYsmbuJHV3csUEXmtR3zcBg88XE0t07W+ldIBqeHho
	LGtryL+bz6Cr3p/oSX+clB9OG74Hue2wwE5UFjhvQzJeTWhHTpJ2tlveki0zLrHx6u/3
	b+YAkj9Z89Ofmr0cdJHagVBC3st8H8cfB1CIgphUidxQQUvp8qMwmKU4Gs9ZAIaEMAxx
	9yy4r79zGnOdOeVOx1zB6S3qz2E2oP+E2kSHBOvDeN4BsNWFlXXwo/76wSgqB/ZVQgkZ
	ik/w==
X-Gm-Message-State: APjAAAWrJOBaVaa1RbY8LHPF2buosH/DhEZbnNs0yAuVTDaN+Mm8/t4/
	yvZK63UJMIJ7V/OgwhloL/Y83Mg088E=
X-Google-Smtp-Source: APXvYqxTOtO7ZDiA0Rh79CtXIFAYW8Rr740jYRtYb+LCqsmuA0vanMmAIzMFrPBr463mUIrY6pFERQ==
X-Received: by 2002:a2e:654d:: with SMTP id z74mr12210931ljb.111.1561936643528;
	Sun, 30 Jun 2019 16:17:23 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	y25sm3273266lja.45.2019.06.30.16.17.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 16:17:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 01:17:21 +0200
Message-Id: <20190630231721.24936-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] bison: update to 3.4.1
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
X-List-Received-Date: Sun, 30 Jun 2019 23:17:23 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-devtools/bison/{bison_3.3.2.bb => bison_3.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.3.2.bb => bison_3.4.1.bb} (90%)

diff --git a/meta/recipes-devtools/bison/bison_3.3.2.bb b/meta/recipes-devtools/bison/bison_3.4.1.bb
similarity index 90%
rename from meta/recipes-devtools/bison/bison_3.3.2.bb
rename to meta/recipes-devtools/bison/bison_3.4.1.bb
index adb9d48e90..7946e20c57 100644
--- a/meta/recipes-devtools/bison/bison_3.3.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.4.1.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI[md5sum] = "c9b552dee234b2f6b66e56b27e5234c9"
-SRC_URI[sha256sum] = "039ee45b61d95e5003e7e8376f9080001b4066ff357bde271b7faace53b9d804"
+SRC_URI[md5sum] = "201286a573b12da109df96282fe4ff4a"
+SRC_URI[sha256sum] = "27159ac5ebf736dffd5636fd2cd625767c9e437de65baa63cb0de83570bd820d"
 
 inherit autotools gettext texinfo
 
-- 
2.17.1


