Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2098.1794939645817191374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=plbgaB9E;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so2290295e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939644; x=1795544444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JUCYswP7kvzpfCKb41HzTHhlgAE7pWt/7YcTn/rVuiA=;
        b=plbgaB9ERmxgfwN7v9Go51sUaTSHM5kBnaCzbB1ugZ9h1zVNkcucQW2UEOZVpPz7Jb
         3+k5Z6AuTsFnxV9eNZ4Y1qXy10YWlSeDUK8+3gYVy/6TXZWNTF1Ppu/IMiQXHtX66rvX
         AeTj83yy5HcdJPd9H4ZQScI1M375DCbDVVgaACEfDl1ZK3DECvMMSdd6WY5Jj7kvyTND
         xPbIYqM+mPMQrAsD5cGiJPBrCLYzKYe12TrBv3bIPNhuwAAYv+vJ41sjMqpiNDG3wqqA
         SeF6R0nD2oVV3r3qYiTVbNbgbw3VUSScSdm5OuBerDP3o6Cr+zm4nDU4XJqL5qnWqCTB
         M4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939644; x=1795544444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JUCYswP7kvzpfCKb41HzTHhlgAE7pWt/7YcTn/rVuiA=;
        b=FElFnpeYnUHOkca4Kqgb7ZHCwAMqTtRa6YxKVy7E9B1WSl0bPSXCtQLuw3hyyonPjA
         M9K+o1en8zID49AFOYKTc4CMbgi2+PhHA6VLRQ6Txn5b5NB/fgINDRpLVd0wZeF7B9ZB
         V0SfMjM8O1QcPVGbxIMYqIgqi6juLc3sVTJ4gxiLI95lU6wpM0tmj2FBTzyRn+mzRYMz
         R5BBwQwYKxgwo/+3inC0K8ixO9EEdYXRxmbe0M4BEYVM74CrWHUjWnxCtmB4pJcEUH91
         QyzUcOv+NLkHlc/ylbg7ktJBMAUbu3UXa8VRckiQtG/fwnKLNDGQymTzrrm3uFGkkweM
         NeYg==
X-Gm-Message-State: APuU4Z/+jxT/NC1uRE0Bq/iKNKSf6U/aQnX/HEJmXosd/y1hY9erovWH
	0UEwUfyUXUwgxOABqt9AL+x/hMzwD3WTDkghue8zlj0D5KmJAdisRgKBznCIEL19MeA842S967v
	6g2weSto=
X-Gm-Gg: AZFdTZeJiqIXv2ouLQ4eHcMU0Ta4y/5/xLfAvniw/pQ0OX4o+pRnKSKylFJaMHQL0hu
	nsvN+HA4T08RgG9mg59uhADXx/dIeO75vepPzLizBxDq3n6k0hAz3+9Ma2wAIiwcsphLvu9dkw5
	lP5auoFlrtnkHKJZNFeTjF1HJpsNAzW8tCzyw6t0dS9FMW2rdpcpuiABlvhd0kTcsQEJiSYl6DX
	F46k6/EyrYRDAqoehvQM9iABnq0570FkAQArVTcYyCZBcDW1cY2fRWrwsxDipcsFxtyR5rFCWVN
	xZ36tmhGAs5xpxBVFRnTLaJtYvjGxjZAB5p4r2oUsetVtK5izLwuXQd+oAyxGp3MPhu9w8iGD09
	0yRl6VxqseNvvr3HcEhiOJeYC1okH1SnQDK7ffnsmAPgtA7rfzdwXPcx96aUI+j7D/z93dRcF8o
	PNT44/lubplS9Yb9q6481CEgi9CADx8iM21Lduz5Rj1oUC5P29ViUvnIRUNwB0Hi8RGUDyE5lPD
	7TaqKNYcp9esiUmpiRpCsO27BuDq+dhj2YPeuJ5TuFtT51obcCbAQDn3ORigFPXVirJDZSTIe0a
	fAfEGXlCVY4JFCBxEEPJECD1a0r4FsjRflyFzh0+FC8FgA/hcTm0+eB4zU2/u4JlAn5g5XMR+/3
	HfDffYfkW3t3y9E0c9vRwNh2kzHU4iF7ljDE1RLCPvvWOomNT7A==
X-Received: by 2002:a05:6000:250a:b0:492:564f:a1af with SMTP id ffacd0b85a97d-4a63a2d6fd9mr645971f8f.26.1794939643952;
        Tue, 17 Nov 2026 10:20:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/17] perl-cross: add patches for perl-5.42.3
