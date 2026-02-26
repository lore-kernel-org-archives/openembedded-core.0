Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC1DFD8FE7
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:39:42 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75828.1772127573519685214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iy/2Clo5;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d196a2334fso936127a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772127572; x=1772732372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bx92Rqv8XH8svNTd1Kyo+6wee10mU/hPz8fUo9sZmFA=;
        b=iy/2Clo5wK7nPaOC0I0e3kDyeLjGAcKUIuLqPrsYgn/MVjAHHSIV4bG6/JPghmWxtm
         BzdeV/L/iQb5x850yJHZrFwwi0NJTqiLWPWtoX7nq+ybWUTOX9gur/weKVkFX/FBf8UE
         wKxHAIupOhv24wY49+eFX6JZweVlDytvu6DNa8PxNU7oC9vXIleWY2v0y1u+cBCSzrm8
         uSNrI5mSe7IH4Y3FovdXo+vjzqlz8eP/9/HShne+qJsJYnlkIF6FCiVOKVgge2doWzO8
         Enb+BQZFV/FYL33lanv/Qnrm0JABwxMMVXNrmL4c8xlgpZnREnuxSkQMgu2pLh+mUgbn
         N8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772127572; x=1772732372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bx92Rqv8XH8svNTd1Kyo+6wee10mU/hPz8fUo9sZmFA=;
        b=VdOc2QzTQPDexM5l2cAGjqiotQ9IvruR638CGqRo6w52RUBHI/AgbOeA+nkkpRyksX
         9xbc1WNkydKgPxxqNfFnKFryT86WXeHooUrvNg27IIS3x27WP5/JDRqavHD6KSGVppfu
         95Ndt/V8gl3Ny95oQE8lEN4rLR3OdWXCN43UY09LDx03llO/dZ26o+eeAE4mL0vNAUex
         a2kJELnO9V0FKweSH853Z6xEKsDnYF3QYigQwEp1Y4kn76XQ8j78ViZVVmRpuQzawqWd
         WYVuewXFeqoypPUtB2Vp5Hqte5uXTbyLhIBU3+Pyr2CH4m7byIpsSriP9YwI1GfiERVN
         3bqg==
X-Gm-Message-State: AOJu0YxbUt09raMrB44kcSI9Y+zzT3x1BYT/KMK+MRlCG59+4WIHKFZx
	s7pmRWjvY9y88NI8DSpttj+gO86mCe+A3LOwuE5DqsavBZ0md0o4b54XL8Wimg==
X-Gm-Gg: ATEYQzwlC4C2aMVtb/VHM2eU9oGj7jPL+fSodDY7/IObsMe2YvvwRHsifMKimCM7AOA
	Tl8DInYTELINlUMgnZy9ACsiSjUsVZBVRSrp7QnQciy0pPM1UPpmozffVDoJZMU9b0AqVUJGRIJ
	TRPUIZlPc+HS3vSlMDGEYJcZOvVDnr0spRTJ6FBQXR9pHe7lSwf50w3AR3VKlFnV7kO+sTkXnLe
	aW0LqXc67cIkY9nZnEROoNCcSHX30eInuw4P2025uvFmcqUHjcQBElnSzz8PvLiS0oINp3dHZNr
	0GDX+RaMM3SxqcCF+Ns+qZJaBpmsqq2DKvrx5qqdwFI9te2EEszGPhIvLw/O5xYvMYw63aoK2CC
	Y1Pxw8jGUGD14Go8d7XiiORm6oqbj9PDdHfS9t/xhuPA46gG8sR9OQmhFOjA78M7StqBZfdVeSE
	fGscMxJe1Z6ojm3wdhKj2A
X-Received: by 2002:a9d:7dd5:0:b0:7d1:93bc:c371 with SMTP id 46e09a7af769-7d58574d6f4mr1315195a34.8.1772127572554;
        Thu, 26 Feb 2026 09:39:32 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f81sm2173027a34.23.2026.02.26.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:39:32 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 0/8] Add SPDX 3 Recipe Information
Date: Thu, 26 Feb 2026 10:33:01 -0700
Message-ID: <20260226173930.2847872-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224230234.679049-1-JPEWhacker@gmail.com>
References: <20260224230234.679049-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232046

Changes the SPDX 3 output to include a "recipe" package that describe
static information available at parse time (without building). This is
primarily useful for gathering SPDX 3 VEX information about some or all
recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
vex.bbclass.

Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
helping work through this.

V2: Fixes a bug where do_populate_sysroot was running when it should not
be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
incorrect (this is already handled by bitbake in the taskgraph, and
doesn't need to be manually removed).

V3: Fixes a bug where meta-world-recipe-sbom was reporting a circular
dependency. meta-world-recipe-sbom also no longer runs in world builds,
as there's no reason to this. Finally, fixes a bug where
NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
(because do_unpack was not run).

Joshua Watt (8):
  llvm-project-source: Use allarch.bbclass
  gcc-source: Use allarch.bbclass
  spdx3: Add recipe SPDX data
  spdx3: Add recipe SBoM task
  spdx3: Add is-native property
  spdx30: Include patch file information in VEX
  spdx: De-duplicate CreationInfo
  spdx_common: Check for dependent task in task flags

 meta/classes-global/sstate.bbclass            |   4 +-
 .../create-spdx-image-3.0.bbclass             |   4 +-
 .../create-spdx-sdk-3.0.bbclass               |   4 +-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes/create-spdx-2.2.bbclass          |  12 +-
 meta/classes/create-spdx-3.0.bbclass          |  76 ++-
 meta/classes/spdx-common.bbclass              |  16 +-
 meta/lib/oe/sbom30.py                         | 192 ++++---
 meta/lib/oe/spdx30.py                         |   2 +-
 meta/lib/oe/spdx30_tasks.py                   | 487 +++++++++++++-----
 meta/lib/oe/spdx_common.py                    |  11 +
 .../meta/meta-world-recipe-sbom.bb            |  28 +
 .../clang/llvm-project-source.inc             |   8 +-
 meta/recipes-devtools/gcc/gcc-source.inc      |  16 +-
 15 files changed, 618 insertions(+), 245 deletions(-)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

-- 
2.53.0


