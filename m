Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C05CEE330
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 16:17:12 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.21081.1728490631131597049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 09:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FAEH+K7P;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c544d345cso9130475ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728490630; x=1729095430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4FomuWq/i3YYy3VzgflAqHQATuomdpgqqkNgTFCH2k=;
        b=FAEH+K7Pf6Cy9Zj2YhQV1Ovs7DYYhGIxkvoQIE5owWS+3NG6qxWZ5ZlWleippvIf/9
         iXrVPQu6xMxrGgFJhEl0O0GnxoTt1SdTIDU5/aoNEpwT0nLOlPLHl/gRMM663g8ybr3+
         +bIS6JbdzHdY/chqIWaZYHedz9JKKjppkWuvaUVWqF9cuI1FsCmF6YlAGowSh0dz5abt
         aLHyMHRRVTQh2soRGF0zaq4z4Z1LFemgpfwf3qe5vwxdfhmDBk+rR8Ym1sL7Ic6m4azz
         Xw2jV8M0RbpVrgDqb2gQdjm8ppSuM55Cdx8PejXjrp4wPVbYbUtXBlcpZT1K1A2jGBLA
         vn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490630; x=1729095430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4FomuWq/i3YYy3VzgflAqHQATuomdpgqqkNgTFCH2k=;
        b=AZKIk1PnvAzBewc53FhhyL94Hq1yjhgx6Atzy1fbMhqKxmXB65sujNLz9c3GEOKTn0
         Hk7uIBqXkVWveKMfQYxbsj3cMvjgZAHOs4J6fD6Bqpc6mGOjkj+zLOjf6ZQPXOIe68L6
         y8G4FsLny0RRRDbIsuVgsDtCh79L3lGj1ASmy8xHY+b+CT1lCmx4lFW8fKgZrAcaK9He
         S73tiNXL+PUjYvu9PYtLhb80wExWagrzpZSTc0k2jEtskcu0FPUdxEnc34nZ45ismBY1
         Hr+qclCnxdAtoPCJYfGHAehfyodVQvCdnl5lK+nNXxaaBPKeHs1EoSAc40mqhVBaRy0E
         /75w==
X-Gm-Message-State: AOJu0Ywfrp5hdsxW9HpRNk2M/1NMAzy+DXUeRQ9MyMiX/kMaTS0V1p4T
	3Q82+fVbUa20zG1bN5QkuPhj2nZo43Z5IpD0ttCW9MYZKirtmDwotw8gQNHI34BQFeNspW5nhgQ
	3
X-Google-Smtp-Source: AGHT+IGEeQoTu75br4r0FSK4mlLnCvbHuS5hn3eud4pd5tpZNuFV/GBQVG8aVtACtBgZjCqVWGqMWQ==
X-Received: by 2002:a17:902:d2cf:b0:20c:7196:a1e9 with SMTP id d9443c01a7336-20c804d003bmr2097675ad.13.1728490630307;
        Wed, 09 Oct 2024 09:17:10 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13934817sm72545045ad.158.2024.10.09.09.17.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:17:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/5] zstd: fix LICENSE statement
Date: Wed,  9 Oct 2024 09:16:55 -0700
Message-Id: <4ef9b4d947b6e8ed7637cdd9e722c3f0c83990dd.1728490465.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728490465.git.steve@sakoman.com>
References: <cover.1728490465.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 16:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205365

From: Massimiliano Minella <massimiliano.minella@se.com>

[Backport from OE-Core: 40f85de590c188c9c3985e64a83efaf06b0b4fbc]

zstd is dual-licensed under BSD _OR_ GPLv2 which was updated in the README for v1.5.6.
License wording in the README for v1.5.2 is misleading, but license headers in the code
clearly state that there is a choice between the two licenses.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/zstd/zstd_1.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
index 3887f31ecf..591e823049 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -5,7 +5,7 @@ It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
 HOMEPAGE = "http://www.zstd.net/"
 SECTION = "console/utils"
 
-LICENSE = "BSD-3-Clause & GPL-2.0-only"
+LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-- 
2.34.1


