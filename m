Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 55A037E091
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 16:07:15 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id z8so904931ioh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 08:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Tnt1GsEUnzHtZmEIOVzWKZZ/dRD+nyPhMPzHWLBVE3U=;
	b=VrfTsJTx9ln6OYyr1pJ7eZhBGl05Pzzl6pfzZ6vjq49FFG/oiWoi8yym525hvrcYdX
	iS9F3+m5hSvGJAU3nvtm2DamCWBDEYXSwcKzEWE/8E/Y6a7JuN4Dvr4oGPxBCAJuRqYO
	uQo/eYPbfk01P+LRVtDz2XaXuLEQRc9oFsqWu2GFjIJ1QzypdPfTMYMQzF9to63YG/1T
	69N4gz8bgVD8WCSiFVuLD4DI9T+Yp8u/nrmPmTB+JqCjql93KTwmjRtUBe+VIi5xs7Kn
	JE3TKvLOuqbWxzkC9FmWMc5/D0QS6mTh1tJ2PJ6z0HC4UsVNuG44CLnHGCJeX6WW/8rF
	ax8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Tnt1GsEUnzHtZmEIOVzWKZZ/dRD+nyPhMPzHWLBVE3U=;
	b=HT272Uw/x70PyxKMsWaehegxKGpNtkhvo9vYHFPWcv0nQ1bgTXjNWo1DlORWpcWtJl
	rDg9wPl1LZNdd//j2ux0njWrVBKhz8h5PRKD0kA107mRF+l6Ppc9om2kDgJC025ac+Y8
	yHP5UEXESIZRIE975eY3E8ZWYi6tkTVMY1cdZ+6JGmvVfICKdJmhe8YiTs4qFiMKTRVl
	OlskhfFeRoQf0O5EQWH0uL5oRD1iGXNqhmGLL7ihyEm1xCZMwh9WGSEJw+4DxSsjIMbh
	sEvihpszlm4nTR9evnphmC5QwtkxyiAFXuz6PFIJ6Kkzk/5clSDDtDTrP5FiT8/ITdvT
	zGMQ==
X-Gm-Message-State: APjAAAW0/dHEsy2g7effd2ExCTpryXzWG/gfmnyIooKUwfyawSz3PsTJ
	eXKv4q8/nBBsFTbxB5jb0tbt8D5PaIw=
X-Google-Smtp-Source: APXvYqyRO2TPD0mCB5I4qUKk7JBa/k4nBAzHdPm1xkq7XlhS0oLkirDyniUBvD3x7mgicwWWhRwRPQ==
X-Received: by 2002:a5d:9c4e:: with SMTP id 14mr12112881iof.166.1576339635954; 
	Sat, 14 Dec 2019 08:07:15 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	o12sm2940473ioh.42.2019.12.14.08.07.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Dec 2019 08:07:15 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Dec 2019 10:06:22 -0600
Message-Id: <20191214160622.1626269-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214005448.162460-1-JPEWhacker@gmail.com>
References: <20191214005448.162460-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Cc: bunk@stusta.de
Subject: [PATCH v3] tune-cortexa72-cortexa53: Add tunes
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
X-List-Received-Date: Sat, 14 Dec 2019 16:07:15 -0000
Content-Transfer-Encoding: 8bit

Adds tunes for Cortex-A72 Cortex-A53 big.LITTLE SoCs (with and without
crypto extensions), e.g. Rockchip RK3399

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../include/tune-cortexa72-cortexa53.inc      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
new file mode 100644
index 00000000000..0d43531be70
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -0,0 +1,23 @@
+DEFAULTTUNE ?= "cortexa72-cortexa53"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
+
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
+
+# cortexa72.cortexa53 implies crc support
+AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
+ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc}"
+TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
+BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
+
-- 
2.23.0


