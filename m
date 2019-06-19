Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A29917E94E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:24:59 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x17so3372391wrl.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EAKdDdfMDctn6SlpC4od2xLRVwetF5iYkBPrVgPyz+0=;
	b=kOVOHkEB9++IqBVE7Ozn3TYeTabuBP5W31AoYGA6CknP7veENia3SlOPKcFfyxbfBZ
	6Qt+H/c4pmJTJIMb04Ws42wb5lYiDX6EN+v4cnIKq5IN1eU8rEdO5pJcWMJNT9TTkP0I
	K6yCNd/ogOyo7W4MGrUf3NnyCS3jFwymGPXC8xXAG8/Ztmn1xGzokmJhSLJD6VoZXTKc
	aDMZUeKbh0lsPD3oGZrZ9pL6WzuoK1vcL0FAOXXC96JKJzoVC+kOBG2MYkWMlv/O54bZ
	l0sEMbl3E3810aNrgAlT336gTJ+Ge4GKxlJ7B2mCvH92lSlG70KYQIZIo+pu4OAMinRM
	n1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EAKdDdfMDctn6SlpC4od2xLRVwetF5iYkBPrVgPyz+0=;
	b=BgqjJHaBP03EIa3mILxX9U0P+aro5pQe4YNOmRO3njY3eI8XTWl/1DZnxdCAo1R5NA
	gFuc6EME/C5hVySEP8wJsZJQHgKRxGhSQQBKTyAuYpifX3LqhzHDPhXjmUkxsKFt70CD
	ZobZBgcSoQ7/8OCUAYhQGRuNgp++3YYJb+zhzVD6T9z/lFDcR3WDmPv9VJmgKmD2OolM
	zjjMSos6a0IOmMUsNDkIFo4AcWkErHt4Wf0XYYP7fHtlmORAw2q4O9gxLsZrjRpQGpPA
	BhLIq5q9yqdIds3RcADSwDPotPOWPkF7t9l9iVemx39/txQKeWke36Hz1ulfZcQctadi
	nxog==
X-Gm-Message-State: APjAAAXfJqCsQtvJiQvZbHSiT8VkGKqG2DcM1Z4nAkx7FgITPWdNuJ9/
	nJ/paDXkIWpLbgD/gW1uPLTt82BIiyU=
X-Google-Smtp-Source: APXvYqw9WaCYnMKCVYcy7x0mhdfJ1s4JA8bFH+1zn3GksBG9ozob/aiFsGTgdXJYXsEnME6n7r5UDA==
X-Received: by 2002:adf:fec9:: with SMTP id q9mr9180733wrs.241.1560950700219; 
	Wed, 19 Jun 2019 06:25:00 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q1sm1588953wmq.25.2019.06.19.06.24.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:24:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:24:43 +0200
Message-Id: <20190619132450.130226-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619132450.130226-1-alex.kanavin@gmail.com>
References: <20190619132450.130226-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/9] librepo: upgrade 1.10.2 -> 1.10.3
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
X-List-Received-Date: Wed, 19 Jun 2019 13:24:59 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.10.2.bb => librepo_1.10.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.10.2.bb => librepo_1.10.3.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.10.2.bb b/meta/recipes-devtools/librepo/librepo_1.10.3.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.10.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.10.3.bb
index 43c1967c2ba..d7c83edce33 100644
--- a/meta/recipes-devtools/librepo/librepo_1.10.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.10.3.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "91ebe846b0320751a264116c36a665a8facf9e0e"
+SRCREV = "2eb0a27031956fd98340ca2707f03abb7b780372"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


