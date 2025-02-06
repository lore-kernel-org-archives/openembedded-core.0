Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39120C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 10:12:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.37302.1738836746943167951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 02:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CRffJ/bM;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: pmi183@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436281c8a38so4481685e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 02:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738836745; x=1739441545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BMRdxGiEv875yOcxzpAQNiHcjZYuiY7qIBEugrmYLE=;
        b=CRffJ/bMRFDo8wK8x+EzpO/XFUReY203xWvlWw8uUdqW4VEZ/twUEih4cdf+3KzIx6
         7X741R6xeYQ5UMWcF1dMztB0DjUkZZPh7Z0Gjele72F3GDczoEIAywelsZ6qsuOGfVoZ
         lzWCpeOltFRpaOTPCAqxoUBCQXN7LegN0KwX2fMb8i78FuUpdtm2IvY57SHqwGJfAjAX
         uPx48M3BO6pYmiI2KOIvOHENuhNjv7wEiwTKdkK0knFDVcBNV3M4AyNtFmzjNYSd3Y6k
         +Zyx/f2VGiDfnIiGPxAaNMkapM2nEhM9i1OqE2naRVZrcNWfPR+RhTuDc3OIhVKfY/8y
         024Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836745; x=1739441545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BMRdxGiEv875yOcxzpAQNiHcjZYuiY7qIBEugrmYLE=;
        b=k87mf0bA/Bvl83e+m09s590y2CywaMFoXCNFjh9wg1yAghcGnhTBcCYp5n6iAe6Voc
         kgD2qbAZjof6hec98t0rL++pXfkiyL2A1RwI32au+6GzvyRSmtRMapRg6ryl+l8B4FMJ
         KiBlF4bQU5FGfkjl+jBMhY+PEqjcnvtAInDHdA70Ph5Il1jZ7M0QLePmB5j5TfzwHl0b
         MLxXpiNkxk//Jz2EQ7MQLiCkFb/ZRjfPg2qqY0KB+JicoL81XlPO+DBr+iqI9D2XILUZ
         UH6pfN5/h1iFvvkyqv96/q2L8MH2zpJin1EAYriXK4V69ftBy64pkXxgC1zOpfkGY07R
         7qKA==
X-Gm-Message-State: AOJu0YxtzsdOeKq26i6UwMvxv6O6gJWxALwPaVXe0/N+kgj50ntN6sXE
	C1IsFxlR9+AfAAE96YSm6RFRgaewrIAZKL3y6NtLH1ZRLkWZsIFjzLj8kA==
X-Gm-Gg: ASbGncuB0R7+SKz/G81LtIzgaVHRm03rDveK9YMxe69IMskD5imQ3ueC3O0UvFWFArV
	zw0muQBl1CzgXQF0JN16z0TZPZXbCXwxjnRF16HFAxW6oqLBuvfHWRBIvztJorTcGfcxlUexIJc
	5R3ekwi0j6T30KoOn1d0Y8z1lCU+cVMXJDdcItv4tQcI/J8YKlojKV67Gz6pfBN64FNXhaI91Nk
	JeZMAHiJU9lhR1IV66px3TX1xoi0H91Th0oz9Ljo4cg1MLX07S+97sqLwlgOII26vbMhCUyWBxV
	5V9yvOe5LK0ccOUgFuOmdg8jKuX4KikvPJ4a2vUIiV/AYQ==
X-Google-Smtp-Source: AGHT+IFJKmax/5dj9jbNovQnil7/mK5xcaELFdN9xe/h1ze3fAd270DRWfeaHcwmlXC0JOqmsSoSGQ==
X-Received: by 2002:a05:600c:c87:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-4390d433affmr53309965e9.7.1738836745049;
        Thu, 06 Feb 2025 02:12:25 -0800 (PST)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f6741esm44443905e9.3.2025.02.06.02.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:12:24 -0800 (PST)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [kirkstone] rust-common.bbclass: soft assignment for RUSTLIB path
Date: Thu,  6 Feb 2025 10:12:21 +0000
Message-Id: <20250206101221.32481-1-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 10:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210913

From: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>

As a user i want to override `RUSTLIB` path on a bbclass, lets
call it `XYZ.bbclass`.

If a certain recipe inherits `cargo.bbclass` and `XYZ.bbclass` the
value of `RUSTLIB` is dependent on the order of the inherit.

If `cargo.bbclass` is inherit before `XYZ.bbclass` this will reflect
the desired value of `RUSTLIB`, on the oposite, if the `XYZ.bbclass`
is inherit before `cargo.bbclass` then the `RUSTLIB` defined on
`rust-common.bbclass` will prevail.

Changed definition of `RUSTLIB` to soft assignment to make it overridable.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6eeb832f73ffb48f5f05dc47191f60e4599e640f)
---
 meta/classes/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index cb811ac5da..1c34d4c8b9 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -6,7 +6,7 @@ FILES:${PN} += "${rustlibdir}/*.so"
 FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
-RUSTLIB = "-L ${STAGING_LIBDIR}/rust"
+RUSTLIB ?= "-L ${STAGING_LIBDIR}/rust"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ?= "libstd-rs"
-- 
2.34.1


