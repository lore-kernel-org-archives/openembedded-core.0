Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id B54BF7FBE2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:10:03 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id f129so8259787wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mo+OtQNLmDTzzzL9WbPLXRNGQDvK2TQq+R1ejJET5fc=;
	b=ChVBqPnO+n4jjMm3X2/TJohW3H1TG7fwJqVTvw0gPSRiOMUX1gYQMNiZfOGXre4H/Y
	QMwht4Lxtz4ryUxxslaXuiTSwAHhBLXc/CSzyK5Oyz8slKgaICt3KFsr2s/OwRzghZHQ
	OhN9XcKGMdJ1l7KqSw0FaFp7/iT5s0xdaIU12exd5QGDaxS71mEzbar/1qpMYCT8/HN4
	nJ0DM5oHztiSPFsyKnoew/qqElTMZaHg5vDPWcbJ5pLKbNhTzZ19+KAf5XmMpxnnIUpk
	ifyzu8mBttN8Jfo9wloCesfT/71WIC0QwF1/YYS7PZdhS1H9gvDaRJ8Mt66Uy2xQBl1O
	iRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mo+OtQNLmDTzzzL9WbPLXRNGQDvK2TQq+R1ejJET5fc=;
	b=FcSihcZtXYd43B9zEBXW5IjQ3m/ISPsvqlVZ6ChJ4GEWWcENsVDizEjxWbNepslyUJ
	lCJPMmL9BuSZgsqLVLZoV1Hy4NDUI0kZtBIE1wW2XedxBC0h8tBRo0yXiGHwKiqEHXXe
	q2jCQLgOEBLB0pCIs3OMCpNvVQXZHvoTtGaZ57oNUURl7+nN9DJ4L+ag65tzYaARJvEF
	TK4+dYY/B4L98d8Dy30zEAXCmBFO1HG9bs9xrad0Y7uTsAbgkL+0nrXBrvyB5C9k0ExO
	vlgXNTp3TpPJ0lJtBS5klGvPUKIKSR+/UY1rhXsuk/Hkxh+6NA6oiguvYcJGt5WDxQd2
	AomQ==
X-Gm-Message-State: APjAAAUUvzkgU9gPFTmXZpkz2C1ztUCBt4ysUx6oQqEmq1DU8p1yWbm+
	ed8K1Ug8yhzG87f2u96q7LDnI7Cs
X-Google-Smtp-Source: APXvYqyvIQLaf0QNk05v2fox+wR3VLcObcYxZWyPrFP+zpo+D4x/AXW2q/Wkp+W6XbRUXQQu+D3LKA==
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr12142068wmj.0.1575655804299; 
	Fri, 06 Dec 2019 10:10:04 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	v14sm17011347wrm.28.2019.12.06.10.10.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 10:10:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:09:48 +0100
Message-Id: <20191206180949.59953-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206180949.59953-1-alex.kanavin@gmail.com>
References: <20191206180949.59953-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/10] at-spi2-atk: update to 2.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 18:10:04 -0000

License-Update: license updated to LGPL v2.1
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../atk/{at-spi2-atk_2.32.0.bb => at-spi2-atk_2.34.1.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb => at-spi2-atk_2.34.1.bb} (65%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
similarity index 65%
rename from meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
index d3a9de1e412..971e18fbbdc 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "AT-SPI 2 Toolkit Bridge"
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "6a4b27bace3b9352721ed462b95f6291"
-SRC_URI[archive.sha256sum] = "0b51e6d339fa2bcca3a3e3159ccea574c67b107f1ac8b00047fa60e34ce7a45c"
+SRC_URI[archive.md5sum] = "e0f99641c5a403041c4214be04722e15"
+SRC_URI[archive.sha256sum] = "776df930748fde71c128be6c366a987b98b6ee66d508ed9c8db2355bf4b9cc16"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
-- 
2.17.1


