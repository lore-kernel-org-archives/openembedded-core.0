Return-Path: <matt@madison.systems>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2DC7891E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:16 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 68so3147289pfx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P/MzlcKetNtfeSG5UZA66Cj3uAy6BIO/LIjdoifv178=;
	b=05HN1TeURMNy1/JsKn4HF6JaF5FEguN0dcvlTiQFgDr6XPo0PB0wiJ0CTtj1Sm4Myf
	y6GdNM/PIMJF1h2ZthqGsaEGxXr4F1vwtjnBTmpAWTRrMM7pbEYp3PJ49MMZabEeOYc1
	+It+kIj5+2LAj6cnUTAc3mkdaF7qTA0/rFMfN5uGHb/WVWsS8RBgKmoWb1i/99jtSgxo
	PVr1KlD3P380C4Ec7iUw32rIytL12cTdEroS26s9vFM9IPvSuH51RG1fne8SGlx33MGx
	QCW5d+uW0jYoVsRZYWMwlipfP2W1fhN6ORwuXDh7ofpSPfp0lSDWdEZuTgJn+URUwEpc
	N9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P/MzlcKetNtfeSG5UZA66Cj3uAy6BIO/LIjdoifv178=;
	b=FqaKOBbcOZAO4tKPSEUN8htQlBlUSGK+ai6wpKCcRlawQDAh4HCJYhSZ+OV9fhw7xG
	OpQQP4Y8kAoXjSzmkfThA/Ph1vamrShCoFKINN6guQqSYenfnRPaCNmPFQL3nmdVBP32
	PywPEa4CrA3/DA4wL+62P8djx+x7hMx4X1DznDfsrslW/IGNFVu+rKYLDSbwk1vxadL5
	ciEXfNxN+PqjdofQHyw/OKmubj3eYodMNOS9kd5v62Z1nWaXH3+B5LccrsI/K3xapVzy
	3t5/y3zR6S7L6BDoGWU1/vwgNr9s6RiM6NZ7DnKFLSypKIJwL3BR2YMrl+iTbWG88jdX
	eT7w==
X-Gm-Message-State: APf1xPCDQUMwLJZOAf7hGXzm9u1qSZwKLWkCi7rCp7UhpOSSM3XLD+wH
	H3ZOX45QpbBOicPNs/k2zBvmNTcs
X-Google-Smtp-Source: AG47ELvLDe2uG3GXlDYM7PZ0ieV8IwgM9Cj/gwhcbJo2zkkIswfC0lwa3wLD4RUDGw/mRCpggkTz+A==
X-Received: by 10.99.108.199 with SMTP id h190mr2877244pgc.295.1519946237243; 
	Thu, 01 Mar 2018 15:17:17 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:16 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:50 -0800
Message-Id: <20180301231654.24018-10-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 09/13] go.bbclass, goarch.bbclass: update SECURITY_CFLAGS
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:16 -0000

With go1.10 the NOPIE flags are only required for
MIPS target builds, and are now incompatible for
the other architectures.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass     | 3 ---
 meta/classes/goarch.bbclass | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 080fb4ae69..90863acbdb 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -34,9 +34,6 @@ GOTOOLDIR = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go/pkg/tool/${BUILD_GOTUPLE}
 GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOTOOLDIR
 
-SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
-SECURITY_LDFLAGS = ""
-
 export CGO_ENABLED ?= "1"
 export CGO_CFLAGS ?= "${CFLAGS}"
 export CGO_CPPFLAGS ?= "${CPPFLAGS}"
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 5c8ed33b15..eb8b32d35b 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -35,6 +35,7 @@ COMPATIBLE_HOST_powerpc64 = "null"
 COMPATIBLE_HOST_mipsarchn32 = "null"
 ARM_INSTRUCTION_SET = "arm"
 TUNE_CCARGS_remove = "-march=mips32r2"
+SECURITY_CFLAGS_mips = "${SECURITY_NOPIE_CFLAGS}"
 
 def go_map_arch(a, d):
     import re
-- 
2.14.1


