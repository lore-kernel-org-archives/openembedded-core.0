Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id E709F6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:02 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id x5so1828709obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DvbgkKYEnTMXCOM2eORbcndyc0nLErr469X0KYjsxCk=;
	b=poAn6MpwW9P8HRL415JEsi76/dLx3AMpyRCFLKUm2PDtnBWHAHI5p3xaclv2//fPVP
	UpKoATfj94Kl0dlkz9nDUsKjqZryeGFDbISR3mD4t7esQRRVeUKGr92MG5gF8dlX5014
	hCI5z1iNvtD4EBBnLPdipXfvDzffc7+99oQ6qnkmpBlbnIr9rgbaxZgxyVari+sAu5ef
	JHPhHIaAjICyRUjqs7SMFpMYn5ZfFxnl12YNQ6TNohzSseXeh3fa2uZ9OdlsUBe9byB7
	uAjfi5xPFsRQXRLlouWLLw8I78M3C33d9ppoNxe7tPV6hTg1KljHL/dohbL4b7MZUrkL
	cyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DvbgkKYEnTMXCOM2eORbcndyc0nLErr469X0KYjsxCk=;
	b=IMCSetOt6K/TO+lh+dTtzt9Tsrh3wqqhTws1odB+lLoERwDXOjmLBGxBE3Iv7KTK48
	m6QWBnN2lJDeja/F0RsNc9RtjRc5VAYua6Ld8Lkpskwjxz5QuEqmjsJ8GlCEocj8Huoj
	q4oTQZC/HkXFZMC9zMiz6OnegPtgZk9xJZ41HE25GRMT6ACM+PhNEEAER/mWXJTU1bUI
	VzVTeXxY1mpsbbsk7/xnVx43xczWOr0vdKtSnt56ruj/y4CASBhSEJYSeA+D3ZaWQyil
	BD+ReMIsTMZwcDYwdCirDS3GgUuttjwvEoWldRhkW/l8+IGxvJyr4kSwuMwv1QWJQNhS
	lZ4A==
X-Gm-Message-State: ALoCoQmLSH0Ya3xPNhzVnS4TXCUWYzOa7WIDz//xUn8mdW5D5DI/KfG8qgNr9+3BNcwtXeNjw4clVP6CSwRs9yMYganRXfgptA==
X-Received: by 10.60.227.104 with SMTP id rz8mr31852413oec.45.1453344243872;
	Wed, 20 Jan 2016 18:44:03 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:03 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:14 -0800
Message-Id: <1453344203-7118-17-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 16/25] gstreamer1.0-plugins-bad.inc: don't set ${S} or apply version specific patch
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:03 -0000

gstreamer1.0-plugins-bad.inc is shared by both the 1.6.2 and git
recipes, so must not set ${S} or apply any version specific patches.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc      | 4 ----
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb | 5 ++++-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 4aa2f56..689d3ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -4,10 +4,6 @@ LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 
 DEPENDS += "gstreamer1.0-plugins-base libpng jpeg"
 
-SRC_URI += "file://configure-allow-to-disable-libssh2.patch"
-
-S = "${WORKDIR}/gst-plugins-bad-${PV}"
-
 inherit gettext bluetooth
 
 # opengl packageconfig factored out to make it easy for distros
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index c1c322b..004d053 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
 
-SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch"
+SRC_URI += " \
+    file://configure-allow-to-disable-libssh2.patch \
+    file://0001-glimagesink-Downrank-to-marginal.patch \
+"
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
 SRC_URI[sha256sum] = "650855e39ff56a8bb6cb0c192109c5926ce12f536d06e19ebf829de71ef396fe"
-- 
1.9.1


