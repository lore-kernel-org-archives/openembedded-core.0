Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id 490526C4E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 22:57:37 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id w23so10146824lfc.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 15:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xq4tjl8JpKw94vVeeknCU8blUxAOZwpcUzp83q6ei9s=;
	b=Mdda8aZ+ioWp0jlkkLium+pOxeslCfEdTNLUisb4Xn0iZcUEjHKnInXp3uflfxFJoG
	W/s5OAdDIp3+VBrGyVfRFMCxx/w2YVa+ZFn1eUKZ/a743FzreVoun8jwPx+PqamuRt+8
	MykCZ7TJFzvfTsdmw85PqKx8MSo2jD8o+ScuwDi2DEnDyW7Fe9TIlVHI0RimQacGLU6C
	3C+Qnzd/PuuLfgjzNCAOm3uM6E8uwen1LROmRHjan5uiOQCbLLBFmP0P44+ODipSdgjV
	2A0/4ibiRIETTuInHxLa54VcFrJQl2QBKHsDDXpyniRhVTidmBP1grW5kBNrskie5rgR
	g1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xq4tjl8JpKw94vVeeknCU8blUxAOZwpcUzp83q6ei9s=;
	b=XYdVv8J5bcfBNJadAZcOHWxIEPDpT1LhlN77XWOFUZGgVQkiXoE0tIMjQyAOfm+8+N
	In7Vc9V2HUbZMt9eBG2Nn+9FcR/1Kl5mKCIR94NZ5bDrzX9xzcsorkfXxz2C8SQdjVWn
	AS1y2572e/Ks0LnSDgHZmPUoTuRPu0Tq70Z0X30PN4hIhU/qarbVpD5E3DiHH/hd7Kjy
	QOdZhbtWxvzzcSasz0W2c6Gd8btnFVb3JoNKrWO1nojGGkTvOJWfGNsYKehNS7xPhQ6G
	/ipQ5tr+Qe3cdPwD/efMbuJlOpdnkHA1bdWqzqMx7MDbZ2sDnmUmKzxrPeYt3q+tn4La
	TjVg==
X-Gm-Message-State: APjAAAVA6n015d1cO6ukF78NKfxRsz/YHmTFXgWqmz/xw8JyojZI1ywt
	6TpZgQeUTuO/5JZ3pEiDScUrtgmhEgY=
X-Google-Smtp-Source: APXvYqzTkUZq30B0hhtFWGf7NTWIMj6yJLAS/ewQlSnc/2mvQ4lOBrH5zbcKGDs9FzT8kjfHoAX3KA==
X-Received: by 2002:ac2:523a:: with SMTP id i26mr7222494lfl.118.1555973857632; 
	Mon, 22 Apr 2019 15:57:37 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z13sm2889511ljk.41.2019.04.22.15.57.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 15:57:37 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 00:57:35 +0200
Message-Id: <20190422225735.17275-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libpsl: update to 0.21.0
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
X-List-Received-Date: Mon, 22 Apr 2019 22:57:37 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libpsl/{libpsl_0.20.2.bb => libpsl_0.21.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpsl/{libpsl_0.20.2.bb => libpsl_0.21.0.bb} (80%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.20.2.bb b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
similarity index 80%
rename from meta/recipes-support/libpsl/libpsl_0.20.2.bb
rename to meta/recipes-support/libpsl/libpsl_0.21.0.bb
index 5cb20d46bc..f545ba076f 100644
--- a/meta/recipes-support/libpsl/libpsl_0.20.2.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5437030d9e4fbe7267ced058ddb8a7f5 \
                     file://COPYING;md5=f41d10997a12da5ee3c24ceeb0148d18"
 
 SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "f604f7d30d64bc673870ecf84b860a1e"
-SRC_URI[sha256sum] = "f8fd0aeb66252dfcc638f14d9be1e2362fdaf2ca86bde0444ff4d5cc961b560f"
+SRC_URI[md5sum] = "171e96d887709e36a57f4ee627bf82d2"
+SRC_URI[sha256sum] = "41bd1c75a375b85c337b59783f5deb93dbb443fb0a52d257f403df7bd653ee12"
 
 UPSTREAM_CHECK_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-- 
2.17.1


