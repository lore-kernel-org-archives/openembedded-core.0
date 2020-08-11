Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.1244.1597169825333338761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 11:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fZ0kjK1N;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id ep8so2275901pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 11:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lJjhmsAN67LECAz7GKgbwZDN8+AYmZmYhOFSvTN4y3Q=;
        b=fZ0kjK1NLnioMRHyowwArRssWT03iWSoMQ6CocZmHFjzV5IwLZr9d6Vnt6P/oUksjv
         vuBz4MxD6gEBXcDsH8t4WaG7S1XhN4d2XEHq9brv06IRLUY24E18ze5Z9TEZaJq3f3BS
         QoBfsU1xwMI3Qc8GLQUYfhh1Bzj2f3lXNIuR4h0ZZ15vljFI0FEepqv21lrV9e7vx+HA
         xIyy13isydd/56lDiPlLBeX7YTU2dQg09QFUqyabfzZdYnE8Ne0vDgft7hdBdWGl5kV6
         fUPiVzIGK+yVG9e0U3U4xf9R+q2hc7poK0Ou+KuV2jN1NagNjzO6zOAKq08hvRiksDqe
         hFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lJjhmsAN67LECAz7GKgbwZDN8+AYmZmYhOFSvTN4y3Q=;
        b=NZPwnlJpdexBQltuEdqTTZu5KQAUVP/C5tEC5B28V7SOEMTAY1cl0MfJrI+n10zRXQ
         pY9FHOCSnUK1xC0OEdHN6S1nADOsPtkR+WodDxM7ieN07+pv5xum+gPayjmlmO8d6/eL
         dfSvuqI1QGZt7ADG8kn+MhyhzRKlg1abHjSkN5pFb3haei6ELgpMhxdf9WEyuL/OHa7P
         oIBeGgVBAEV6VBXKjx28zFC6WU4CQapeBZzn96cEDBlhFPOwcRGTAQQrRmnmywTCf1ZR
         lmnhdUQiaPxE2GpR64wvtUXNgRF44BkFEl0mFn1+nXIRcEgsRGEZTaFEOPUZA7BkzNhz
         s/Dg==
X-Gm-Message-State: AOAM532cg6inDFZoRfpxubyCvu7PbwsYTw0G5mdLsYNT0SUEmLNI4gyy
	DFhCWyuXmOFpTQbNwMbNiFPJPmYq9qk=
X-Google-Smtp-Source: ABdhPJxx94+Lc924NmT4xqHelkkdNs3YwYlRN4vYbJT4m0z7l1nwKMYcomvTxJEcHvYduymSu6Xeqw==
X-Received: by 2002:a17:90a:9e7:: with SMTP id 94mr2230803pjo.97.1597169824427;
        Tue, 11 Aug 2020 11:17:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id b20sm26476064pfo.88.2020.08.11.11.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 11:17:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH] go: update 1.14.4 -> 1.14.6
Date: Tue, 11 Aug 2020 11:17:01 -0700
Message-Id: <20200811181701.2638189-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Includes security Fixes for CVE-2020-14039 and CVE-2020-15586

(cherry picked from commit 97d5c2d1f2dffe2518f46bbe57cb9348eb59c633)
(cherry picked from commit 6591d269792fe864d7af4e379035f1cebc4510f5)
(cherry picked from commit c9011d04eb624aeabf5d707e88de80137bcc2eb1)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.28.0

