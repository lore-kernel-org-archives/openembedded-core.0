Return-Path: <matt@madison.systems>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 161D278918
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:44 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y186so4480930pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VeLeW84fsYwkcCsHgxuGkOjDyNR0RHPyMkeGaExrzhQ=;
	b=IM+CpAmiWn7vlNeYNSU/Uz6BamZ560g5uJvJj2G60ZFj+CZOIQh+dZ+IYvuTTpuxuS
	VOPGgZtvm0IRrlhHy1SK3du3dtpdHHctccKMmQTFQIwrN/unaGzRkzP7Vlw6NCWsEZcI
	DUo9DN2DK1s4IaSXAAOQaTUsu7ZSadv5L14GQV1+C2yk7nblNiFBSB/ghyd7VLLdfYTi
	ejumqzJFZtL2E7aRgljNby5dL1E2/l7ooAKuKiCWSSrpYJKqaTEfNPbDA6X1YnbSuDxj
	C64tBFDKoLZLWtccMypUpTl90g9R/x1yN6eO6/uY5PVNVWwJTasKQFEq3+Moz/tj/9Zy
	faFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VeLeW84fsYwkcCsHgxuGkOjDyNR0RHPyMkeGaExrzhQ=;
	b=nxFailcgR6U47TA7igPYoJErH8L7LL4+pYHxl7tYmxd+NKpQnr0AvHkYURRzvGZIN7
	JCQJelsxioooYIPoKyMKVbLU/Hj5EjYneBav//ZXOPXfPMKw3whESulJVjPIHzkb47V6
	+Y6jqvp014mZM2O/UB05TSE8T5Kjek3vQTK3LBgb6kINzay9AEA9/dOoFGpclTh52mjd
	0NeUI2fTVmcqpN5qUQtvyIiS3zVA8dsQxJYF/xnScuBGsJai+RoA3fZRkLBv4oQ0EYko
	hwqBwOeda1kXVTstAGxa4n3POMdg76qghQzgFFvvbAMBVNoMbjfIM9cTAzbU9SlwrrZP
	QjWA==
X-Gm-Message-State: APf1xPBTknYju9ZukDqbwWQjA984oWTsy3nmo2h6VlVu5h/G8I9OXvQM
	yt0qTwpmqrNKELvkywnSsZRw92j+
X-Google-Smtp-Source: AG47ELtDhAiIi5qngVVEwswswiigN5XpwxaldyDjfW96tKpPq7vHnw0R45EI5R2hdKhyyzw7mVqjkw==
X-Received: by 10.98.192.74 with SMTP id x71mr6765115pff.21.1520022826111;
	Fri, 02 Mar 2018 12:33:46 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:45 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:10 -0800
Message-Id: <20180302203314.32737-10-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 09/13] go.bbclass, goarch.bbclass: update SECURITY_CFLAGS
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:45 -0000

With go1.10 the NOPIE flags are only required for
MIPS target builds, and are now incompatible for
the other architectures.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass     | 3 ---
 meta/classes/goarch.bbclass | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 010914c307..821095a63c 100644
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


