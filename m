Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A9D8D60750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 18:10:43 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id r58so7728989qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jM5P2yQp/AD2lLHgNrUPqecPDE233GqAGDvGpfa4SwU=;
	b=aEZf82iwtsQtPbTC1H5zrXMHcntaMvD3W6pb93Xzbz+opBinI9Li/Ua0PftxMangQV
	TCUNW/ul0GyLZ7ZfBQLI4nlU3IKwKLNVX3SB6regO9dYLOJpjbqJkO7NtRl4tKaQKDjA
	UAFR+fjmDh2zF9C0G76v6PJdng4flhXOxuJ/ZK0PpWWty9KOC8I5PpuA16xoNNJUkmIy
	JWfuoPYkIOBv8U27DhH9IqH+Y991C1y30l7uHqzAc4KWI9CiW5fMMab3kc2VAdK+/75p
	0qlLhPokIVlEJGGjOoellU55UiF4p/c3Ru4o19E00zR1U/Xotf8wGkYR7Cxawpfs1iZ9
	sw7g==
X-Gm-Message-State: AODbwcCk77pQXWEAGmn7TCS0nWbpS8a1037fyEbp3450RENq7gy9jBPc
	5IYmdWM4AxIlsg==
X-Received: by 10.200.46.7 with SMTP id r7mr4853052qta.209.1494612644571;
	Fri, 12 May 2017 11:10:44 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id j4sm2752436qkd.19.2017.05.12.11.10.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 May 2017 11:10:43 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 14:09:05 -0400
Message-Id: <1494612546-2295-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv2 1/2] pciutils: upgrade 3.5.2 -> 3.5.4
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
X-List-Received-Date: Fri, 12 May 2017 18:10:43 -0000

Upgrade to 3.5.4 and fix libkmod detection (was missing pkgconfig
bbclass).

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 .../pciutils/{pciutils_3.5.2.bb => pciutils_3.5.4.bb}          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.5.2.bb => pciutils_3.5.4.bb} (86%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
similarity index 86%
rename from meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
index 9a7297e..0faa501 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "PCI utilities"
-DESCRIPTION = 'The PCI Utilities package contains a library for portable access \
-to PCI bus configuration space and several utilities based on this library.'
+DESCRIPTION = "The PCI Utilities package contains a library for portable access \
+to PCI bus configuration space and several utilities based on this library."
 HOMEPAGE = "http://atrey.karlin.mff.cuni.cz/~mj/pciutils.shtml"
 SECTION = "console/utils"
 
@@ -13,10 +13,10 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "1bf5b068bd9f7512e8c68b060b25a1b2"
-SRC_URI[sha256sum] = "3a99141a9f40528d0a0035665a06dc37ddb1ae341658e51b50a76ecf86235efc"
+SRC_URI[md5sum] = "e82537cd2194111c45fa7e684b52252e"
+SRC_URI[sha256sum] = "64293c6ab9318c40ef262b76d87bd9097531759752bac556e50979b1e63cfe66"
 
-inherit multilib_header
+inherit multilib_header pkgconfig
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
 PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
-- 
2.7.4


