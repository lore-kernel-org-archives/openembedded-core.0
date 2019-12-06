Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB9097FB1F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:10:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g206so8776599wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WdHAp2SrlAGAvxJjKjLRIhjnmRGEq26550LZLkfv5Co=;
	b=suPgnXu93+59VWe8ZVE4b33qMMQr10L93Z/sB0j5FMR1/dRHNQorTUc0aq0QiYba8R
	KgbmLB8W2q1Q2n2rZfQrvM6zC/dDhWjLc70R7+HC+2fVu4N3DvBSCy5MCrbFyQyQmNmJ
	HRyyIT8RxzWPMeSRpV3PtQk+fswbdFbg5WDXPa/ogy2KbFWD4MYMbY9tJGMd79Sy8j6C
	erdfx95jYFmQuN38DVHMNe1mGp0E+kmK7KHTZfTFeUd6vvC270rRDv32eGrjJixJJTWc
	6orcNJw1HBqGJcU5IPokE1FcWkQc6ZgKVTCC7BX1JD1dFyzwjyGWqL7JvbVn/q+snE1v
	ZVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WdHAp2SrlAGAvxJjKjLRIhjnmRGEq26550LZLkfv5Co=;
	b=j7pq3P0FcSCcoFXlnu9fivSVEt9/TThi2CT9nsnebM/gFd3bUBdfCdHDTOrSVVIwZv
	+0EemcV6EYMrvhsB5IRzvAnyCGA5LdTyEhM2BAdSQBXpwDzDR/nrdrpURkFZBGT3gajs
	m6ZlTAjMRef6Dr8Ifo10gD4kMQ2kdYzip4lChoq/vBU3nM8f/rQXPUSBExqiaRmpd2HY
	AdwhPIIuViRhJb6ywWlGaEHvqwIJCCd7HBRARDynZnUHhV9B8j2vD0YMnTp2EzsXoCKR
	e0EA5f5qtex246i8FyIajWaE3CoGNA/FDWKcqfoM+OwTfxL5GDyQ4D/+RdT3HfKGVOWX
	Htbg==
X-Gm-Message-State: APjAAAWD3HjH0HJc6INjNxXudSNsEg/GNJlVwR+61TNvLzYAenj/0bov
	BjQ3DJjMX7Nq/CQ1HuVQZqvffEjg
X-Google-Smtp-Source: APXvYqxDyH8CSYHxVwTcCKlnInfkkS7mZqvYnUaYlTndjmAHoVCcyD3BJKdUaG2tZbCk/YqYHrUyKg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr12203537wmc.9.1575655803323;
	Fri, 06 Dec 2019 10:10:03 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	v14sm17011347wrm.28.2019.12.06.10.10.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 10:10:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:09:47 +0100
Message-Id: <20191206180949.59953-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206180949.59953-1-alex.kanavin@gmail.com>
References: <20191206180949.59953-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/10] at-spi2-core: update to 2.34.0
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
X-List-Received-Date: Fri, 06 Dec 2019 18:10:03 -0000

License-Update: updated to LGPLv2.1
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{at-spi2-core_2.32.1.bb => at-spi2-core_2.34.0.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.32.1.bb => at-spi2-core_2.34.0.bb} (83%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.32.1.bb b/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
similarity index 83%
rename from meta/recipes-support/atk/at-spi2-core_2.32.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.34.0.bb
index 18b5de2d581..d1afc9b5c1f 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Fix-source-reproducibility.patch"
 
-SRC_URI[md5sum] = "998fd9d858f8fa22c4c8c15567bf6254"
-SRC_URI[sha256sum] = "3c2aa937ebfaca2c86569bce9b16a34fbe20d69ef0c58846313b1c42f53b0d53"
+SRC_URI[md5sum] = "53c21565507105fb68031cd9c21a559b"
+SRC_URI[sha256sum] = "d629cdbd674e539f8912028512af583990938c7b49e25184c126b00121ef11c6"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.17.1


