Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.6325.1604890635093610383
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CMGhrDZy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id r10so5780142pgb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bAFzlIYQNLdqwJ452siHpX8aaqNSvqVPHDoXBg5rLdQ=;
        b=CMGhrDZyBj6qfEvJagsl3GEqHRkCfJrcxR0POkImMZDuwLhSV3mdn4/9gDlSRnxXt7
         Jc4sS4fp+KRt9deuu99gYjkCuqJhNn0WZSB68CJHsdqx65PppR+Jt92zRrccsbXhSEqz
         gtcfW95+kUPEJYnTtT1fJp7offOj8rXD2EaXj55235Vkk2ZzKh1yEGFdjpM/qMKbY99r
         +ptkI8PDzLMrv6+j1DgDCr5Ja5uqptr2C1kcEX3wc00M9r2KT1e8Mx4AEYmxCFDbb8ng
         BqnlAWK0/W88KhIi4Ysj/kEYfrCb19GYboM4mn6OxVh8Z27Usr+gqSe1jZFsEs7PXlPt
         S4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bAFzlIYQNLdqwJ452siHpX8aaqNSvqVPHDoXBg5rLdQ=;
        b=EeW1p5sp6yfW4yCYJnvtz+D6Lup2XvG/+uAnmVCw0joZcJ5DGnh/ADEThjfvM2guSH
         CDDx74jzWSBr9iWSJQhYMXpZZ0QlZ8uucicgcIgKXZikuTHYAv3CKkgi35IG4TeKm/Y4
         XOJtshJ9s0HzQ+BSlj7o7mZq9nY6NFPHvD7D6guxA84PMKi/l0pNQ3YtCf7c4NaPHm1r
         yRXtVA9ZYTtNd/0pTOayJcSxjtvohrkRPYKstwohTNuX26E+QVZthlap6M2QIFNvDkcm
         wHrTe13bhwLpUO1N7kq+x1cL2i/PYUzX8OrGO4DIanJF7IB6vk0rUwSZmP7Bw/abT6vF
         YBOg==
X-Gm-Message-State: AOAM530Gr1xWwydUzTlFgoODeuQ6wB4sGYP7GqRViR/vodsqlzHR+5bm
	ecNGrMQQFTo8y3M/0c/nFHS1I4ddk20KJndE
X-Google-Smtp-Source: ABdhPJzhyM46V1K8ZNBQ2WQulqqv9OQ2mw6BwtB9LELD4u8EKf+O4Cn5Lv+qq8qHSkO9Lj3pIj/2og==
X-Received: by 2002:a17:90b:e8c:: with SMTP id fv12mr10808164pjb.196.1604890634279;
        Sun, 08 Nov 2020 18:57:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.57.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:57:13 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] netbase: bump PE to purge bogus hash equivalence from autobuilder
Date: Sun,  8 Nov 2020 16:56:16 -1000
Message-Id: <2c4607edf1c4509ffc4935887388604538552d26.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/netbase/netbase_6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
index 0153746a90..21af3a6c7d 100644
--- a/meta/recipes-core/netbase/netbase_6.1.bb
+++ b/meta/recipes-core/netbase/netbase_6.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PE = "1"
+PE = "2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}~bpo10+1.tar.xz"
 S = "${WORKDIR}/${BPN}-${PV}~bpo10+1"
-- 
2.17.1

