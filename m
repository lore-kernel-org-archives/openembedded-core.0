Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 11BEE7F935
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 04:06:12 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c13so873240pls.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 20:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kzvLJuBoTGkH/HjBnTVZNesKQXytBPMBrkQ+mweExcA=;
	b=o/M0LYBormufh/Q7yiXfJENoHiszyjlA8F+152C/yfKC3nRoItUP41nXtKCB/au8gs
	jBsIqAsr/4AzQqMMH1M1yQEXqtA/rN5uXGOyyipldlpYJdrEQiCXX644rB1c3wT5rhfF
	zl7k2fhJuoximBiNL1gk2lttvqJHvoCGhoxv0w4p+QPBV+SvMuYCGor9LMWGPzKjJiLZ
	5rOmXvoxbZVs82znkW/RmqYO3G1YpvCXnS30pvTT9xlUUz+VOTbS3R/vVteDicP+NDN+
	rAiIgKb6+m7xD/C70OIYcGvSXDYma0OajT3OfYNb31bexFde0a7m/Ii6N/1XuQn3oAyB
	bf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kzvLJuBoTGkH/HjBnTVZNesKQXytBPMBrkQ+mweExcA=;
	b=JH4B+HKHkv1cPlEcAwqvlibLCMoPEX3hnVv1j3RhiFF/DJ+3apavLlPRiMhAiaZQxM
	Qj5I6y7lO2Q+K83xnWlBpV4YO55BQdRxQCQd4hzQrCSbgS9kzdWh9jy/K5dVTqT0C/O/
	saQeBNqvwfR/1dge+XaR7EaEx6/o9LG6OgydGc/1GteOEKIhdMhdSdXya7ZSrq02VhBD
	mvKyIOW6NneDlWCLDnqUZDmJ0vl04DNNStIA54bDw60R4Uep+0IfCMWIWNnYoCaRHZyp
	NjdxsO72yLg9cbwVZIPe/Onkge7nBw621Xx5XBodEQ3hQ4h1/GVM95fTOo/JjiOyt2nf
	mZkA==
X-Gm-Message-State: APjAAAVzJwSJGXTQU1fRbSaxvSkPqMKKofXm4vv/rBhKSP/7MDkvVuKB
	qlGnt9badc/i4+LvOhnVKywDvCSPga4=
X-Google-Smtp-Source: APXvYqwq8CLY8XYY/3Z6ZqAl1Z/UeaB7Wyz8chO1c3cI3IUN/q98EW2GqiFecRYEOPXZQ11iEXcviw==
X-Received: by 2002:a17:90a:8902:: with SMTP id
	u2mr1154580pjn.85.1576037173452; 
	Tue, 10 Dec 2019 20:06:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3552])
	by smtp.gmail.com with ESMTPSA id bo9sm486209pjb.21.2019.12.10.20.06.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 20:06:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2019 20:06:00 -0800
Message-Id: <20191211040600.783068-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v2] libpng: Correct SRC_URI path
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
X-List-Received-Date: Wed, 11 Dec 2019 04:06:13 -0000
Content-Transfer-Encoding: 8bit

Fixes fetcher warning
WARNING: libpng-1.6.37-r0 do_fetch: Failed to fetch URL https://downloads.sourceforge.net/project/libpng/libpng16/1.6.37/libpng-1.6.37.tar.xz, attempting MIRRORS if available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix a typo in specifying var in SRC_URI

 meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 78f3248d739..8c53d116420 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -7,11 +7,11 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
 SRC_URI[md5sum] = "015e8e15db1eecde5f2eb9eb5b6e59e9"
 SRC_URI[sha256sum] = "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
 
-MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
+MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
 UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 
-- 
2.24.0


