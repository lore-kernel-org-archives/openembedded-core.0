Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C7EB26AC28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:50:05 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so76483838wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=honn6aKetxaY7uVvhG5PlabkOjkskd9tSFBIgN3w/xw=;
	b=FDvB9G/o1cwxkQQNLHW6NSNb4NY3a4hbVROelrlxXUkrCJxlAYicUulo5BlIalmz8n
	VeI0NO1lCZ83RwcmbP+9OFML0hTB/NQ2t2HmZ3CP3SgerSC71sOjCvS+bWuXKdQ28IcB
	T8JP1YoMwDya9p/M6krf2IHc3a4vX+54uWXhjAJq+WIVInGTp393w8FJIAMQHVsiSThl
	F4wNHXoqwn/Zf+MdtTYlpylOiSYypThljrRSwIjGahKTS7+jCYcEjaUi6saIUzrcdh5Y
	+f1qOWPOQhW4XY4bGERN5TzcyqtzhdXtuW46o+LAWXRNz1BaT19zVbfESCHmrVq1DNAE
	Q0qA==
X-Gm-Message-State: ALoCoQmvQhE7WJfyeCXZ1VJ/OYiSQtpx/tCrEURAPDJl6TXZgKBNnPrBulrHbtlf4eeC+r7hHSKa
X-Received: by 10.180.74.10 with SMTP id p10mr15196150wiv.3.1431967805968;
	Mon, 18 May 2015 09:50:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.50.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:50:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:28 +0100
Message-Id: <1431967531-25163-10-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 10/13] libxshmfence: upgrade to 1.2
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
X-List-Received-Date: Mon, 18 May 2015 16:50:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxshmfence_1.1.bb => libxshmfence_1.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.1.bb => libxshmfence_1.2.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
index 7dff0d4..ae34b1f 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
@@ -13,5 +13,5 @@ DEPENDS += "virtual/libx11"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "2dd10448c1166e71a176206a8dfabe6d"
-SRC_URI[sha256sum] = "dbc2db2925ca9f216fd1e9c63d0974db9f4d49aaf5877ffb606d2d8d7e58cebe"
+SRC_URI[md5sum] = "66662e76899112c0f99e22f2fc775a7e"
+SRC_URI[sha256sum] = "d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c"
-- 
2.1.4


