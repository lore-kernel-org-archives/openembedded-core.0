Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D82FF76C01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:46 +0000 (UTC)
Received: by iodv127 with SMTP id v127so161982895iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=D5FX3quNoswoETKQTib7aOffolo5zkWBPitM1VybRBo=;
	b=y7AIOzRX/vR0YsjhuhjAEwjlq7OFbCEVMuuQ+ckmd5Dc5qA0u+NSbN+UI5fLK1bhV3
	2QJJJ2ngziCkHwOIy1FXD+cUi9I+2fBabF5cul96IiL4MxoAGHMZioWQy9GkuZp0gmkc
	pHyouv6PQHB/uQKGtiq3D3pLCZecgHuDoj74QYWm1VX/DuOyG1ngzys23M1lF7Ac03ro
	1wN6OY7QutB41XurvsGG5xYGh2GeE+7PLMEnvZPOT8Ebl3Rot8EaIp3/D9B0EsboZnaJ
	YFzHe4bOeuLvjrwv9+A3GU6/OHmdgpZKRV/9+Xbq2s7WcC/JYqTdJULY16ss07MGfQv2
	EiFw==
X-Received: by 10.107.34.144 with SMTP id i138mr14791925ioi.127.1440446626923; 
	Mon, 24 Aug 2015 13:03:46 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:30 -0700
Message-Id: <e31434fa47284c71bdc27958a0b1432d2ab45fe2.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 12/17] systemd: Remove exporting special CPP
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:47 -0000

This is no more needed.
it was done long ago while systemd lived in meta-openembedded
http://lists.openembedded.org/pipermail/openembedded-commits/2012-August/141061.html
The accompanying patch has been applied to systemd already so we were
not needing to set CPP for sometime now.

as a nice side effect it helps compiling systemd with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_224.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_224.bb b/meta/recipes-core/systemd/systemd_224.bb
index 97d5d22..98efe7a 100644
--- a/meta/recipes-core/systemd/systemd_224.bb
+++ b/meta/recipes-core/systemd/systemd_224.bb
@@ -122,7 +122,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 
 do_configure_prepend() {
-	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 	export NM="${HOST_PREFIX}gcc-nm"
 	export AR="${HOST_PREFIX}gcc-ar"
 	export RANLIB="${HOST_PREFIX}gcc-ranlib"
-- 
2.1.4


