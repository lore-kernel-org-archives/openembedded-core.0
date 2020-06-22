Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.445.1592848898284726325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1InVFLEq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id m2so13780366otr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=I/LbTzJarrQk6CP7mcUBwNN29HrvgkwT4OmiRXNk21o=;
        b=1InVFLEq23gKi/usx7L1iExirXI4nDIN+m6PI/cc9irOqcR6nsdjGCUq1lTVuPSbmW
         MtZhODq/eVOmht2O9F0hVgiNh3ir82kkGHqyTKbCXXRF0cLwBjvoOM4/87gOauqLjwBF
         4d4BVPHgyVCB1gF0TfqpLZZsCoyVC0iouSmr1TlRtNL+FYSWw4fplg1JOVqv2oACDU8A
         AywFDKsoU/3EoAtOyQy1NuQbG4DIYXKYjdpLGEYst9LBO8hg7ig7bHrQQy0xU/7H9iFC
         qS+TA5GfkntgT+DJO2GfLgLn37PHtOu2iy/dm3rCJkwjTZWyfS2UwKMLIBzpvz9ryqWu
         U1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=I/LbTzJarrQk6CP7mcUBwNN29HrvgkwT4OmiRXNk21o=;
        b=FjGqpE37vfC/Y1wRYuSv2IoUlkpolPwI6t6VNnLG2MfIe7wxPjFExSiSTKjuQ5hNPK
         KW31yShB6BuSyXKw+PySO6Tkv9p5ijFnEkNDeTQGr4EO8syp13i+eShX6cz2eCyTiPGq
         nBpvRp+SLBQav0ZojdOwbTIDUviTm57K6gE+/h3N0Mg2rruizDHBjm4JRwgZNdZce4YP
         TSV5CNlD+QcxvDUG+hHd2qxLfItz57QXgrwC2gp9bCWXLiW9Cc53sBO2WSfChHX0y0g0
         zvEilZfdQr8mJ1MkMFHwiV024xmqYyVv7/UPaAksuoeDGSsnoVvfZ6BB/b0MepQYRqQa
         QD2w==
X-Gm-Message-State: AOAM532KrFlJmvTLOxIyWvbQvXzQzEr4p8En6yRIHJwQPcGWQBY0QKYM
	rGjhUSZDN6p3OXdGs191LP6ljgm+szcjgw==
X-Google-Smtp-Source: ABdhPJwBYXM7nuFExiOUEAaj6T4968bXsXqPvMY42kNSJbfv9YU7r7cLDlXEhvFOxewc0CVCgubcvg==
X-Received: by 2002:a9d:476:: with SMTP id 109mr15924294otc.77.1592848897181;
        Mon, 22 Jun 2020 11:01:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/33] glide: Avoid use of 'go mod' support
Date: Mon, 22 Jun 2020 07:58:20 -1000
Message-Id: <8e5865beafe2e157622911068e7e75db25799138.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Otavio Salvador <otavio.salvador@gmail.com>

Glide utility must not use 'go mod' support, so we explicitly disable
it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5a4369ba606677285b0a89a78c040b38f57767f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/glide/glide_0.13.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/glide/glide_0.13.3.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
index ebad0ec60a..31295edf90 100644
--- a/meta/recipes-devtools/glide/glide_0.13.3.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.3.bb
@@ -9,6 +9,10 @@ SRCREV = "8ed5b9292379d86c39592a7e6a58eb9c903877cf"
 
 inherit go
 
+# New Go versions has Go modules support enabled by default and cause the Glide
+# tool build to fail.
+export GO111MODULE = "off"
+
 RDEPENDS_${PN}-dev += "bash"
 RDEPENDS_${PN}-ptest += "bash"
 
-- 
2.17.1

