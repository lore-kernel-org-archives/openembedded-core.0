Return-Path: <matt@madison.systems>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id C63E278AAE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:59 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id m22-v6so5030090pls.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V8JTJKe3s+g4y1kAfTZn+Wo4yxRy63bBGNuOi+Fq5QU=;
	b=THkEWotAl5czsN9vAEgsi7Z4zTV9AohLRJ2i4eC2SPwW01r5U3lj2MQ9Xswzs0rEdg
	o9jVHfJqiAU/6lSOUzjfsD9Zhfo9Dij1dNfGA1HKKVbxnR0gahaCqKD/YGam3/I7dh7G
	Oxgjl/3a2Emio1KX5Y6vn3vTEEO1VquePYIoGoqDmw2PvkH5MRc8GYdl0cuDpt+dsO3r
	wHsIGosm2Es3dW7a25Xho8bdhkLf67nXh5i2gypyzrVMxtSbzz8aMAb4GBHDWsjwF5DO
	eK+0LK1bue/2EfSCUPgPZrgyoGMlCVodC18Df/WgSsNmDqt6cvjvw9+KFOZ+BNGpreZU
	WVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V8JTJKe3s+g4y1kAfTZn+Wo4yxRy63bBGNuOi+Fq5QU=;
	b=X+lOkZvuUR6Sa7JcAQ+BbAgjKYJsAJk0bJhyhgnTI7ZqXlll9ms8DA1V9bxUG2XBir
	k/6aOHDwXBgph0KpcwkSqi+blc1vQGhzgLl93ykZd7B1YFLaw3lvijEGT/QLmA56IdQ9
	n7tCGoJXLL9U5pMS8WepCaWZ80yw4y/fhMrgbWOhCQF0Fp1AJC6UWataLHX7L134L9bP
	FXnVm6j9zptd+4pRRvm90/gpM8IOVuSRpXe7AKhexjCZE7b41IOKPiIow9gW0qki2UAm
	tQE7WGEt9BCx8rrs2IfCLj37c+Kg4f30dEL0nhXzahTPXRRdDehPG2IkPuH1MRMoO3SJ
	vCOw==
X-Gm-Message-State: APf1xPAaw2kffQkZARxe6NCEttAEYUmLwfXHkwjTvNskFdIbgGxG/RXS
	ProZM7ADrTczUAts0N3p8joQaw5f
X-Google-Smtp-Source: AG47ELutO6Vm/WX7RyXAKEx4eLIssYq2XI8lge0K0o/hFCUngudN+cVwDFLdt29OTVTXDa6jcYOmkg==
X-Received: by 2002:a17:902:b7c1:: with SMTP id
	v1-v6mr11084806plz.315.1520197800570; 
	Sun, 04 Mar 2018 13:10:00 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:59 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:35 -0800
Message-Id: <20180304210937.29727-12-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 11/13] packagegroup-go-sdk-target: add go-runtime-staticdev
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:59 -0000

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


