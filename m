Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F06827E069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y3so13497717wmm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kJ8S6N0R4iYdrzveTKUFWTVXS+9V25VVy6w499vzQAs=;
	b=OnCkBBURP/s5WmpE3HCkvebqvUdl4TfwOrAOq97K/0qZgmtGp1KU7pnkS0gp0a0nep
	B0qXhlZ5L9wDeI+MGAJ8SakRrX0J1gmALl6mOz8uWLkao+awoYVNf9SVdw9JH/5d6kkR
	1vJ3XoBtehtrVT12K+8aKx7uEtAH70e+XDULMroddKcjansAFGFMFOzh8GTfC9aydXEh
	aqrIY0G+9lEOXImdJDKtlmWsBm7r6VmmN8xWVrrTtQeVQvakddBFOAZks/ZHwCj4epHS
	LcEmEWbe56YpfHAa1DbXeu5t4ypbE0Sbu7bAjEcsS2XpJ65O6tDCaydsH1ih36yFG0Gj
	xtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kJ8S6N0R4iYdrzveTKUFWTVXS+9V25VVy6w499vzQAs=;
	b=h98929CpNbofmaYttSZGUysIzCPMn9sYZpDYGDAto9V7tsqGKw4w11C2jTFtSHnjEq
	T597Vog8YIydIC6h8Rn+6HADEa15kcaQzUuyG/bj7Hys/EeeW2QzgCyQKKUpOr7nOIoN
	M26s4OMiWrEsabcbPjJS5vDVlnplBtOig8dfzL1E1NDCXEiysEdyUi9Xn4Ayr7ddXsmy
	kzfJK7jAladDmCT1PUeHvnvluOoDs5hGvsuwaUrADRfbeZ6kPzZ223vaG6ZE7xYQV4ay
	+ck9HednWRxoZtMsee/fAe1pvyHiuV5qrpAUQOEDAqHDnWHiinWS8d8PJ6P8aniOuMGZ
	IV0A==
X-Gm-Message-State: APjAAAXCJ7ZkPWQo2dohi7r2ATpR1PhL5jwTn2FT05jtAAk9dx+aylvN
	XlgYyrWWmU0zYe7GlTf9tgsyATDX
X-Google-Smtp-Source: APXvYqzdkr6pl/ZBmoqMV2Thaaj5fYhsyTWbUglOHuorg2ZGkECPalKBRcFF2YahyAtRBs1Xf349kQ==
X-Received: by 2002:a1c:197:: with SMTP id 145mr30994648wmb.10.1558361515632; 
	Mon, 20 May 2019 07:11:55 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:06 +0200
Message-Id: <20190520141125.10805-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 23/42] pkgconf: upgrade 1.6.0 -> 1.6.1
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
X-List-Received-Date: Mon, 20 May 2019 14:11:55 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../pkgconf/{pkgconf_1.6.0.bb => pkgconf_1.6.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.6.0.bb => pkgconf_1.6.1.bb} (95%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.6.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.6.1.bb
similarity index 95%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.6.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.6.1.bb
index 1452875f5d8..c60ef74226d 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.6.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.6.1.bb
@@ -21,8 +21,8 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[md5sum] = "0c93492d7f001e5175b0347b5472e86d"
-SRC_URI[sha256sum] = "6135a3abb576672ba54a899860442ba185063f0f90dae5892f64f7bae8e1ece5"
+SRC_URI[md5sum] = "556bae2b9e0cc7b46e7c00083cb6d95d"
+SRC_URI[sha256sum] = "22b9ee38438901f9d60f180e5182821180854fa738fd071f593ea26a81da208c"
 
 inherit autotools
 
-- 
2.17.1


