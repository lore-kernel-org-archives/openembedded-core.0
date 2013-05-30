Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 292AC60811
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:03:57 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id hn14so4593373wib.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=YcUoQ4dDt4YsU6sUuSIMHK+ayx/i8ULi2eDnxpWdYzc=;
	b=JqMHP2iMSMagTJ3z4oHhTQzFHA7DyMWAM58xeNUESo5Fr3H3/MVGyyaLpYy40QaqWn
	K0qPg2xZox2AbAHYzYJCgnoOfUJt6Q+TX7H8S9gT9x38sJIIJDZs+WS4/4r73aLvu7t2
	jPQS1d1/0q5C72FF1TPXMKU2hTF/CA5kcQV52lMt/L4gMzK2UREE5UZRdSdxglQoC7En
	NEhUL9tyhq2LvHETCvZ9N6J/+AcEeMbDhhif0A3Xet2qiOt0CoYqyLw6sEPVARPiQYbB
	OApLBFZ4vbWJZB28XNgO5YECw3IwkiQag0Iy4Th1IfzGE0ogBP69SgP9q83obfs5zIAR
	sgcA==
X-Received: by 10.180.198.140 with SMTP id jc12mr4701933wic.53.1369922637854; 
	Thu, 30 May 2013 07:03:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id h8sm38208362wiz.9.2013.05.30.07.03.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 07:03:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 15:00:35 +0100
Message-Id: <96e26985a886c355cb5cbdd0b62e2c52eaaff80f.1369922325.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369922325.git.ross.burton@intel.com>
References: <cover.1369922325.git.ross.burton@intel.com>
In-Reply-To: <cover.1369922325.git.ross.burton@intel.com>
References: <cover.1369922325.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnfrkCgg+i2nFVDMepewR3rgOpLDQ85aDTEvnfJNnRkqmsaxKludZkNDooq4qDQ18rjsXD6
Subject: [PATCH 2/4] wayland: update to 1.1.0
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
X-List-Received-Date: Thu, 30 May 2013 14:03:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb}               |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.0.6.bb b/meta/recipes-graphics/wayland/wayland_1.1.0.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland_1.0.6.bb
rename to meta/recipes-graphics/wayland/wayland_1.1.0.bb
index 7c18979..a71402e 100644
--- a/meta/recipes-graphics/wayland/wayland_1.0.6.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.1.0.bb
@@ -10,11 +10,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
-PR = "r1"
-
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "936a2590aea69fa3c0cf234d54b9137c"
-SRC_URI[sha256sum] = "f52a012df699eff434b0f49e56000d6978b5f781048402ca8e0232242970fc49"
+SRC_URI[md5sum] = "d2dc9398a83692cafc16eba6e45f85d8"
+SRC_URI[sha256sum] = "2ef587cf1a0e52b6dee44eeb9c288110e8180819abf4e419d247dfe234867a5c"
 
 SRC_URI_append_class-native = " file://just-scanner.patch"
 
-- 
1.7.10.4


