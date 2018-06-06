Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id D28B277170
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:27 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id b17-v6so3773385pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0Q26my5jT+qelTva3Pyh1VoVTTSr4tDOG2YWUk2ZKSo=;
	b=tKD6vsDYR73BZ27kAPoc6Dy124Zlg0ocEEBc717hhhXRHFI0L+Sn/HIIF/EbVvLmZO
	gXrVAOhTjY4uHVozD7XvYE8MWlw+RJ6yWl2QOG43s5hwU7gyxArS5Q7UvXSq0uPbocHS
	qZHLHK6ogk1AAojqpcqyY/afQTRcbOI4uQXDqSmulqedNcy5Mr7YP2VvKx/GGjdIzSeN
	gy9pktXdyPNIxMIn7YjcPndYzuOWGWQMLkYpr1ETVYaZwaLljSEmiHujm4IZlQHbxwST
	+xOppWx1Qec8JIvBoKQuNKynKNW4JwNiH+dJyRZc3hdmw+sim4OqrgEYJLEQykfgaInh
	TDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0Q26my5jT+qelTva3Pyh1VoVTTSr4tDOG2YWUk2ZKSo=;
	b=oP3PwfYsM+twsfcAh9iGggADMkSmIk7aTVJRlTW9eTOZoIYvNzb4bE5fiIEKslf3k7
	rSIatdqwblYpGNAc05RMqHmk4mzaiJPhajHbDFx53LTQSuX/tEO6SaYCb3Na/E/aOEWK
	1Bhu+W+lM9VuJ/TXMAxvNMafLRUUtjPxkfk3V9iESdMTpfMTNJU7x0h136btJkN3Vb3d
	ykBv4AGVVtibvUeie2eFY50aKNXcuIVUExY/sh1E4ZWCX5ayDW5igKdTF0Vjes5pBi2J
	5uODczgV/A7iePvXsLH9X1XyilrjgEV0JTpmo78+jytAjIDVulaixorV+J84zDh9NdMy
	6e0A==
X-Gm-Message-State: APt69E1K46hc+wIroJKz7HLZGXqq89nDhaemoVqfLuZSQ06nMLEfeIs9
	LBnElU38+IEIqaL6yij86VRC5Q==
X-Google-Smtp-Source: ADUXVKKeqZbwJVAS5wK9Q4pgvvv9Mc+KFw7QFW4HJ/0kNW9+pzEGQ/YDbwNRpoukflFzfy/ZSOcQww==
X-Received: by 2002:a63:715d:: with SMTP id
	b29-v6mr3974898pgn.325.1528321048599; 
	Wed, 06 Jun 2018 14:37:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:19 -0700
Message-Id: <af37268cb091d1e3a723e33f133d466723c0956b.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 03/12] tune-mips-74k.inc: add tune file for 74kc mips
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../machine/include/mips/tune-mips-74k.inc    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/conf/machine/include/mips/tune-mips-74k.inc

diff --git a/meta/conf/machine/include/mips/tune-mips-74k.inc b/meta/conf/machine/include/mips/tune-mips-74k.inc
new file mode 100644
index 0000000000..94afee34bd
--- /dev/null
+++ b/meta/conf/machine/include/mips/tune-mips-74k.inc
@@ -0,0 +1,37 @@
+DEFAULTTUNE ?= "mips32r2-74kc"
+
+MIPSPKGSFX_MIPS16E ??= ""
+
+require conf/machine/include/tune-mips32r2.inc
+require conf/machine/include/mips/feature-mips-mips16e.inc
+
+
+TUNEVALID[74kc] = "Enable MIPS 74K with DSPr2 processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "74kc", " -mtune=74kc", "", d)}"
+
+AVAILTUNES += "mips32r2-74kc mips32r2-74kc-m16"
+AVAILTUNES += "mips32r2el-74kc mips32r2el-74kc-m16"
+
+# big endian: kc+dsp2=kc, kc+dsp2+mips16e=kc-m16
+TUNE_FEATURES_tune-mips32r2-74kc = "${TUNE_FEATURES_tune-mips32r2-nf} 74kc"
+TUNE_FEATURES_tune-mips32r2-74kc-m16 = "${TUNE_FEATURES_tune-mips32r2-74kc} mips16e"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2-74kc = "mips32r2-74kc"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2-74kc = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-nf} mips32r2-74kc-nf"
+QEMU_EXTRAOPTIONS_mips32r2-74kc-nf = " -cpu 24Kc"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2-74kc-m16 = "mips32r2-74kc${MIPSPKGSFX_MIPS16E}"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2-74kc-m16 = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-74kc} mips32r2-74kc-m16-nf"
+QEMU_EXTRAOPTIONS_mips32r2-74kc-m16-nf = " -cpu 24KEc"
+
+# little endian: kc+dsp2=kc, kc+dsp2+mips16e=kc-m16
+TUNE_FEATURES_tune-mips32r2el-74kc = "${TUNE_FEATURES_tune-mips32r2el-nf} 74kc"
+TUNE_FEATURES_tune-mips32r2el-74kc-m16 = "${TUNE_FEATURES_tune-mips32r2el-74kc} mips16e"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2el-74kc = "mips32r2el-74kc"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2el-74kc = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-nf} mips32r2el-74kc-nf"
+QEMU_EXTRAOPTIONS_mips32r2el-74kc-nf = " -cpu 24Kc"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2el-74kc-m16 = "mips32r2el-74kc${MIPSPKGSFX_MIPS16E}"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2el-74kc-m16 = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-74kc} mips32r2el-74kc-m16-nf"
+QEMU_EXTRAOPTIONS_mips32r2el-74kc-m16-nf = " -cpu 24KEc"
-- 
2.17.1


