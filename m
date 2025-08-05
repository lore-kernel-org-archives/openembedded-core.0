Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBF8C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 07:24:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.16240.1754378691435171145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 00:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gYPJmgoZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23fe2be6061so38792285ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 00:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754378690; x=1754983490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Faow5+bq+yDaoLsumQc4AKEOiJz6darG5lNfn9ssMw=;
        b=gYPJmgoZf3yt5QtIKKzaGt1+DAGj4n6mRqz7/c5EBqoEeNWr3yMeYn13pLy0HLJS5o
         tdDfXod+/JJz5geNxyqmJDv4wg1b28he+Jcjc5WyJzLB0QWQCOvQ9ky4DVd3ALoja+Wi
         n/mD8D6VGyUbYL4KsPRD6x82VcaZLps1H2DgKPoneVC6Mr2+3o11JzRrWiuoPGkGhMPL
         yE6CsWJd3SCYZHvAiaNUOa/PQJdMjGEuIpUehT5546/m4Ck+JMKa7iCDX8SOs/E7FpAB
         iCvRX1n0W1rKkjDq+dM0h85Uw1DPK8fCOdlBJ+SHvZA6Yq8yT83jVe/2SqIcsSwg68L7
         hz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754378690; x=1754983490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Faow5+bq+yDaoLsumQc4AKEOiJz6darG5lNfn9ssMw=;
        b=sgkCAuXcxzYPH9i/1m16Omc0vvbKYMg/+i2FglgIYn08liarjsfUIOlk/SxDS0csdR
         KW4vUAqoYXjPtUnYafyyTbYeHwr+/Ak1sBTyQ5HWKHec+JfUTpfsqTwVKEA2CEgZYueo
         6d/kbf3KDsh8BrBFpSs323xLr94YxJNtSFT6WgiVkhJxQFwrBQ8X00ddXx9w80ybwSSd
         jZYBciFTBE0Fi85VxFkEeFSiJ8bigc2w5Dh9jdsW/CD8Uv2OWGgOU8qRpEmoOG1RT1km
         EcaKCPugT4C+IIl+ehvSzilfmhZUE5F1fTsSf28F9GSsbgfPyg7i7QXLXI8SgZ1ZAvoH
         OSsA==
X-Gm-Message-State: AOJu0Yyo/bzMVb6Owp8ruuOLLX52AhX0KxV+6befcI42C1nkRehB6rtd
	mBWg1ZG4DnZsdkKuirkOMcFZRwp17GkcHo/L2mUNKgVuYHgw0SORS2badO2kvBU=
X-Gm-Gg: ASbGncs9dMN2KkpeC1LK1IrjNOCrfAnyetyunf+gXFBec3oSF7Ut8Vz/j/iJ3IL6k4c
	J4fbU9RQSqNr+zm+Z7+Nvih+b8ygKSKMpD4PxPhEUMntElcxfWusV4OPFSjItuwf/WaDWK8I1mD
	yH7cmSIaMe1kdske4w1O7zGGXE6ZxxVFIFRZuQVqvAxFdfM3Jyl1cq5edWib2YTDXdOQLRx64K/
	jjX1mIsNgrTnuMfXRRrH0XVDwF1P4w7MYKRTRjYyVc6paq21MkGKtaKnopNmmxsFYi8a+oXSt2z
	iLFwCsoHT8iZcUPNmm9w6wMmc5MMKvKRJGfhfAmE1aioxzF7TCLrbw/ROqfjodk6kKT0MKivNoL
	5S0u7BKsqnS/Gzf6w7ZHKaVaNKmg=
X-Google-Smtp-Source: AGHT+IHOM3jqpeO0m1hR4pzS/gRiKhCF/7pM8l8iYc9m23wh+l4AVKDcphB7EhJMXpw/i6jQmamjYw==
X-Received: by 2002:a17:903:41c7:b0:23f:f39b:eae4 with SMTP id d9443c01a7336-24288d20b20mr28942625ad.9.1754378690246;
        Tue, 05 Aug 2025 00:24:50 -0700 (PDT)
Received: from L-16657L.kpit.com ([103.189.135.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e897716bsm127064315ad.112.2025.08.05.00.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 00:24:49 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: Nikhil R <nikhilr5@kpit.com>
Subject: [OE-core][master][PATCH v3] cmake: Add PACKAGECONFIG option for debugger support
Date: Tue,  5 Aug 2025 12:54:43 +0530
Message-Id: <20250805072443.648964-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 07:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221459

From: Nikhil R <nikhilr5@kpit.com>

Starting from CMake version 2.27 support for interactive debugging of CMake
scripts and configurations was added. However, by default the `nativesdk-cmake`
is compiled with debugger support turned off.

This change adds debugger support for cmake

Signed-off-by: Nikhil R <nikhilr5@kpit.com>
---
 meta/recipes-devtools/cmake/cmake_4.0.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake_4.0.3.bb b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
index 7d8b8cac65..cfc5cb1b93 100644
--- a/meta/recipes-devtools/cmake/cmake_4.0.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
@@ -43,9 +43,11 @@ EXTRA_OECMAKE = " \
     -DKWSYS_CHAR_IS_SIGNED=1 \
     -DBUILD_CursesDialog=0 \
     -DKWSYS_LFS_WORKS=1 \
-    -DCMake_ENABLE_DEBUGGER=0 \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[debugger] = "-DCMake_ENABLE_DEBUGGER=1,-DCMake_ENABLE_DEBUGGER=0,"
+
 do_install:append:class-nativesdk() {
     mkdir -p ${D}${datadir}/cmake
     install -m 644 ${UNPACKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
-- 
2.34.1


