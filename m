Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 75BC161858
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 19:39:41 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id j20so1064288pll.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 11:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OmTTcbyecX5rLuU3TGpOGj7vx8fG83vl1bZuKaumqFc=;
	b=pUhlFXBcfb2sgib9FU2dDboID78lDtwkP6Q1ohpSx0A057AXtt829DvVglRu3Fq+ae
	p1VOtHiF5uUm2KTpX2Yp5Ry1gBRcTFQoROT/fdtBA5bdySYuwemIqahHxCK6b3Y3CmaD
	trPL/c3rbiqmp67IH4NqLVes6tVSlDgtm2tNoLOjOoMaUCHbU1tZ+dII0aBSPyOIyh5v
	RjaGzBzm4gxvmTe9TPOV6nI/xjBYCbAEc4u4jiyNImqoKJXJvVKOPMe0F+ux1hZveCGJ
	kpsJ8xL9bDf8hbJ4pn9o6O++/c0vqAzcR2YV3NrO4LmtvNhTCqHR8lmtenMPywLtIAzp
	3UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=OmTTcbyecX5rLuU3TGpOGj7vx8fG83vl1bZuKaumqFc=;
	b=Tw0Sl7oLfOMFD1yr0JI9yTYmb+R1k9rwhZqX2lxLtb4v9N7p1qhsqsNM1hajQDtp8a
	caN1Z+A3C69FHC3ByIpE1MmRiLEWh3TbK+OIVKnQNg7IFL+uWlaXnfs8Syqq6AKrOpb9
	wFIf9idRlW/RIl9rwXgv16/c80lgM5qMquJ0kmdMqES8iU3VSzPcfNgfKD07c7eXRH1e
	xDgytpqAyxzCYauuZZfI3l5gbqBMWRXVXF+TbBZkohEyQN/pHNGBotLmy03orBhxGf0P
	hOhQoqoQQa4B9HN3/SIArgxycx0LesSba4iLX3lEUdGf0ueWVsUvZwKv2vtSpWxhnq7w
	FuYw==
X-Gm-Message-State: ANhLgQ30I4gk5vphbIwdqEUORF1ahkLcMsA+6YAWxwd0KeIU2pa89wSU
	W1xSk2+pV/SXeFZCnNas0B7jAyrj
X-Google-Smtp-Source: ADFU+vs+J9xqV4MOEV/iFRb8qA+a3UmDwU3EY0iR/Bf0gfBEBYPRpdx/yahBQXYDpPqsS0Hzie1tMg==
X-Received: by 2002:a17:902:fe92:: with SMTP id
	x18mr4292017plm.52.1583350782062; 
	Wed, 04 Mar 2020 11:39:42 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	g12sm28392139pfh.170.2020.03.04.11.39.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 11:39:41 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id F41AE2A07BB; Wed,  4 Mar 2020 11:39:39 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 11:39:36 -0800
Message-Id: <20200304193936.27389-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] buildtools-extended-tarball: add nativesdk-libxcrypt-dev
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
X-List-Received-Date: Wed, 04 Mar 2020 19:39:41 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

virtual/crypt-native is assume provided in bitbake.conf, so
buildtools-extended-tarball shoud provide crypt since it doesn't
use the host's headers/libraries.

[YOCTO #13714]

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index d756036373..4a79b09fda 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -25,6 +25,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libstdc++-dev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
+    nativesdk-libxcrypt-dev \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.20.1


