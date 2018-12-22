Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B6C926D2A2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 18:27:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c123so4104754pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 10:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XScUwbeuPeXgBsWWl8YacsmaUT0vDioFTVHPCYWMv/M=;
	b=f8NzwwDjI5C++BVPldwTRdUtYCKNx9D/ekSs7N3vLYoDVvW+dguCw+B1SH39sDNTHb
	yxU/MenucnkLfyf/s9gYCFATsN3TVYozpEXpXBL/KN47CrFLSZ925JO1tT4Hp3O9b7qy
	GWWvtEmVjQDamgYqRNyUZ6JRlm+I+g/MwAN0AZg77w4jnx18Z/pQtG+Ff13vDcQylRIh
	nucaB+olmhobaffb4itDnD4gCuTjwLNeIIwjNGBtpWVKEGEyU8xcHCjSXhJsHZ8ZJtTy
	SI5KA1dwnWEPi9e6YGW+EYwKzALZELl5Q1sJC8qx+qutrXcgsirsycQgwxoU+aB/UUrD
	Fovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XScUwbeuPeXgBsWWl8YacsmaUT0vDioFTVHPCYWMv/M=;
	b=ETmiKWZkbXyCT/sGscqQAoRVnxyMmQDUYgYx4g7Hc7wEDc6F9lGFk7Lq20KZ/6+9vG
	asBuE3bRlcEYPR4WOe+TAqH/0bDWj8PRFVR4RhAlOqPT/qb+D7sKUpZdjjAAS8hV0GYz
	pq3R07KQDW2omEtR/LijrYEdhNB+79I3e1GOIOVURwuHgpVBtLMZ+VXiyQ+G+jGhDhDg
	IbLekmEoFR3m6LT2X7X33KHHd95phFV71iJYuPYAhleKEWP/RWELpym8EerbQvoIfQXp
	XOBAQRNxRT/6NXdwOXMLV2ziwOlBOnpc+FA033Gm93T7c0Xp/H59X/1fivefDuvA153g
	Rdzg==
X-Gm-Message-State: AA+aEWbJBE56pORBDnfgeHP7JcZKTIkRgCHX7XNNPGs8dumHHuyOO6ZP
	wl5BKu1aLjGYQo5DyOwOmwqw+zmbDi8=
X-Google-Smtp-Source: AFSGD/VVI7BmoAH7Em+ow3VSQ2v98REEkoEA6ctjW6yC/IU7fOU250yrWqZLcHF3/48WE1IZYT9iuw==
X-Received: by 2002:a62:3006:: with SMTP id w6mr7432317pfw.258.1545503256450; 
	Sat, 22 Dec 2018 10:27:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	b2sm37341887pgg.87.2018.12.22.10.27.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Dec 2018 10:27:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Dec 2018 10:27:28 -0800
Message-Id: <20181222182728.39446-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glibc: Enable --with-default-link
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
X-List-Received-Date: Sat, 22 Dec 2018 18:27:35 -0000
Content-Transfer-Encoding: 8bit

This lets linker to use its internal linker script for shared objects
Fixes with when gold is default linker

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.29.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 743fcac0b0..d5caca8de3 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -87,6 +87,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-stack-protector=strong \
                 --enable-stackguard-randomization \
                 --disable-crypt \
+                --with-default-link \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
 
-- 
2.20.1


