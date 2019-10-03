Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 857BD7CBDF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 17:18:30 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g13so2971552otp.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oCmKRXbGIGOb4CUZKbl/jVH24cSrXTn95D6XsRi1zWw=;
	b=faOR4g8wjdcX5TdievPs7W4IDk9OBOHpr3FyKEVXFMh+b6OtWFJac6fx/V9WnNAsUm
	cJhXV2h7HrdfZc7CP725fzLXVfE9HkLO5aAA1iA0TGPZ/VfLiTJTpyW13Q/hy0A+hOQ1
	fGIlFBJQNCrkcitF6G01wD/sZ0udqnki+8oAmmIty+lrnoZhgyHWfkvvPR7Q5cElAqsR
	sKVk2DO5FSRoWKzFMQKVf03svMbJg1VDvV2WhQwkp0Mhg2Bd4BmSJyeK+xopIEMFnFky
	yBuUL00YZP8xX257TIOyeTlBDDkctekrvjG/PzXgLCWpXlCcjBMi+NEwEZFnnEu/6frx
	xsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oCmKRXbGIGOb4CUZKbl/jVH24cSrXTn95D6XsRi1zWw=;
	b=uR62qSLoSIxYKlMNgg7PF/rVYsL3s+qR8AFvJlWdnOPD7dxJXaZQ/fL1rSvA3WsKs/
	ChP5jJGQETuI1Ha0ZU/TUGg65SEL+0jCqPzuWlkBO+ZDiSqGXUi4w2GOBtrQYhlpN16e
	sGj8PKqVGoprKbIXMYjRZ8D2KsIHhEg4/MVyY+jv879KLDSZdrDIfQlR4VDu1Y1PE/ey
	vGbrRLYjdPojxtCxLn0neu7lVC2RpPijdjaOGgSlwv5oM3oohzQqaXew0jf+5lNuXdrM
	d59C8lQFo/iAUZxY+S9QE/EGukk1SJLgQkogb4C64Ib9GHM16j/2amOOQ9uRVSQfoalV
	G3dw==
X-Gm-Message-State: APjAAAVbmn3IOdAwvqltWA+QaSNCLl3E3LqMcmNIUR26OXI1P/0Mo6Hj
	c8G0793wBF6j8qraEiJEm3AD/WRMwtY=
X-Google-Smtp-Source: APXvYqw51m/4YvfxYGNZE3nqezO5RM5EWHjfAukiUI3iV4Qpx5S4OKfr1qNyUsdJEccrT1HT6x7z8w==
X-Received: by 2002:a05:6830:86:: with SMTP id
	a6mr3576294oto.353.1570123110972; 
	Thu, 03 Oct 2019 10:18:30 -0700 (PDT)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y16sm906228otg.7.2019.10.03.10.18.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 10:18:29 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
X-Google-Original-From: Nicola Lunghi <nicola.lunghi@jci.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Oct 2019 18:18:16 +0100
Message-Id: <20191003171815.26731-1-nicola.lunghi@jci.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: [meta][PATCH] ofono: convert recipe to use git
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
X-List-Received-Date: Thu, 03 Oct 2019 17:18:30 -0000
Content-Transfer-Encoding: 8bit

From: Nicola Lunghi <nick83ola@gmail.com>

ofono has a git repository available.
Use that instead of the KERNELORG_MIRROR

Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
---
 meta/recipes-connectivity/ofono/ofono.inc     | 4 +++-
 meta/recipes-connectivity/ofono/ofono_1.30.bb | 3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index bbf31c3a9d..63f97a97d7 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
 SRC_URI = "\
-    ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+    git://git.kernel.org/pub/scm/network/ofono/ofono.git \
     file://ofono \
 "
 
+S = "${WORKDIR}/git"
+
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
 INITSCRIPT_NAME = "ofono"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.30.bb b/meta/recipes-connectivity/ofono/ofono_1.30.bb
index 71c33e1287..37cc0c79d0 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.30.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.30.bb
@@ -3,5 +3,4 @@ require ofono.inc
 SRC_URI_append = " \
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
 "
-SRC_URI[md5sum] = "2b1ce11a4db1f4b5c8cd96eb7e96ba0c"
-SRC_URI[sha256sum] = "8079735efc5d7f33be9e792e791f2f7ff75c31ce67d477b994673e32319eec5c"
+SRCREV = "c1de25bcb4541ee4c69cbd31baea681025df43ed"
-- 
2.20.1


