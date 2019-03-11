Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A56F7CF6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 05:16:43 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h8so3118680pgp.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 22:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=B3/vXhnFF7xT8fOtnpHRWbTOZgdnC+EDPYuySEkQx84=;
	b=LleoalvBSO6zXw5fe8ndz9gwENdQkUiQbWJBG334ILcYwt4k4pCdXMyDGTLZIHnIkY
	j75xSj9+0QuMnRfxCqYVO04TIspAyBqvjGXIWZrZJxkpnhrCIL3NYwGq5sGViLo+Jv6k
	abfyTQgQbkqEurAt8/6ekRGXF/J4mJybJkLsHoT8ddemchOxGs/OobwktWRgRvZoXJl3
	ISLJRr0RrVvD/gBPUWtt3stFg+GEp9+OMIkfxV6F5PWN2OLEYYVx8OoTT2JeMgsucoRN
	3oRAiFKt+bGo8ia1PWdVQZk9g7Bd1oIfLoGetAFC48otM/x0fZMY336OtvWgOFoHR5dn
	HEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=B3/vXhnFF7xT8fOtnpHRWbTOZgdnC+EDPYuySEkQx84=;
	b=jYMxFwgWuXcggfZa8I47i0RQgIR+qQLoEgnTv5y/8xGOklJNhoJCHMa+9r85Cj04Yi
	Su6cy7wwnEgwG0KG3CwER2b/gNqtkAcJLbqZmUiUPhCjdQ6jxMdyDKeuLvB8f1ewCf3m
	zGYsWBvjG4GUgpGJtA0uaVgkWP3r2OwePL7y89NWSUDkdMxcjjdbq7BciIOkuwMBmjls
	szNGpozwEOEHCnrmhLlySW3ymOAz9N487D89HO8cc+evZJvBQTSw4xj0dHNSWGx+WIRu
	yOwyWed+dZFp819bvN/GrwwGihBjGeqt/fHdZtDJetjbVnMhzHRkZpOBdwi1OoFVkySG
	9TiA==
X-Gm-Message-State: APjAAAULCo8VSln6PH+MOuKjhXjkMRQjRI23aXCbgifPmystwE3xPwul
	J0FsjQQMIWywrliGgL+8JCWnxu44
X-Google-Smtp-Source: APXvYqy8PtrvjDPUUryHB9U9YKsu2DOz5/9ACym2Xg5jv0kGo6VDrA2oqw9QqRPJLHEZ/VfPfghfYw==
X-Received: by 2002:a17:902:3a5:: with SMTP id
	d34mr2314671pld.174.1552281404442; 
	Sun, 10 Mar 2019 22:16:44 -0700 (PDT)
Received: from localhost.localdomain
	(50-196-139-177-static.hfc.comcastbusiness.net. [50.196.139.177])
	by smtp.gmail.com with ESMTPSA id s6sm6215239pgm.90.2019.03.10.22.16.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 22:16:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 22:16:41 -0700
Message-Id: <1552281403-31669-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] libxcomposite: update to 0.4.5
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
X-List-Received-Date: Mon, 11 Mar 2019 05:16:43 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libxcomposite_0.4.4.bb => libxcomposite_0.4.5.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcomposite_0.4.4.bb => libxcomposite_0.4.5.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
rename to meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb
index 5e26fca..3ef3ddb 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb
@@ -24,5 +24,5 @@ XORG_PN = "libXcomposite"
 
 SRC_URI += " file://change-include-order.patch"
 
-SRC_URI[md5sum] = "f7a218dcbf6f0848599c6c36fc65c51a"
-SRC_URI[sha256sum] = "ede250cd207d8bee4a338265c3007d7a68d5aca791b6ac41af18e9a2aeb34178"
+SRC_URI[md5sum] = "3fa0841ea89024719b20cd702a9b54e0"
+SRC_URI[sha256sum] = "b3218a2c15bab8035d16810df5b8251ffc7132ff3aa70651a1fba0bfe9634e8f"
-- 
2.7.4


