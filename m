Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B78137719B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 12:42:16 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l66so68420201wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 04:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ta0KBRmSYwaDdYDb4T4+sBbvD0wJLOoih2x0+2K2AY4=;
	b=UCuuXymHdjrHhAPKAhIguCqGqafm/X69b2GDPas4hNokG8zMITPquCgLs/Lfd5cTEB
	TzBCiu7DYxA6/9DbdU2T/EpZrwHPvgrQtisvv9b7d+IS8UgCEHcOTA1LzE6jkwLG94J/
	iXSRRTvKUOxqaFTh8crb8XTYtUJhGYi8E5kovdPWybV12RoKtaHm+iKuDQLDIPktYt0t
	5N+LtTa+OUSthMVYcN+Tibom8OBgOx5TTUc+HGJFZHe4daa3PRFGkopwqFs7yCYsuO3/
	hM7xV+qM0rY+7m5SX16tKJ6PWS6jKMOmzWQ2nY5X8vexyISyDRnW0dNjJoMjpiiJmXAa
	VVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ta0KBRmSYwaDdYDb4T4+sBbvD0wJLOoih2x0+2K2AY4=;
	b=DMs6E0+x8S5Us3c3sAzMP0ZxImTJCux5ZfKu4Dxl0rubWYQ/RSwImNfquBldxr6yZV
	bONj5WLZaidgouE9Zhe/gAnwvMppYvG3OuD8lfxIZlPW45aAuoOFBhz9ht2p1iQri0c2
	2+/StaaK74R3gkw0JAKhIr7xvM/gu8qpw5prJ0rnFffbGSQGHQoybUggMshKY/7CPgRI
	S/IVfEGaBXzswPw4p2RX5hL0Ds3sLkfAdC7g5MIElF00dMYasLaexMGZswICzhYS+IBp
	5U9U+tNux3ak8I7HYHIs3+mRA6ZcuRYZTik0QDj1sTNfb31t4W543V/YOdP5Hp33RoML
	cLuA==
X-Gm-Message-State: AG10YOTcnU5MhVz0lYLfPz5H+bPZbG4fgWY6AW2wlCovOM1V0CzUGtZ8z9oUCvEOqgoYbxdM
X-Received: by 10.28.30.132 with SMTP id e126mr25543998wme.42.1454503336645;
	Wed, 03 Feb 2016 04:42:16 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	w80sm21450432wme.17.2016.02.03.04.42.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Feb 2016 04:42:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 12:42:14 +0000
Message-Id: <1454503334-2424-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] i2c-tools: point SRC_URI at Yocto source mirrors
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
X-List-Received-Date: Wed, 03 Feb 2016 12:42:18 -0000

The ln-sensors.org web site has been down for some time, so point the SRC_URI at
the Yocto Project source mirror.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
index 042695b..4d25542 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2 \
            file://Module.mk \
 "
 SRC_URI[md5sum] = "7104a1043d11a5e2c7b131614eb1b962"
-- 
2.7.0


