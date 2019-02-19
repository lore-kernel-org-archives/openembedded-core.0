Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 77AED6C498
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 16:59:19 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id 2so23935580qtb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=4S6UoaR2WZ87Si7Kx++OaR/ThMmN2GKPY5N/uhaazI0=;
	b=Cm1G0J/RbdCRx6AzQlcnnAs2ns+HTQtjEr+XzMI+v5L5TWNUstUeQ3Oc4gnG+7UjkY
	zrfELZHA6lBU0rAOIXQ7jvcGSOEiSQRUc8RVXl74SZ7XM573Kqhdr/Djo0aFUMu97itV
	P/AlrfMRj4DD22l72xp3drxQZGJAqXzXPVPQMSWEIqGJnIhqbr2HiPGAXVr5wfYHdvFh
	qEQ29C7b8RUx7LDCU9VdgWan2b/Wngf3bU2FErd0zBWUbz/S/80GXQfb+adEis0ny/iI
	QcJ/OSrjBlNWJKFQtLGBdVLTcjAXws7wVV8HLFnWojO1vWbmfZNrmbHO7UbD4maAGx0a
	3dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=4S6UoaR2WZ87Si7Kx++OaR/ThMmN2GKPY5N/uhaazI0=;
	b=CMn9iNA9iiPW9R+WxQz7WrytLVg5jyuHHwwDCYTaEUEK1O62LepetTWTpuTpkWqiPR
	PUyt8zOTIk3Rg4lClGTPogWJnAreejXLQUH4A6dzmBxfJF+bw0Z/yWaJgtFqiLQdR+zm
	7qxlJp+jl356pswD/em8jzTd5sLC4CxUIZJsuFp/SAaXMx12CFVp3OpKza/JyXvjwMqK
	GUGXShr07pTE0eHxlaPCKXwqg7seVC1UaiZZvo+xSR56nKsalLbWgg0CHYRAcCiqc+Us
	4dkJZzkDI7shB8SQmOD2DAkyoqG0e4BdvxPPeFhVU7T8BX/IV45/dejDXPexa3r0hFBD
	R1+w==
X-Gm-Message-State: AHQUAuaZQhg8ARIHnjxxzATfFNsnTBFF5NLpk0OD6A17V60HoqMNlyG5
	yfmuAxt3ELmm0aSCVx+ocbCYs/KE2SuEdQ==
X-Google-Smtp-Source: AHgI3IbvQILj6eAMnt/GR7ZvUNKEjqfQmmqdnvrx6n5dexEKGKssr2VGX3vSDbBfdVyTzbbkPz+TNA==
X-Received: by 2002:ac8:2734:: with SMTP id g49mr23346041qtg.115.1550595560388;
	Tue, 19 Feb 2019 08:59:20 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	t20sm2003377qtb.58.2019.02.19.08.59.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 08:59:19 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 13:59:05 -0300
Message-Id: <20190219165906.14377-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v2 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Tue, 19 Feb 2019 16:59:19 -0000
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
 meta/recipes-graphics/mesa/mesa.inc | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a57438b295..8d3e976481 100644
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
-DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
+DRIDRIVERS_class-native = "swrast"
+DRIDRIVERS_class-nativesdk = "swrast"
+DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
-# On the native builds we use host's dri drivers
-PACKAGECONFIG[dri-native] = "--enable-dri, , xorgproto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
-- 
2.20.1


