Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.729.1613432358925582640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 15:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GQcUho+q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id v1so11034045wrd.6
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 15:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7JMZELENtzOceJa4Z1rR9GMV4yZCNyikRPUzGaeLLIc=;
        b=GQcUho+qm+wfgCfEQXS8BQuhfwiyBGsoJeRMFQeJbkZr4M6uLqJnRfzbfDWBHqo177
         XlRM9oouDfHvOlPr1oUTl5Xi4PdBmz0MWc6RG1xIPBlNvppvYSkKjlzOkmINk6wVSPTU
         nIJCzeKvftgkMYmUuvoe1aCU4zfYDkUJbd6Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7JMZELENtzOceJa4Z1rR9GMV4yZCNyikRPUzGaeLLIc=;
        b=SyUA9fK1qhXTSoTGtRO8BLb5csM9II15kyl5E6hOMi+Hoh9uh+jjLcKbCDyt+ZeoIn
         p1Pklyan0b5jxr5fpNMu6e0sjhU1fsHAdg/uNP8MmJ4ubea/WXJ1LEuOaXI2qEFHtHi7
         yQfeT76qk/KwkHqdz9rOIXFD7q6csbEdmLNL0PKYB0ubHiynBebjTqX49JRm5dJniyTL
         e+xb8ChD8DutMPXoBXaufSCQBcPPZ45jFY85raAkVmYDpkLgCciXFpdaQF0Vv9sICJej
         M2CdtsNDcsoX3u/fTLP4cqluLWW3XumWBPiuj74NVxKi2Aa+yQej29J8tb3OLEH0tg5/
         tvAA==
X-Gm-Message-State: AOAM533bKnRrwkahUPyxX2ziTWzcXrE0aAJed9LJOyktxnB98hgloBXg
	boVUOjXMEIkqR0UErHgYu2KdgfcmiV5HlA==
X-Google-Smtp-Source: ABdhPJy9V0uGIjoyyuhlWlD9GtYUMo/vn7p/x/b8YSYdmnBzWshg9UzpxGY4w5KCaiZTA4sbhqQC7Q==
X-Received: by 2002:adf:cd0b:: with SMTP id w11mr20337883wrm.327.1613432357486;
        Mon, 15 Feb 2021 15:39:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id i1sm919125wmq.12.2021.02.15.15.39.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 15:39:17 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] selftest/reproducible: Update exclusions
Date: Mon, 15 Feb 2021 23:39:15 +0000
Message-Id: <20210215233915.2007777-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210215233915.2007777-1-richard.purdie@linuxfoundation.org>
References: <20210215233915.2007777-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ruby-ri-docs and meson back as not reproducible, remove watchdog
as issue fixed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 99497522d2b..7059c3a7a01 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -24,6 +24,9 @@ import datetime
 # https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-hwds3mcl/
 # https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201203-sua0pzvc/
 # (both packages/ and packages-excluded/)
+
+# ruby-ri-docs, meson:
+#https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210215-0_td9la2/packages/diff-html/
 exclude_packages = [
 	'acpica-src',
 	'babeltrace2-ptest',
@@ -53,16 +56,17 @@ exclude_packages = [
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
+        'meson',
 	'ovmf-shell-efi',
 	'parted-ptest',
 	'perf',
 	'python3-cython',
 	'qemu',
 	'rsync',
+        'ruby-ri-docs',
 	'swig',
 	'syslinux-misc',
 	'systemd-bootchart',
-	'watchdog',
 	'xmlto',
 	'xorg-minimal-fonts'
 	]
-- 
2.27.0

