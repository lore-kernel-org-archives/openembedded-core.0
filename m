Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6477A7028C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 13:40:53 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so4454595wes.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 06:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bbcUJTfsUXj9aomaIg+Jewf8oAFt6wn/4zl0xLwYHtk=;
	b=klmrUm5oys2ojTDLJE2xhw0eHhZIzJDKxjtIg9lxl76k6nLuv/xMCYDKrS9ooO2bvW
	hNHZRFVXGpeD5boNzqCUhK9UBuGGJfQdyMOC9gU45R2TYZMQwTXR3FaAqFZPBlW+a+Lt
	Q2aykh+SOIFPJIyFAMI/AIFhtPPA8Tm18kYEhR9s9hsMPp7fUGWfLbZ/VnUoooQbqp42
	sglpWht9sgKnqOKevM/Eh62YmOkvbCDP4IHqdoSh1uXil38BGi8G14J4nn+Yg/cQ+hec
	+EfNkrdjx76elBhO2pMgy/w3ORn/E014aO1Cr9n1MAWbHsXqdp71U5oy71OXboz2lbeE
	M0Dg==
X-Gm-Message-State: ALoCoQkOx8WwA3R7dNZP48C0dZcTlknsHGYcA6pulRT80wH3bc2hQ9tWWbE7+EVfqmD81KTyp3Nh
X-Received: by 10.194.133.1 with SMTP id oy1mr32560329wjb.87.1404740453854;
	Mon, 07 Jul 2014 06:40:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	jb16sm115349396wic.10.2014.07.07.06.40.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 06:40:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 14:40:48 +0100
Message-Id: <1404740449-28121-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][xserver 1/2] xserver-xorg: add PACKAGECONFIG for libunwind
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
X-List-Received-Date: Mon, 07 Jul 2014 13:40:59 -0000

The automatic detection of libunwind causes non-deterministic builds, so add a
PACKAGECONFIG option for it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b9b9ac4..48ab347 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -122,6 +122,7 @@ PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86dripro
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
 PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto libxshmfence"
 PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
+PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
1.7.10.4


