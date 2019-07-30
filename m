Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E39B77F332
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 15:54:43 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so63134966wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 08:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rR27vzDQyYphzkUJaW+Ab4SIsOr+PDC/HNcIhVG4NVk=;
	b=g3fsDatXNH/fSxPhprFdFLkYcy8q9kj3qbJsGdCB3Pq7fWoJYdm97GZ3cxHOsHq8HT
	2eB1IH5FpKnyvKGTPMbmG/lavslvjfeenhDhgovAl0gDEXP0sR3kL6mg77U4fhT8PHVJ
	PrEH/eOmRYfCLFpm07JMN9G1U8Ndbq9ivZTP76ETmOfwSqXuLTBUcGpPJwjdxnE8i3bB
	1Kz7bzDwcfVW5/EXkQau8f4Hx63Q0BzLhtX2KOhnwZ2i43pU1QJJS2TRTeslB3VWqxOZ
	DSTBI1E/jrEdUZdPPwez7r3w8W0tqmciESxkB1ksAljluH5pXTpXYvKC1+AAVM8YuWDI
	kA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rR27vzDQyYphzkUJaW+Ab4SIsOr+PDC/HNcIhVG4NVk=;
	b=m+yhOZj/GmMgRIqgOSR56+hlJw3N75Mgks1ZM18wG/MJjzn4sOpBWotpptUFIRFHqh
	pN6Rt49+J7LxX8hQiO7pitEwiOBGcyedGClwsDEzU2xm0qov/Rg6IBEk/R1+7eowiW6Q
	ZIvda9s+W2FxuL9NYvOEuTky/ZGK4TR6vHxgXfiTfk/PusLoDZkdTY8/ed90L7mbShnx
	jwrylOFauLAfy1+/Z7yRLMoZrX5b8FDc+yShsF7oWkURVwxUIuLivRcdRwg2IjElv38L
	go/mE5SEToefxCE8hlYINj3D1YabDdPe232+gcxfJZOQjyrUQrXvFTlTUjMcuiC2M2Lh
	N0ew==
X-Gm-Message-State: APjAAAVa93dwjvrBWp0lPumixHRrU2H6vxyOA5ukcHi2r2u/2kZwONEX
	fyjQF4vNeCFLbX0rxbaByJB80uAezwM=
X-Google-Smtp-Source: APXvYqz/aOIFHlzbgvpqxq8YHAa3Yy5c4kjpCd+QSln9O30Cl+IiU0q6JDawoPlnnxaGRu4AD01CkQ==
X-Received: by 2002:adf:e343:: with SMTP id n3mr89455657wrj.103.1564502084385; 
	Tue, 30 Jul 2019 08:54:44 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c3sm70781403wrx.19.2019.07.30.08.54.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 08:54:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 17:54:29 +0200
Message-Id: <20190730155432.96611-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155432.96611-1-alex.kanavin@gmail.com>
References: <20190730155432.96611-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/8] libwebp: upgrade 1.0.2 -> 1.0.3
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
X-List-Received-Date: Tue, 30 Jul 2019 15:54:44 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webp/{libwebp_1.0.2.bb => libwebp_1.0.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.0.2.bb => libwebp_1.0.3.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.0.2.bb b/meta/recipes-multimedia/webp/libwebp_1.0.3.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_1.0.2.bb
rename to meta/recipes-multimedia/webp/libwebp_1.0.3.bb
index 8b3ffe02132..01fc02d23b9 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.0.2.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.0.3.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "02c0c55f1dd8612cd4d462e3409ad35d"
-SRC_URI[sha256sum] = "3d47b48c40ed6476e8047b2ddb81d93835e0ca1b8d3e8c679afbb3004dd564b1"
+SRC_URI[md5sum] = "906ad85daaaa2eac97c8aa2dec9e8b77"
+SRC_URI[sha256sum] = "e20a07865c8697bba00aebccc6f54912d6bc333bb4d604e6b07491c1a226b34f"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.17.1


