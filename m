Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id B5D437CF9D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 02:24:45 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id q66so6609405ljq.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 19:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YY81aozfVHn+wye6R/YY05sq7u5ON6f41kaQb6h0ok0=;
	b=JabOXfvcjknBKbme5uXnhagIxefAlPpMbJwOGDAvIjNtUhSDwTGokF+lga7F9BFnVj
	J+Kefcv9NOrvHgik2X1jiG1GyOCkHljp/a4rMSil2dwHTBLqlKqUATJx7eUqoCowZHsA
	GJnqahnwlB2+/CaAFSAusezKz1dgJ2QFYBJ/HQp3DDKTY4j6PDOCtrg59fir3AHTKakU
	Z/dRUvg4PCmvxmQLrdnmK7Hbf/yMFlHQfpekmx/aBVgWsmFtm/MSUmweRmnGd8hOqYiu
	EtfX9uI2jc4OjsI38XieoTOnJqXdT3HXCF1weyOrbMjfUBoAM1MJ6g1li+M8IucUNSK6
	mC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YY81aozfVHn+wye6R/YY05sq7u5ON6f41kaQb6h0ok0=;
	b=MVo7F/KSR8BzMgaCqJ3yZJ64bhTi4PJXmKZ2FFrOGf8KfOndRRldzhr8f91frGt7wA
	gImt+qznkUyZOoaW5fEuM1D7mQdt0j3uaaqtJmdERZk9W5w8Ax03OLcuWgOU2T6/Aum1
	KIyhLrjnWYICmBGD4acGjhqv9+ZFxpJzAJM+b7wiW8WGGbsc5Lji+Kk5QQGEr71AgJ4Z
	YIfWlksSRCvQbF1FPSLNy/jGMMHxHrDjeP2sMNO0HQncv9zuz3kLdQuzDyKmKRKonbPT
	rgDOxpzYEreaD3PxbGXNF6+WodFDvcplxtG63lno1UMHRhPvwDZEJPnF47Q2VeCk6Fq7
	Wlzg==
X-Gm-Message-State: APjAAAXjBYmYX92k0HPZ+75U8pPshrgz5evsKv1CfLLyj5XfWGDTvKGP
	JYf2XDOB7fjSQgMC0RgpIPgQgjlv+OI=
X-Google-Smtp-Source: APXvYqz8yxd3Te0m0vHvHCfy2fAv8noryQlAYlCsQx4+ykuCszDqMWaULKwcppGyDul6ZusNwUn+rQ==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr8852745ljg.10.1554085485723; 
	Sun, 31 Mar 2019 19:24:45 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	187sm1774905ljj.46.2019.03.31.19.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 19:24:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 04:24:43 +0200
Message-Id: <20190401022443.16656-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libyaml: update to 0.2.2
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
X-List-Received-Date: Mon, 01 Apr 2019 02:24:46 -0000

LICENSE checksum was changed due to copyright year change.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libyaml/{libyaml_0.2.1.bb => libyaml_0.2.2.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libyaml/{libyaml_0.2.1.bb => libyaml_0.2.2.bb} (62%)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.1.bb b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
similarity index 62%
rename from meta/recipes-support/libyaml/libyaml_0.2.1.bb
rename to meta/recipes-support/libyaml/libyaml_0.2.2.bb
index d77891825f..0d9e8bfc5e 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.1.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
@@ -5,13 +5,13 @@ HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
 SECTION = "libs/devel"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5591701d32590f9fa94f3bfee820b634"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
 
 SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
-SRC_URI[md5sum] = "72724b9736923c517e5a8fc6757ef03d"
-SRC_URI[sha256sum] = "78281145641a080fb32d6e7a87b9c0664d611dcb4d542e90baf731f51cbb59cd"
+SRC_URI[md5sum] = "2ad4119a57f94739cc39a1b482c81264"
+SRC_URI[sha256sum] = "46bca77dc8be954686cff21888d6ce10ca4016b360ae1f56962e6882a17aa1fe"
 
-S = "${WORKDIR}/yaml-${PV}"
+S = "${WORKDIR}/libyaml-${PV}"
 
 inherit autotools
 
-- 
2.17.1


