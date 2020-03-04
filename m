Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 74CDE61134
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 23:17:38 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g6so1751550plt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 15:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zTnp40n2cEpAdlRTgGBwMpaKEJlAYGPLOuaCheplxyM=;
	b=eJSlZ9Ui56ObDK6Dxaa4ZiXVuoynDYIVEeRd6Cnq98O0kZud/p+hWTgtLAQDdsSru5
	xmA0p7vlqkMPtlGOetsSiF/fEMAVooc4Y3SLM1sO6rvOT1QU4jSNZ34kekblvc6aLSSG
	AEE3dlPlo2D0W+8ZHRcW1mCbpzEtb+ncgYjvNLNn1+vuasnSKmFnVknWKrP1inhHkjlF
	M3cszKDrpLx3uhsRbkVj0y0RZY+ZyKlsqV49rT6rcXMJMS+zOyWCC6jTaTZzrdCAhgnM
	/W/DHVF3sTc/x49PYBWITAfd5r1lhyNCKEYCZtzGnwWqtJHSmtl/T1AQoeKe1lbJ/udb
	s+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zTnp40n2cEpAdlRTgGBwMpaKEJlAYGPLOuaCheplxyM=;
	b=quCfgum6q19g2lMfqdKPm4uS/4UWjnjTpWq+FShXg+HgQvIBv4iHjjT+hZYceys2YS
	YR03E/gqX/JAMA8ItmaKKaHXzSaExSshOYTEo6Anhc+kQxtKS5MBwzn76dPSj7kXmqc1
	H0GzTUU6bhu6ChCxst//lUHyTLymCIaIn/2oppXE1UkXVMa0kjfqwSFlmAdEXNchfJ5h
	oKaU2E4CGhD5MFxx+nq5dVYy/AM3RjayyY9ocT1JXIgXUEmrZl0vkytF6QFtUUsf2VYX
	g2hc4rDNi8qfRIb7EPttwqr7qZgi3iVuhRsHh5qX/PbaJoheKxjaNfeJE6ZabBrh48nX
	rvGA==
X-Gm-Message-State: ANhLgQ3E25rgNjNiassy5EG9/J11iSLSVdoPCDutFZZ3BW4Ar4HXoEWt
	5/cTmiOPSx3y609KS9oZkc/BjNyD
X-Google-Smtp-Source: ADFU+vsxsBFKoVOUVW3tEZWuDMImThPWgwxJb3AGtZJpKzvd0iOGJO2dN0qUm9p+SxLO1ubBjItugQ==
X-Received: by 2002:a17:90a:de16:: with SMTP id
	m22mr5396048pjv.142.1583363858806; 
	Wed, 04 Mar 2020 15:17:38 -0800 (PST)
Received: from desktop.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	d22sm3873788pja.14.2020.03.04.15.17.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 15:17:37 -0800 (PST)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 15:17:24 -0800
Message-Id: <20200304231724.6236-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: cardoe@gentoo.org
Subject: [PATCH] qemu: update Xen packages names for the xen-tools recipe
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
X-List-Received-Date: Wed, 04 Mar 2020 23:17:38 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

The Xen recipe has been divided into separate recipes for the hypervisor
and tools in meta-virtualization commit 545461ba, so the package name
references in the qemu recipe need to be updated to the new xen-tools
packages. This change allows the temporary bbappend applied to qemu in
meta-virtualization in that change to be retired.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f26e722f43..f3342eaf28 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -136,7 +136,7 @@ PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
-PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,xen-libxenstore xen-libxenctrl xen-libxenguest"
+PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
 PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
 PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
 PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng,"
-- 
2.17.1


