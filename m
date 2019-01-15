Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9043F7C141
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f188so3874915wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nfsWBpNUdF9h5DgreoovAdTam7h8FJckkikIZONVh38=;
	b=tfCuxPLYlN4SLWbop3jUaXH8eWZbXAHCKFrgNZzdZmeeNGUFpd717WbKDfAd2ddpPU
	xT5NMtZXd19r83mASYQ1Yj1iD3XMJJSrFNiTxnIxd+owLSMYPT2glzV4aV3DqABTriF+
	nW8mtZMn8XOIQb1LlaVfupCSDCDrtmFVUxLIk4+2p10LuKgB6YLlZfZIhuhnZWNOAIid
	gxFO6nqPIm9RV5O6OO2i5Fu/Z9yvo+mOeLD/7KzrVkTrzT+LIQVFeQhfuXM80fO3p81l
	i4/Z4jnvVt0Aw3FPE0ClTo4UP6nqZKIOHOYJoFP1sPXpFQqq4tFKSjMZKHvxoEW30g9I
	QRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nfsWBpNUdF9h5DgreoovAdTam7h8FJckkikIZONVh38=;
	b=Zlzo1Vz9q2r4CXxrqy+9B4I53yKOhuo/J1f0uy2C0MSokwnbFHdV/Wgx7tT5guJjBH
	N4X22b5NgwOh9xLoc1eCfKFnPfyiu/eqctKBhVK1pEeIfAUPfxHmA2apk87B1gWHq3HT
	EMppcmy2uxK2c6YprXdTVgTyHdFHrU3HEQLNuMDUz2I0df7p06QljR4rEJmivtPEb2tG
	dW5HExUB+yLBJBzTgn5gW8YU7YMaP3KFICH5QWJPdMbJ1G7Xt6Ss+D0v+YvRvpnbocuB
	f55Wu5hE93xJeNQ07ZtMvjVBvUbZ84mKO4UDYf/iSQhm0I04lGHY+gfLJH1YpGbYTJU/
	+tcw==
X-Gm-Message-State: AJcUukcr/awnfliNXJUY8p8e/oWR7Ra8rudzwQUT4m/ITNKG9zGMb6xf
	kkBlZZbjKAQQFrxiMri7OysfU30kUt8=
X-Google-Smtp-Source: ALg8bN5RnEIbqxDTyvReNq8+Uaj3zkvpqK6h2WL+5o0j+FKPcpmRyo8bkZRoWyCs62gfspUk+UXsmw==
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr4159788wme.152.1547570358103;
	Tue, 15 Jan 2019 08:39:18 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:49 +0100
Message-Id: <28d0bb802e55ce68575dc9e593fb6c76d1e01549.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 14/22] qemu: remove support for building against host sdl
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:17 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 531f0a04c58..db9c2245df9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,14 +39,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


