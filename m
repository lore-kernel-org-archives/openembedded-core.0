Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.45027.1597677136720637738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=psMPDomr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id k13so7654273plk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZV0HtsOKGxrFQ6qa1B/PLQcTI6qJ/7NlH0DYeFS6EdE=;
        b=psMPDomrD7181/8dz3jrkyUqmH8UD6oVa2tCxJ6OO9sut98Zc2Fjf0AWVn+O3yg24w
         iUBF3x4Tl1JaExsJbAoTnKySZsp4MNXj0/Jqa0WUYqw3oR7DUIDirEBObT0J7Y8XF7/i
         66tKBJOdmzGSVvGffT+FAGLKjUO+nQoMErbAY2DxYmgeIcYVx4op3TOq8zFueUjMQXT6
         U9f3BdpJKuEHZaO0XxbcXwSFiSakDKoMg+HDTRl96jYadMHlC5TjsH73zgsdS9lTJZAH
         Z6zREyHf9cjtDhWdbh5kJEWWN4M0XDxXOsmd/3+0rGTkyRDs/KIeKhOTEFBfZCDkYHcJ
         KomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZV0HtsOKGxrFQ6qa1B/PLQcTI6qJ/7NlH0DYeFS6EdE=;
        b=hUHSGUEWW2WMQVnL10u06a4NDy+YVGFaSPyMu0GgpBggPH/Ix0/R23NL383hsDtrzu
         533SsGWOpIbXPrZw2qviGhxKpQQUAG8LOsSJK+qHiqmPIkYuvX4OllDSCnAX5CATcVap
         NS+EF1zb+r4SKs44ggW+IvjSmRfthoydbXfEbwf+FmuDJJ1hRX1m+NbnaHHmdDCU9BQZ
         GL1O6ypi/mxGHozdVYx14FqbN1wGILnqtOOPTPcx/uIpr73/LJqlogQNdvNtchOoTz83
         D5xwQVPQ1ikWJ5kjBNAe5r1P4U8TUV3yvKoGPw84duMUWkxT1KO32Mwafgjg4AonEK+A
         4Bpg==
X-Gm-Message-State: AOAM531yF4Vh4qlk0aB3Oa+SvEJb2YZkuUPg0O3c3Bg0jCnleflEP5VO
	rZE6TXkdXWpXDAiKg7c2nsK3AZnnkhCNKpEBSyw=
X-Google-Smtp-Source: ABdhPJxkEX/ofCVCMqYUgCvA1tssmSI994tvltizSivQrGKvncJn34/AeLmlBYkaRL5gchuTXh/BbA==
X-Received: by 2002:a17:90a:d249:: with SMTP id o9mr12406962pjw.233.1597677135660;
        Mon, 17 Aug 2020 08:12:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w15sm19547363pjk.13.2020.08.17.08.12.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:12:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] go: update 1.14.4 -> 1.14.6
Date: Mon, 17 Aug 2020 05:11:47 -1000
Message-Id: <e33d2ddaa6c8945227a5bbf4e96d63606d0fab38.1597676744.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597676744.git.steve@sakoman.com>
References: <cover.1597676744.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Includes security Fixes for CVE-2020-14039 and CVE-2020-15586

(cherry picked from commit 97d5c2d1f2dffe2518f46bbe57cb9348eb59c633)
(cherry picked from commit 6591d269792fe864d7af4e379035f1cebc4510f5)
(cherry picked from commit c9011d04eb624aeabf5d707e88de80137bcc2eb1)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index c52593db6b..64c2768f7e 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".1"
+GO_MINOR = ".6"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -18,5 +18,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-
-SRC_URI[main.sha256sum] = "2ad2572115b0d1b4cb4c138e6b3a31cee6294cb48af75ee86bec3dca04507676"
+SRC_URI[main.sha256sum] = "73fc9d781815d411928eccb92bf20d5b4264797be69410eac854babe44c94c09"
-- 
2.17.1

