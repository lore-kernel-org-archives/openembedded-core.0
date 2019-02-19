Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id A62D57C9C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:38 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d17so8530704wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KpcJc+Dcfx+cU7R8WMZwcUAEPkgnmOJit9xyL1RIYmQ=;
	b=pF2bc46CKm95OtP5U/o9KuGO1sucRaOFU921W2TD7sttKZZD7c5uuWZzMn1EhBMCF3
	SI9FNKJYObldhfAffJ+QKqOQmK8BVHt59stIM+/r/gECjNIVNqW3YUxQ4MGfv/zkvVHP
	wsVlQBPVVnFzBzQPpFzMaqdGwTz0Xu7TgRRv7cPlS49DJIbXY7PfIA2ciEna8spekg4m
	+9/kxxBxCHh5jEYBCOjxR8vVrjmf8WCCs1PrQVxOgL8nKaQats+9V/RfjkV+f1PXlHon
	pAsUWtMdfyLZaZCCy+1xmsl0o4d6VUKJNawPDQ0V3tXr+m5ANO1DwXQHEijv2USACCUl
	ccYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KpcJc+Dcfx+cU7R8WMZwcUAEPkgnmOJit9xyL1RIYmQ=;
	b=ULvebXhVr4Q/etKHMQzrfWbDac45p1Mkh23qVjIK6VaUpLH4tXMwOJrMAbHF2JCzYt
	EV1UHdPw4UV58CefE4AvsKVg0cuvz5HV94LoL7ligHmEiCEzprH4psukpW/6BPJ93DoQ
	qGtZ/HMUnW13l/QVZz/B+b7IJPjfmeLmaVD3mzEiISBcXCaE503Ga88mhvsBq65KkeV5
	08Vqt8Q82JOWFYNSiop7GXSfvgXA9lMVgaWx9dQapaz65nPOvOos24IDNW6ygN3dz4UT
	wFV3NnTXrYS1xa1MuSHybafysaOhsctqRNiXZLrU4kx8eonCvzLsRWdhR1vQ6aud4HRG
	QQQQ==
X-Gm-Message-State: AHQUAuZH5Bdv6sgNfocO9uEPhwTp5QBn/PN6IuU8jwghTOyQjU2mtK2F
	/WM8Oe3xFJoCcKfN2XxLEG7d/Uqm
X-Google-Smtp-Source: AHgI3IYGJ9szBd8V54UT83Lz2VZMhjdVz0V/kLVwmr10V92GJcfP6I49uE068+7MLOlNCliGMpWZHw==
X-Received: by 2002:adf:b646:: with SMTP id i6mr22328438wre.262.1550598459135; 
	Tue, 19 Feb 2019 09:47:39 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:10 +0100
Message-Id: <20190219174712.60694-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/20] ca-certificates: upgrade 20180409 -> 20190110
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:39 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{ca-certificates_20180409.bb => ca-certificates_20190110.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20180409.bb => ca-certificates_20190110.bb} (98%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
similarity index 98%
rename from meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
index 0d57083c522..b9f57900c8e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
@@ -14,7 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
 # Need c_rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "dbbd11e56af93bb79f21d0ee6059a901f83f70a5"
+SRCREV = "c28799b138b044c963d24c4a69659b6e5486e3be"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.17.1


