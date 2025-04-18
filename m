Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E55C369CA
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 17:59:22 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2108.1744999155291135453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 10:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Su0nBIm9;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223f4c06e9fso20158265ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744999154; x=1745603954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu3II48jho8iAbVw+K4ALGRmJWlih4o5loO3khbYxXw=;
        b=Su0nBIm9lphov+5/y5RnwqPIGMTB7JKrJpD7YZTN1jsE7MtlJgFAgqI8ljIin+c7H2
         ZzjjOOolJUpC59WkbD0vTfloGsTAxphiTyPIpmsDas5BofT0V6TTApT5Zr58jbxjbzJw
         6l084nBNtfi61FkxGITcZJweQcDQUySY1WVjIKIBmcUH32sMo81/3aXW5Uk7AW1F9Mly
         X9VUZv8QzfbIzXmWJN1tPnT/SdYNsoIn2rvjyoYXF3PKZDjXZJWWvHpK2J34mL/iIgKc
         Imead9u0q4iDZUXUmdErYgoNyz8J1wc5vSQcGSrzGdIJnn6E1a51s0ADhqBbHgEmEtDc
         o5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744999154; x=1745603954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mu3II48jho8iAbVw+K4ALGRmJWlih4o5loO3khbYxXw=;
        b=DRFl8wKs4cHN3GdL9KJB7S7vILx1Zld/ERgnHbW+KjhfE8MkYmzs+8AEeaqFpQmSqU
         AHN+jH0lacv5C8RV2Nuw2peNIx7V0xp302hiXCjjNlnLO5XTF66JasI71CK/UOIH32jR
         9qbZmNUoDs8rhaFnGfsJwFZeE+8TlE3DEEeaww8ViMKlVoaWskajPSpU0nsqhHturpLf
         Q91blXqa/SBpIt8jEoVo+OQ6I+6o28gkeF6TVzlY3gA795qeCL47Uj1j8oZ99OVZdHoh
         tFiE7Ktr4UCvWjTHhy6do9VeioWAeDYyz1IXiQ7tYWhpHPxaEafWX0D9XNMILQbPXPVi
         nqmw==
X-Gm-Message-State: AOJu0YyqEKn38d/xKHVQxOIyFGUN2ZMMLeUCYd+3LrgQoJ1AMrkoiiZZ
	VrqL/gS48J04ZQhy03sVmYAEVPdhN2I7JG19DSLXpW4P2j8NJ29MlZd3ZmAl
X-Gm-Gg: ASbGncv0sFKesZzj2XucNAI5oVMwsIz8uEm8FZ4wDVjbqMgHdwwqbdzKnHlyPGEN5y+
	JrqDDHsJBCsmXcisYG6AVKJdd1pn4J559p4Jn4JjyyUxgPYZd6WEJQYl793wMnC6c4JD0/F9SO5
	Qj0AQoEgjHiEAxQg7fckTAJBaPKu3/GJZyqhxwZo8rsSDoqkNdzswE+el6o5Gg0NEIgPlBQOtf5
	Ex0VGlDWW7oLK38qu+ZEEHQFhh2wBbqvJ5+aHqafcHT8JG2mj14fBtmbLAqa3gXYVgTb2F8GvE4
	5l9fj0PnHmftH5Ix63DGJifcMSHgCVxU
X-Google-Smtp-Source: AGHT+IGKSNYkVh1bdEp15b9uON0e8XvDygylFACqR3Mn7vggOWk1UPCMzPRzuaSwDOnbKOCRDs8Lcw==
X-Received: by 2002:a17:902:e884:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-22c53f17338mr53500815ad.25.1744999154466;
        Fri, 18 Apr 2025 10:59:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bde206sm19816105ad.14.2025.04.18.10.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:59:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jacob Kroon <jacob.kroon@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] bitbake.conf: Switch prefix mapping to use -ffile-prefix-map
Date: Fri, 18 Apr 2025 10:59:11 -0700
Message-ID: <20250418175911.4033750-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418175911.4033750-1-raj.khem@gmail.com>
References: <20250418175911.4033750-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 17:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215137

-ffile-prefix map is more comprehensive when it comes to reproducible
builds and its superset of all prefix-mapping options in compilers

This makes is cleaner and workable across gcc and clang, clang does not
support -fcanon-prefix-map and it has to be explicitly omitted when using
clang.

There are lambdas generated in templates by clang which still get the
absolute paths despite -fdebug-prefix-map, this helps with that as well.

nasm is an outlier and we have fixed it by adding -fdebug-prefix-map option
luckily we do not pass DEBUG_PREFIX_MAP to nasm, in all recipes which use
nasm either pass -fdebug-prefix-map explicitly to nasm or they rewrite it
to use nasm flags syntax.

We have discussed this in past [1]

[1] https://patchwork.yoctoproject.org/project/oe-core/patch/20230428032030.2047920-1-raj.khem@gmail.com/#10281

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
v2: Drop using --ffile-prefix in go

 meta/conf/bitbake.conf                     | 14 +++++---------
 meta/recipes-devtools/rust/cargo_1.85.1.bb |  2 +-
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8f90026f7c2..b4e1964f77d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
- -fmacro-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fmacro-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${STAGING_DIR_HOST}= \
- -fmacro-prefix-map=${STAGING_DIR_HOST}= \
- -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
- -fmacro-prefix-map=${STAGING_DIR_NATIVE}= \
+DEBUG_PREFIX_MAP ?= "\
+ -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${STAGING_DIR_HOST}= \
+ -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_LEVELFLAG ?= "-g"
 
diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb b/meta/recipes-devtools/rust/cargo_1.85.1.bb
index db18ecfda9a..150c2d2b801 100644
--- a/meta/recipes-devtools/rust/cargo_1.85.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.85.1.bb
@@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
 inherit cargo pkgconfig
 
-DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
+DEBUG_PREFIX_MAP += "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
 
 do_cargo_setup_snapshot () {
 	${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig

