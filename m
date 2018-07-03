Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1D371771AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 13:27:28 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 69-v6so2274417wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 06:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Q83dblZ14nGidg4GVn3T7y8hV9NoEYtkeeoVYcH8tJQ=;
	b=VMWoX0G51b+y6LksD9CGdsCAAH3jZs7MU+xDJucM6OY8psaKKNgjubvNPHlk7++imk
	EThKk0CVs+91yRd4OW6iu9Za6H5xqDLhSXFe9vmxxvT3TbFgSZeIfkc82ypGhSWyGknn
	KVHtGweOusVHNTN3PfWL0ChelbcHRQSo/3bK9nlFNJnQazMTiWil6ig0tnGlTzawduPd
	Dkh6ne767rZgzmYWt/ISARLFR7yThW+9039kKWXo5Kcj7cJ6KRSzEhjBpZqoyT4sqq0y
	c3AjYEYk7nRdRIfY3muG78gFRsCzS9Wuv1sUKMLcBoq9Kd7WqMHK/DL8jNuKN1sVj+pR
	03Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q83dblZ14nGidg4GVn3T7y8hV9NoEYtkeeoVYcH8tJQ=;
	b=VvTxwqPopvPfHEo+kHL2YPtmX1nP3PKsLZFcuJasOwfn4BvYYoebg+l1XtvCiCH0/3
	dB/5JYZ+Y1+jEFmAMl69tfpBwBZSMYrx79LaRJkNfZPE6YiIhonnDpjI31uV6LLvlXxe
	PVqY9jZpzGUndx9uaHWOKvdhMur4hwPJ8ESRyUwjFMVRAM/BYRsH40ieZZe7hhSND4zk
	Nolc4tAES1vCnNwT47d8EmnRc6MU9FTiz7WCu9HkdQyxtOBJ4AEtU5bwiUwfjbMGVAes
	s7KXKYl2G3uBVxTiYO0MpXeeu0tNlyQ7QX2VVRVDAZ7NP7DxxtrW9NbZyT4f1I8SAgL0
	3NjA==
X-Gm-Message-State: APt69E1HhkqRFhLgP/C7QSclrYeU8n1mibYhFLMtfvXg5lF9LjXkpbox
	YWoiorGZjpKFFr9x23bHuzbUwRFv
X-Google-Smtp-Source: AAOMgpeR4HdChqCUa9myU0Oi149LEcPes4LPOp8oa61RMRllnVK1A1X52U3cwmfqrUV7KlfUvYKuSg==
X-Received: by 2002:a1c:8c08:: with SMTP id o8-v6mr5479119wmd.60.1530624448454;
	Tue, 03 Jul 2018 06:27:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	203-v6sm1908169wmn.38.2018.07.03.06.27.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 06:27:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 14:27:21 +0100
Message-Id: <20180703132721.21476-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mesa: enable surfaceless platform
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
X-List-Received-Date: Tue, 03 Jul 2018 13:27:28 -0000

This platform is enabled by default but as we override the platform list doesn't
get enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fa99f7d50cc..cc01ea73b46 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -29,7 +29,8 @@ inherit autotools pkgconfig python3native gettext distro_features_check
 ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
-               ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)}"
+               ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)} \
+               surfaceless"
 
 export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
-- 
2.11.0


