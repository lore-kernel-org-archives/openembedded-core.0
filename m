Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id DF5377CA8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:48:55 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id s1so1022513qte.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 05:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=0vUv27TI2wiHZA/sFLejXT26kQtVYuzD7Cev7FuVdMc=;
	b=xdFCZV5yfQWsJ4W4bTJr7a3Df3+dPT6LwAojhUVNEgzpMSba1JLoc5b3wq+Xldck0c
	eFIcMMHR6+Y/i6S67pR0/HMWs+1W32a227mqoSChEzrFViLFnlvwnBaXTqRS81vyW2xG
	j5BqWip5AxSwEMEz9Ko+5ASmoxxxDM5Rx0bR9PsE3mge85/gA4V7PUMStGmPoBkT7bXQ
	ytG2oZCHEYXA9scN8ujYywpX6l1gNl3tySH8U70uKtvYyEOulRGxhgmxo0buWxZm6tk7
	IpzTbBWasZbLiYzaawDsl+vgVPqzfntJvg0Bfzs0gswbBKH5WEZH4ItL8go2QHi1ea2s
	zVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=0vUv27TI2wiHZA/sFLejXT26kQtVYuzD7Cev7FuVdMc=;
	b=LvgeMnkks0r00qljGR12VKUx6NI3SdAGUeZKsQIoGiEMztsX8pVm+ScOUyVKJGzeLG
	Vmj8p2wMvcW/bHC2DPRCLfhRAGl4XY7obfAekCgilrZHfed8YhPkCe0njHYveisYKPop
	Ipyu/hxXwyFU34w+PPwlJ/35jePTvqqxUcVHvKY0osiVda2s66zCg+5uTI79s0UD9ziw
	CFCsYKXfq6un4cVTP0EcnlE+dxx7foFE+dWpgOHBx/iLobh8tHK9sNPRlVZIy27llrQK
	T5lclwo+ISh/ZV5yLIRrftCuHuZcpqe3+6AHM09egWam+MirFu6i91z6dNJ4WcPiFkz1
	uXsg==
X-Gm-Message-State: AHQUAuaj3PUTsOSCXw1q8MhUJwbzb8TFi32NOq2NyxgD5rnFsTYCcFQU
	C8dpMN+t2Ro0fLbMtWCS5/9Giu230IJMFw==
X-Google-Smtp-Source: AHgI3IbwChapgbjbuRMEzQIIEYw/Eumsn4RVGnnx3gaFMGlIUDoF6DFLpjp9mHKYvIXzoDF9D3HZqA==
X-Received: by 2002:a0c:d4ab:: with SMTP id u40mr26161159qvh.30.1550670536580; 
	Wed, 20 Feb 2019 05:48:56 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	y11sm19500140qky.2.2019.02.20.05.48.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 05:48:55 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 10:48:43 -0300
Message-Id: <20190220134843.7699-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] libdrm: Upgrade 2.4.96 -> 2.4.97
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
X-List-Received-Date: Wed, 20 Feb 2019 13:48:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../drm/{libdrm_2.4.96.bb => libdrm_2.4.97.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.96.bb => libdrm_2.4.97.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.96.bb b/meta/recipes-graphics/drm/libdrm_2.4.97.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.96.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.97.bb
index 1c9e0e9f95..bbe9a33ba9 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.96.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.97.bb
@@ -12,8 +12,8 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://musl-ioctl.patch"
-SRC_URI[md5sum] = "f296d87272b1befeada3bb135751ab3d"
-SRC_URI[sha256sum] = "0d561acf7bb4cc59dc82415100e6c1a44860e8c380e00f9592923e3cd08db393"
+SRC_URI[md5sum] = "acef22d0c62c89692348c2dd5591393e"
+SRC_URI[sha256sum] = "77d0ccda3e10d6593398edb70b1566bfe1a23a39bd3da98ace2147692eadd123"
 
 inherit meson pkgconfig manpages
 
-- 
2.20.1


