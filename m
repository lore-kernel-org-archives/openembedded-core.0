Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F1B337F38A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 20:37:24 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so67506961wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 13:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=stYe8Q5cM5KVsHvOzcKRoFBdGb0Ve2ZybgapCyA6B/U=;
	b=DBi/7EzL9VR1kfJnfOrHpDQKLiclDbmM7Qrizl31QQOBhZo92orCkvUpeOEGR9z6fy
	1AVlIUfxBHiFpqlusuJtCsbBxJiyq2jgLIy5+2aGuctgFotVchFBHJYRugleyQhobU0Q
	9uU+9onPLIvJq6RDzhPR19SQklrqyD5NmEg3yP5X6mkrcJCfP6GwryU/vfCFlb/sriOw
	wIPgsaDfpS2aqDBhEgizUQ+IvI3NP282p1frz+YYiFkHbCR7NXO5+JLJRD06sBWyrnIo
	Is1rmyosrJHkzMSaeHAC6T/pAmCI4Snq9ClYKe/RGiOxG+AKS7aLb78EXipl8moPwSO+
	0vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=stYe8Q5cM5KVsHvOzcKRoFBdGb0Ve2ZybgapCyA6B/U=;
	b=Ogei5pJbjR/KTWDQ1E8uVaPupj/CZBSEP+0YyjXwvkXjX0wqXfs5bKff/BXO5jVfaF
	5zC7mRY1p4g8y/HlzJQLCJCPDz8ni7mviJ0rvkKoz+YSXjUTYPLZBNze2IRp8Rqm77k0
	uEby219PbaGfjLEgG0hbE3ArY3oikzhq8nDjFcUewtZzQMPziRNxp4nnrs34z3c9Ni+I
	kptdyqKsMEn40lyKbBHPbE+KUOO5oZ4YYEqcc98r9Oy8znFDmCR9Oa/IGcyUrZoEuBFb
	OzmT5CPaFzWetlMEL/2j8a+vJXn2ivyUIoeFdkFkFuxbNldegp0guhpfWUXyYDIg5wie
	6qcw==
X-Gm-Message-State: APjAAAUmM3yj347ghOxbgnUpQ6Jx7fF4aD0poo7JZ9mhfZYuf2zysC7C
	vBus4ZQgyCE20megnenqTtgf/tVzIZs=
X-Google-Smtp-Source: APXvYqy/2pRkqqhOjMNw71D5SHZi8pSVEVztT8cfu7IwsN2A+cg3N2pj8jdh8KW90T30sH1sVRlxdA==
X-Received: by 2002:a7b:c455:: with SMTP id l21mr5845819wmi.114.1564778245370; 
	Fri, 02 Aug 2019 13:37:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm59083910wrx.39.2019.08.02.13.37.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 13:37:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 21:37:13 +0100
Message-Id: <20190802203719.20437-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802203719.20437-1-ross.burton@intel.com>
References: <20190802203719.20437-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] xserver-xorg: add PACKAGECONFIG for DGA
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
X-List-Received-Date: Fri, 02 Aug 2019 20:37:25 -0000
Content-Transfer-Encoding: 8bit

Ideally we'd disable this as no real world client applications actually use DGA
these days, but some drivers (for example fbdev and cirrus) still need DGA
enabled in the server to build.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index fc05c6a76ea..44315f59dc0 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -120,13 +120,14 @@ EXTRA_OECONF += "--with-fop=no \
 "
 
 OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
-PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
+PACKAGECONFIG ??= "dga dri2 udev ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
 "
 
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
+PACKAGECONFIG[dga] = "--enable-dga,--disable-dga"
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,virtual/mesa"
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2"
 # DRI3 requires xshmfence to also be enabled
-- 
2.20.1


