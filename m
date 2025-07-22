Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53772C87FCA
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 15:27:14 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.16136.1753198025885755604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 08:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FQV/2TvR;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae361e8ec32so976256066b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753198024; x=1753802824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufpu6hlQFdktzkLdjfHn7Lfh3mXWaWplieFAkHvr1HA=;
        b=FQV/2TvRgHR96VfnO780TCbFb8Z/VatwnQdvOk6EHmUdxnK3Jkj4+RVcgbPqnqJ1Io
         0hRSpFV0dcGFuarEaHKJZ95gZqzBsNdLtTe4rlFTV1x+8iLjerbDUgWQKDCW8BeEgPNp
         lOD91wyoo30zT2Rk06tTZO0umI0XCDHxGFvHji/V3+HmIlnbvRgQ1W1YAmKMi//c/kre
         i4tK6z1q2x9tmwt2ur/OLwnfW8sR1D2+n+qrYdqXAeXwz/GPeDjo/JBKuwSauNG7vdeX
         Fsw7i1Y0nY0Ef8vq7WRZTIsKyTqHQNcrGAWbxocHLdUkLY7f4PydipCEDYzMn5qOwJ2T
         gHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753198024; x=1753802824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufpu6hlQFdktzkLdjfHn7Lfh3mXWaWplieFAkHvr1HA=;
        b=AnO+VrLRmiU5iAXd2YVdBntU0ZtpNMvcXyBXCth2OsfbQK//Kz5BE9pAQRZLRRgUVs
         XBrBWKWwDZ1H4+jIMgCvhA7ywckpznPwrTFysRF5yXHPcNyu1CoyTh4nzejERkiyWV2l
         oCWUuou6BHRudCKQGlpS/wi35iM6XQ9opY6nyK1SB+QbUfQaQaLBI2rtCEGGwFgA+mZ7
         FCQoypyC9XOEelnwqq3nQtCCyLcx3csR/pQEVF4lmS4Fj1RFau7CSRGt4F3gl/2PB7Rv
         VolrubnAf422ie1XOSJfzYEOIS8vzy7//aJhOsi/uwEB1Y5GiBpocUD346A/XkJoGz4r
         eK3g==
X-Gm-Message-State: AOJu0YyUE4a9fXpWlBDJtg6WtcPZKXYla3H1dePgZhO1AOrocwU1Xk8U
	hvKHdkW0+hA1kDQSZAcoUIZodJuNLpzHXNtnoBwjLGRND4OwPO4hWSRDWYmT9g==
X-Gm-Gg: ASbGncsA+2E7K5sH7qRci5XSO2j9QnCgF6SOpOGC1w6YWUmycAN7hiIltB+lFtOzosq
	Zm6Sjz9RMLyg0RSFEomVwwT4nQwK//sBDkCoqMMkUozS7+1DVybWXy+8vagBeKfhNNcFds1bA1Z
	7oMHeQP1g7AeafDbcMEhvqgKjhMBmkcq6DQjyLKMh/ABmJhQvFJfeQ6JiBsL+yJIJ+AH77KjabM
	d9iJr3Fr8Fn5UcbW3LCX9O4ht/6r+1+tRUSuPZLy9N9bZI7WCvA3cJuJdd2C/SepL+//VqMMU60
	hgsEGv7NlfkAbpkR5w2955MGoFHALT7rAR4JQstn5xMFrersQDElM7+paej7VW/f7VEWcfDUh+M
	kOjAWExs+OjssTCekZrQ=
X-Google-Smtp-Source: AGHT+IES1VCF46FXCwisRmelC0i4N0dF5HCDAP3FCc4RjUA4R/pk6aErir85tFdf0DEKKaHlCWZEdA==
X-Received: by 2002:a17:906:a01:b0:ad4:8ec1:8fcf with SMTP id a640c23a62f3a-ae9c9b6c610mr245387966b.46.1753198023557;
        Tue, 22 Jul 2025 08:27:03 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cad0feasm877743766b.138.2025.07.22.08.27.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 08:27:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] libmicrohttpd: upgrade 1.0.1 -> 1.0.2
Date: Tue, 22 Jul 2025 17:26:59 +0200
Message-ID: <20250722152701.1718859-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 15:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220751

Changelog: It primarily fixes a double-close() bug on bind() errors.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{libmicrohttpd_1.0.1.bb => libmicrohttpd_1.0.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.1.bb => libmicrohttpd_1.0.2.bb} (90%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
similarity index 90%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
index 0628ee71b5..a75a5b3be8 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94"
+SRC_URI[sha256sum] = "df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7"
 
 inherit autotools lib_package pkgconfig gettext
 

