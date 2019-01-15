Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 12D6B7BFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:10 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l9so3654658wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ilJNqvImTlUTeR9XwNqyvbEo4FeDLuNWVthg2aUvItc=;
	b=h61SN+1+McppY/AxuwblsgVyT+7l9ePVXR5IxTxz/tJczZbMAkJG5FCLLJFF7iw06W
	t5iAqCr91IYOw0PhRBcJC6MSH5AG/WorblW7lIsWiZEwelJdeHRZarhHB3G401TsPimp
	yqkZ/bWV1O9/3F8Lr+VuHo0DW4ygkBDERGmYDOFI1kapvXN4NUbltortOMHhd/83olIM
	kuD1b0tX1urPlMPed0A3RICt39p1zzAbE/nV7t7CD39OtQf5K3CvAOs7ZJnlgsPr0kkd
	uqsZf5YteEz1XFzepeyXftSz2iytTQtxVTi4OZqjDT/yWyf94Khbacrz4zEThG8iZupK
	2pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ilJNqvImTlUTeR9XwNqyvbEo4FeDLuNWVthg2aUvItc=;
	b=q58TE0eC/SuKSOizTyg8MitR0sbscNMp2HUC88BmzE0rfcDHBb2m3xgo3ilN/4CwlP
	TGoz4gaPqEXr4EYxyoYGENJ+VN4HjX5lUOw1r+1nxloTJ7PszlPn5BWwt5fCaXvClJF4
	hGKZyy0FTZh97gebn8+yh8HJ04MQHHGkrYDT9ugCY29xJKj/yOoLZsGqkPVhpzjJqUqM
	SgWfusJ4pJRd2d1VonZV+cSx2x5S5QCdpzSH8K9nYR+cYMIAXqhtgklhWJl6sCUoPSJK
	j9utX7l0ACDpqAXi4PaIV2GauW1VeFnDm/XCM1vl9e2K3McFf4aDMVmBaogUvKE4RrfR
	+FwA==
X-Gm-Message-State: AJcUukeMwIuVnManpDkGDMoPxK11OK5gmsrGienLJRkv2udT4ao/nBXR
	UQvpXE++/v4uZluX+5gipLtMFMcOFv4=
X-Google-Smtp-Source: ALg8bN5QqThAT9ArvG+4Es7k7lMYRtufvzOFqUQTCld5J2Z7m9CCUk1MwjetfjHWylEPt7zwqjUG3w==
X-Received: by 2002:adf:9061:: with SMTP id h88mr3830802wrh.65.1547570351260; 
	Tue, 15 Jan 2019 08:39:11 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:42 +0100
Message-Id: <169ac17760c9315e2af18a242c55280a2c1599de.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 07/22] mesa: enable native and nativesdk variants
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:11 -0000

Note that only the most minimal necessary subset of mesa is built;
particularly we don't build any drivers as that is offloaded
to the GL implementation provided by the host.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0cc0a82de49..37ca5e39c2d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -26,7 +26,9 @@ PROVIDES = " \
 
 inherit autotools pkgconfig python3native gettext distro_features_check
 
-ANY_OF_DISTRO_FEATURES = "opengl vulkan"
+BBCLASSEXTEND = "native nativesdk"
+
+ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
                ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)} \
@@ -42,11 +44,13 @@ EXTRA_OECONF = "--enable-shared-glapi \
                 --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
                 --with-platforms='${PLATFORMS}'"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri', '', d)} \
+PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
+PACKAGECONFIG_class-native ?= "gbm dri-native egl"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri-native egl"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
@@ -62,6 +66,8 @@ DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
+# On the native builds we use host's dri drivers
+PACKAGECONFIG[dri-native] = "--enable-dri, , xorgproto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
-- 
2.17.1


