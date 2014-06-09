Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1C70765FC8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:18:30 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id u57so5823218wes.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 07:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FHfdKJqdF4uFWmTJjHddyx7l4HlqPMSmNwpG4t6Z3Ps=;
	b=HaoFi/ciZnii5cmLfZViHsPqWIW04FVDsAxTSGoqS/YeWyvDRXAwHO+BA8uZMVaKQG
	f2avZZc3ODvrQauQI2xe9nhDg0/kN4Qjw8pmf5ngEnov3iAm3/QmfkvTLbQ2epa+G1UR
	S2kjIXnW9z0qYR6TcrNiTW/ipCWVeQSL6YAwr77Vx6MnN+RC9WgzQxPXHIjYP+iDO6nu
	uxY5uO7lMYisaeu3FH5uVDhfUrJ/8qo5u4aoW35JVU6h6GkDkNCp/NjqBvrTK7ndK5pn
	HFg2nHyQdjrMLRS+xk/f4gJ53KPgM/rzlKst4WioHs07CXX6EDsqcp+18KN2OEcHiT27
	PdEQ==
X-Gm-Message-State: ALoCoQm5jAJWBZfgoOufjmcoQ6Isz5cN8wgQKLFzlg9P72gkacNGEJyQNH1dem/UhEpQArKfBade
X-Received: by 10.180.13.239 with SMTP id k15mr29551093wic.4.1402323511016;
	Mon, 09 Jun 2014 07:18:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id g9sm25200969wja.39.2014.06.09.07.18.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 07:18:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 15:18:19 +0100
Message-Id: <521c60cab274b7833562f18907efe4bf51bd5d42.1402323356.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1402323355.git.ross.burton@intel.com>
References: <cover.1402323355.git.ross.burton@intel.com>
In-Reply-To: <cover.1402323355.git.ross.burton@intel.com>
References: <cover.1402323355.git.ross.burton@intel.com>
Subject: [PATCH 3/3] xorg-xserver: disable DRI3 by default
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
X-List-Received-Date: Mon, 09 Jun 2014 14:18:34 -0000

Add a PACKAGECONFIG for DRI3 but don't enable it yet.

Based on a patch by Valentin Popa <valentin.popa@intel.com>.

[YOCTO #6402]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 2e83d53..b9b9ac4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -120,6 +120,7 @@ PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri d
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86driproto"
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
+PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto libxshmfence"
 PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
 
 do_install_append () {
-- 
1.7.10.4


