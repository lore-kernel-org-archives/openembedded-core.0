Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA896C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 04:50:04 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.1206.1722833393590990779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 21:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gelRJW4A;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-70968db52d0so4414226a34.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 21:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722833393; x=1723438193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3nbSX1kxcqzruhHpJnLap7kp0GGsdmP/HmtPcNLXys=;
        b=gelRJW4AILsiIQyqlh11UFxwnUgdYUu4EaURJ7K+Y/IOYio3/+F9Ju+mY38zb/YzZj
         cb9GEszfRGGitl9oS76NuFLVlpZF0i5cHA8HrhzjrYjz2yuMj04hixE0YsMnZDeV+VvR
         WQUhI7MwlHhoOmytSh5dkbVfotGECI2clRgiPNqNrBIHAaZK1kbPFGwbWIT21iZwCOkL
         bPAGgOCBJmp7C1Y6F4ChGvxkeMBzZtHBhyAeYu9imstnrJ5hXxOhWam+h/k1TAXLdxP2
         aR5UYxAH/NDeGEwN+jYDwscVpUZOj58q1ydWQjO2DjwbIkMzXa9C5s3RVpCT8y6SDBki
         YCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722833393; x=1723438193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3nbSX1kxcqzruhHpJnLap7kp0GGsdmP/HmtPcNLXys=;
        b=cV+fsjyPE1tfW1dIHBobRuiF9/ByvlsS6f2kuEmEP9Chz8Y1ZSoOA4hC56oyLGIZpZ
         QP/9Z7VnbFlXXm9T2SxrCRtGwaR7dpoKiLD4Qn94KarAuqjmI7XWs6YZJBT9rjmth5um
         2d0gQ3pCD/wCLGga1uW6fmJmqXJkdifxc0FgvT7Rg8L8PkFjKwHHVDWEHicv9mS6yhDi
         DhfIFf5c1GvLnUR7KvjWtp41V6BxBhP3kHAEQlHWDsWVHU6+peljpem27+yCup8NoUnE
         KGLlikI3Pn06fRgmLQyawvyrualBq+fqCqLlGqbMGi8L0ukRTk37k1maM2oi0eRGsuSh
         JvPA==
X-Gm-Message-State: AOJu0YyTXgq4zugPQYl0VqmZeUvWNtDldV2onXwzpxc3groCY86TW4pF
	ZYVqNCgLy0opCyVgekfDVfdFqmgWch7oZVJKb2HQzAARcLhQEhIr3c4hm7DJ
X-Google-Smtp-Source: AGHT+IFx1bCPrTvskDZOGkq89jMEZjJRmF2SzCcq9EhLr8X3tDmG1rA3M57ylvoCf3i/CeMRafJQJg==
X-Received: by 2002:a05:6830:650d:b0:709:396c:c465 with SMTP id 46e09a7af769-709b323807bmr13743170a34.18.1722833392665;
        Sun, 04 Aug 2024 21:49:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1822])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecfb712sm4619838b3a.168.2024.08.04.21.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 21:49:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Fix comment about major version
Date: Sun,  4 Aug 2024 21:49:49 -0700
Message-ID: <20240805044949.296619-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 04:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202983

Reword so that it does not have to be updated with
every new major release of binutils

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.43.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.43.inc b/meta/recipes-devtools/binutils/binutils-2.43.inc
index c1689a82dc2..f6f6eb55a94 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.43.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM="\
     file://bfd/COPYING;md5=d32239bcb673463ab874e80d47fae504\
     "
 
-# When upgrading to 2.42, please make sure there is no trailing .0, so
+# When upgrading to next major release, ensure that there is no trailing .0, so
 # that upstream version check can work correctly.
 PV = "2.43"
 CVE_VERSION = "2.43"

