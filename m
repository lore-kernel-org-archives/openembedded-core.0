Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1184.1795890562114450287
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 10:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fxHG95Lr;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385d8a00598so14821765eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 10:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795890561; x=1796495361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJ3qarEtrKwcIDl+f4aMRq5UMDtc9EffX9Ys4Lbeudw=;
        b=fxHG95LrX/mIiNEfg85j5yLpH1pqHjh278IcGPBxD2bmDcXwNRZdd5QfmJ9Anf8I8c
         BW4ar0BSIFqUl/ZnUJ/jiqBFZ4i7dok/BOdD6E2Xxx52ivdhtDQHlmltWAZxn85NL7y6
         U+hLiJVZGKBJTge/Nsv3b0sedOD82ib5KT+f7CXUdZ+446mEKCUDUsS2gk7C6Wpywjuf
         M0VmSbHkZAEhUCrzMGBz9SRZ99fyBeyE7zBPaQeyZ6EEkovhBeppDfMSMq8SlWiGTsLc
         jSXibjeNRfn5UUFns+YfHT8f6Yzheckn4qA81Wf6cE3I97XEnX2ZSip1ZYVTdFyoyOKX
         S+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890561; x=1796495361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJ3qarEtrKwcIDl+f4aMRq5UMDtc9EffX9Ys4Lbeudw=;
        b=GWqvipotf58fjoT9YspRxsM+5qvPbV3hFeIsTPZ06KVHfbHwpEtDujBkCuqEDqz2VE
         5mvG7qtakdIVCB2fx2EFNYes2JXsmMWK1+Rme+kIVRF6eiQGbmWb2xZwp/vfKe14WB8z
         79MxEqkY0DtLOUvYq1vBCsyFoasH0d3QGizm4uUnaVOy4hLb29mbanIdALA5hWorFFYK
         f06Zh9U4RaFms84GD1yXK8uhCzH5f5F+AJKwU/izVA8ff1rcW7WGm3CeE5nn7KKN8a7e
         HfFRvmk4rDZQWErmBZ5A7TGcj36freayI3MRM7ALy5aU30CbZ00KYgECw8Q25DXcnXGd
         oh9g==
X-Gm-Message-State: APuU4Z+J/qd3jd/J85vMbArXkB8q1laljamz8wXLPtg4JorbIPhVwaAE
	/rK3/gPPiZkffKYjMv+GZVNJSAKeSNYprrCfvccXcdK4836hCokxxJ1YaYss9kmX
X-Gm-Gg: AZFdTZdTjM980a/YmKBHkFwaXqrXZmN8AWBPrI6glI7iZZNuotKOteHVWOJTm2kUxKS
	2TMui8ZLWNY6QLbJHgzQmWWJC1ewfQ3Afefd0/+XVNyJlrVt7KANynwhQUo1bjbuvzU97AyRT0u
	C5YhBhnZ/TGZ6hn2SEpMo+W6vAG5n04eDnyi1cdBdyQaW1OJ5wQuK1PiUK5XUG3V5J/tbruWLPL
	JV58OrsyEgFNIwlwaDaPilvXkTbubEb0ozRwRkm1ZDJqIXwPww3Y9vhMfdRuvAA8ZfP0vXb9pMV
	WO8PkI7RzzyQwxOtxQIHrQlr0kKjBI/glsfLriVmkn4Tzz/F1ruXCQO7Y8fVGc4rDqC8AH63wjM
	ouHNgeijvcGYqlzMx1Bz/jFXfTGIMr9nTy0KsRe4Ap+Y9qqPvy38N1rZsGu5iHfAQUyG8Xnm7DI
	3u/DMFXPswSmzQNc73HSUtQPKaaXJXvKSNP8r3T2ZylvsmCDhrxrBqQtNShA67AXFnV+5Y2jw4y
	MA13LsvwZOe/ePgtoRF/QsKQ2UE8TMl5onzlopYKG55D14ykvb707cwU0xjpFNEYmecyuLhUQo/
	Z72pNCefz5zLe5M2c9+qkU0B3eniqe7OIGCGYHqd00ZsbWxLwuxGTA5GU2ItSd2uvuX4BiBC2gI
	DE+zXggCzti3nZTZerF7rfgWEdVjg85Gl/P9bWkRhbTg/xFqwQvmYN1RggvCGGVUJo13+nry6sJ
	Y3byYl0qQk+5hEZjRzSVbeA0Qh0w8HCZKAudOsQPix+nvcgdy0bd71HKf8GpA/tCYlpEd+Lntnt
	3UScGfeXQmuy3Vn/AODnJQNCFPZQSXPJbHAUdPVn13CbJEo16dHvjRBNbhnD1QByF9ZeQm4Guop
	QmEC
X-Received: by 2002:a05:7301:2419:b0:367:185e:867a with SMTP id 5a478bee46e88-38571027a5dmr30442376eec.38.1795890561235;
        Sat, 28 Nov 2026 10:29:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm70403164eec.25.2026.11.28.10.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:29:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/2] newlib: Restrict the upstream check to newlib release tags
Date: Sat, 28 Nov 2026 10:29:17 -0800
Message-ID: <20261128182918.1484961-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 18:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251506
Content-Type: text/plain; charset="utf-8"

The newlib-cygwin repository also carries cygwin, gdb, binutils and
snapshot tags, and the default check picks newlib-snapshot-20211231 as
the newest version. Only consider the newlib-X.Y.Z (and older
newlib-X_Y_Z) release tags, which gives 4.6.0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/newlib/newlib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 4336f1bfdb..a8487029ed 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -18,6 +18,7 @@ BASEVER = "4.6.0"
 PV = "${BASEVER}+git"
 SRC_URI = "git://sourceware.org/git/newlib-cygwin.git;protocol=https;branch=main"
 SRCREV = "8ba4275b83ec27529f67e0d477611fa6d8d6e6bd"
+UPSTREAM_CHECK_GITTAGREGEX = "^newlib-(?P<pver>\d+([._]\d+)+)$"

 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/cross-cc"
