Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7312CEE57EF
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:57 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.35236.1726097036623881280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jWqZMjq4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-718e1ce7e84so231624b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097036; x=1726701836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJIjIyba3E1tZ7BT5OyPXJLoVZG25K9eGZjMh+Bav1I=;
        b=jWqZMjq4MJSxSy4GZcLspUzLb25aBGpgkhGqZBOX4pp63ydXrJ+g6YwtpKDhtaPLGg
         FsVc2/gTt7me2EC4aD0fUYbsNrrDGBjjbTa1MH7Vce8ZFeuQ+qmCRpu5vf7MBwE8RnyD
         VeUT81mS6nuDApdh6zVd0+uqQPkekB9MYeb4Pui28KxM9uS5jWE2f3pktuySHgVXbS/C
         /OEZhMa+xzcZMaYpMXBvD8C3xcIMpqQGwu0ibLt865d4kKQG1EdTdT6YyE2QJaA+aaEh
         wV3fSCCTOtW3JttSqJNdZCHuXihHFt+MpU6JGWaiFBqhUS5Y/OeTnCuhF+mVDqBapz6C
         gYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097036; x=1726701836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJIjIyba3E1tZ7BT5OyPXJLoVZG25K9eGZjMh+Bav1I=;
        b=lN7Ls0KbBBimXMSX787LtIP8w6Ko15TbBuE3AUjnSpV53pUmblb+aYM2Ha46cZnt/6
         iLjVV1UduPBLJJaIUDjRAiXZf3n/00YBtCaAKcVD4uQi7fSYAoV4NFyFRQ+bIh+9PUyW
         nAh/hT3LObxF4LkVrg7C+gNEWu/0q9Hx0zs9hQsRwcDkFKpdb6M4ewSiouN8eypos74Z
         DEBvlaI18N5NcEVQTU+oZ+fzoxY+NTcjoVJJYnh8blwSkILyulNqGuSM0KkcR09Braer
         6kKucodNfpaYbwE7fGPyCoK+lDTG9MrsSc0ZNIioQ29qRiUMirKPk8ZtRqC7c+DPe8HE
         rsWA==
X-Gm-Message-State: AOJu0YzRY3JmiCE4YtxP0FUwXpqleYxDT8VrcPxGd1vcMBSrd6GG0TNR
	43zXYjUemfUceRoC3LImaD65n5M9yNJXrmaGWFDMJru68vo14URRnmFennxehiiKf89Pflla3Lr
	F
X-Google-Smtp-Source: AGHT+IGSwtWK3CeTdj3wZC2Z7smCsyiwEqSXjh8jrRoAprvwLY9sSQb1JHK5LyK93ZWxZkTWu/4H4g==
X-Received: by 2002:a05:6a00:1952:b0:714:3acb:9d4b with SMTP id d2e1a72fcca58-719261cb457mr1214156b3a.18.1726097035699;
        Wed, 11 Sep 2024 16:23:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/22] iw: Fix LICENSE
Date: Wed, 11 Sep 2024 16:23:12 -0700
Message-Id: <686abc98421198d8224423cc95f97e3cd16296c1.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204409

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
 meta/recipes-connectivity/iw/iw_5.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iw/iw_5.16.bb b/meta/recipes-connectivity/iw/iw_5.16.bb
index cf176a349f..85f9a63998 100644
--- a/meta/recipes-connectivity/iw/iw_5.16.bb
+++ b/meta/recipes-connectivity/iw/iw_5.16.bb
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


