Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 70A407F9E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:57:55 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j20so4202451ioo.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oDc6xRTh8bw0C7oc/J4XqsxG9flIQ9WQo0cItqivwxM=;
	b=rCe5JmGu9jq514p5SWb4JoX0zoZeC90T1j1U8IXJoIGXnv8nhtcyuTS9tbbJsg1euw
	RqqQKW1jD5xOW78z2x9jILhKpYd+7YWton9jbwT1X+WlA/1/3mPkwQwKvvEziXSdDdnv
	XQJortROX1d9hGy9nBd7dLijFKhxWjeepximeqRwA7917+Fuk3yoQeHINeghA9BgMoGM
	9cOirRvEjDCeWHHICQTYWo0Wf5puwy03Z/R13nOWv12z+v0Mr+VlOArozEzc/drQvvwt
	w866sFNNM/9pZYb0t6vljaXk14bZhQ95e1wSq+kWo4q1kSIrEvKjqPacg3lFXsHg/KNl
	WoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oDc6xRTh8bw0C7oc/J4XqsxG9flIQ9WQo0cItqivwxM=;
	b=lsTxadhwSHWu2KySkYP4KtE0ngDV83nZUt/SXJ23E88i/qIr3aAs910pBqhw0xX54x
	W/Ys+iHC1SPd2Eh/Lz6n+rFJch7p011PfyYXJENb7jyzTe2/uyr4PRpI7+EyIms9S+Qi
	Lkm1jzXNah7HE73im3GG8Kg0zz2TQH2lelkibY3L4xGdQG8S4to9DYEDPFgPuvOGTy4b
	lG1aQRJEFHc66Pvgi4ePydn4tjgx+le5NeKcOXGoZ83ZfbPJuAgD9NN+48StZr94MBcg
	+2EGT0jwpohDV6/OXpqCddkrp+3PyVU8iVcU6wV0fJiDkMG26VjqSENoipO6gdnl7h2s
	iZ2A==
X-Gm-Message-State: APjAAAUPJEchGa93a3VuXBuFwoT9wybXg6qwm1h+kTy9YlTtnwQrKtJm
	LiT11vhFK8uW8d9KLkdIDKMURP7qs/o=
X-Google-Smtp-Source: APXvYqxcUkGN37XFRbwMWt59V1DVRRwSRvl5iZzjkpmruf2fZcKSOPb5gqYd3uEpo0xVTiHU+Zeujw==
X-Received: by 2002:a6b:9245:: with SMTP id u66mr8366297iod.98.1574355476187; 
	Thu, 21 Nov 2019 08:57:56 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id x9sm1372328ilp.43.2019.11.21.08.57.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 08:57:55 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 10:57:52 -0600
Message-Id: <20191121165752.1219946-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] at-spi2-core: Fix reproducibility
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
X-List-Received-Date: Thu, 21 Nov 2019 16:57:55 -0000
Content-Transfer-Encoding: 8bit

Adds a patch to fix to make the -src packages reproducible

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../0001-Fix-source-reproducibility.patch     | 32 +++++++++++++++++++
 .../atk/at-spi2-core_2.32.1.bb                |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/atk/at-spi2-core/0001-Fix-source-reproducibility.patch

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-Fix-source-reproducibility.patch b/meta/recipes-support/atk/at-spi2-core/0001-Fix-source-reproducibility.patch
new file mode 100644
index 00000000000..7631969cd62
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-core/0001-Fix-source-reproducibility.patch
@@ -0,0 +1,32 @@
+From b7fa0aa00b07e03e338dd02af564431bf2f2b185 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <Joshua.Watt@garmin.com>
+Date: Wed, 20 Nov 2019 15:24:02 -0600
+Subject: [PATCH] Fix source reproducibility
+
+The generated enum type files can be included in source packages meant
+for debugging, and thus need to be reproducible. Replace the absolute
+include of the header with the basename. This is sufficient because the
+target include files are always in the include path anyway.
+
+Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/at-spi2-core/merge_requests/25]
+Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
+---
+ atspi/atspi-enum-types.c.template | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/atspi/atspi-enum-types.c.template b/atspi/atspi-enum-types.c.template
+index 385d0ee..92e4937 100644
+--- a/atspi/atspi-enum-types.c.template
++++ b/atspi/atspi-enum-types.c.template
+@@ -5,7 +5,7 @@
+ 
+ /*** BEGIN file-production ***/
+ /* enumerations from "@basename@" */
+-#include "@filename@"
++#include "@basename@"
+ 
+ /*** END file-production ***/
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/atk/at-spi2-core_2.32.1.bb b/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
index 11052a8ecef..18b5de2d581 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+           file://0001-Fix-source-reproducibility.patch"
 
 SRC_URI[md5sum] = "998fd9d858f8fa22c4c8c15567bf6254"
 SRC_URI[sha256sum] = "3c2aa937ebfaca2c86569bce9b16a34fbe20d69ef0c58846313b1c42f53b0d53"
-- 
2.23.0


