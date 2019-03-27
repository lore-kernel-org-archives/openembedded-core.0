Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id BB9A87D132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:16:41 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id s15so19503524wra.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cQO1ozR9KZTx3MbVWBqAyTh3UJZ1MUV0X8e+l24Qmws=;
	b=GI9v49pwQ2WgVGwO5zI3+Risu8q6wrBxtXooMrhUdeKbH1jY41VZ3vqUIbjLNfP8LK
	PboQrSRkQRrRP9GYuZ7j43m5OO1xKf2T4QkaT0Gd5puTeuQjLTrFmWnPsI2S3SInLkZv
	UKSQ+SvdO9TLkBMJf5tM7qF9vfFnGVIPHy8+7rD4zdKBPZpzx0tzzxHpv5E8DtBbnxZ3
	L1SM4NpwrNC5Tn9ZdSFLlV88Ky/0MMkYeN3Op43iIPhxHKCnz8jF7SrLQi1uuohIaHKg
	ZPwvCK7Wzkdm6IEdC6qqYPXv3m/K8NrdmY2GvHo23ewVS1GDtDWaLM6+2Iszdut4hBTM
	dSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cQO1ozR9KZTx3MbVWBqAyTh3UJZ1MUV0X8e+l24Qmws=;
	b=tv7UHf0wZntn6IsK86RZf20ZVZSiwMqutYHgTgZ/au2M2332eIIqU5X8dFhGReVw2x
	UFQRMWYyCVbd0YIWQQh51NW78TAaSGOaVS4ZiVwj9NOYYtj2UbfTSUAf8uO8M/3PChYu
	1MhR0fTcMvXCmSil48LqGK+ouQrOgjOf06hZH+fO2xm6PwkFOFJKgqxbc191auPXBSDb
	CKEcSZFICwYRJvUmvndAPOE+eFqy664l0EdwUVN4laP1keXKsWOMcVn0kNLZlpDnvQa4
	+sB1Icpa3fhDZCfCVV+PKW77PU2OLQH112w68X1/PieZQJvVJKz3g0fV+3bpnnoTTxAJ
	vhDA==
X-Gm-Message-State: APjAAAV4i1HzNRh4FGAp7Pt9OVEe9pKb7KJ9s9AUBGGxejYrVYPIGm/h
	fvX5htEgt8vByeBBOVFfu0Uh0FMX4ec=
X-Google-Smtp-Source: APXvYqyYDnlwueuSMyNUM+uwEfr8RaPWmujAasPixdrtO0K7e4ZyqgenRztNnHwkw46QvZUMxsG/vw==
X-Received: by 2002:adf:fd04:: with SMTP id e4mr25179232wrr.190.1553707002280; 
	Wed, 27 Mar 2019 10:16:42 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id x84sm873848wmg.13.2019.03.27.10.16.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 10:16:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 18:16:27 +0100
Message-Id: <20190327171633.34697-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327171633.34697-1-alex.kanavin@gmail.com>
References: <20190327171633.34697-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/8] xorg-lib: drop native overrides for REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 27 Mar 2019 17:16:42 -0000

x11 is actually always present in native DISTRO_FEATURES, and
so it's fine to require it in all cases.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb    | 1 -
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
index 84303e6246f..518249ee922 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
@@ -30,7 +30,6 @@ inherit autotools pkgconfig distro_features_check
 
 # The libxau and others requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
-REQUIRED_DISTRO_FEATURES_class-native = ""
 
 export PYTHON = "python3"
 
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 6f4e44454f2..09df0109cb8 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -24,4 +24,3 @@ UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0ret
 "
 
 REQUIRED_DISTRO_FEATURES ?= "x11"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-- 
2.17.1


