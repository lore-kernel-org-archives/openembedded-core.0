Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id CC7466FFEF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:54:47 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id b35so6142848uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=akJvi9e22moMii87UKklx3aDBWWCjD/quafi4EZinx8=;
	b=brN65OdtLKB5JyX0IRKOqteCDFpr8XpdBU3H1uRPS49xBGxJ4lOxnmXKYgCFH9sYhU
	9+aR3IdAWiUS/B9HgAc1Cl440Hw5045HpFcm4X4DA80n9sWWGB7iwE5/KeYqYbgDcEMe
	6NZeIfIO1rw3lXeSloAfHz1RjGMqHNBvGl21HIE2I55xBjNlBAOw0Q/isP+inx8rB+Uo
	zrUp09dMZU4ecRRsKtLB1G+mQRIa6a8lbAhPDXFM6V8PKlObrxEwsXtyh+Iq+xyYkObz
	ggGwqdPXvrS5vJ2oHvUMy5Be+TtwU/S0byxaI2Aa2B30lW004BfUMIXRsgoVfSdWzQFx
	FN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=akJvi9e22moMii87UKklx3aDBWWCjD/quafi4EZinx8=;
	b=TedZefVhlE7LE9wNqoM7bWwLzwQMM+Vl/B0U672K8XtzoF1ulqOJLRvwLcISPTbiwF
	8jv248KGKF5JtEWmcB4EosYnY9F6kcm+sHl6ih1RFcS0E1jSSvQDRMrimMleS7TSZ1Jc
	FXfnKyAHM/FFYidcKetybT+fJ2sgKbE/2jiEDua7wlDCskGPa/whuF6wCCDDcldXgc7h
	jZVPRSclc6c/WIoo2913v2XBRx8VvXp4quzd5sukhbKbm82D1VlecmjRl2vvclNXaHsd
	U1w4E1SUxoGf8lbXfd2tiFfHJmQcQSiUPERUKUsyNt6cTO+L3XZHIwYAQcHbwWsxm4aq
	T2Nw==
X-Gm-Message-State: ABUngvcDeo0WJNRS3iBKbp78Wc2MS4kccaJg/WofH234N2D528+Uxt+DAPhzch4ZW/sz6A==
X-Received: by 10.159.49.27 with SMTP id m27mr9303005uab.178.1478030089162;
	Tue, 01 Nov 2016 12:54:49 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id q7sm8055913vke.20.2016.11.01.12.54.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 12:54:48 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:53:58 -0200
Message-Id: <1478030040-20670-6-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 6/8] libxrandr: Update to version 1.5.1
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
X-List-Received-Date: Tue, 01 Nov 2016 19:54:48 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../xorg-lib/{libxrandr_1.5.0.bb => libxrandr_1.5.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.5.0.bb => libxrandr_1.5.1.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb
index abbbae5..48e88d2 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb
@@ -19,5 +19,5 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "309762867e41c6fd813da880d8a1bc93"
-SRC_URI[sha256sum] = "6f864959b7fc35db11754b270d71106ef5b5cf363426aa58589cb8ac8266de58"
+SRC_URI[md5sum] = "28e486f1d491b757173dd85ba34ee884"
+SRC_URI[sha256sum] = "1ff9e7fa0e4adea912b16a5f0cfa7c1d35b0dcda0e216831f7715c8a3abcf51a"
-- 
2.1.4


