Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id BE86F7D2AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 06:30:25 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id u57so14862456edm.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 23:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=A6SluzCUj3ZAGg4KwyU9YiC7QMoRKtOPotTZS22yWTI=;
	b=QvU9WexX/I6SMhV2PvOctLdW/27WXfJHxrwEXBJg7gry23WS9QsVpPJ0U/Q4ZqCMqT
	Jpk0iIJHNHwS4PuU2+31cGkKHXVEIlW5c+WK//4sgWUUp1kBR4iiuP9nwiV2pQehCxQl
	S51QJ8ifV+vkJLeVVQaE+FC+TkyfmeWjbomVOTUAGVU2vv/Dv2hV7DvJiYUc/L/lmSH5
	k4BxoCQhmsnC4rUv5wILVdVS869alWeGeIV7N2w95PZBFi80c6d+5trXat37oUf9J2PN
	FOwFQsD/GPnp+ZoAkVaXYpX+2GXkaaOVbi2OeavhLsXGQIxjkpQZc3cZ1kBT5qzHl7PC
	7y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A6SluzCUj3ZAGg4KwyU9YiC7QMoRKtOPotTZS22yWTI=;
	b=nUeu2zxEAxeMB59deiHnQCxiOAcNM0Jn6twJalgR/ibOuYCGUYXgYAqiL+zFNHpg2Y
	Y21O31Ju+e7+xKA9zHUdkp9pOuC2Ihf7nnUq493ieathd7vz52eCn99OEUjzfJzP3149
	dFDoMK0J+K3akthpiek7NmiQVz83Hn1EVLwgQo62u7xjLUsNeWc2vY+ZHCnr3riMDnkv
	z5mk4aNuybJF+UUXRsZkaJPCirZnCSTTmFjFhHMtSBimJUwu90H4WYfg/NbbWVG3LAKW
	bmigV57vXuLakGYcGJpJllzHOZAOgD892LehEzcVP6GnkzhBux8gTqcDVDeHELRs5Pvp
	OBtA==
X-Gm-Message-State: APjAAAXqLpsOvD+AgNDe6QXBMNNj5oVTEF/w8J2zV8UCYDqi1UPlzq2r
	senmtPyqS2ZsmoC4v6p6TQT0HRf9yMk=
X-Google-Smtp-Source: APXvYqznMeN/2rdztNgvFQTGkkp+tsosrB9s2Fy47YPbbO1BdJwcxTr4VOa4YzUwythM159zgCDNPw==
X-Received: by 2002:a17:906:a48:: with SMTP id
	x8mr5504883ejf.247.1556087426172; 
	Tue, 23 Apr 2019 23:30:26 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j10sm3411320eja.58.2019.04.23.23.30.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 23:30:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 08:30:23 +0200
Message-Id: <20190424063023.21576-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python-numpy: update to 1.16.3
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
X-List-Received-Date: Wed, 24 Apr 2019 06:30:27 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc           | 4 ++--
 .../{python-numpy_1.16.2.bb => python-numpy_1.16.3.bb}        | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.16.2.bb => python-numpy_1.16.3.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 43c8960a18..43c3053cd8 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -10,8 +10,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-npy_cpu-Add-riscv-support.patch \
            ${CONFIGFILESURI} \
            "
-SRC_URI[md5sum] = "4fc754be7ec3e0f80b042d907e99f4ad"
-SRC_URI[sha256sum] = "8088221e6e27da8d5907729f0bfe798f526836f22cc59ae83a0f867e67416a3e"
+SRC_URI[md5sum] = "0886e5b5017f08f2b7a624c0b5931e61"
+SRC_URI[sha256sum] = "adf063a3f87ab89393f5eea0eb903293b112fa0a308e8c594a75ffa585d81d4f"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.16.2.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.16.2.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
-- 
2.17.1


