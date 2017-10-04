Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1977C77CF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 21:13:21 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q132so25662100wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 14:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hr8O7Tj0+n+y/WNCu1hBaFShXy2/Y9dt38H2TWDvfQk=;
	b=gW+7eN6eQAKJmqbxp/JIz2gfIJZwlQSKL4r2X1JVOa/1FQgt+8D2xhC1EUi7MVhIPT
	t4Pj6oUFNQmwYiWYIfKKCNBckfuuPxceeQD0gpDSQdhvO4Obk8FsCENtqGf9845A+M2q
	HtBp3MDYh2RF/elvHeBfAxDo4J9hBxWtU6bwo9eq9llK6sZiQynadUfzfYhDGwfRclGl
	2XQcSDSv5LTbmPVgei5tzleiGo5hYA3K2CxE1V53TOcHS6a6avlxvynN/hW0iDh15ds7
	SrMcYUX+wArrKmk955LXmnXb5cBUO6SMREZUuzU0SdzMu6iqN5m2vTWDGStG/CL0NiCD
	S7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hr8O7Tj0+n+y/WNCu1hBaFShXy2/Y9dt38H2TWDvfQk=;
	b=GU54JOqgxOZOd28CW7SeGnMm5y+E3X2M/BOD1tp7c96jAm8Hs1nRvJgITJ6S//lGc5
	pR59MB6kJ0jBwPv182Kf7FwBO3tKj7I1HDy9VpKm8H/oNGqDmi+LJHYGlVcTOJnvyF4c
	s7o9NWuTVwrSNBnYzllnFbmcXcWkqgdAWlTPNwECNc/UBTYMkr+LFj5FcG3MXT/FRkQZ
	L/26lQHVmD4/euEVufSX9JUUEzAt9eK3ZaZVVr1Ex1EX8b47j06YYubygmkUSDc5a9gm
	wwlcYaHV+p0hYUjhUv66+mkIVjQ/RvuH6k0/60JiTZ3WL2HwlHBdpYpTJGXOTZfouVCa
	iqfQ==
X-Gm-Message-State: AHPjjUjcL5JlG/1/3kDvhUz34DQuumq13mBoQxHWRchqcURrjox2as1K
	zrU+cIXEbF3n/EfdfL0CMvW5GZOfmF4=
X-Google-Smtp-Source: AOwi7QBZE5X6wsvtBayd4wI4f03XbgYiQWfUvs56IeGuzQi/lzuTY1wcs7eGn+vcMqg48bjHsoePAg==
X-Received: by 10.28.107.17 with SMTP id g17mr18584422wmc.58.1507151602289;
	Wed, 04 Oct 2017 14:13:22 -0700 (PDT)
Received: from localhost.localdomain ([31.159.87.76])
	by smtp.gmail.com with ESMTPSA id 50sm8882302wry.84.2017.10.04.14.13.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Oct 2017 14:13:21 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Oct 2017 23:12:46 +0200
Message-Id: <20171004211246.2772-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.11.0
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Lorenzo Chianura <lorenzo.chianura@abinsula.com>
Subject: [PATCH] glibc-locale.inc: fix typo in comment
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
X-List-Received-Date: Wed, 04 Oct 2017 21:13:22 -0000

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Signed-off-by: Lorenzo Chianura <lorenzo.chianura@abinsula.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 75ababea68..1a629fc69d 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -12,7 +12,7 @@ BINUTILSDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
 BINUTILSDEP_class-nativesdk = "virtual/${TARGET_PREFIX}binutils-crosssdk:do_populate_sysroot"
 do_package[depends] += "${BINUTILSDEP}"
 
-# localedef links with libc.so and glibc-collateral.incinhibits all default deps
+# localedef links with libc.so and glibc-collateral.inc inhibits all default deps
 # cannot add virtual/libc to DEPENDS, because it would conflict with libc-initial in RSS
 RDEPENDS_localedef += "glibc"
 
-- 
2.11.0


