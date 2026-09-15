Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F79C88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 00:11:03 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12387.1789431058525241214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 17:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nTQG/0+0;
 spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: michalwsieron@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so1232574f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 17:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431057; x=1790035857; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=daJx2SQOqkMoaa8dZH+nWppIxhwzVshVsj6BXKHZdug=;
        b=nTQG/0+0iIS4gE0lrb2iAyTZc2J7D7dr5dheFDMBe8VGUOFfJiMvw4bIvEIt2OhuUS
         8WI51FwLmWsBgXrdHvUCfGNRx5d5bFGhhU8YAStmTZ+m5KC2hNOuNZl5XE9Boo1FLbgT
         tzUQ3GMbs8O9agz9pfV+2hzZPIZPqgzalbbIMC99du6osK+bczsEJGY/FiRcJPHpIOfJ
         veyfqV1i2aHMylA7LUFOqLZj9FTClRafFGVldFTgYSi/J4yVWyfG/T5LKG4fVcDf3kxq
         bUOCOUSoCO4TJcvGKH6bRCxGW49PYsCnkr7Ega/Sy2WVWzJOgJr1G1sE2JFJnMG8pxNV
         Tpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431057; x=1790035857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daJx2SQOqkMoaa8dZH+nWppIxhwzVshVsj6BXKHZdug=;
        b=vyHXOuIn1IEbGTaBBkUNnqEUbfoV6xxqQuYNCmJ9wT2u8HH4JQk6RwZQ+cCrM+R8mt
         IIQinYwY3ucE8yNjSRw658FoUVYl/tt0PDFkKH8r8eRtuMghuAymEZXWRoVU3RZSRG1p
         I2HAG9ibDrsG+jynjShks6CUeid3EiSJiXvLOKNA+7fIJJC/5G/ZHN+JOS34ujPmH2h+
         zBaiekneLgEG92pMMVpFQtIJ1Ls194I5yYqa2w7exQ5/g8FlpRsAT9aAaAXd5Uk6Y0ZV
         i3UeDYDAKKMGxj4CVc+goVn4zA6fA2n2UXt4MMZq4wVLVJhVGnoKQ1B+aRJgiUKAKLY0
         75SA==
X-Gm-Message-State: AFuF++nzn+OdfEqvPixAOAxmTWO0umv/zo/M2N4dyOg5uvvowyQ3x8kr
	P3MiOV2shCDk7SnmxlZ67C3bkOIOt7GimwGTcl3DUoPFQDqNLxazh+Cc
X-Gm-Gg: AYBFou3Czyft9CevWjZ+JfEghOnwobbEfvoeNekQXlyi7B+dyPC5Fglh4aiLQzvrXP7
	Rq8Idtq6lpNVTrDv+oGeoXSkQuMTi6AdFhGGN8/WePvdmllLsN8qbQa44cGuQZjgSzhfvRODGY1
	XOOS+M/X9OJIccVnlK3a6EpgD90D5A+zDvL2c5bK0zNu/AinIlC10I+grqYvWPFg02BjupZ8mqm
	h1PeGtta9Cwhm3Cn5u73gsux/7jX1PkJkHIw/KdV34RWFCXXNnXMMErzsFK/PE66wCTmk7vYdSR
	sgTUqEqm82j3YjWP67n402t/8aBkH69RMYhxoW5I2IIdYztnvcHJhfOEo7hqSb/HlP+dbtrR2dS
	wmTHfS+jZNG1Pb9DgkArK8OAKViX3GE2atw5axbuHOmDv9EP92Sy32B7TUjY5aVyZtSfJfROnpc
	2fTBUtvW4ZFg1QRAl8FwigaqzPMDDrPBafgFitL7kQcX2nlTv6Tzh3UGzPt/aS3Ne0onyYisuJv
	w==
X-Received: by 2002:a05:6000:3110:b0:487:6f6:29a6 with SMTP id ffacd0b85a97d-48706f62d4dmr820253f8f.35.1789431056703;
        Mon, 14 Sep 2026 17:10:56 -0700 (PDT)
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm29287221f8f.1.2026.09.14.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:10:56 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Tue, 15 Sep 2026 02:10:38 +0200
Subject: [PATCH 3/6] pciutils: Move DNS and SHARED to PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msieron-some-packageconfigs-v1-3-44dcf1145d3d@nokia.com>
References: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
In-Reply-To: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245802

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.15.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.15.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.15.0.bb
index ee3dde9ae4..917136cf01 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.15.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.15.0.bb
@@ -16,13 +16,15 @@ SRC_URI[sha256sum] = "c02940f430841ecf158d5d9a50007afc4d5353c8678a2455003ca0b2c4
 
 inherit multilib_header pkgconfig update-alternatives
 
-PACKAGECONFIG ??= "hwdb kmod zlib"
+PACKAGECONFIG ??= "dns hwdb kmod shared zlib"
+PACKAGECONFIG[dns] = "DNS=yes,DNS=no"
 PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
 PACKAGECONFIG[kmod] = "LIBKMOD=yes,LIBKMOD=no,kmod"
+PACKAGECONFIG[shared] = "SHARED=yes,SHARED=no"
 PACKAGECONFIG[zlib] = "ZLIB=yes,ZLIB=no,zlib"
 
 # Configuration options
-EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS} DNS=yes SHARED=yes"
+EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 # Construct a HOST that matches what lib/configure expects
 EXTRA_OEMAKE += "HOST="${HOST_ARCH}-${HOST_OS}""
 # Toolchain. We need to pass CFLAGS via CC as this is the only variable

-- 
2.43.0


