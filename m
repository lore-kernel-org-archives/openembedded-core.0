Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EC6C3ABC8
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:19:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.127886.1726453190995174898
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=D0KTlhJr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fee6435a34so33645985ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453190; x=1727057990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhfSepGkIPkzdRs6rPfRuin0YL+EoJxR+SyY7d+p2CE=;
        b=D0KTlhJrTmuYybcNNq3VHxHADp6ECG6Tf7jGbbsvrpcrDVtd9O68JF4PjIxpCIcGIx
         +R1xzkfDyt9CqhN68A23e4Nc7DGAc098+4ap2v83MD/Ia9hI7TuLyp32OIXzr6zmaEvd
         ULHnlWSaaheC80plGAmjgkn7jUSa2VJVwpcUTiUmsydOMO1IZ2Zqqb32wT8BCnDKM/hG
         HeVVNdv7mJocsLUlv2GGGyNz5nzlBJd8EPsj/0CPl7ZLaIGwf1e7OkpKhdDEYaf2x3QH
         MBCeJGGDL7iEondhmz+kUmNGCmzvijVixN30qWyyhtbdui3chOK8SltkYVq9KAH7j+th
         /ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453190; x=1727057990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhfSepGkIPkzdRs6rPfRuin0YL+EoJxR+SyY7d+p2CE=;
        b=QoObY9XKaVMtwG6uJREdnQVc68EPyKlbnPoYlqzuQzt/m457V3FwDZ7ULjNayV4t4T
         uD7uM7qT0wAUgMrHx8vVCZvMoL9YXGpcvG5ZElvd21zJ7iPmnpq54c0n0Wt9hIvZ5t3U
         Z8CUupoNeGwfuQ08Q4IVcO7F4t1RzLKcCVkpe0KsNu5NavG7AtpoNHRK/VZ1I414qF7v
         71mmL+h/9iYd9W/z9FKkiSpRLkaoG/iCcOVAuesQYyc1M5YM5tSM7jwMcizAf0oWvQ20
         59kxm1i3bFn80s3d21tximNF7ADP9y1NvEgz65tNAQOGAOiCbIjOMuXDuJW/EGe43th2
         l8UA==
X-Gm-Message-State: AOJu0YwUZxKFtkiuFuilCLNrkV42xUDT8hhDWPbR8KD2GAlzQ3lTCXme
	YESH3gKch7NQNQVbAPTAWG0WF4kxxPPeLhdFfYDUhZeqjhJO7NTQ2MvSj3rvHmmbCgl0T4LJS0u
	sRx4=
X-Google-Smtp-Source: AGHT+IGWn1VvJ0my4ghNiuaWlRL+YKCI5EaVUY4URHwXwJkslRI0TllMqAkWmXNAyctFH4Kj3wbpIw==
X-Received: by 2002:a17:903:1245:b0:1fc:6a13:a394 with SMTP id d9443c01a7336-2076e36156fmr206788615ad.23.1726453190218;
        Sun, 15 Sep 2024 19:19:50 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/11] iw: Fix LICENSE
Date: Sun, 15 Sep 2024 19:19:29 -0700
Message-Id: <cfb0352f1c89729e11259bfe3a7ebcaf7193620f.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204593

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the COPYING file included in the source code match
those of ISC license:
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git/tree/COPYING?h=v6.9
which seems to have been in effect since 2008 commit
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git/commit?id=622c36ae94a880fb53f7f051f1b26616f5b553c1
("license under ISC").

(From OE-Core rev: 87da7445a2a77fe73e3524cd50112842e91235b6)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/iw/iw_6.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iw/iw_6.7.bb b/meta/recipes-connectivity/iw/iw_6.7.bb
index b46b54bc93..162b4e922b 100644
--- a/meta/recipes-connectivity/iw/iw_6.7.bb
+++ b/meta/recipes-connectivity/iw/iw_6.7.bb
@@ -4,7 +4,7 @@ wireless devices. It supports almost all new drivers that have been added \
 to the kernel recently. "
 HOMEPAGE = "https://wireless.wiki.kernel.org/en/users/documentation/iw"
 SECTION = "base"
-LICENSE = "BSD-2-Clause"
+LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 
 DEPENDS = "libnl"
-- 
2.34.1


