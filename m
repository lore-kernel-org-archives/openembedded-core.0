Return-Path: <matt@madison.systems>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 024E37893E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:19 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f23-v6so4545161plr.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V8JTJKe3s+g4y1kAfTZn+Wo4yxRy63bBGNuOi+Fq5QU=;
	b=hGKIbyKYsmAUuLCrXcEuVu3dklzYLEMpSxlr2YhTuardTengiUlkLXt6LOtV7MH1iC
	KaGBZChdfWSXi2lGX9suc3sS7uv6WqSd86IA98X4UxzqEjUe6BHFPic9oSeY6deturoK
	2nyllQFYtv3bKMku+bv3FCHXOk87/w7Km9KMXo98HhQYwYHtL9Y5w7WMMYF+WzsgC4MV
	27FnINoSAXurf1CERFKTM0G4tRZ849wh23ryxl2iIxpRhy10O+/BG8qdaGaytuyeo6tC
	YmVhEvtlnaOzQEKk6bzoTODhxuxIdFDF7NMAcPZ94pPSbvmbdxdm2UUyfNXwTDaBAv/q
	vixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V8JTJKe3s+g4y1kAfTZn+Wo4yxRy63bBGNuOi+Fq5QU=;
	b=CvIh9mDUJmImy4EYdjTjpzSGW94gDrFn9GTGf9O85eJWI21dfV6HqjCyH1kzswwURQ
	Y18pCQ++pU4azeVD5whqQtmidxo1u2UfsGlab30Po5UcPNY1R/PFUcuc23KiUqZs2cE9
	8/Zt6Xjc7SNaVEFlLpIrs4UVIggP/6ExEMnTsttRf9SzKjHpsbf71giGcOAmu9k1N4ow
	NNl+/S0YPRNCuSCQPMZ4ijdn1kpFzgkOkXgVoV0tnVPOp4EWTmlLYZL7LYmzPOZUr+hh
	mks0G5r8bOWPZ94GyPgvkdUl2Sr1YvUSERH6+MYjeJEzfYJj91TOPPsqazrBGL/kdhb4
	q/Iw==
X-Gm-Message-State: APf1xPCYJZKXx1UQwtJDXxlnhVgpxYKkOqVGvc2qvmvYiDFh0zhkaTre
	7ANWKXiqeWL50wM4G0M6ZgwXgV9f
X-Google-Smtp-Source: AG47ELvwsrCF4SNaIh5qYTYlHp0ogYNmi3pryRyk0pDfSIylihH1BVo+0pULnbQ1qVe4NcanYuiC2A==
X-Received: by 2002:a17:902:b901:: with SMTP id
	bf1-v6mr3399797plb.175.1519946240769; 
	Thu, 01 Mar 2018 15:17:20 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:19 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:52 -0800
Message-Id: <20180301231654.24018-12-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 11/13] packagegroup-go-sdk-target: add go-runtime-staticdev
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:20 -0000

to allow go programs to be linked either statically or
dynamically when cross-compiling with the SDK.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
index 3e190770a7..7d2ccbda22 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -5,4 +5,5 @@ inherit packagegroup goarch
 RDEPENDS_${PN} = " \
     go-runtime \
     go-runtime-dev \
+    go-runtime-staticdev \
 "
-- 
2.14.1


