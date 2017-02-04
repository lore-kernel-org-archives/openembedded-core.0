Return-Path: <andhorsthemke@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 41B4371994
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Feb 2017 13:35:15 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u63so11089074wmu.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Feb 2017 05:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LRMqu7h/AK00lKuTT5yYa1vyFFwULXWXI4aVN7fkCjs=;
	b=WSLn3zds7aI95N6Iu4aMo0J+pp5kArVl1LAaRROTXke2v9JxFezs53YIDBoSTtqNVD
	d8GTrv11bQd9f95iWyzjyOyGLX0wxz/HGY8wdT+u1NBlGhwi0t6Yk2Rhl+UguOmlHuaY
	junT7LOuHbk1mITmB+0W8JzCUki6c+1JdoWhx7pob+3aowUkZ4fJhbV6TjMZJ1PagYVW
	NSx8QOXxo7JzTTub5rV/4RStsvDnWS9AqU8GZMNEFE+jZTzDfOaAz5RmbYsUA2OiXa0s
	s9qxRqtCTRnPUhJcc0Sf1JWot+Rw3iXLZlgH/DzL5VnCYImnWGgi64dh6QAHNnlJD+NB
	f4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LRMqu7h/AK00lKuTT5yYa1vyFFwULXWXI4aVN7fkCjs=;
	b=S3RZ472z0YGGGCZtkdMy7tJG3uar5OX6F9FiW2Z5MKpuIUpN604RQGryHUA7mbXbAb
	+EFFixmvW1D9e792YlIWQayOZtqWZCheRk9C07fAbBp8d13wWYVaws9zXohj/3chbwP7
	3CQHMfr6LAw8JRxbmhL/rGRDc82U+YPVJMhGS+M3qACwV+ZVVzt4pNqnja7eI0Wd8PMa
	V8VdjnjJ4ex0k1W1WTkI+hPSSjynh2ZRFKTMezARw7+57AI2XDtQapwiq4HDhL/YXwzI
	+QumBxupuCcYxxbSogqvxsp91Iv3q/41aDiVMTwiWcpDI4dvVuElhkxQDubhLaJdEo4D
	vtdg==
X-Gm-Message-State: AMke39le9pQqBrvOPbdYyB+tiVvJFk0SSLD/11XfJnyjAtpXhMRkPUrSmAfZ/PCRmslo2g==
X-Received: by 10.28.224.67 with SMTP id x64mr2242089wmg.20.1486215315551;
	Sat, 04 Feb 2017 05:35:15 -0800 (PST)
Received: from workstation.Speedport_W_724V_Typ_A_05011603_00_011
	(p2003007A89036A15FEF12F0E367207C9.dip0.t-ipconnect.de.
	[2003:7a:8903:6a15:fef1:2f0e:3672:7c9])
	by smtp.gmail.com with ESMTPSA id
	202sm2645615wmp.20.2017.02.04.05.35.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Feb 2017 05:35:15 -0800 (PST)
From: Andreas Horsthemke <andhorsthemke@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Feb 2017 14:34:55 +0100
Message-Id: <20170204133455.30345-1-andhorsthemke@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xz: upgrade to 5.2.3
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
X-List-Received-Date: Sat, 04 Feb 2017 13:35:17 -0000

Signed-off-by: Andreas Horsthemke <andhorsthemke@gmail.com>
---
 meta/recipes-extended/xz/{xz_5.2.2.bb => xz_5.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.2.2.bb => xz_5.2.3.bb} (90%)

diff --git a/meta/recipes-extended/xz/xz_5.2.2.bb b/meta/recipes-extended/xz/xz_5.2.3.bb
similarity index 90%
rename from meta/recipes-extended/xz/xz_5.2.2.bb
rename to meta/recipes-extended/xz/xz_5.2.3.bb
index d118f3a744..c0f8b82f64 100644
--- a/meta/recipes-extended/xz/xz_5.2.2.bb
+++ b/meta/recipes-extended/xz/xz_5.2.3.bb
@@ -22,8 +22,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[md5sum] = "7cf6a8544a7dae8e8106fdf7addfa28c"
-SRC_URI[sha256sum] = "73df4d5d34f0468bd57d09f2d8af363e95ed6cc3a4a86129d2f2c366259902a2"
+SRC_URI[md5sum] = "ef68674fb47a8b8e741b34e429d86e9d"
+SRC_URI[sha256sum] = "71928b357d0a09a12a4b4c5fafca8c31c19b0e7d3b8ebb19622e96f26dbf28cb"
 
 inherit autotools gettext
 
-- 
2.11.0


