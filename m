Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id EE6A67C623
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 10:46:33 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id d16so256lji.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 May 2019 03:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lHoJfl62NR3g6/L7uNs08wN+amufIK1AcglRx5MHu2k=;
	b=2DShrrCAuqC6UCLU9z/9s0wuMhF3YVN+Ga8JBlxude8KzD3G5r+Krd6Tf3CLZ39hmW
	CtsB9dTVCwRCOeAp/FcLcL2Qb3fRF4Xs9+1RuL1QwOsaMHh6cT+6TPn8IafrQqMVge/X
	QfuNNw4wGtnXUMz7ympDuBQfNVh9M/6IY5AGkaqFYV+WwMffdtZCFy6k5V5hl/bJeoZk
	qQ7qoTGsB4o0TfOHD69tEIjJk4NL5Wfqx5kjPnjjKitN8SlHa/ev48UWHJNfruvVLPta
	ApmVOrkYJ5/lw8ZjSX4CeL7obmcf9gr/Zr2th/XJ/6WRwwvhXsoP/NjVDt9klnRO8sne
	P4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lHoJfl62NR3g6/L7uNs08wN+amufIK1AcglRx5MHu2k=;
	b=FJP2+ZhP4k92/FGhVXrzw1fXKyX6+nmcSIMSxRamSrN5854o70u+jf4j4S9z7/uV0J
	/+vYpl8oUlvs4KqQa9hSyLNwOZclk/WCQi9d2tMCDnEF1Z/kbIl8+4Pfvd3jHDRIX6bB
	RzRaj1K22OX0JL84O2OghSkJOhhtcKF0lM7XRf35lnnCza/WoY21AUw5I1fO3MxA4h1T
	szgqeev7RY4C+DV16/LuDuN3CN3Fn+0t4Cg8l0gJTZa8/Pibf0/PrRo2swBgMpMJJovI
	xBYPbeUHnbrW2hQ+eG+9DQaYT1Tioc93p4wJgyQvTiTI+xSztpjVZc2NcT2E3nkdWdeW
	EfkA==
X-Gm-Message-State: APjAAAXaAMCVNAMgbdIR8ZPQGko9b3jd8BKA1Mhi/3H+UbA5z5gFoOUD
	O5pozGemLgmH8hwgsWtwZ9hK1SmowgU=
X-Google-Smtp-Source: APXvYqxMBQ3/0y80Ih3Vz9UpswdMER5DdYgBdvJNkPA1IbmX7ezG2I7f3/cLZ/FQrgJASaxXozrFfQ==
X-Received: by 2002:a2e:7f13:: with SMTP id a19mr10493454ljd.35.1557053194095; 
	Sun, 05 May 2019 03:46:34 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 63sm1446683lfz.2.2019.05.05.03.46.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 May 2019 03:46:33 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 12:46:20 +0200
Message-Id: <20190505104620.8248-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] nano: update to 4.2
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
X-List-Received-Date: Sun, 05 May 2019 10:46:34 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_4.1.bb => nano_4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_4.1.bb => nano_4.2.bb} (79%)

diff --git a/meta-oe/recipes-support/nano/nano_4.1.bb b/meta-oe/recipes-support/nano/nano_4.2.bb
similarity index 79%
rename from meta-oe/recipes-support/nano/nano_4.1.bb
rename to meta-oe/recipes-support/nano/nano_4.2.bb
index 1fe36cdb0..19a8b4782 100644
--- a/meta-oe/recipes-support/nano/nano_4.1.bb
+++ b/meta-oe/recipes-support/nano/nano_4.2.bb
@@ -12,8 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[md5sum] = "235eaf7d27db3c3679b2054361ff6181"
-SRC_URI[sha256sum] = "86bde596a038d6fde619b49d785c0ebf0b3eaa7001a39dbe9316bd5392d221d0"
+SRC_URI[md5sum] = "9ef42650960fa71671dc5318841a27a9"
+SRC_URI[sha256sum] = "1143defce62e391b241252ffdb6e5c1ded56cfe26d46ee81b796abe0ccc45df9"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


