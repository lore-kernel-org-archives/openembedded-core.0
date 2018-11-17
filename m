Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 18D566C235
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:58:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j17-v6so28301045wrq.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aD4XS8JZCRK7KUk+Qg0W6RQSMmmJ47EVfc+JjGPydag=;
	b=Q6KKjDdHHfi1Ilr9t+omNDzZvFTuiJwlDr03h+yo8E9OakHLb0xEH5UIYLei1JN7u5
	m/+XC2+8Fs/08xP/R2Kmka8HWVMw+Fbb4sO58L+StWEff9ctJ6BpC56NJDBTGPhsVUUQ
	CgP8Zfa4TX6ijhLTb3k6S5CKnCH1Cg2siwiM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aD4XS8JZCRK7KUk+Qg0W6RQSMmmJ47EVfc+JjGPydag=;
	b=q8Tq6VWsV7wRK3Q/j2/j5Q1dCGZvqR/40CzPjqPugDRuGcKyYg9Zq6q2ahIW/17tbR
	psOfsgqQRKbaS8BDwsA8z3e1XXe6DN13qvWE7A0kGsLh7gQwmmhNOS2JZtKIaOGhXxuK
	aI1I6HKQ2NTdID53NHHJB+cTP2vsoYeElWss93lnRXmYwOoayr0cZkpnqRblby5uII8D
	vN/SYvC3WlZ2D4TsMNk1i55xNep4P5MHcwh1hqW/MdFIMT/eGMVxrUQvKJp27NUOUyv/
	XMgclcdRR+CTE8SPu8XPkJC7Hzl+polOYc3IWNgvRbTVSvdY0t32hj+QahBN73zCRaIq
	BowA==
X-Gm-Message-State: AA+aEWYqSK+oL1Mz/tkIMrmAbuOAU8RrwtbWD/5XBZB4F1HNpZ1t8cd8
	EHrofSJ0tewWvXn5025fi0X8rQ8Hvts=
X-Google-Smtp-Source: AFSGD/WgwGlbkBFDgA4KkHT3BTm2QIbYnIot0N0rEcatx09rRRHnbH38zVZNVcAWGrC5afUbPnSCUQ==
X-Received: by 2002:a5d:5510:: with SMTP id
	b16-v6mr346774wrv.222.1542495480387; 
	Sat, 17 Nov 2018 14:58:00 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm12658470wrw.4.2018.11.17.14.57.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:57:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:57:49 +0000
Message-Id: <20181117225753.15733-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
References: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/9] at-spi2-core: upgrade 2.28.0 -> 2.30.0
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
X-List-Received-Date: Sat, 17 Nov 2018 22:58:01 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../atk/{at-spi2-core_2.28.0.bb => at-spi2-core_2.30.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.28.0.bb => at-spi2-core_2.30.0.bb} (91%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.28.0.bb b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
similarity index 91%
rename from meta/recipes-support/atk/at-spi2-core_2.28.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.30.0.bb
index 7975f58bad7..536431f7cd5 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.28.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
@@ -8,8 +8,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "9c42f79636ed1c0e908b7483d789b32e"
-SRC_URI[sha256sum] = "42a2487ab11ce43c288e73b2668ef8b1ab40a0e2b4f94e80fca04ad27b6f1c87"
+SRC_URI[md5sum] = "d4f22c66b3210ffe6b10d01c04e008b5"
+SRC_URI[sha256sum] = "0175f5393d19da51f4c11462cba4ba6ef3fa042abf1611a70bdfed586b7bfb2b"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst"
 
-- 
2.17.1


