Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A935AC83F3C
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 04:09:19 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.13147.1752811753450671719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 21:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxVa9FHW;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2349f096605so18868435ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 21:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752811752; x=1753416552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jOEFZVcxQwAa6Ugz9JhDQvKFu5EVMjyntOpFxXATVg=;
        b=hxVa9FHWH08CdcByJ+Q6twetwANurMmXAB46DU5Lf5GuNaAUgZYdEACyXl4q3FN8cl
         0J5va/cL9gGIyZLal8SsgZJOaUf3b8RNpEdHegO1fsEMEBYdveSEQxeMBF+2QqITZJBU
         WeKv13CC7YFqIXKza5R125tEFZana3mhDFiyOr4cRUo581nqF6shitKK0ctvTNFyNJ9z
         ZYNFLrAaCOo/GqMRYGzLQfTi4zO5Ue+Fk1k2yqZzZXrXGhFpMEwXSs/LlZ0BD9NgWq+5
         hjc8sbhBvz79IOWTsDI8uhx/5ARC5td4un6rT3tBJE5ObepBPzDjjs6hU2/POqYWCV+e
         X4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752811752; x=1753416552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jOEFZVcxQwAa6Ugz9JhDQvKFu5EVMjyntOpFxXATVg=;
        b=e4/EKhuucEHCPe/PNuUA4IfL93Fjgpc+BSa4eFlVrZZOD8A2HXaMdoknFh0fOo8WdE
         qBVfjSEii/Fe8olsW+ndKIwKPTPAe7OoNS2qJdzxHezK8fGP9IZDU0eMx9Cn6GjqmTBQ
         1yscnvySpSmcEmSlJ+EkqaC8+1mmkHV6lGMEtT8QuzZYpGldQ5Nv12B1vt7Y7E0DD/FE
         aYhkItxnoI931ZlVoqDTISn+3mHZzbDqVhmkMj7EThOyrrJVm3HGP2lNqzG1RlyFvMcg
         Jlb1zAR68mG4X+iJrTkztWBfkvuJl/Z4Yby2Z2gDvehMcNz0W96Ynb+k38gZQXjDdKdv
         yyCg==
X-Gm-Message-State: AOJu0YxfBqpD95WJm2b2WpCcQFXGuPf+yCcD7DScSNNr6klaS13gg9uh
	rgL2AOUXv9EtR28rDZXaGROlw0ZZtf2R6W6LDwHUDcoJm2CcefiiyHOSplsbAstmYmE=
X-Gm-Gg: ASbGncv8RsGJDhCRUA/+V3t8DnmO0rjqfVlWpAe9ETcISoNm1k4nP7b7mxI3+j34v7F
	KuHNbxbJk6ucvxZQNIxyVM6MvnsW2hnrvgC2xWoKoqZUBeBoLc6W01P/bV6khdFu7JyEQVjj37y
	23Bd1qSCsXjCF5W0r3PFuBksDTiFRME06yjg5qy1XolL0wIDz393iIdBlqN3ZnZQyVJUX7NXfaf
	9rht+SwXCpThhThtD30mh2wk6vsr62hVusQNtCiBbF7X2PmVLNJpn9sOxHkYWgSA2Zi8/vpcY7o
	wgL1vv+CBFFmn7+V/s08JSp1Syhthd1dUirwk76rZVkqm+r7XIXrr+q9hcX/gxehY8AxMIQMYlT
	Draimh+rwJ/W5+jG6/neMOBJd
X-Google-Smtp-Source: AGHT+IE0g02tcTxMiOMWJjhrbCbcIpI2G4pEgDM9ztCvwlqdvJOHWDI7QravaICUSwgC0ET6XBhV7g==
X-Received: by 2002:a17:903:2441:b0:234:a44c:ff8c with SMTP id d9443c01a7336-23e256cd198mr105635595ad.18.1752811752416;
        Thu, 17 Jul 2025 21:09:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8d14fsm417157a12.26.2025.07.17.21.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 21:09:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] clang.bbclass: Add clang specific ldflags and dependencies
Date: Thu, 17 Jul 2025 21:09:06 -0700
Message-ID: <20250718040906.3591603-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718040906.3591603-1-raj.khem@gmail.com>
References: <20250718040906.3591603-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 04:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220569

* Qunused-arguments option is needed for making clang not error out on
  options it does not understand. This is required for some packages which
  might be using the gcc-only flags. We still want to know the problem but
  let clang ignore it and move on instead of dropping out

* Add rpath defaults for nativesdk recipes to let nativesdk packages use
  SDK sysroot correctly

* Add clang-cross to sysroot via POPULATESYSROOTDEPS to get llvm tools
  e.g. llvm-strip, llvm-nm etc when they are used at default STRIP/NM etc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index d7b8a3657c6..f7e3e7435f4 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -29,9 +29,13 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian = "clang-cro
 
 BASE_DEFAULT_DEPS:append:class-target = " compiler-rt"
 
-TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)} -Qunused-arguments"
 
 LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
+LDFLAGS:append:class-nativesdk = " -Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.."
+
+# do_populate_sysroot needs STRIP
+POPULATESYSROOTDEPS:append:class-target = " ${MLPREFIX}clang-cross-${TARGET_ARCH}:do_populate_sysroot"
 
 TCOVERRIDE = "toolchain-clang"

