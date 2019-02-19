Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id A93037C9D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:37 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q1so22950618wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iy9wQqI6sZq461bETOY5T9E0DSmrWEgJ7gmPtfirFkc=;
	b=sbjGU21UoPpx86rgx8CP70Yj/lblPAt0lgUuwS4IiZbL2PDkceH+UlihTcFvpG550J
	ki7nm1w8XUaSIdJBLmf435o10Xs8R584adD1OW08MSG5DtL27EgZ9iT1a0KZB4MLkxoB
	uDor9L4vvcB7l+ZoCM1uFeubb8eFhzD2qeEH5I1Hwxgzb4/iXFEWJBRiqiAphVl8vsNO
	FsEVFnUgEFM30jgGAAM7LB7TjwZWCpNhOC9LHoD/70NFY4xWbb02kJqjqdNN6/dTYdbw
	wPcx5veUfJiqLikeNshqCWj/ZqqzsCK+F6hlI48/bsHsybEg6dYKqGZz/w2vDDOh3UvJ
	R6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iy9wQqI6sZq461bETOY5T9E0DSmrWEgJ7gmPtfirFkc=;
	b=l2OWkNoMrEhkPKNnKFXT813e9bydVWbnFWXKRx3EK5kL/Gef1zh8d5EoBwNV1UPlhO
	bn/3LZw5xF9mPuJKvRvpeGj7HblMpn1pDU7ChFjYGQPH57Jvu8xydUIXhltgyRn+MdAo
	lSf+h8wcGl8bP1v9TaOCmG/i+TtMmAZGUiSnpeEkwtBeRhuV0rkbu3IrirGPe7gle7At
	KO3nScDnGIuuvr3VEnKuRCxTcTHGCLNqXbcBPWgqJCcELXlaD41C5W1jYvfXue+8DpFd
	GNjIF793Sj7N+q3VabD/05x/WdefGvOQpFfw64aUdlt30Vw1y7XwkTtzXmRu2Q+YD0O7
	Gp7Q==
X-Gm-Message-State: AHQUAuZYmCSOn3WNVDLQBI/in5IUmJ0wfPR0re9tRBQNkxpyzVpqlTBR
	tLe2QCvFI2KX3dInWj2ajgjyJ3hj
X-Google-Smtp-Source: AHgI3Iaq0lPZTVlY30hYBMWFOM3TUYJPHw5YZW/IrOaDhc4wZExBiB0nZSen3KpqLvyAioDWHd3Arg==
X-Received: by 2002:a5d:4fc5:: with SMTP id h5mr20882340wrw.84.1550598458165; 
	Tue, 19 Feb 2019 09:47:38 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:09 +0100
Message-Id: <20190219174712.60694-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/20] libwebp: upgrade 1.0.1 -> 1.0.2
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:37 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webp/{libwebp_1.0.1.bb => libwebp_1.0.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.0.1.bb => libwebp_1.0.2.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.0.1.bb b/meta/recipes-multimedia/webp/libwebp_1.0.2.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_1.0.1.bb
rename to meta/recipes-multimedia/webp/libwebp_1.0.2.bb
index 451b0659b0c..8b3ffe02132 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.0.1.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.0.2.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "ba72dfa7588c751a3a9b735a6746a23e"
-SRC_URI[sha256sum] = "8c744a5422dbffa0d1f92e90b34186fb8ed44db93fbacb55abd751ac8808d922"
+SRC_URI[md5sum] = "02c0c55f1dd8612cd4d462e3409ad35d"
+SRC_URI[sha256sum] = "3d47b48c40ed6476e8047b2ddb81d93835e0ca1b8d3e8c679afbb3004dd564b1"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.17.1