Date: Tue, 17 Nov 2026 19:20:16 +0100
Message-ID: <d7ec2e780a5efe9b70e0a5641be2f7caeb2ac555.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250483
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

perl-cross 1.6.4 has no patchset for the 5.42.3 point release and aborts
configure on unknown versions. Reuse the 5.42.0 patchset, as its
cnf/diffs/README advises ("Copy the closest available version").

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...rl-cross-add-patches-for-perl-5.42.3.patch | 114 ++++++++++++++++++
 .../perl-cross/perlcross_1.6.4.bb             |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-patches-for-perl-5.42.3.patch

diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-patches-for-perl-5.42.3.patch b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-patches-for-perl-5.42.3.patch
new file mode 100644
index 00000000000..5b823d593c9
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-patches-for-perl-5.42.3.patch
@@ -0,0 +1,114 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 5 Nov 2026 14:00:00 +0000
+Subject: [PATCH] perl-cross: add patches for perl-5.42.3
+
+Reuse the perl 5.42.0 patchset for the 5.42.3 point release. Following the
+cnf/diffs convention, every entry is a symlink to an existing patchset so
+no original code is added.
+
+Upstream-Status: Inappropriate [oe-specific; perl-cross goes 5.42.0 -> 5.44.0]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/diffs/perl5-5.42.3/constant.patch       | 1 +
+ cnf/diffs/perl5-5.42.3/dynaloader.patch     | 1 +
+ cnf/diffs/perl5-5.42.3/findext.patch        | 1 +
+ cnf/diffs/perl5-5.42.3/installscripts.patch | 1 +
+ cnf/diffs/perl5-5.42.3/liblist.patch        | 1 +
+ cnf/diffs/perl5-5.42.3/makemaker.patch      | 1 +
+ cnf/diffs/perl5-5.42.3/posix-makefile.patch | 1 +
+ cnf/diffs/perl5-5.42.3/test-checkcase.patch | 1 +
+ cnf/diffs/perl5-5.42.3/test-makemaker.patch | 1 +
+ cnf/diffs/perl5-5.42.3/xconfig.patch        | 1 +
+ 10 files changed, 10 insertions(+)
+ create mode 120000 cnf/diffs/perl5-5.42.3/constant.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/dynaloader.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/findext.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/installscripts.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/liblist.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/posix-makefile.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/test-checkcase.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/test-makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/xconfig.patch
+
+diff --git a/cnf/diffs/perl5-5.42.3/constant.patch b/cnf/diffs/perl5-5.42.3/constant.patch
+new file mode 120000
+index 0000000..065e198
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/constant.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/constant.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/dynaloader.patch b/cnf/diffs/perl5-5.42.3/dynaloader.patch
+new file mode 120000
+index 0000000..ffb73eb
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/dynaloader.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/dynaloader.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/findext.patch b/cnf/diffs/perl5-5.42.3/findext.patch
+new file mode 120000
+index 0000000..9efbe5b
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/findext.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/findext.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/installscripts.patch b/cnf/diffs/perl5-5.42.3/installscripts.patch
+new file mode 120000
+index 0000000..1c05e0f
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/installscripts.patch
+@@ -0,0 +1 @@
++../perl5-5.36.0/installscripts.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/liblist.patch b/cnf/diffs/perl5-5.42.3/liblist.patch
+new file mode 120000
+index 0000000..5037380
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/liblist.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/liblist.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/makemaker.patch b/cnf/diffs/perl5-5.42.3/makemaker.patch
+new file mode 120000
+index 0000000..d7bd609
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.38.0/makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/posix-makefile.patch b/cnf/diffs/perl5-5.42.3/posix-makefile.patch
+new file mode 120000
+index 0000000..29463b7
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/posix-makefile.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/posix-makefile.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/test-checkcase.patch b/cnf/diffs/perl5-5.42.3/test-checkcase.patch
+new file mode 120000
+index 0000000..36c5186
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/test-checkcase.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/test-checkcase.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/test-makemaker.patch b/cnf/diffs/perl5-5.42.3/test-makemaker.patch
+new file mode 120000
+index 0000000..4e970ff
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/test-makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.34.0/test-makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/xconfig.patch b/cnf/diffs/perl5-5.42.3/xconfig.patch
+new file mode 120000
+index 0000000..87ac501
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/xconfig.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/xconfig.patch
+\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
index 3c544c97464..584c08defae 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
+           file://0001-perl-cross-add-patches-for-perl-5.42.3.patch \
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
