Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 656F471957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 03:19:10 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id j17so277491uag.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 20:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=l8ZjZKuMVpV2ZQmm2C7A2VzvXQQohYuIZEg+4TAjW+U=;
	b=fHaCYDmT179PeYh6TkC/fR+GQvIeNprwc3xji/YZpxmyGZx1il8RPIxxkWPY8enfTx
	J9fU3gJ4L3bRVyAATWQ9MS5Y2+TrbUSDtUhAe86QJGkRiyww9QLyqNQ1RaK8Tb9ML+hv
	7j6fMHsKlyxUU2qvIpA45GFF9+9aNHMmb0XHRUHk2mY8Y5iGoD1V7tccQbv0bp+4qJtJ
	EkXOIUn4BQWyl9p2xPLfL7oNo6dpIs5MO/J6iAJA9XA15El+fkPWZODr95GJFVPi+WhG
	1aULIGYdUNSIK6s95snE3tJESPrRuzpnphX2NGGMqzLvaan5XijfTdiuDMkt797lIdK+
	PGbg==
X-Gm-Message-State: AODbwcC18cWt9EbNAt+gAh6iUUufCY4y8+1TUnFCxnzSPGq9L/DyQZ0A
	db0g3Pj02hkXhNvf
X-Received: by 10.176.68.133 with SMTP id n5mr10252899uan.116.1496200751646;
	Tue, 30 May 2017 20:19:11 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	a38sm3623445uaa.27.2017.05.30.20.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 May 2017 20:19:09 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 31 May 2017 00:19:05 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2017 00:19:04 -0300
Message-Id: <20170531031904.7439-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] u-boot: Update to 2017.05 release
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
X-List-Received-Date: Wed, 31 May 2017 03:19:12 -0000

This 2017.05 release is out since May 08th, 2017.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
- Update to 2017.05 release

Changes in v2:
- Fix typo in commit log

 .../u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.05.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.05.bb}   | 0
 .../u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.05.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.05.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.05.inc} (86%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.05.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.05.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.05.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
similarity index 86%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
index df24c853dd..3719aee52d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
+SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot_2017.05.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.05.bb
-- 
2.13.0


