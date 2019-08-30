Return-Path: <narmstrong@baylibre.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id C7CD47F322
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 08:53:43 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g7so6162661wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baylibre-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F2V/U4R4/PNAQO+4qTFq2KM2Y+jGCD+35li4yFnQESM=;
	b=WsCE137AU36h2hFOhkzl1TTuEZG+RRLI5P1rJEsKI6DGy/gvumEcr5zcM8qGNk6rd7
	YDPpXPooCx6SY3cNigzMUPUwiZVNiug+3mcwq0D0MSxZLQ6yARYQl22tJafsU2BjS3TH
	hJF9zWERGSgfyJHsVqzOUBu3SgRc0Uw2gz/kWs039F91LcIl4klOjDUIq5MjyVT7wkFV
	3tEKe7aJKliYX1fI9Vq0x7PtiPN7AUCN59wQ1WIC7lgco/lDAhUy0OhVaPfBmjCJw2/V
	aDim1Leq6iuo7j/+KcTNGqEbjjQz1I6hdmnKlkm1wsoWukRmI9r9dplY3UGiFT1Y4t8R
	nABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F2V/U4R4/PNAQO+4qTFq2KM2Y+jGCD+35li4yFnQESM=;
	b=ATOp/C78LUgW8nQ9CsXqNzNIL4pPtoiwZYv3aRig4ogY7b10CpoipxRbjanh/VT2YT
	VZm6JzApEXcOJX8MYyruLOzdVHFK60bRRqc0K1oBA3YHGMBJ1zM3Ss8Mr6bZcWWJ6nPB
	XOObNKuc6X/L8BILVwmRZwcwsVR1k3tpaKFQof15z5MU/ctWPxSmI96CNOWPCIUVFbBu
	Bu37FHWlkkIQGPevxor4+8R2Ut2erM96dAzgILDak/RGtQVy20bjzHbVfMiUmUKBTVpc
	cbH/17JOCI9+JYhjcI8Nc8WpxPQBEDr2UNL4MbUWftXVUIDwFUeUkb57iG9leUGg9jGj
	O9VQ==
X-Gm-Message-State: APjAAAXEU3cSOcb47PAU50YXMTqDhDlht2twgXXbP6AawC+NlDitYu1M
	sLNsYK7lDTR3DNUvhr/Oyl0xBM9DbeRHwg==
X-Google-Smtp-Source: APXvYqwMhw+WYvOmOzq32LwRrhynsjk/avvp/ODER48SzisakucK2calX8Cdc6LFTBOyz/kM1Xqe9Q==
X-Received: by 2002:a05:6000:1187:: with SMTP id
	g7mr14806674wrx.192.1567155224032; 
	Fri, 30 Aug 2019 01:53:44 -0700 (PDT)
Received: from bender.baylibre.local
	(wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
	by smtp.gmail.com with ESMTPSA id
	b15sm3909267wmg.30.2019.08.30.01.53.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 01:53:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 10:53:41 +0200
Message-Id: <20190830085341.4939-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] mesa: Add support for the panfrost PACKAGECONFIG
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
X-List-Received-Date: Fri, 30 Aug 2019 08:53:44 -0000
Content-Transfer-Encoding: 8bit

Add support to enable the Panfrost Gallium driver in PACKAGECONFIG

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fcd19884f5..a7495bfc42 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -122,6 +122,9 @@ PACKAGECONFIG[xa]  = "-Dgallium-xa=true, -Dgallium-xa=false"
 PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 
+PACKAGECONFIG[panfrost] = ""
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+
 OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium', 'classic', d)}"
 PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
 
-- 
2.17.1


