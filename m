Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxWHP-0004JL-0U
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 06:20:17 +0100
Received: by mail-ob0-f179.google.com with SMTP id x4so6690185obh.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 21:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=eHJj8EGyyRcpA5TZuL1pDKcUCUssYFlnXz6T033PP04=;
	b=seKCnccFPDYg2C9PeN6YJAPtjlKqdPABRoM1WmNp6TCWbjODJ0YRLen8JzGJ90A3j4
	r2SwlOg1m5mYzYQavYqgZnXCaiJQaTlfzdfC3uAvUwqKWoKecVKicWWKbL/fbWH7LH6i
	uSMUzXTdMvK3FGNhuKHUsFqRhCAEmnRU7vU6/DGFuv9KA+IT8z7YGooeBuSEQ/kYAkaB
	QknHxNUTMWxpz0w2KrkAS7g7qiEIYXH80+seV7cme0UBDY6tfrM6pXgVY4baIxQ4wK54
	NAPnNuyVr+Sgy96gHhjFt5hdJoSsmQGBvORkFOBl8j+Z78VF3u0gIM4fgIuyHj/NKCdL
	Iy4g==
X-Received: by 10.182.48.69 with SMTP id j5mr15646358obn.17.1358831085113;
	Mon, 21 Jan 2013 21:04:45 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id zz6sm12729989oeb.1.2013.01.21.21.04.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 21:04:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 21:04:29 -0800
Message-Id: <d28e26f25f925112139add38dd723d80f47fdc56.1358830857.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <e9f39209e9fdf88a6205eb59b482c830eda83aa6.1358830857.git.raj.khem@gmail.com>
References: <e9f39209e9fdf88a6205eb59b482c830eda83aa6.1358830857.git.raj.khem@gmail.com>
In-Reply-To: <cover.1358830857.git.raj.khem@gmail.com>
References: <cover.1358830857.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] qemu.inc: Define preferred providers for libgl, libgles1 and libgles2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 05:20:55 -0000

This is needed to to boot efl images on qemuarm,qemumips and qemuppc
these options were already defined for qemux86 and qemux86-64 and
therefore the images were booting fine for these two machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/qemu.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index c1012ab..de694bd 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,5 +1,8 @@
 PCMCIA_MANAGER = "pcmciautils"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
 
 XSERVER ?= "xserver-xorg \
             mesa-dri-driver-swrast \
-- 
1.7.9.5



