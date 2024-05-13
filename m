Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BE3C25B78
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:18:29 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.58497.1715602707714352586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 05:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L7rRcsPs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so23238505ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 05:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715602707; x=1716207507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D25hoQrS/LAslEIvGRM52tmXlg7PHjkp9ZOq1dTJ4Ro=;
        b=L7rRcsPsBn1q4XVrtIpnngkBXPQ2YmoU4ep5gSk83y9ULlrBHtO+vlCsuRCQ6Df/1S
         PtLOCoRtU9nYl4QqWMdcLEMMisMV3yziKurudWlgATrdIhvkCBKJIefIxNR03nIMAmY2
         lSNfBhcdgScVlYcOdvmGtLmtZZ70kZXjFlrRDvfemQp5oJtHgGBPqWqhgEdHZP67xucd
         DHZj/sSsU2WiFyTfJe6AF+1i3xdU6RRK5xvRitUtxgDFC+/p1wrBkhyEfyloRGT7CC/4
         3kY96PZvIhGUo4DHgK/L0EhMbfbaf6vRyBmHV0zvMcxfjnuS/N2WH1IukqK3npdqM/gB
         ypiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715602707; x=1716207507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D25hoQrS/LAslEIvGRM52tmXlg7PHjkp9ZOq1dTJ4Ro=;
        b=SzX8Qs0TynKo6OR2amG7042cd3lIHBNsQ3LKiwML3seV3H2hlYgzum+ZvN9Hca0iyd
         GiaPJFWdPPUmYCvlzSt4ScrBVovFllpJXm+YhAJhsStPmoWMzEmI9xI4g50smtfWtoLa
         FRcaIDWlYWO+yVo4JaGoa3tVjeDHquBnxkbRPfxWHqHgoKO4BmtbOV6sJZ31pZBT1bYg
         9ptNXHHGQdlhXo9C8pKXYOGWS983t4WytUQE4f5dmsgRo+Oy4r7lUJ4+t5U2eIKyZl4Y
         f5GyHKnBrNrR+Yd5Ya7+eZfnJlIMN2UCW78S0SFzBDnUec+gccQXmbUkQOLC8jbNRDEA
         5jsg==
X-Gm-Message-State: AOJu0YxMuD8mK5m1pNKUrZNiriOIcAwcKC0vzS3VjGuRHc+xZUVUB4GF
	iUKmT+XRGws406wppbvi+HrfJn4lH7qA4JBYsVw8RdQRHvEHUe0uWAm1s+ztQRkMUzLkE2VVbYL
	nfMI=
X-Google-Smtp-Source: AGHT+IHngR6+mTUTEzQHLw5K4aCckCBs9FTyVP8JIvHRRbopv7sUwH/BajSX56FTgPhHKdkgsmyc7A==
X-Received: by 2002:a17:902:e842:b0:1e5:5bd7:87b4 with SMTP id d9443c01a7336-1ef43d17042mr107929015ad.18.1715602706986;
        Mon, 13 May 2024 05:18:26 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b85sm77599225ad.181.2024.05.13.05.18.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:18:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] libpciaccess: Remove duplicated license entry
Date: Mon, 13 May 2024 05:18:12 -0700
Message-Id: <f85d5dfc91d536a00669ca3148d8c3b2727b183d.1715602539.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715602539.git.steve@sakoman.com>
References: <cover.1715602539.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 12:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199237

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Remove duplicated MIT license entry for libpciaccess

Duplication was done as part of below commit:

Link: https://git.yoctoproject.org/poky/commit/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb?h=kirkstone&id=b0130fcf91daee0d905af755302fabe608da141c

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
index d55315efc2..445f3751fe 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
 SRC_URI[md5sum] = "b34e2cbdd6aa8f9cc3fa613fd401a6d6"
 SRC_URI[sha256sum] = "214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489"
 
-LICENSE = "MIT & MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.34.1


