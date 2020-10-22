Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.4614.1603334755628001428
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 19:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm2 header.b=zFmGldRP;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 64.147.123.25, mailfrom: alistair@alistair23.me)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 8F20C984;
	Wed, 21 Oct 2020 22:45:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 21 Oct 2020 22:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=mSilHLSvzNPw14Z2Ko9dmNmSaO
	SUSLTpIZWve8le96c=; b=zFmGldRPT8783E1EzoTuAEW54s19EZ2EV0pLjfyDAe
	xurkZ1qM2sEsiZefGIYdk7NqopCxFzY7rk6z0dVZ9K+911gP781weGOD0tJIFzs+
	DRPKkImcspgcnH1OKD5Me3/hWK4c9j6RtnnzmzZ4II5S07meYUsdsXzvsaAT74Wi
	dnlLxeRylvmLV2aoamkkzcBKIhgllf/ltWereYQo5m4u+cV6xMlmxm6QkYFJ48sC
	J+kBAEoMIEuafqgxo8GPavkcIQF0kylcr/YgDij63Fadkc7bVkr/lbBnlDdcSLpA
	iFtnkPcBXG+RlrCEelV1flWTQ8dxPLT0fxiCrVTVQ6rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mSilHLSvzNPw14Z2K
	o9dmNmSaOSUSLTpIZWve8le96c=; b=f6XiZQNCcikknm2mBBiuZNtjcipChuRYy
	RCpDiQ9lmwBh1frmqnHltO7LWrVUskCNcP/cNO0Vi/78hvqerzf0NV2yWkqYp9lR
	ZTjFZO9VrxwNXQ8qVpsC4t7YJfGTjqapDb8/g1tr0W7L8SFKtOIC85RL5YqXXsZa
	6zDQODnWOrU3Jv2YHReNPVevl9Z0ghYK933KVbOUIKhR0w9fpITyw0ll3sWX1Ahp
	Avy624BpNd5KgG3uWdMGeK+lv3mLXyLHHd8AYBmGAtg8HVkOkMh8o3RjVfAfXBxL
	F1noDAXn8xPUYjYmZoBm98fVBdUoTOOH9pAapzJ05b+jG1FLtK99A==
X-ME-Sender: <xms:YfKQX7vSw7ubQcZwDLxLXsekKnJTJ424U_gKfD1T4IMeQfvGshIvIg>
    <xme:YfKQX8fXDpi5pKsz-ITBBBEeAzR1sSaX6_hSyTbocdYQjCfGZdWarrazz6Af_-7qt
    AoLIH_KF1fK9JVgqYY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeigdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepjeeliefhvdetgfdtte
    fhtdegffdtiefffeejiefffeevueeljeehjeevhfffueeknecukfhppeejfedrleefrdek
    gedrvddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:YfKQX-wBA4kIzPG3Cgfzrmwf3wcpYeEefiDQCDjb7faKO7DJv-Ip4Q>
    <xmx:YfKQX6NFdbyJV5ahLYngvKGHIVrvVliE9xXuqR_QFIQKo1d_iU1fgQ>
    <xmx:YfKQX7_cBmOiARCfQaEWjrvru2FKT9sDazP5ztAaVQfUmxeIQT32-A>
    <xmx:YvKQX4KcdQqsx_rpSDUPH8WwX5wrT7rKrXL0zWLUkmLapfTDwJVTDQ>
Received: from alistair-xps-14z.alistair23.me (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 459133280064;
	Wed, 21 Oct 2020 22:45:53 -0400 (EDT)
From: "Alistair" <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] weston-init: Allow setting idle time to 0
Date: Wed, 21 Oct 2020 19:45:49 -0700
Message-Id: <20201022024549.1165227-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a PACKAGECONFIG that can be used to set the idle-time to 0. This is
useful for always on machine (such as kiosks) and for debugging.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta/recipes-graphics/wayland/weston-init.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 07cec75fb3..b7a99be646 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -15,6 +15,10 @@ SRC_URI = "file://init \
 
 S = "${WORKDIR}"
 
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[no-idle-timeout] = ",,"
+
 DEFAULTBACKEND ??= ""
 DEFAULTBACKEND_qemuall ?= "fbdev"
 DEFAULTBACKEND_qemuarm64 = "drm"
@@ -45,6 +49,10 @@ do_install() {
         if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
+		echo "idle-time=0" >> ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
 }
 
 inherit update-rc.d features_check systemd
-- 
2.28.0

