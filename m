Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id AC43B7C1F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:16 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id k19-v6so9050850lji.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zd31Ht7eYBGQbC+95xgfJr1lfw4nleysVVwjoVFhxh8=;
	b=KZRgjLIE4o+6yENv6WitZ14wCnHM1gubypuiF+3Wwb24DdMdv7yFyD2PIcaTD6YavW
	GTQULiO1ME3VjZADXssLInSNB0oXfjBR/0clPHoRxww4UKFlTVuPBT+q+eC4cIYx3Rqa
	2pojenVsp/agWhmkbB5zqSDOV6kKNPvcyU0RegPeHOydzj18W/2td/sQ/YSIiQdmpw1k
	vn64miU782LgCzvjIEq4n5I0ZoaYjaHeoIU6I0grwiFvXVtt/6TfsTAS4vmXb1fc+nlK
	D6NyGqk/DWmb3XK1yrmb8RK6An5Rtk4Epl3WffX+HwhqEt5Q1FdcHN/48ie9gBz5Ebbj
	FnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zd31Ht7eYBGQbC+95xgfJr1lfw4nleysVVwjoVFhxh8=;
	b=aEBeQRM3X7CO7L302R5jKyiD2vqBdAQSYDkivrTCbhIs51QuyAmpd/iTUviBaVKosq
	Zif4lWci+s9/H0Yj4w11h6Qco+ufF28gi5uGcgzX10Td8tUVHptzO5zcE/2qKExZJUrJ
	NMK1nEGfQDCoycAnQpfzbWiCr3P3Ofeqn/JoftY9tvoNsipyVlMCacKavzar1LHfs8T2
	xy8WUhBpgK80Wwlb9JYH2PKRkuaRpS684IxWSKVkPDwdwB1+zh/UKQEoLiztHD5Gebk3
	cN+NnvaYGdQb7NaWUTQEK+LY/HbQ/Hj34ZL39X7Vj30NV+yGNEY4GRrjSmO8EcPcoBIA
	Cfkw==
X-Gm-Message-State: AJcUukfJ/5c/BjPNM0btG/qS7lslM8ZwWQS3m6WS/Gwb8vMX8IpTODm4
	m5cIxHzVF9Z48NUgFRBrELC8OGVl
X-Google-Smtp-Source: ALg8bN5PrEwZWeDHH2f0u/98yQs4K2J4le3Rxz7LEJs7BVsNcznHDoHmPoiKAr/uE5vTf1YzLgt5EA==
X-Received: by 2002:a2e:3509:: with SMTP id z9-v6mr9903926ljz.54.1547742436980;
	Thu, 17 Jan 2019 08:27:16 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:57 +0100
Message-Id: <20190117162659.24997-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/11] ed: upgrade 1.14.2 -> 1.15
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:17 -0000

License-Update: copyright years updated
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/ed/{ed_1.14.2.bb => ed_1.15.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.14.2.bb => ed_1.15.bb} (68%)

diff --git a/meta/recipes-extended/ed/ed_1.14.2.bb b/meta/recipes-extended/ed/ed_1.15.bb
similarity index 68%
rename from meta/recipes-extended/ed/ed_1.14.2.bb
rename to meta/recipes-extended/ed/ed_1.15.bb
index 87d03b10b1d..c79310325f5 100644
--- a/meta/recipes-extended/ed/ed_1.14.2.bb
+++ b/meta/recipes-extended/ed/ed_1.15.bb
@@ -3,8 +3,9 @@ HOMEPAGE = "http://www.gnu.org/software/ed/"
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
-                    file://ed.h;endline=20;md5=4e36b7a40e137f42aee718165590d125 \
-                    file://main.c;endline=17;md5=c5b8f78f115df187af76868a2aead16a"
+                    file://ed.h;endline=20;md5=8af8e7dc7275dca05ce6c9e7ece7aec8 \
+                    file://main.c;endline=17;md5=d4dd6a62c502712358ca18551f978781 \
+                    "
 
 SECTION = "base"
 
@@ -15,8 +16,8 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[md5sum] = "273d04778b2a51f7c3cbfcd2001876bf"
-SRC_URI[sha256sum] = "f57962ba930d70d02fc71d6be5c5f2346b16992a455ab9c43be7061dec9810db"
+SRC_URI[md5sum] = "d3aaeb5eb032142948d7a2f98a24899b"
+SRC_URI[sha256sum] = "ad4489c0ad7a108c514262da28e6c2a426946fb408a3977ef1ed34308bdfd174"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.17.1


