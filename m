Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 87A967D70B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 22:10:11 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y198so13432734lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=MRVo/A2sKs+7a755b5MnOTqDqHMTNy7iKR87xxC3zlk=;
	b=Xm7J3RYqvRqCeKNIGvM8EPo1/2UauRvBig0VU8oSIdNLz7ZqR84/3/4fW3nSYlOK2a
	HKB1cXwFXrfHbFnUQfO56lHPDsigYY8kxAy5wQw3D89wFpOvOirxIS6dUUNi+R6uDwNu
	H+kC6w10+6HSPyhsTdjl7Ub/dov8v5yT8FPBLHF8fCP3Ihzoq+T7pY1LG+91peeG66xU
	iYKiBzpp63UkBK0X2dWS2q/78Q7VZ8GfStE9hIttKSqm4izmwHwhwquo+6PzW8vx0J2f
	AzNYEgUcpD2Fd+L5hXH2QTYPvoaGXSK3R/L3xNo+x4ElJtIsi4NRvOR4x+fxLq+emGQb
	jddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MRVo/A2sKs+7a755b5MnOTqDqHMTNy7iKR87xxC3zlk=;
	b=AdcPRWJYcirNTrmZUKs9SZSM/DwJb/r+0ckHpQBrE1ULFIzvPGDnWhW+vqjsaycjaY
	mdVP4dRbUgVhNJuvz4XVDw5pDXCRV7JMzauCM5D8VCqY3L1MAQenELfYNgfF9830hexT
	iY+XesE/OCqQmPQD53AYCWyVD4gXDLXioahFsfFoRe0x4j6dMzRmBF5aovdFJRPaOI3R
	5dBDx2/n2ZyhXdVDyWsokwmoHlM3JrohxyxtmVeaNfmF74236Cc6ymwIq4wJ5A1+Ne7N
	4dZnaz2H/sAJ1BEZobLkR0hJ6m3gJB4aCID91XES36m4Fdikfy7i4m4Eo1FSMbYVBzUn
	RMww==
X-Gm-Message-State: APjAAAXL6cyI+uXLdiYI4eVzjjsISv0atNH0/4OL0KtpGf2UVfnV/eUr
	uMZPzI6IovOdGaTbzsfGEApKtO0him8=
X-Google-Smtp-Source: APXvYqyP062fLfdidDbg9VS/mwCSsid6q0KsMu0bfYM5acNpitRcznREoJxc3rWVklm79iuN2S4lhw==
X-Received: by 2002:a19:9e4b:: with SMTP id h72mr16878580lfe.21.1560377411560; 
	Wed, 12 Jun 2019 15:10:11 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id z24sm227681lfh.63.2019.06.12.15.10.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 15:10:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 00:10:06 +0200
Message-Id: <20190612221006.3691-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] popt: fix SRC_URI
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
X-List-Received-Date: Wed, 12 Jun 2019 22:10:17 -0000

rpm5.org has been down for about a year now. Use linuxfromscratch.org
as an alternative reliable source instead.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/popt/popt_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 478288f9bf..27e49c2ca2 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
+SRC_URI = "http://anduin.linuxfromscratch.org/BLFS/popt/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://popt_fix_for_automake-1.12.patch \
            file://disable_tests.patch \
-- 
2.17.1


