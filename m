Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id AFF746C13D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:08:19 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 125so3672503wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z2VMAokIeTPaowmaSsmTQPR/k64aU32x10DFtef+9Yo=;
	b=mHs7d6pyQhP5H4wm82qbjhUPlaca1plNDKG6qIM7fThIqBzSnVI40z2b4JTlW4wkEI
	n+a/8R6Tj/4C+xQUQnurLsyXdzwH//2+xcG+lyQQ0IieCvNDN8e6kHXyhk4Rl6UIZ5up
	dhmFPF7QvsnamtmP+8K7p/LDtMNAqDARp4oseONR/fdgNd7GSDx+ZdlyBBGw+jM9lkXh
	k5FbSL1yDJ8NBKsIgouOr64TEcbpXi90F4kTgFv7B1GEb4G9YJ3DVz0NDHy2eh0zNx2i
	BKqOO+DybufSNF8TspRMQ6birTENeWQidKd5pLR3Y7/L8MeBdm4wwavmUNB0zVxN3U+7
	dWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z2VMAokIeTPaowmaSsmTQPR/k64aU32x10DFtef+9Yo=;
	b=lJnUmMbP7hiqQwe5Y9hjacdyjhnPh+RwVulQ8uRKAsBbxQ9zDHjg/VibfJa7tua/+Z
	byueOdi7cqKG4/a0IAsT5pm0X3OeNeMExpP42Ct+9xIphGWvsRaK8Upd8VUKIsPRE1L6
	h/SmTCUbJnAD4V1T12hrpdBH0KY3/jwOtFgWQieMeNsBLFzYC3hLXAm7sinZzB5j7e2E
	tBNxDxLkRyyCQP5/JdrS3dZmleXtSC7mO5gUmoU36Znh4pKS88KZTOhpEdoI6M8DLZdT
	lVT/qu+yoBGfC4Md7q12ThV1ufVCZodSGkCAs8owytCLhhVOZlxWSRTljEs8WwOUmhGx
	xuSQ==
X-Gm-Message-State: AGRZ1gJmHzHANi//xHhcVBIKAYLCCf4eN5Vfi+ES4t6xWBDYXo9S4tnG
	rqFzyBay+obVhpxLy4EzupZK6eky
X-Google-Smtp-Source: AFSGD/WV06nC/luMg6/FGbtjwkKRJhYmwYRuPrdh7GzNEkAQdYidNdZ5f93dfgJGysd5uNvdMa9aaw==
X-Received: by 2002:a1c:4046:: with SMTP id n67mr7228996wma.123.1542640099979; 
	Mon, 19 Nov 2018 07:08:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm78042526wmf.22.2018.11.19.07.08.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:08:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 16:08:09 +0100
Message-Id: <20181119150810.94381-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119150810.94381-1-alex.kanavin@gmail.com>
References: <20181119150810.94381-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/6] libsolv: update to 0.7.1
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
X-List-Received-Date: Mon, 19 Nov 2018 15:08:20 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsolv/{libsolv_0.6.35.bb => libsolv_0.7.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.35.bb => libsolv_0.7.1.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.35.bb b/meta/recipes-extended/libsolv/libsolv_0.7.1.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.6.35.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.1.bb
index 12dfc5d3a2b..9e0952128e8 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.1.bb
@@ -12,7 +12,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "38c5374d4712667b0b6ada4bf78ddbb343095d0c"
+SRCREV = "aae08b819742abba7c44510797077c5f25f3ed00"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


