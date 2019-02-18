Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6211F7C85D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 12:41:19 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id q12so12223066lfm.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 04:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9hQqro8smR6AaYNSqLpBinOyYSSGGtysXkyEALx8yyM=;
	b=fHJClYVPzOCS9+ojCdHbSBsnhXABw5cafa//EAP3m1Py48f4C2sikQKSjtuTilo+R7
	bHTyx4n8tddemeLHHbcG7ymVe6xtHsYOGhxSrTCElVhnLjrd8KgI1TRYxLurXiLiFaoU
	QlUIfDUgq8J7iq2D6jJCFegRJYSCjGfP8+RCs9ePwaBAd4NRZzO0nkpXtziErKGxzA8Q
	QLT6jJi1zeIveTYooTFxsFakwIN9PNmEVedJnicqGI7OjLYXxZQ//iOJr4JBuoRxkFF4
	Q7xrebbQnnKkObuCJkY6FqcR5W7Y9DCC1vWj07S7Z/lzqxXv/e7Ff/op8FjzFWjXuMr2
	VcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9hQqro8smR6AaYNSqLpBinOyYSSGGtysXkyEALx8yyM=;
	b=sn2jJdvxDjzqkR8Fe5BTMe5H5ZPt8/TWAglMrKFt44aluCQFqdmjD7kuvzi81noNoD
	QqswUTv1BV6eGWxPj3EpJrnUa4lCT669F6WVANUrNE/GEBWMZG0N101uFiRJcHFSCrfE
	ZIqxI++FDu+OFyKbVjiXov2n2aXS+IEY6w/4aG0kmrAFKoKwLK76TtjVP+g1m2GOPlbR
	UAJ7lLBxT3KgI7TMObCSTpNogkar2zVKXgg8r6dVbRAjx8v4I20cp4uaRSxBhTanCJvX
	gemmTkisyuJBalDUMZKaQI9RsN1QG/ZuuT6vKSSBAyFDqBeMjC7U9Yxg9Xq8uF/j2KUn
	NZ4g==
X-Gm-Message-State: AHQUAuZneuapsw0Oft5/uL1YsxwuleatcUcaUQCD/c613GQPNgaS4VCc
	Ct0aeIlvy87WSLruLJzcwOrX92x4
X-Google-Smtp-Source: AHgI3IbIYGwnNzMvg0ez/DOI18RVAfZZ1TLuCN0ytxgVHcwQDmZLnP9y6y293E0KVr3pdgYSoIt0uA==
X-Received: by 2002:ac2:41c9:: with SMTP id d9mr4026717lfi.111.1550493679482; 
	Mon, 18 Feb 2019 04:41:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id h3sm3733898lfj.25.2019.02.18.04.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 04:41:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 13:41:05 +0100
Message-Id: <20190218124108.7846-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190218124108.7846-1-alex.kanavin@gmail.com>
References: <20190218124108.7846-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/8] libxkbcommon: update to 0.8.3
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
X-List-Received-Date: Mon, 18 Feb 2019 12:41:19 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libxkbcommon_0.8.2.bb => libxkbcommon_0.8.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.8.2.bb => libxkbcommon_0.8.3.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.2.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.3.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.2.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.3.bb
index 8cf508b0bff..ff0f0690b67 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.3.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "5f7f8533f907ebcfb1cf8dceb9501264"
-SRC_URI[sha256sum] = "7ab8c4b3403d89d01898066b72cb6069bddeb5af94905a65368f671a026ed58c"
+SRC_URI[md5sum] = "8225a206e00c4146d2e06f5e688b28e7"
+SRC_URI[sha256sum] = "b855c629849a97ab9835a4ad99d6b749a636f70d38a03f070c6ef72024825540"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.17.1


