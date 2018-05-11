Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED025783E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o78-v6so5060708wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1jgq/5XcvL2uFLUQFQY3KxxFbPHkLUzcVgT/T4iP6JI=;
	b=OUQGu/HSWLvqwtzkeR3n+/jjgMtj5jWy3/nzSWbxvnMxk5TGhgUZG/rwgdKe2byniN
	1RHAuVSlGFlOyxF3rwLoUc+WYlZFPZYn6eeKWCR0Fdnu+BZfnAks5vgARt6Dqrt/Bnd7
	hJskdfpn68JLbnFi9/F0mQBRcc0SUSgv1LaUFGDS796KpwjvdOVG9Loec/JAKTCbiBf0
	MZhs2bNCllAjfmLPPcpqQgGeGqNI+ahpRVge69/2hUE5okxmrMT1LvEsCX52WjUf4uCc
	GIni6ebLz+ys/A5MXBweZy/6ichRepoornWnTbkQtLgei84AbdSVUrtA7NUPHfGDMwZ0
	lCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1jgq/5XcvL2uFLUQFQY3KxxFbPHkLUzcVgT/T4iP6JI=;
	b=ErRs6o8+fqOIkJaED8sAXCqM4ebomZ/7Qqd81eV3rcAwTCeHrHxo0BW0nYFrchRAAq
	h3Wac1x3HpXuh/hVf0nbx3imlyiDoJqQ9hLUQoaOHECuvEPUYrTSbU0aodsAgxOjH1CI
	EUttGDVF8+aLh3fSaosUj6ZUfbfpJLOJCfbg5bi1MPD5GNC3ewZEzhQWIjxZO72nbuMJ
	GTRN2wIbo8HY4dGyUECED8CXVFBvPX7fYEXenkkkTOYz5aUAcV6l0fYejXCVHbwSchHw
	7wvNjN+ptvkCYhmcFykj1AUv8ZTLL+DcUq155zLLjPACdVtJWlCqeF+za9k0N8RB6ls9
	rgIQ==
X-Gm-Message-State: ALKqPwc7sFkI6GNNz58g25TJrCXQIOujsh+jhCKKsARrdfZ0XVZ6CSWK
	cboH6eLijehEBPk1j+TPeSgg9g==
X-Google-Smtp-Source: AB8JxZqwiORXQpoWC57syPke+LhujDNVmCW+GuDYPq7kgIR7aZYCWI87+P5xawUhayUJDq4GvdLSPQ==
X-Received: by 2002:a1c:71dc:: with SMTP id
	d89-v6mr2627538wmi.26.1526066467703; 
	Fri, 11 May 2018 12:21:07 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o12-v6sm5025738wrf.31.2018.05.11.12.21.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:02 +0000
Message-Id: <20180511192103.7581-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192103.7581-1-Martin.Jansa@gmail.com>
References: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
	<20180511192103.7581-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 4/5] qemu: add PACKAGECONFIG for virglrenderer, sdl2, usb-redir and spice
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
X-List-Received-Date: Fri, 11 May 2018 19:21:07 -0000

* drop "fdt sdl" listed twice in PACKAGECONFIG
* sdl2 when selected needs sdl as well and will depend on both libsdl
  and libsdl
* keep all 4 disabled by default
* spice, usbredir recipes will eventually be in meta-networking layer
  (you can use jansa/spice branch from meta-openembedded-contrib repository)
* virglrenderer recipe will eventually be in oe-core layer
  (you can use jansa/qemu branch from openembedded-core-contrib repository)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dc73df813a..9010a04792 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,7 +74,6 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-	fdt sdl \
 	fdt sdl kvm \
 	${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 	"
@@ -89,6 +88,7 @@ PACKAGECONFIG_remove_darwin = "kvm"
 PACKAGECONFIG_remove_mingw32 = "kvm"
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl"
+PACKAGECONFIG[sdl2] = "--with-sdlabi=2.0,--with-sdlabi=1.2,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
@@ -115,5 +115,10 @@ PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,${BLUEZ}"
 PACKAGECONFIG[libiscsi] = "--enable-libiscsi,--disable-libiscsi"
 PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"
+PACKAGECONFIG[virglrenderer] = "--enable-virglrenderer,--disable-virglrenderer,virglrenderer"
+# spice will be in meta-networking layer
+PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice"
+# usbredir will be in meta-networking layer
+PACKAGECONFIG[usb-redir] = "--enable-usb-redir,--disable-usb-redir,usbredir"
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.17.0


