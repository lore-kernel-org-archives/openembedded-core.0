Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 80EB37E034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r4so8045682wro.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=19idcsPXYnh8r9SRcl+/c2BvwxrFiPUGgcYY56SuD80=;
	b=l4OXsMD2AEPvtRfMeCKyf0S/d1nyWJ40VhmMcpulqS7x8GzUw8ndZD0hHzrRXfgtvO
	IIeceFl1EEzCoMc+dOa3fs/35ZSqxlk8sRVHUCZYMQpa7MNSVDZvswclNem7O8CWNovG
	y2CV3PXlEn8MOJj3rTUhs/odqAUBdqOeUQy2xUpU+z5VNxDhzFdQ2SicFB5RUsD3KR0L
	vI4b4ds1XQxqOAJdIPFKNxA1RaHHqAGlED3qZK1BCiQyX3hkY1Bu+Gt4jvSYKZqlz2EY
	u2Fd1jOLQNieFDJKgQrV8a+Mqxvo0evp5UV2s4KocwtxB1xz43PLUz3rgpJjCUzHeenn
	bVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=19idcsPXYnh8r9SRcl+/c2BvwxrFiPUGgcYY56SuD80=;
	b=Co6SrV0dx/kx/3RJ8P3YydkyDYpI5ZWeIL3kUzSPCBmPCEmJImIvMoFGlokriXto4o
	HO5K+FVhHwJjkEcq5zy4gYvsb1PKZyZCv6HcKKGM5zbIfcNX4KJ+9v/kJQ5eAuEx0gpN
	r0/C/CYYqEtSLUTN/bcUgv3hPda8GCH0i2HAmLO9My+tNBRauN0h/kDd8Bq4qVHcspdQ
	A0gSP6LtrwKki4lj74ilRYkxcgmrsxkYFXD8tqINtyb1f4H+S+bRbz4OacX4QAy0DLxl
	+c7txJ2lFpLuVQYZDt6Ocb+dGZzAKyvik7l/ck3PJp8ccdAVQ4JamN/DXiGUF23QRQ1V
	5C7A==
X-Gm-Message-State: APjAAAUkQ6NVxIB8FjK55hRnTjl3cm7Q7vbFlOc59+6c0EUJMahMnRbs
	OywNKUBPVFCFh6Y+CG5fyiDXU+kg
X-Google-Smtp-Source: APXvYqwSpz2oeipsULtuK7dhdoFvOZJxUP0B8P10mtHVe70R/YtM+bIZh7bjLe3Bg4zwYx/majU8uQ==
X-Received: by 2002:adf:f408:: with SMTP id g8mr8091179wro.264.1558116740353; 
	Fri, 17 May 2019 11:12:20 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:39 +0200
Message-Id: <20190517181151.44001-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 25/37] at-spi2-atk: upgrade 2.30.0 -> 2.32.0
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
X-List-Received-Date: Fri, 17 May 2019 18:12:21 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../atk/{at-spi2-atk_2.30.0.bb => at-spi2-atk_2.32.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.30.0.bb => at-spi2-atk_2.32.0.bb} (80%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
similarity index 80%
rename from meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
index 2244797071f..8812d33d9a0 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
-SRC_URI[archive.md5sum] = "1ad754b90bcb14244b73ca4d0c14d274"
-SRC_URI[archive.sha256sum] = "e2e1571004ea7b105c969473ce455a95be4038fb2541471714aeb33a26da8a9a"
+SRC_URI[archive.md5sum] = "6a4b27bace3b9352721ed462b95f6291"
+SRC_URI[archive.sha256sum] = "0b51e6d339fa2bcca3a3e3159ccea574c67b107f1ac8b00047fa60e34ce7a45c"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
-- 
2.17.1


