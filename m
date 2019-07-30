Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6BCFB747E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 07:22:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p74so56005393wme.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 00:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8kMTdpr4tPk1a/ycXsWiUJc8tBWXIfCA836RT7LASIs=;
	b=tFHnDaapjzM0MOp5k652Wvw8hKI8Kli0FJYOjS13Hs6zcsoAWPIZqluOkEacVaHPc0
	JD1/c8gJMtCeneQD8tBu+oWBgG0GHK9xh59ix8MVHiD/Xj8AMKIjlEcmU1vZJCwg4jMd
	lX1K68hy9zMXScm7ZoIuZVLdZ3fTgrSGpDXlYD2OuOhazIVmPIOF9ezaxLikSFEpsORa
	DxAi4cYiLv4upgknCfK6Jov9Yf4tKnd79408HKyP4Jya8PgRTNSoM7JUwOk9tN5JB9D5
	spHKRdmiisx6BuT5M4veyAMMe9Z7bf9yOgHlxVNj9w6318ZnNbBpILMJ9oI7OD0Geg8L
	E4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8kMTdpr4tPk1a/ycXsWiUJc8tBWXIfCA836RT7LASIs=;
	b=sE/r4BeKMhKcy9kL80vAPD60Nhzl0Ohloq9YiO5RfRgd4D8sWmgb6npQx9p7utHNph
	wSmg2GPrpUZh4y3S3r+loH7YM3hSJdicuFKNh9waf20gPSzdCujMzz0E7xxaPx+YNqkz
	57YyzPprcCfQ3C3wqPe9FnE8aQS5Bro5jUz9xiKYIc8p8ntzaqmMfsjL38iaQa2aPeVU
	FJiyQGHYGZRF46VwE8Fs2a9LIgut9tpmZkb/pgsfWW242VShmCQ21sB2EVIid5sssc2p
	Y/NouWtOXla8mAr0Ywn0Oog8g5c6yM8likvlguNXTx+fViX1iAI4yMRkNX4HX9Gq3e2E
	qjuA==
X-Gm-Message-State: APjAAAVzD+GwwQb/f0a+XLLT2o60FVZhfvljP5o1tz2ZIavVs/AYmqAA
	vKvrKf51WfVami/s4QkXoFY=
X-Google-Smtp-Source: APXvYqx73Gt1Nuj8fxaHzxMCxu0yNHpn70mxyzEJsnq4yBOHdz+qSpq3TlNFR/OFBQJ3HrZxCDGsfA==
X-Received: by 2002:a1c:9813:: with SMTP id a19mr100688751wme.11.1564471376595;
	Tue, 30 Jul 2019 00:22:56 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id 2sm88478297wrn.29.2019.07.30.00.22.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Jul 2019 00:22:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 09:22:54 +0200
Message-Id: <20190730072254.10730-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] qemu: fix patch authorship
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
X-List-Received-Date: Tue, 30 Jul 2019 07:22:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I accidentally changed the patch author when backporting this from
upstream qemu. This commit restores the original author.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 ...4-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
index 2feb567f1c..f7939b84bf 100644
--- a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
+++ b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
@@ -1,5 +1,5 @@
 From 8104018ba4c66e568d2583a3a0ee940851ee7471 Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+From: Daniel P. Berrangé <berrange@redhat.com>
 Date: Tue, 23 Jul 2019 17:50:00 +0200
 Subject: [PATCH] linux-user: fix to handle variably sized SIOCGSTAMP with new
  kernels
-- 
2.21.0


