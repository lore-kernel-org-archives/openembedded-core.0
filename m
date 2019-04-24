Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4517D676
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:56:12 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l6so3081539ljb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rJ9QxExabW5l5SNycXyXzsfkCPEsOVNkHrJIBgdk80k=;
	b=aDQKfbAjQIJ7XBpPa/bGQIDOBqmKmkfW42gjEmJ2UMQgRnWa/fEUJfQ5qyrgAWehI2
	smoRD7FOrruHCE90XLUlGeNfaW8sSav9lQ5zk6Hb09EipyGvQVWF5h54QMYgbFNqd5Sh
	xfpPW/DlYzhSxCMceim+ZQKTkAUVqXza7rZ4QrbQKmQUJkqPbtJ/LGu6uS0DUifSYx47
	LhR7U6YbaYP/l3m7MFc63jno4hPjLqZ5l8u4YIGAz8TJ7hgKGSuxkmKU5GPHKA5NJVZ/
	WCJYTNHA1Fw6jFZqsyZ1Pz1FJR2gXshFRZPWYKIYrFms37q6H9ABAITw86A4yT3zxIt3
	gx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rJ9QxExabW5l5SNycXyXzsfkCPEsOVNkHrJIBgdk80k=;
	b=NJrXRfDkwv3hM1S50LgbtWrQg1dHx2sH4i+Kgf4xNSJNWFVNHJOCAQsPaDtCcwjt92
	GSt3ykTI7PbRHNFgGKlUy8F4Kg0MC3lebeNwuaK+vv5/t1LpVZ0jylTziEXFK1wPqYaK
	sYjq5Y6fgefieUZH8+ecKFe0ejYI8dlf8kjpus6p+TgEawZyyl/n6oRSYqQtfe0OrmKt
	A+K881NzIJ8JNpbSIGw0ahe7qO5No4wsKBOB/7xLOcqV9ROfPhBxNSerOSgJPGRf/UrE
	e4QtIJarwCI2copveV38tDwUK1tcCGJ/KSEgMf28qlAcg1AbSHympU2Wv08Z7AXee6pi
	gIzg==
X-Gm-Message-State: APjAAAXWlZRhFP052YjrcRTvLng16y6ZeMQpKoFsTOvtqf9VKEXnjM7n
	2EPQ3sSvcmiBjV40yxY653atKcOu1Ew=
X-Google-Smtp-Source: APXvYqxOmFkbYwTFgfTYy56LNccActoFQUk2BT7pm8ZJ0zHzXOaN4AS3qWrtwZ/GOGpLfnEJNER4dw==
X-Received: by 2002:a2e:8507:: with SMTP id j7mr5006420lji.85.1556132172855;
	Wed, 24 Apr 2019 11:56:12 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	y65sm1352558lje.84.2019.04.24.11.56.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 11:56:12 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 20:56:08 +0200
Message-Id: <20190424185608.6920-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pip: update to 19.1
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
X-List-Received-Date: Wed, 24 Apr 2019 18:56:13 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-pip_19.0.2.bb => python3-pip_19.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_19.0.2.bb => python3-pip_19.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pip_19.0.2.bb b/meta/recipes-devtools/python/python3-pip_19.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pip_19.0.2.bb
rename to meta/recipes-devtools/python/python3-pip_19.1.bb
index d81a60caa2..aa27ba82d3 100644
--- a/meta/recipes-devtools/python/python3-pip_19.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_19.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "526fd9ec1e6ea956b3571ebfb42cf83c"
-SRC_URI[sha256sum] = "f851133f8b58283fa50d8c78675eb88d4ff4cde29b6c41205cd938b06338e0e5"
+SRC_URI[md5sum] = "22e3726252b492ce24312c2b43d0127f"
+SRC_URI[sha256sum] = "d9137cb543d8a4d73140a3282f6d777b2e786bb6abb8add3ac5b6539c82cd624"
 
 inherit pypi distutils3
 
-- 
2.17.1


