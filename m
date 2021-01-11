Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.27430.1610325988657494294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zYuFs0KL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id x126so9974911pfc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AEFXvVHYG/XQi2Qu9k9DTuM04n9n4UKjzetVWvtPYSE=;
        b=zYuFs0KLV7QX+4WmFM9qc0R9KQe3z/dPkLvssDoPW+nCgH3wrBGppogCCzcvhwM4WB
         oWXsHV5bDcEgeCqfjBIBw9ELESkZbS4rRzN29BOmmQz0K4sGPQdA1tPFsaXswdrFbb8h
         VpZh0BTOgTdHQsXWQT+DVEtBoKjM2dXF9VbG1eZMiUBZHnN6Zcv85q+0hSXTulptYsd3
         GwvwnfODS2nKVp2Nov4T925uEqB+0Tx+Vi0QwdVijWIWLmyc6VnDIhxDp/uCViJWtKAW
         rctrfVfKYD6nYlJNTt977/X13N3w3K70FCTHGX+00kyNjaxNcQ8RuiLy2GAwdJs5xhEf
         24Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AEFXvVHYG/XQi2Qu9k9DTuM04n9n4UKjzetVWvtPYSE=;
        b=WM98J7hIqgvminFaAqAfDOU0QPDkbDR70C9HmGQIup7D0Ec9qm34JuvgSkUS0BBEmM
         JzG6kbpfqOFFB8d+7eST/Lrt0HjEbTfycjuQATkw5FdoG5PBbXpmoXJo8sJpsJZZ7wFF
         li8VRB2CVnEF3UpdQ3IzVZVvhk03+aquH9OZrQEOv+oKZ1uOlCuRtjLPziiPxVekpuAU
         iFqr2q79RjRWerpRbYBRVbb92oBOx/VAr1pgLpcu2LVAuSs8U7xhUZkp6yDYPtdXEuQi
         WzriDbnrD742UMklTT6sLgmMMV8vWfrsfQKDNNyvkoLh2KLhfUqc4drIX11qFxKGFfD9
         UStQ==
X-Gm-Message-State: AOAM533OIjKuFO/0UrfABcJcyd45iinMKRb+7k9P2zfhbJNughmbbdzl
	Gcf9xSzIG3lbsAPMbZ30zvFX7WxXy+h4GGQn3aM=
X-Google-Smtp-Source: ABdhPJyaInN7WFFs9Sk5D/ZEWT534OI0gfmAWwP1ZlAbCM5v6cYFkHbjSDti7Fpu4kVIgTKseFj4TA==
X-Received: by 2002:a63:5843:: with SMTP id i3mr17429323pgm.209.1610325987869;
        Sun, 10 Jan 2021 16:46:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] diffstat: point the license checksum at the license
Date: Sun, 10 Jan 2021 14:45:46 -1000
Message-Id: <017d9626a7b7f2cb72d3215be8242aea52f1e4c5.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Previously install-sh was used, which is installed by autoconf so isn't
a relevant license.

Also remove S assignment, as that's the default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23cb39a5fa2a55681e7bc2605f435135cec9173b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.63.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.63.bb b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
index 61b2ea5dc2..863f924b22 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.63.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
@@ -5,7 +5,7 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0ca4a5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a3d0bb117493e804b0c1a868ddf23321"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
@@ -16,8 +16,6 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
 SRC_URI[md5sum] = "b9272ec8af6257103261ec3622692991"
 SRC_URI[sha256sum] = "7eddd53401b99b90bac3f7ebf23dd583d7d99c6106e67a4f1161b7a20110dc6f"
 
-S = "${WORKDIR}/diffstat-${PV}"
-
 inherit autotools gettext ptest
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
-- 
2.17.1

