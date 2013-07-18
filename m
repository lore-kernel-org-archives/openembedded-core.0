Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 397A46B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 15:29:45 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so3312943pad.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 08:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rtcJo/q2m79ShTJDoPoR4P2MLVOtAbm2uOHnGpDDwOo=;
	b=KXjcdIH730MelsZgg6SLqWm/TjfINTS0ty1RHemOcyaiEhCAuN/2HVhGkge9ZeebfJ
	je8IcrFpFXXN9/3ObxzyxNermOv/oGggYBEfxkvZ5xg/qBmqLeMZOW5/ZnPGXRzYOhKl
	0t1HXum6Ark7pAZtwFeGKYlN2S0PR30akz/j+AafRJinRIWm0ROjBfcXHe8sPqle2aUh
	4zocUzw1J6MNlkE3tJCEaKHptbSCazDb0Kf0+bcHWeum5lq3ZoqruvPx1R7mmqH/1stw
	sduulCIxDSe0IeyeIXOuuYCnmr0x+VtBBeghqlRV+ZrgNjRy16ZSKRVfAtaSwHhhtZv2
	MZDQ==
X-Received: by 10.68.178.129 with SMTP id cy1mr12699403pbc.73.1374161386126;
	Thu, 18 Jul 2013 08:29:46 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id s5sm14330891pbo.38.2013.07.18.08.29.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Jul 2013 08:29:45 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2013 01:45:28 +1000
Message-Id: <1374162328-23522-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2] mesa: upgrade to 9.1.5
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
X-List-Received-Date: Thu, 18 Jul 2013 15:29:45 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch       | 0
 .../0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch   | 0
 meta/recipes-graphics/mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-9.1.3 => mesa-9.1.5}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa-9.1.3 => mesa-9.1.5}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb} (79%)

diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa-9.1.5/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
rename to meta/recipes-graphics/mesa/mesa-9.1.5/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/mesa-9.1.5/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
rename to meta/recipes-graphics/mesa/mesa-9.1.5/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-graphics/mesa/mesa_9.1.5.bb
similarity index 79%
rename from meta/recipes-graphics/mesa/mesa_9.1.3.bb
rename to meta/recipes-graphics/mesa/mesa_9.1.5.bb
index a7ccbe6..49fa5dd 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            "
 
-SRC_URI[md5sum] = "952ccd03547ed72333b64e1746cf8ada"
-SRC_URI[sha256sum] = "8d5dac2202d0355bff5cfd183582ec8167d1d1227b7bb7a669acecbeaa52d766"
+SRC_URI[md5sum] = "4ed2af5943141a85a21869053a2fc2eb"
+SRC_URI[sha256sum] = "89ea0d1afd90a87dab253777bfe414820c4aa3890add1487ca2b49f6b3e194fd"
 
 S = "${WORKDIR}/Mesa-${PV}"
-- 
1.8.3.2


