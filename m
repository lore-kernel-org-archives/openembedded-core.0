Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462E2C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 05:43:46 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1109.1745559817234236122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 22:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4hebRen;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736aaeed234so1630406b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745559817; x=1746164617; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AZNhrPu/ql7VC/XdDgtKSsy0/I0x2aFYmrukg/YtJw=;
        b=B4hebRenU6FYFqxyidGDZwvzOR72fnHlVdZWz9zh3VggHTpn6jRZSO94KpgV5v0zHH
         1icVWomRZPNmDOyO10sjMGxMB6QDqytYbB7pAuizcq1ygnbjXBf1XxV+N9RMLX4AMTo5
         mvZ5opSTC42vcjpe/BFnBl3vQtujvunKCEoUlzgTazG4jRBhAMd9QcfDAc6x62fPs6W/
         DlPmNzgL65l3kJjD5HQcVw7J0R55Evr4DX6vJ5JzlPh/xC6fN+Qvsq104ZDve/Y8A7NM
         9BHF5RU0TYphF25umWRaiHi+eRIftaAnDXOaC2rdfyeRaPq5YKow848Xa0VcHsWTorUT
         nd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559817; x=1746164617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AZNhrPu/ql7VC/XdDgtKSsy0/I0x2aFYmrukg/YtJw=;
        b=oEqPdt3BHIS10FbZtZpCWDzWUOJYQJQgFCRgbG6iOtF8IR6L9STyMcSyxue779wWV/
         eMQD7QgDzqsVQ1Elr2CuvLXJUYGDvORmtejWSL/1UGoIQFXhUnxg+2R6kIcCDDhx7loP
         B2iQGESjoQxfoTysNk4TzOeFYY9ZUi8lV5S4fhnf/JnanrR4LR7Qujgrsi8PttNkM5/y
         7XWoR9xmJ/Tblyr6J1NgaUs2YBQWIyYMk3Kd+bsFmIgAdJ8MOEQ+OoZGYByM8T5Z07EH
         NfcwC9XfvU83W3R6cUAvgiElUs988vXgFmsCPjdprQqQ4VqzVXsfbTkm/UMU5nx5uV7m
         /dhg==
X-Gm-Message-State: AOJu0YxYPYqosx0tAJ5fr6hiYLgMXfPpL6rkuYJKw/JwX+o7FvqXLSkJ
	h86bR7cDbcNCjOJWV4qCpzptAYSNgNP9A8qfBjolk0o5kK/s7q1qjWJ8/vno
X-Gm-Gg: ASbGncuJYSPNpBo718sYKQCgnieBfIDUECAtza9uBnAR5xqp/cojA7dLWkuaE7PaE+n
	/szW/DwS+b2urfamSA1RsdrF15qmvM4tJmAyjZ0Eed2/GjQpfHqjmne3ef8HlHK6Lv33gAoTd04
	ybMcWfYNxhsZRbyVhbtRACcTmKw0GI0xV0dTs/UnA3Wy0c+1jK32Zw+p/ih9FzlKbktH78ePv+Z
	9YB1FMfd1bbN8In1OJFmzYlyWiOlLKdx64W5HxGg51Eovkt17RumKNIoJ4GHegN447v0mc48BPw
	e8xXvN15AP+rRpxJ2Zstq19ximmUJq6S
X-Google-Smtp-Source: AGHT+IG44kzPuVk86OeG17rRJ8PDUcuY8RgbE/gnc3ijVLn8qD/qRwSgJNoNmeJmKgQkNMPrbcf6FQ==
X-Received: by 2002:a05:6a00:3e2a:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-73fd896a139mr1203247b3a.15.1745559816558;
        Thu, 24 Apr 2025 22:43:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm2363626b3a.167.2025.04.24.22.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:43:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 22:43:28 -0700
Subject: [PATCH v2 7/7] maintainers.inc: Add myself as maintainer for clang
 family of recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v2-7-0a51d0c1940d@gmail.com>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
In-Reply-To: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215422

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8065287c171dca14b85b2b78660a24b5994337a0..8f480c768ec1aee41c51ae86a85d4137a388a638 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -97,8 +97,14 @@ RECIPE_MAINTAINER:pn-cantarell-fonts = "Unassigned <unassigned@yoctoproject.org>
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-clang = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-clang-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-clang-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-clang-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-cmake = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cmake-native = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-compiler-rt = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-compiler-rt-sanitizers = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
@@ -325,6 +331,7 @@ RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdazzle = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
@@ -472,7 +479,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -540,6 +547,7 @@ RECIPE_MAINTAINER:pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-nativesdk-clang-glue = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-icecc-toolchain = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@arm.com>"
@@ -559,6 +567,7 @@ RECIPE_MAINTAINER:pn-npth = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-openmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-opensbi = "Thomas Perrot <thomas.perrot@bootlin.com>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Unassigned <unassigned@yoctoproject.org>"

-- 
2.49.0


