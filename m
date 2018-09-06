Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 677C2795CF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:19:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y139-v6so10933047wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MxnFYs8c1iR93F6tz96Sz90nt6Lwf4CNf+6gatxKjMA=;
	b=0O3MaiYRP67e8eO++XM6um9DHShJwgLgxfckjgjof74l87XjZV3CoEFcN5VgcI3xzn
	fXUyfBMecQkV8GCiO38q3NufWV9BNNwDDfCYt0ecSA0+m1ZH9+so3REs/QQ4ZzKVkz2w
	OfynkCy8zYUemswE95Mb/P+xI38n2s7B18279pt5E1AfwzEdFuJmEzQ5bJGaK4RVjubc
	P8WF0h7xIGc3cNydoaNp/ur0B1rer7T/6hzMB0Pt2eYU4Y10ybVPvjkeOte4uEcUw0S1
	9lYSJLTj75O0yhp+2MrRoNY3xFYpVGoGyVvjF1LgZh4wCKylihpwUukEdBahAwH8Su26
	h7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MxnFYs8c1iR93F6tz96Sz90nt6Lwf4CNf+6gatxKjMA=;
	b=RgXvTXPM+DdsX6WLfDWPJc4Sid37k0ckBQ+k4K1omEUfw8ZOuByWIBAj0scFvrql29
	tUdvA8yxY/tG1lfBv1u95YCR7O2I1vRiXNHGdgvJhhwQQCbACtx+FdAtQS2P9NWNgpgF
	BdeiVUTCzoN1R7ipi6UQEI4r++eD32tSZAxWiQI5wpi8m8l8JP9DNPxqtAxZvsp63bdx
	wOMDyhPBlND8j0lwNRW0v8+WfxfyBvwbppgTBeUCxeChtN+FyCywT+uIz+C6WS0v137u
	6Ae0hfPxGoULxWc9QlI03OyoNfl9ki/FJB6TQU38D1j1n7Yyx8+QewXBSR2UUCVacYw8
	B6Tg==
X-Gm-Message-State: APzg51Bzx2BhtE2wJBfNozMEVfJDmv8xaDWCWvVNwDgOT7bPCiZpXhlQ
	IeG4uWglEQ0o6qzm7YLSmLIRt3u0PRg=
X-Google-Smtp-Source: ANB0VdZNpPiWMxJQmVEGbEwpRDrX/CtQ5hRkk/+JS3LvyEMIqVjjdtvZzuOEa6vRbwcBc+JJuNd43w==
X-Received: by 2002:a1c:1584:: with SMTP id
	126-v6mr1893201wmv.24.1536232745108; 
	Thu, 06 Sep 2018 04:19:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x15-v6sm4860834wrt.53.2018.09.06.04.19.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:19:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:19:00 +0100
Message-Id: <20180906111900.23712-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180906111900.23712-1-ross.burton@intel.com>
References: <20180906111900.23712-1-ross.burton@intel.com>
Subject: [PATCH 2/2] libbsd: drop obsolete patch
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
X-List-Received-Date: Thu, 06 Sep 2018 11:19:05 -0000

This was only needed with old pkg-config, but we have 0.29.2 so this can be
dropped.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...overlay.pc.in-Set-Cflags-to-use-I-instead.patch | 33 ----------------------
 meta/recipes-support/libbsd/libbsd_0.9.1.bb        |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch

diff --git a/meta/recipes-support/libbsd/libbsd/0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch b/meta/recipes-support/libbsd/libbsd/0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch
deleted file mode 100644
index 7e3a5b3be4b..00000000000
--- a/meta/recipes-support/libbsd/libbsd/0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b6972f1c29ebf073cbe19a4a669ee093259792a0 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Mon, 30 Jan 2017 12:00:33 -0200
-Subject: [PATCH] src/libbsd-overlay.pc.in: Set Cflags to use -I instead of
- -isystem
-Organization: O.S. Systems Software LTDA.
-
-pkg-config currently only handles -I and -L correctly, but misses
--isystem, so we need to do this workaround to fix this issue.
-
-There's a open bug in:
-https://bugzilla.freedesktop.org/show_bug.cgi?id=99516
-
-Upstream-Status: Pending
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- src/libbsd-overlay.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libbsd-overlay.pc.in b/src/libbsd-overlay.pc.in
-index ac8bf89..65dc3ae 100644
---- a/src/libbsd-overlay.pc.in
-+++ b/src/libbsd-overlay.pc.in
-@@ -8,4 +8,4 @@ Description: Utility functions from BSD systems (overlay)
- Version: @VERSION@
- URL: https://libbsd.freedesktop.org/
- Libs: -L${libdir} -lbsd
--Cflags: -isystem ${includedir}/bsd -DLIBBSD_OVERLAY
-+Cflags: -I${includedir}/bsd -DLIBBSD_OVERLAY
--- 
-2.11.0
-
diff --git a/meta/recipes-support/libbsd/libbsd_0.9.1.bb b/meta/recipes-support/libbsd/libbsd_0.9.1.bb
index 2a1cd645352..2b75cdf9563 100644
--- a/meta/recipes-support/libbsd/libbsd_0.9.1.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.9.1.bb
@@ -33,7 +33,6 @@ SECTION = "libs"
 
 SRC_URI = " \
     http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-    file://0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch \
     file://0001-flopen-Add-missing-fcntl.h-include.patch \
 "
 
-- 
2.11.0


