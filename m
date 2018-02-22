Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E14B78745
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 10:51:19 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x21so2842056wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 02:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=yLDX6U1AW0h/CV6/ObczTgTnaBEMUGS4x2js8NHagfI=;
	b=WsqUzgmQHp1oWoiq1RiHfPFIleZ0O6Sh78sGjoT43DE0W18S1jEV9UvfAvdiTY/BAE
	ixhLhthgIwwPQNEo+jA3F9YhI6toNwslvufXuYDA99u1B2PmYa8m7E6CRS7EIDEJGIRv
	066vzvWHmzZjz9j5m30VzGTEDwI3vYcn4a3U2cYjICKlhy0LqFhvwV4Hhz2FKIyCfZWt
	2moEJgyYgOtiJHN8emcLS61xRmGLgy4kELD9dCvtmNLY3qW2OhAM89AxOHLoDaS416Mj
	aDSHzhfa+TqAOTSBVRD/c1G0Iduv4vcfHrMMe95JETLx3uWOSLO/ARGuluFG1PIIBMGD
	vQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yLDX6U1AW0h/CV6/ObczTgTnaBEMUGS4x2js8NHagfI=;
	b=Y1rTE5bQZJwy0G9jO/YmM1phzOJ4hbdm8p5prj200+wczK2m6WHQLTat2DoVOIefb0
	NELIkfDJoF5e8Q2VBRR/ZksGM7rCz4D5bx1V6D9W8qg76AMyxS4vnmjx1XqmFhWN2M1G
	M/RY+sezkP0Q8xRLMXFVA+TAPlZ13K031feCFGBhaGSYJBoa8OgVq76FhmlEvf+xds3b
	d/IsVhPjhW2+hA4M6vIj1dxx8LI4y40XcX1ciT8VKjwaO2+OpiSxXWPTv2IzQ49vGVbo
	UNtpubc7IjQfa97e7ZW8RhxIEaPUQJnG99QskSaulbK6EBglbyuBPdOY9oJvod4/6RzH
	2hAw==
X-Gm-Message-State: APf1xPBrMRWk6CNfaW5suDTc4udShYqU+XBQPscjg964qimzhRkt918s
	1CqJzvcRdxzi4Wc+lTFlCX4mmouX
X-Google-Smtp-Source: AH8x2251S4PrX72X81n3YfbkckNcltriGbD1zDxXlwaLc4SdtB6qGTY+r1tOx0eVRponX5X5yqIflQ==
X-Received: by 10.28.87.20 with SMTP id l20mr4311025wmb.48.1519296680415;
	Thu, 22 Feb 2018 02:51:20 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y6sm128446wmy.14.2018.02.22.02.51.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 02:51:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Feb 2018 10:51:16 +0000
Message-Id: <20180222105116.4102-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] maintainers: update for change to icecc-create-env recipe name
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
X-List-Received-Date: Thu, 22 Feb 2018 10:51:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 59906f8b6de..965fd34ca04 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -266,7 +266,7 @@ RECIPE_MAINTAINER_pn-help2man-native = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-i2c-tools = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-icecc-create-env-native = "Alexander Kanavin <alexander.kanavin@intel.com>"
+RECIPE_MAINTAINER_pn-icecc-create-env = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-icon-naming-utils = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ifupdown = "Maxin B. John <maxin.john@intel.com>"
-- 
2.11.0


