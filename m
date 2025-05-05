Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25B6C3ABBB
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 04:15:23 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.42941.1746418522709067552
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 21:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YBFIBrqk;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225477548e1so39817115ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746418522; x=1747023322; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=112Zt7u+/MmjSt1BsA7mfjugqzhX/dqSws6CTQuSQ/k=;
        b=YBFIBrqkFQabdcRqfgZ3aXbnH3hpgUqPKqheXAgC2TucKtto6RN7bO9B5qnkuPid+Y
         fF8pa4IiFBG26oKEaocepFm3cWX5DxdaKo1dMfkm5cLZ7e+YcN4VeUMTNXPg0ZLRP3o6
         xkJYUkTbbpzEnODsUHXJKJhhrg2q3cVR7aG94rcMS+ApdlKDlg2y4r8cbm7icFdd7wGE
         OC0wqhoSWE7NfYtzegd9QeNRmdw9yPJy9dZsPLvUK3IGFEt9ffT82wl11lLtmfXArqFq
         MjrEN9aUyphFsFInnYGt7EDTiMQXyQ4VMwPWHF7SJZLfSGAblvL/J3ydEvk3HjMusiDF
         wSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746418522; x=1747023322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=112Zt7u+/MmjSt1BsA7mfjugqzhX/dqSws6CTQuSQ/k=;
        b=Y1tRTepWq3i2w+Sf4L25++9UBQWUHzmn1HuR9lhowlqtR7ZTSSxcQ2Qw44XhGw+gaJ
         GA7Z61+Av6YqWMZXVunQjX/rVhPX8cfaET7qnhlXAizHU1OERgUYslRpPGaZI2oQ7tF/
         J8rdKldBhRn5L10t6nr/DVts49RlH8MF8Te3wva+Ao7w5iAzOrGG+nhmZDXYuHnhPtTE
         MfdoeV+f3IknwTGGdtxlz4+uPAOdMVI/rbEYF1N0j9iXnlDHCB0YiYRwo+xEAg+nMSnR
         ZIIc6a4+5B+0E/9h/gXG6Qjqm7xQrc3LIU4B69kDgDgXH2o24V7hAa6WViJugXMFWrHH
         r3ow==
X-Gm-Message-State: AOJu0YwLv6hRzHStbQQrfN+SwEVoeDFhklEiWw1lc3EIxOVLV8jvSV0D
	y9pdKyJl4//t6cl3FLrf5RYFD6hU5limT5LZ0pA3d+5WPhhIsbFhJdt2E6+1
X-Gm-Gg: ASbGnctEMQMUvwA/I2T1Pkuj/pmYgN4x5igFmWZnMF107Nli+tkmNWSdz5VZddtRpzu
	91vN6qLxwh429QeFb7ONbHzQjm2cn/8sTfc5NH4mQTt6jAdHnXxZ0Fj6AauE1823fjWqdlqrPEE
	nFKbUq8CMRMh7He2v8eI0iqkxX+g2zem/AYaULHEoFQlv55Wy522Eb98K+ugANVkkWNi7TjhMre
	RFrLaZd62AqPjuEjjet6B2ooKyr8jkztG3vPB/5I4xv7AOFmRuqXkp3jdRu14o95b8/BCvs9N4F
	s8fKjT4K+ZzwTB1MKrspfzp0IihGgaEJ
X-Google-Smtp-Source: AGHT+IGea1KraOtyc+3+PWxbpYTtsqSI++VXVbrVd5KwfbLsat+uZGVRCREbGVuYpxH5f/XALHYQcQ==
X-Received: by 2002:a17:903:40d2:b0:225:b718:4dff with SMTP id d9443c01a7336-22e1eae32e4mr107268315ad.53.1746418522043;
        Sun, 04 May 2025 21:15:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021044sm5905039b3a.96.2025.05.04.21.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 21:15:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 04 May 2025 21:15:18 -0700
Subject: [PATCH v7 8/8] libsolv: Upgrade to 0.7.32 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-clang-merge-v7-8-165be7b96180@gmail.com>
References: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
In-Reply-To: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215984

Brings these changes

- build both static and dynamic libraries on new suse distros
- require cmake >= 3.5
- new features:
  * support the apk package and repository format (both v2 and v3)
  * new dataiterator_final_{repo,solvable} functions

- Enable static libs for OE as well, this fixes a crash/signsegv seen
  in stringpool_strn2id () especially when multithreading is in play,
  this is brought forward with clang merge patchset when using ipk
  backend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/libsolv/{libsolv_0.7.31.bb => libsolv_0.7.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.31.bb b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
similarity index 91%
rename from meta/recipes-extended/libsolv/libsolv_0.7.31.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.32.bb
index b395ff972dd3fc917c3e3b7959530be50d76330e..71786e40dce090839e390be14594079dc3321dbf 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.31.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "95aef5cc57d0f51782e55b6903b30ec93afbfa15"
+SRCREV = "95f64952e3270deb6be30ae4b786cae5c114c807"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
@@ -23,7 +23,7 @@ inherit cmake
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
 PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
 
-EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON"
+EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON -DENABLE_STATIC=ON"
 
 PACKAGES =+ "${PN}-tools ${PN}ext"
 

-- 
2.49.0


