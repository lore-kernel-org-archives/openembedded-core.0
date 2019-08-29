Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 615BC7F3B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 22:50:34 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u13so3791602lfm.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sBAmspkkE3bA879QtDydXAGQ2xDE4wdtMSfCzPiLCWk=;
	b=AYHbi138h+xTqDQKCuk8RhZnK2/ix2Dt+tD6JJznFt3s5w6a64SkNzUIZPlhopES8Z
	qHoaUMTzgcHIgJxqfTY1FitQXqZPl9C9+b1j8EDNBcWLoo5dU66y/m3msZuw0lITGQIJ
	PBNBaCTivOMkKplLlEn1EkWZ5YxGwAH/I3vqmJLeDZ2FuVO7XOT5gKzEuGS0aMk32VNK
	2Zh7wEUmSBF4PmibdF5FMLs61IsR6FvL+OhzLw/LKP4IWDUQF9J6/EyV3JHnqM+ReFsj
	iBtUO1t3jMfxj/M0Q31nS7fOu9sCH0Km2XVKqNkzglmj6eY3lEPSCeUZ07iCJK+7PCIS
	nKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sBAmspkkE3bA879QtDydXAGQ2xDE4wdtMSfCzPiLCWk=;
	b=tJfmGMXd4DjLwxnueE0e0Jt/WDSsRbc/YOj3h0oQJ7OosYHlAwPuAXm3pkzlrdwULB
	BxpdKy8H3bAIUrREqg5JU4wpxu3xUIyY8ZonrQiN2HHg0BuhH2LES/k+cA2qPTsa4mc4
	skx8FKde+gfFxSSloCQJFw5TJY1E1HXHoJTaxSBaXs9DM3w2FVLIUbfZszTfKo3ZhOMi
	tp+Qw6ODgxNWkO/3DgZlhubaCjS8RwzgCQAjbaVHoqzaCEAirqYmCW2/AOLHpCpsOijG
	drrcgiljeW49dSTaQJ7URbxkOrUneSbhxAiPhngs9AInSXpf5ib73DY6u+gwIUCNqJdJ
	hVNQ==
X-Gm-Message-State: APjAAAXAELb+LS+44M1PqJk+kRJ9vIVMYiAxqGlwPunyQX7YgxJ9MD2n
	4c5IkT0MVLisTjpmyBviM64pvBnlKPQ=
X-Google-Smtp-Source: APXvYqxGSdYagUJSQY4J5Ct/WjMJtBY4dE6lsshrabdAK72tg8jYXuhPXlpgPqtfIHfDm6uDRw3gyA==
X-Received: by 2002:ac2:52b6:: with SMTP id r22mr7805941lfm.19.1567119034775; 
	Thu, 29 Aug 2019 15:50:34 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id u11sm580878lfu.47.2019.08.29.15.50.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 15:50:34 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 00:50:32 +0200
Message-Id: <20190829225032.30698-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libevdev: update to 1.8.0
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
X-List-Received-Date: Thu, 29 Aug 2019 22:50:34 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libevdev/{libevdev_1.7.0.bb => libevdev_1.8.0.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.7.0.bb => libevdev_1.8.0.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.7.0.bb b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.7.0.bb
rename to meta/recipes-support/libevdev/libevdev_1.8.0.bb
index abd6f386b8..84274987d7 100644
--- a/meta/recipes-support/libevdev/libevdev_1.7.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
                     file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-
-SRC_URI[md5sum] = "fabe87d8d7d7f7cdb4a26e5dc99fc517"
-SRC_URI[sha256sum] = "11dbe1f2b1d03a51f3e9a196757a75c3a999042ce34cf1fdc00a2363e5a2e369"
+SRC_URI[md5sum] = "879631080be18526737e33b63d848039"
+SRC_URI[sha256sum] = "20d3cae4efd277f485abdf8f2a7c46588e539998b5a08c2c4d368218379d4211"
 
 inherit autotools pkgconfig
-- 
2.17.1


