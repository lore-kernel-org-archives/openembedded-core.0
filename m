Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id C10096C0BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 21:30:46 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id x10so9667208edh.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 14:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EbyTT9deZZ1XAORsfydFhNNBIz+LIxkWDzzabB9gLMc=;
	b=tKzm0fNZanrzMSTICrt87Fw0Q4VQI9D95BBK/Fz+JLZXxoKRMh7687EABxKmVnZnKz
	9T2aNBjNQBOso7YN+UBD0GqzVNPmvdbhcOhLP+2vr6ukSmSP3c4HftkhKNGVa1iJp2OG
	24cmc2Ewdmz0XnSMiOKbPbBSPqIIsS4JoLcYQW3Rgsp5+DtyvAfl32QzrfRDJ89t0mXK
	eGEE9PaVNjtxo5QucAfRqUNGFtL8popp4hrcsNfE5WYo/NuatycaqpaBxp7ap3Yxhz7v
	K8eh4WNkYF2o6OJFvm8FIT/NB/YiZbCFeoRfWR+2Lf0BpFUM1fqNQP0uz0fYGOZ+mDcU
	1L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EbyTT9deZZ1XAORsfydFhNNBIz+LIxkWDzzabB9gLMc=;
	b=mFItm/LxSKz7Tr8s83EbPppXJpjcJrpY+/97E8F2W0/82/re98fshVCpwLKRM9CsQr
	cCBvS7sRH8exBsNcwhfD9LyvpYprqM+ObKklgYYweFqBtCtjYdmEatNF/MJt8NK6hDa9
	k4rkgPUE9EB4YJVQa7bmvpVX7zyHi/70rzNIKobfVqV2vEWV9c0LEmXZK3j/e0PZ9J8N
	bj1lYugaMNUqXhW5CjuicMyaFqkOyAYtMwbq51LVBjEpuV3wkLH8EChCEmTdQM0i7pxR
	IdqynCU9laMp0TL7dv/3svPmKuJbmLuXi1gG50+ZNCCoRnNkSprTHWIUJS1awQtjHh58
	CQsQ==
X-Gm-Message-State: APjAAAX9c6O1ofKhBTPZFdrYs4Zu7QxVTz3oj1VffNZxYOx8M4b/Y7r9
	61C029sG8zi+3CvgizZPYHrIqAEPCOY=
X-Google-Smtp-Source: APXvYqzQQ7ZKlDKPdmZLeQw6uO70WwwPSBtw6+fhsuFDBkvi7PFeLsXFVzRGiGuRk9v/kxafwezbxw==
X-Received: by 2002:a17:906:2781:: with SMTP id
	j1mr37970519ejc.238.1554154246899; 
	Mon, 01 Apr 2019 14:30:46 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	e14sm3505771ede.89.2019.04.01.14.30.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 14:30:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 23:30:42 +0200
Message-Id: <20190401213042.24130-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxmu: update to 1.1.3
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
X-List-Received-Date: Mon, 01 Apr 2019 21:30:47 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxmu_1.1.2.bb => libxmu_1.1.3.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxmu_1.1.2.bb => libxmu_1.1.3.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb
index 4740c15732..dc3179f53e 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb
@@ -7,7 +7,6 @@ Widgets. A subset of the functions that do not rely on the Athena \
 Widgets (libXaw) or X Toolkit Instrinsics (libXt) are provided in a \
 second library, libXmuu."
 
-
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT-style"
@@ -28,8 +27,8 @@ FILES_libxmuu = "${libdir}/libXmuu.so.*"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "41d92ab627dfa06568076043f3e089e4"
-SRC_URI[sha256sum] = "756edc7c383254eef8b4e1b733c3bf1dc061b523c9f9833ac7058378b8349d0b"
+SRC_URI[md5sum] = "ac774cff8b493f566088a255dbf91201"
+SRC_URI[sha256sum] = "9c343225e7c3dc0904f2122b562278da5fed639b1b5e880d25111561bac5b731"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.17.1


