Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01B2C83F34
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 01:32:42 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.2932.1752888759983226434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 18:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YkYbfFlM;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234c5b57557so25264275ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 18:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752888759; x=1753493559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OikFd4UdYtJfTNXsleiilqLo2ah4Vjw4kWDPZU/PFz0=;
        b=YkYbfFlMZ/L/MD35k7RpMKorYBj9JN6tylCXzq+1btNsUrwWRnHy/BdVPfp9HNt/GI
         FvVIJ2l+PfELDeSwpv2JidqdZgfxOEhgJt9fxY42OD1JfLxy4YSDrdlP7whpzGVzfIrt
         cSkrHzyy4Spj82TOGDwg0GEyMQ4arpDB+RwoowOPTVo6oFOmy8Bs/rbeqKHE4fSxC5HI
         +zGeZa3NG2S1Ym5tlPGrThdNVHPFK8wvCFcODwOQfAbNAMHXAC2fCLCuBvky3B5cVx/m
         zVtaRKdkxIw1g/+JdKfIAZHEeKSJ1NJW3E7pcZYkfKaUAKk5qt8QzXqwLn0U116RJDiV
         JPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752888759; x=1753493559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OikFd4UdYtJfTNXsleiilqLo2ah4Vjw4kWDPZU/PFz0=;
        b=Apn8expqeftzySPVIv5hCw0GFI5VEvPuQY7pRzpSOoqoX2FngU8wAe2Pp1tHaCpxtn
         pEra1HE/kSjUnmIaV8qasjNAglyEilcBEb4/m261ipEUf7wIt56jR6+UDcsBclRibgzY
         rxLi97d6dC3SPKe7wCQOqFFJMKSJXJH5jYAOzGipbZKj8yegiV02FP/3Fi+c1J5z0xOq
         ggaobKduDQFXhGmVJW9Wfj11zQgL5Kvvr4VX1CYVCdVlt3xGuqvmOqZr+ASnecrOZTQX
         AQ0ybly+qEjs87/HUl2Wm4BQLDy9cydxx6QQc7lGabU1KSFx8djanj9doBH+8Xzvunkz
         LiZA==
X-Gm-Message-State: AOJu0Yx4ZgDuBCrkSPcatQx7d0l50r0Tmi6qih5/+QiG5RWI4ut6KolT
	th2bcSG78k1C1y9tmiQTrB+PnpduMm5uDujOGv8lsUiGM45D3nNpphvASyf5XXPjDuY=
X-Gm-Gg: ASbGncsXpIABnyxoSgYV+sxUx0y+XPlQz1SpdBnPiDirhxC/qjxJZBpZn2g0d/1MdXZ
	OlgblL4dKh24EMp5A+F5nqnrvGugQLLDMpd2jyukIyncyjaUJuEhKcuiAgQQhDBJ/UQsSXrgDIa
	+bn7cwwLybsgjs+ZO5SnHPmEKD7n61+XnVj35csGgOebRkUboBhTiN+Quo33SVT5V5GdJdtP6KU
	nCFJnNYv8w9flkWQB9Ge7+9IqQtO1Uo81daleV6zOzRamC+GZ5CWikhNsbceMlsBs/+OOHFs0fe
	s+/7/ecRYmAn9UMUl1t1CdtEMI6Jz6AO7QFMBylUBOE7DOI+qn3FitiAyyBARNmA90yz5qlgNZ+
	5V9FVuZuT98bU+GfcuJ5lxERB
X-Google-Smtp-Source: AGHT+IEIkB+qFVfvMTyL8kBNgiT3lLTR/+YA4V1DvLJv+341j8QOmMuKM+Y+sD9b74m4QnWBbXIpnA==
X-Received: by 2002:a17:902:da8b:b0:238:2990:6382 with SMTP id d9443c01a7336-23e25522cd7mr205641045ad.0.1752888759036;
        Fri, 18 Jul 2025 18:32:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::edf4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e5b40fsm2011401a91.13.2025.07.18.18.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 18:32:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] apt: Always Use libstdc++ with clang
Date: Fri, 18 Jul 2025 18:32:36 -0700
Message-ID: <20250719013236.275126-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Jul 2025 01:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220607

Clang can be configured to link either libc++ or libstdc++ by default.
apt does not build with libc++, this is reported upstream [1] as well
untill this is root caused and either fixed in apt or libc++, use
libstdc++

[1] https://github.com/llvm/llvm-project/issues/63743

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/apt/apt_2.6.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 50ac2ea812c..45761367e4b 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -56,6 +56,9 @@ EXTRA_OECMAKE:append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DWITH_TESTS=False \
 "
 
+# See https://github.com/llvm/llvm-project/issues/63743
+CXXFLAGS:append:toolchain-clang = " -stdlib=libstdc++"
+
 do_configure:prepend() {
 	echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WORKDIR}/toolchain.cmake
 }

