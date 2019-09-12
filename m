Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6511160234
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 18:50:43 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id q11so5254615lfc.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=n6LcJ6i/nDX4g+fOGzsusFSjuzoc/wHvzwVfIEU/xhM=;
	b=gXPFmX1bpyYpztwl17t/NzKLd1T1pvPMrI2+fk8ApXOfEau7XkhvnM+j3nGIYrIK99
	Oj6t/St4k0cdnWhhCdT0zEXcTifR+PfvNxmIqB2FHkfxvr/Mil12Vy3S03X0fLhiCHtQ
	0OUgXbvV+FcZpC9tUassRTUkGNxE2NGl3W7IGf/sxIreyCb23CLraTsIpdcUkvbLnaUv
	rKj1nojMs0jA+nzmejYc57wgmLXjQYiSqfzvqVulJx9Ah47NhjKf0JaqcqdDfsbVhjsN
	roBmV0+I/TGeJJf65W5RJtQGf47YPT7WpKXRNjynRclw3XJuNDr0FP86MlCNIjjHH5uo
	BMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n6LcJ6i/nDX4g+fOGzsusFSjuzoc/wHvzwVfIEU/xhM=;
	b=k946rrpA7x3FgzLfxjWUsVzEoWiLXiqcwOl83Lw1OjzYM9o/bAQNqhhqZ+ZDiyHNfv
	Kq26/1OBEMCPzV0VGEXmZYHxHWWi6thMDB/yVkHpYS0S44aQHbvj+Zd1o2cQ/ZfaIFHH
	oEbmvxpOdi4XVAiDpqR8BgD+3L62ZyjaZWpHAaIxS/YTxf2+LmDF7G8E3W/nRGF53EEo
	qD58+6v5iVtQ+vVDUxohDmbCrRlpWhFccKKq4I/3BDKZqTZlvqvYFUFb+JXCVHE+3dUq
	abhvQRsNGQw4BE5THP9Db4l/PL8KSXIaFY/SmffJnGTtnDqL+Kh1m95jSv8MChzir7Zb
	sDDQ==
X-Gm-Message-State: APjAAAUDcOdj27gqurGhRypUKHGVkNrdJf1U+IFugoY2sBAHoa7McR64
	QJizb03WcdbQt1bIlYWZ+yshb+WRNPI=
X-Google-Smtp-Source: APXvYqxsG66RM6ZemA3M8qYAeg8S9MDQN2807kULDL6bGr9OOJK6siMemKlSAJQU4Z+KOm+wH6OOQA==
X-Received: by 2002:ac2:491a:: with SMTP id n26mr1484147lfi.182.1568314243433; 
	Thu, 12 Sep 2019 11:50:43 -0700 (PDT)
Received: from lund.luxoft.com (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	f22sm6510697lfa.41.2019.09.12.11.50.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 11:50:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 20:50:39 +0200
Message-Id: <20190912185039.4981-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] font-util: update to 1.3.2
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
X-List-Received-Date: Thu, 12 Sep 2019 18:50:43 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-font/{font-util_1.3.1.bb => font-util_1.3.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-util_1.3.1.bb => font-util_1.3.2.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
rename to meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
index 1289c1686c..ebe7a603fa 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "23756dab809f9ec5011bb27fb2c3c7d6"
-SRC_URI[sha256sum] = "aa7ebdb0715106dd255082f2310dbaa2cd7e225957c2a77d719720c7cc92b921"
+SRC_URI[md5sum] = "3d6adb76fdd072db8c8fae41b40855e8"
+SRC_URI[sha256sum] = "3ad880444123ac06a7238546fa38a2a6ad7f7e0cc3614de7e103863616522282"
 
 SYSROOT_DIRS_BLACKLIST_remove = "${datadir}/fonts"
-- 
2.17.1


