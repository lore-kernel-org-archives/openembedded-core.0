Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6C071AB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 19:05:56 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id b192so5032568pga.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jqKraPypedDHneYQUcrTiwnDUAgrv/My+RfjHtsfT6I=;
	b=HKJux7JOVzyj7U8WSf4e5t07d6n81HUHaAt5qq6RD6z+9vkeah8MCUOxojCTUe3hC3
	Ixb1f7Fnalug/m/hNQi2d1e8RHeG3dV0rAuA171lCrmGO62h68n2+7zcYOXHehBWTuQj
	F8uGOxESA0sZpdu55S/rVTS2t7qS2WDwzFX7XLWJO9vj3xpImViTZYnhAfnLTwfyk6iq
	jbU8X/JOYlnzu5E/XnYb0WDTOpcT5++T9PJ473ZH3ZnM5LLhmM7PsRuHiJG1XENC+VGO
	2u9RYrsuxpGPk2d/fG2CNKAIf4xVFnllhxc0fK7/riStOL4XAugPm6WWYzKmCZkZSC/u
	qxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jqKraPypedDHneYQUcrTiwnDUAgrv/My+RfjHtsfT6I=;
	b=M2+W4UBBWoN/4t+OAh+i8B+g4OLjXFSOYcmP8UYTATcEtZPhagPfaYMG5cg4hSmOpg
	yaTpLGp3argi7Ab8d1KussqGFIJwpDTlL7uHSWU0aROHzgTM5MxSs8xcsJq2SeraY1lh
	Uyf+plLZLTPnSUw22LRb5gGy6n4q59yyj4kvzr57++2EQRmtviaxvsIiofXlrhbwQ/Bf
	dUtUvaFWXa64600e8mzL9sDhqXljbihqV574qJ9BfXvYwWhRKohXWkJCYCmD/hSSplZH
	GXC6wVQK48ol0BV27Hbm8GITDlnV0teHrmoKB7h7Dg7M9K1YXv4ctKGiHY7teA+Jk3ME
	q1pA==
X-Gm-Message-State: AMCzsaWNYjFrSnggaRewrUihml9F7bdSiV60OV5ghGXACbEBm+VpQBgB
	oeRW1MSmqgHZmTK9DHX/92Tgaw==
X-Google-Smtp-Source: AOwi7QD4lukIqVPcPXpIqJlJIJ2MBmX6U4xzLGvv2Nd6/oET6VncHGtfcF/I93mE03Sw2xE6yo/+gA==
X-Received: by 10.99.114.81 with SMTP id c17mr14746428pgn.43.1508353557937;
	Wed, 18 Oct 2017 12:05:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id 76sm24836123pfq.4.2017.10.18.12.05.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Oct 2017 12:05:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 12:05:50 -0700
Message-Id: <20171018190550.23205-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH V2] libcheck: Upgrade to 0.11.0
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
X-List-Received-Date: Wed, 18 Oct 2017 19:05:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V2: Pin to release SHA

 .../libcheck/{libcheck_0.10.0.bb => libcheck_git.bb}          | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.10.0.bb => libcheck_git.bb} (66%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.10.0.bb b/meta/recipes-support/libcheck/libcheck_git.bb
similarity index 66%
rename from meta/recipes-support/libcheck/libcheck_0.10.0.bb
rename to meta/recipes-support/libcheck/libcheck_git.bb
index 9d34198a96..a72cf5d43a 100644
--- a/meta/recipes-support/libcheck/libcheck_0.10.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_git.bb
@@ -5,13 +5,14 @@ SECTION = "devel"
 LICENSE  = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
-          "
+SRCREV = "cbc78bab899858f3ece1f218168da54aac757bb0"
+
+PV = "0.11.0"
 
-SRC_URI[md5sum] = "53c5e5c77d090e103a17f3ed7fd7d8b8"
-SRC_URI[sha256sum] = "f5f50766aa6f8fe5a2df752666ca01a950add45079aa06416b83765b1cf71052"
+SRC_URI = "git://github.com/libcheck/check;protocol=https\
+          "
 
-S = "${WORKDIR}/check-${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig texinfo
 
-- 
2.14.2


