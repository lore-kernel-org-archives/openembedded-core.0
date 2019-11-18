Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF057F8AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 18:59:08 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b17so491466wmj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 10:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RRexF4GgU7rENxaeEHyoaEXdAr3lAwSef3qmPy4Rj1s=;
	b=mUlvU3tVeaQmMbYv+s6Rdo/2+urKtQ0codg+hLqH3D74utZ/7mCmMMQRd5/Y45Yr0e
	Em+h69Mm0WlSCsyZ5CmJ70cSOLtmSqnM+WEKasIDXBLOdKgQAnTn75az5fTnKgGoFrxc
	B48odgTMSsuwhysbg9CaC3A4pP532BSDh7KJIOH6JJEw3XHPxvFh7BoO1XocBnaSvNyz
	g5SET8sUQNyf12XBOkzyWjDqHhBy9EzJlLNpdDpzHd9Al4srhyS+1bnUQMXLWn7AE4X7
	1W4VL9jIw6+E6pNJjPjzPAUPWTvTvEWb3+Ci5scsoJg7XPPVruIVToP83j5Un3pJMvdN
	ySMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RRexF4GgU7rENxaeEHyoaEXdAr3lAwSef3qmPy4Rj1s=;
	b=Wm8KvddRIajpuCicsqK4rcCwUGCMnS9uBFoaEzMukfWJrzviTPThqfoCGiTpu5jCvC
	pSH9yx/GVaI1VL+hn2ZoaAbnyNPxACtJOHH3USJqGStoZoD0dRlFKfaFo2RL/MAJrHBP
	765FY6AkLPWnS+dpw26OjYAsgQ9PRlJOtZQWc7mV8rdTXrSiJFu2GgrZKJS4yGelD33r
	bpgHKpZHrw9i+uLhQo1iZf4Uxa0CFabOkxykZoxloAppGIfTFI845Ay1vp9H//Vcvx0T
	2p8wl4SPkHzb6XyGlET0mvwAzpdIKlitpjvVhIVmjSKTJtwL50i9pht/bYw1I2oy2a6e
	Xohg==
X-Gm-Message-State: APjAAAVxHsNR2YoU+ydnpvqF8NSsOlFPQcIX4yk8FeohKMQGTve6G2pO
	+b3iR3mHDn6dI2cThe9HymJ6zYCk
X-Google-Smtp-Source: APXvYqyhagzPGewbcyBsHOClwtalWJ9sw1ZRy/PTKxFYJPLMOIrLUBWl1eH90Wiq8LhFEqYYnqYWiQ==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr745624wml.100.1574103548773; 
	Mon, 18 Nov 2019 10:59:08 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f67sm332571wme.16.2019.11.18.10.59.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 10:59:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 19:59:02 +0100
Message-Id: <20191118185903.18087-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] cairo: the component is dual licensed
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
X-List-Received-Date: Mon, 18 Nov 2019 18:59:08 -0000

Somehow, over the years, no one noticed that cairo does in fact
offer a choice between mpl and lgpl, but the COPYING makes it clear:

https://gitlab.freedesktop.org/cairo/cairo/blob/1.16/COPYING

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index f32e9ba1bcd..e3de3f6164a 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -10,12 +10,12 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 
-LICENSE = "MPL-1.1 & LGPLv2.1 & GPLv3+"
-LICENSE_${PN} = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-dev = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-doc = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-gobject = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-script-interpreter = "MPL-1.1 & LGPLv2.1"
+LICENSE = "(MPL-1.1 | LGPLv2.1) & GPLv3+"
+LICENSE_${PN} = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-dev = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-doc = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-gobject = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-script-interpreter = "MPL-1.1 | LGPLv2.1"
 LICENSE_${PN}-perf-utils = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
-- 
2.17.1


