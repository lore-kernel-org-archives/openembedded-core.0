Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id ED78B7CAB0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:09:37 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id b8so28964972qtr.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=jiS26g7Xg8RgZL5dUZ9kV7R614vqmDhyT3hRL6EPKIM=;
	b=TIWBjxUNRVsmxA8BoElTU00cxmMhedclAwQu1WsvYuKL4oonxlaQ5lsoYIGi3MBozi
	UkGX/2GdYn2sFh0liYTQeFAWcQnlHHv6+KKMTmaoy91q9xbEbclTs2xFUxDouQzYDe6E
	/wNZyfpuruL/GkmzQL/mtyDPskIp6uT8oRdMfJrF//MMMWwpDLRI/2WrDDxhA3Pk6Me2
	8B3KXNFyK4mHyNhTwwTtX+dX2pBRX6AZRGL/p/iGKs/Q/TjmCWLreLOCVDPIVYflPFJR
	Auayt0PsIUq5hJGGFus+TFBQ1b4IQAf8gW1NRwq9zE4azZ/CAqROWGbkNsK+N5UfVgSr
	eV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=jiS26g7Xg8RgZL5dUZ9kV7R614vqmDhyT3hRL6EPKIM=;
	b=aFLZ9INg/vYuWEo3w0wJmpK2Af0W6zkCnB8K9IzbRX6pMx1qC3KOl78qpP2yQbBVgk
	hzLKXvHLLceqx+6spcUdhGbaIBcJPbynKXF/d1uWJTREgYYf9JK0syLcJZELaaslviWD
	fGMl4LtnV42aISK3nojMBjXs7EcpCqZrlobjUy7PHpmUz7gOdCaTjD4LbQKnah/tb7Tb
	rr0m/eaMSbEsuf/q+jQmzY2nFnTvmtql55zfku3x3iSddrByZe7zmlSHba29fNVmIzF2
	4OYR/oU98kg4qdsmtDF7PyVLfYTgunDNpISmDDH8ZbYZHg+tSZ5QtKKo+2aFZHoQcfbj
	K9MQ==
X-Gm-Message-State: AHQUAuZtFj0hjsLUB/P5keJhzRyjFwGS+gXBIxWj15x4cOpU1hRfIseF
	kYdTyJqJ4V2l/D8fq/bwSbOLygNXNTCUWg==
X-Google-Smtp-Source: AHgI3IaO89Ws8fnw5yJEx/7+eiOYY5+FyPNnLfrpedOTAvVeLwxIr4KqQJpqcH9lK5ywQdCCRQtN0A==
X-Received: by 2002:a0c:b701:: with SMTP id t1mr24434540qvd.179.1550696978669; 
	Wed, 20 Feb 2019 13:09:38 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	m42sm14486092qtb.63.2019.02.20.13.09.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 13:09:37 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 18:09:20 -0300
Message-Id: <20190220210921.26761-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220210921.26761-1-fabio.berton@ossystems.com.br>
References: <20190220210921.26761-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v4 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Wed, 20 Feb 2019 21:09:38 -0000
Content-Transfer-Encoding: 8bit

Instead of using a native specific packageconfig option, we now set
the swrast as the supported driver.

Currently the native version does not build any dri drivers at all.
This is intentional: mesa-native is used only by virgl, so was made
the most minimal possible configuration for mesa-native so that a)
virgl works; and b) build time is as short as possible.

There are two swrast drivers, one dri-based, another gallium-based.
Autotools lets you build both, meson forces you to choose.
Thus DRIDRIVERS = "swrast" is only set for _native, as for _target
we get the gallium driver instead.

See discussion here [1]

Based on https://patchwork.openembedded.org/patch/158748/

[1] https://patchwork.openembedded.org/patch/158806/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b9870eb6ad..c5f3e332fa 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,8 +49,8 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri-native egl"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri-native egl"
+PACKAGECONFIG_class-native ?= "gbm dri egl"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
@@ -61,13 +61,12 @@ PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-DRIDRIVERS = "swrast"
+DRIDRIVERS_class-native = "swrast"
+DRIDRIVERS_class-nativesdk = "swrast"
 DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
-# On the native builds we use host's dri drivers
-PACKAGECONFIG[dri-native] = "--enable-dri, , xorgproto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
-- 
2.20.1


