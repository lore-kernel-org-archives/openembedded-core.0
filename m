Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD65AD44D58
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:33:36 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.45593.1730900010011925615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wRP7mzl8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7f12ba78072so2848469a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900009; x=1731504809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtFl+HrByJjFw4OoPBvPc+oZOD7m+ZUUajxdsuIlLHk=;
        b=wRP7mzl8R8rzqsqgPFUC9pDkZBkUIq+ef3Lfb6GsrY3O+ehQmLIaf/1RQHeenu1mcj
         vxvADBRBE8opRpkIqusiS39ebld5gIfPOQaYbrj7SsFardrG4sxopoRTtgOyWn8tv1hB
         1dEXMEwuYLh1ovJ2GFOBBmF38aAliQbwrs8qjQQtGz9UJJfNcJO8kpztzZ+QUhyZVHeT
         Ib5pzbQ3a0qHtz+bDylwpnkh9LFzAub1+2S6aaMxE5sbFYSqqv+ZnZ56a6HS3P7mcjxq
         c8M0MiJmMVVO75ScEGKKdnCf/BJQrDjowBvdNPU18IIdMdN64hWjOb580mOAERuLwa4E
         dwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900009; x=1731504809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtFl+HrByJjFw4OoPBvPc+oZOD7m+ZUUajxdsuIlLHk=;
        b=i521zfM84jNWI24bT+A3khXNmZi+amPTapch3As62dGeDLEEv+Y3U/uTI1tabL96X9
         eyeNIm0EojgIiVyx0D0jFLLhIBUYZjNFeHNTUjRamCMxhLK6d71rOwWE5c4XlqFNdQ/u
         oscTKFhBSB9IwXCcO4PC+t+rLP44X8Tsm34R0HvgUOFiJhcTkF9zRSxkP08XKIFfPGeA
         C5fzYcPUIsyEySmZMdiZNwFJFxT5reicC5+zc4kjW2GSlJZZjCPxcmBaffcInQrOoIVH
         XfEw6+cFdTi78iOskniD9ag0nTp83oNbBIKkmxvVQgnJQreD9DWOgfsOCvxSgEWXdTBs
         swbA==
X-Gm-Message-State: AOJu0YyYmVz/71WUnAvmS0n0OWzwg0+L8PlKZnFBGgBTTYWkSCHcxpbo
	WMMmT7bRCTiyYc493D6TpJV+D2UWCWDEjG/0skWtf4NOn0D/I3uS5wNnEUpHcHy8jVRwNNKjPyO
	T
X-Google-Smtp-Source: AGHT+IHoGftiZ5o2s/7bjdSsPylzXIk4R2IMgk/kyA9t9m4+xMxJliwoLrarX20yOvnpUrTUPFi5vw==
X-Received: by 2002:a05:6a21:38a:b0:1d8:a9c0:8853 with SMTP id adf61e73a8af0-1d9a8402d9dmr57555825637.23.1730900008953;
        Wed, 06 Nov 2024 05:33:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5722sm11631717b3a.71.2024.11.06.05.33.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:33:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] Patch review
Date: Wed,  6 Nov 2024 05:33:17 -0800
Message-Id: <cover.1730899830.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206767

Please review this set of changes for kirkstone and have comments back by
end of day Friday, November 8

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/398

The following changes since commit 2c913a7b66ea756ebc65a573e1b5bb5dba6834d2:

  util-linux: Define pidfd_* function signatures (2024-10-29 07:51:17 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Martin Jansa (1):
  xmlto: backport a patch to fix build with gcc-14 on host

Peter Marko (1):
  zstd: patch CVE-2022-4899

Richard Purdie (2):
  cve_check: Use a local copy of the database during builds
  package: Switch debug source handling to use prefix map

Ruiqiang Hao (1):
  gcc: restore a patch for Neoverse N2 core

 meta/classes/cve-check.bbclass                |    7 +-
 meta/classes/package.bbclass                  |   68 +-
 .../meta/cve-update-nvd2-native.bb            |   18 +-
 meta/recipes-devtools/gcc/gcc-11.5.inc        |    1 +
 ...4-Update-Neoverse-N2-core-definition.patch |   40 +
 ...001-Fix-return-type-of-main-function.patch |   42 +
 ...mlif.c-and-update-xmlif.l-to-comply-.patch | 1259 +++++++++++++++++
 .../0001-fix-Wimplicit-int-for-ifsense.patch  |   33 +
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |   10 +
 .../zstd/zstd/CVE-2022-4899-1.patch           |   66 +
 .../zstd/zstd/CVE-2022-4899-2.patch           |   83 ++
 meta/recipes-extended/zstd/zstd_1.5.2.bb      |    5 +-
 12 files changed, 1583 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-definition.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-main-function.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Regenerate-the-xmlif.c-and-update-xmlif.l-to-comply-.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for-ifsense.patch
 create mode 100644 meta/recipes-extended/zstd/zstd/CVE-2022-4899-1.patch
 create mode 100644 meta/recipes-extended/zstd/zstd/CVE-2022-4899-2.patch

-- 
2.34.1


