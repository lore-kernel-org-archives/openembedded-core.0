Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FBAC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 05:16:57 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.296.1749100611344630173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 22:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VwMOypcO;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso881147a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 22:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749100610; x=1749705410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5AF8kXJcN2F73BgaOvVUlfkKBSQfw3aPBLdQLCSN75U=;
        b=VwMOypcObW3TYuCFLUqzxVtkZ4f6T4miM04OXzm0mJjPe45/fpY/Wn+ftDZ+OChRbq
         E+FMAMIkfEszZd0uoba8hdIloc/tPP1hPOKD00W+N45+sg4ZxANfNMjMjTx8OO15ZaR8
         cWEL5kKCTHdFy3eQQzCINaLDGor4j1v/vdEoowlOgiv68cPgfufXb+S4DNVlr1elsbyC
         Y7rjQ2GAknShWvSlFHDRMzFs5hjKdpqbDZlHvjn+xedKfwtVxA/yu3ipbX/oG4SDI8h4
         5BCpmXT9r1Q5p+8AYlq2M9W0u5+UMfUtWdeCncsoBxPmMU5V98uc3jJF2U5YEotoaknn
         ZO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749100610; x=1749705410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AF8kXJcN2F73BgaOvVUlfkKBSQfw3aPBLdQLCSN75U=;
        b=GWh/R8D+9ia5C8/EMWMCmgch3dUL7E5pQuG0Jpgi29EZy8hBNr39qG3Kmf2zGcnINa
         WW2t+714G6ikAODBoYtbtPwnSLgseltcoxRVsrVoyeMICgtVsRaiZMtFeRj437eW3JFU
         6KZdBqj8xEdyamX5JnSgQ7UaLEtcEKhbAwv+7ALs4pN2u0jJKPQkUER8sQDz2qdthpyM
         0emh8Mp80yFd8ZZ5cJBAhFn4s9wuZzqCnMiN2p3TDs79rwAMbv+8/j17vM77m5iubkv3
         ZpXmndkc0Chx0NlJPJ4GjhqXMR1B0gMTy6u2f1OfiUXNYtLQtmp/Iqr/4rlwG1r6TLGV
         /rKw==
X-Gm-Message-State: AOJu0Yx9iHzOVcBZ+jEDRRiwiGaQU0QsPjgs5Ug9r8fAve3VEemWQGm+
	zxJCNGssrFc0+zIJ3hHo+zOOTd5n0B7M66f4kRN1pItDIHgvQ0WAg1wI24ol6n1I
X-Gm-Gg: ASbGnctKUd8fdhyarP9FyQQqSBYGYni5HElbvzQ0rGTYeS/LiPkn8SQ4fQqoVngKXti
	o5f6g0DoL7WH1SBWECHyrW440YDPMSRkz9SV0Wj1EuTKNs0kWwR4shkN5mSn5wuG6/Y/7t1eATA
	svriVq3O8/zPXn5hkV5Zs+G1H7eH69SAevmLO08dQs+XHv2UMUMangaJdZxCKkcDWYjUJFyAwk6
	AWT8n04KWZhzfbOQFc5q01gDKa6CHn9mK/QI3CDJWZDpWj/erXqlKNzQu2vr9ESzvxuWF6v4WjX
	7iUzndb8leTFCgJL64slmBAqvdzy8RRpoFyGBE6cE/XW+3W7cTIMDUU6UjnQvwnckKVjBAFEtxY
	C1Q==
X-Google-Smtp-Source: AGHT+IFuPz1tPreWVOOZhFj2sUc7YEsLfzndJ6Mk+e6/dGQ3OsamzJXQRZLR5HAle9DIknfLtr3PlQ==
X-Received: by 2002:a17:907:9626:b0:ad8:9d41:371e with SMTP id a640c23a62f3a-addf8f52af3mr502454366b.36.1749100609333;
        Wed, 04 Jun 2025 22:16:49 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf011sm1209463966b.105.2025.06.04.22.16.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:16:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] diffoscope: upgrade 293 -> 297
Date: Thu,  5 Jun 2025 07:16:47 +0200
Message-ID: <20250605051647.2149219-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 05:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217982

Also, remove the musl restriction - it builds successfully with both glibc and musl.

Changelog:
294:
- Correct longstanding issue where many ">"-based version tests used in
  conditional fixtures were broken due to the lack of a __gt__ method.
  Thanks, Colin Watson! (Closes: #1102658)
- Address a long-hidden issue in the test_versions testsuite where we weren't
  actually testing ">" as it was masked by the tests for equality in the
  testsuite.
- Update copyright years.

295:
- Use --walk over the potentially dangerous --scan argument of zipdetails(1).
  (Closes: reproducible-builds/diffoscope#406)

296:
- Don't rely on zipdetails' --walk functionality to be available; only add
  that argument after testing for a new enough versions.
  (Closes: reproducible-builds/diffoscope#408)
- Disable and then re-enable failing on stable-bpo.
- Update copyright years.
- Add NuGet package support.

297:
- Add a LZMA comparator and tests.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../diffoscope/{diffoscope_293.bb => diffoscope_297.bb}      | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-support/diffoscope/{diffoscope_293.bb => diffoscope_297.bb} (88%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_293.bb b/meta/recipes-support/diffoscope/diffoscope_297.bb
similarity index 88%
rename from meta/recipes-support/diffoscope/diffoscope_293.bb
rename to meta/recipes-support/diffoscope/diffoscope_297.bb
index 59e7cbe000..6f6f4ac520 100644
--- a/meta/recipes-support/diffoscope/diffoscope_293.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_297.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "15315d09babdee45449be7042ad1f57104a5f04853bd6951cdc0da171c13ac3b"
+SRC_URI[sha256sum] = "25532061c640b4be7496f9a726640e20ca0fcb8e46a8a1a46e51ac940a5f4e57"
 
 RDEPENDS:${PN} += "\
         binutils \
@@ -29,9 +29,6 @@ RDEPENDS:${PN} += "\
         vim \
         "
 
-# Dependencies don't build for musl
-COMPATIBLE_HOST:libc-musl = 'null'
-
 do_install:append:class-native() {
 	create_wrapper ${D}${bindir}/diffoscope \
 		MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \

