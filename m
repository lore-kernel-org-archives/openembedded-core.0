Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A43CD6C17B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:57:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l9so15443494wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vo6nEVPw+hKZSgDHln3tkeViGG/DJzAznuHbvUsgzIA=;
	b=N7eBUbwNszFiIRQKr6gUTbKEYBGwksw1UUSrrqNEC288nKupCwHvc/PwNOKTQF4XCh
	VxX92JJ/PmWbv9OhMIgnJLU80JMaw0iypsv2gbXLB2/xfuOcB2eMsJb2ob9jV9tU/Hu9
	IkPIJbM9ClVlQuxn5buAr4jdKhoDdnP43EmCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vo6nEVPw+hKZSgDHln3tkeViGG/DJzAznuHbvUsgzIA=;
	b=jaajjACV8LPOdYWSmhuRU5lclo8sdyFsi0N0bOaC8b5XiF+4xPdhiZ2laKPC0KO6NP
	FY604hai7KT13fr/eSsnMcQstXN8RtxozCkBWkzU5MGlMx9E9+rvNpZjV0OAp27rzK+D
	i1cQkazyi910e4T98ziY76ZKzJd07EYlvtxjYai288BscPPj4IiubFzvXWZPXZdOlok1
	Zt8O9fZCR5jBo2cNqyYK9CZJRn4vDlgdO7MXM6hbawZN3oBH1Xy2MsI7GKi9sywzOqO8
	oVlLunN3IYfmjUd91ZP62wPoOdBr9P2h18PC8mxCIvJyVBMZ7zVSr1EJTF8Rsdbf1SHg
	VXUw==
X-Gm-Message-State: AGRZ1gL1+cBUQr+0+lpV11jHZG2ZA5vJldgE4s3fMoi8a8iwxOekwgPD
	xPA/w1A3BGFk/foYTne+XHing/SVQTc=
X-Google-Smtp-Source: AJdET5fIsPz3YmhSvIU9b9g//fnnOUKnNzNfGml+04Myu2YKpJJ3jrGSya4zZz+e8pPAd3va6ZOFgw==
X-Received: by 2002:adf:b253:: with SMTP id
	y19-v6mr13214814wra.213.1542495476907; 
	Sat, 17 Nov 2018 14:57:56 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm12658470wrw.4.2018.11.17.14.57.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:57:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:57:46 +0000
Message-Id: <20181117225753.15733-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
References: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/9] lttng-ust: upgrade 2.10.1 -> 2.10.2
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
X-List-Received-Date: Sat, 17 Nov 2018 22:57:56 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.2.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.2.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.10.2.bb
index d79a47931c4..3e5f37d8865 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.2.bb
@@ -23,8 +23,8 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
           "
-SRC_URI[md5sum] = "4863cc2f9f0a070b42438bb646bbba06"
-SRC_URI[sha256sum] = "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e4662712aef2d635b88ee9d"
+SRC_URI[md5sum] = "a95333f76e2986113154b8193f5cfca3"
+SRC_URI[sha256sum] = "c4ca22b904eb08817b313a73d499e1b217ffee1f862156d0d52865317486c045"
 
 CVE_PRODUCT = "ust"
 
-- 
2.17.1


