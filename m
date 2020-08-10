Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.37303.1597028420972937560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=P1H+Li9B;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id u10so4058069plr.7
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/KNDWct8ddUvijz4jWFMbJqB2DPD/amyT1YHQYxdFj8=;
        b=P1H+Li9B72fdoZgVNSLwhsEU2SzeKBT/I+ns9OH8IJ3FaZqoRwrjN6GqkyDU+qk9B2
         8OnnKG7JM83gMALq7eIvbWmAL1Wojv9Z4UKfntc+5SwDg2SlcFWZl3VFxwhhFH/RSh1h
         FZFRiTqT0e9PZblv9C5CUMNWAN8yYZoyXEr+LxlzRIO4tqYCgruc/iqW+5sBQkd7+zo5
         z4ugj2zNksR+crwsqJQmSC2Qam69HcHA7/KZF7t72/7qCpZ1GTbTurb6XTcyOtyq08Sz
         xcGo0e+Ga7VOvSPavK74BJcZcho+8rsWol0Zdpg+wyL1q+oaNtDAn7bAIMFbvRqv0r4E
         8GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/KNDWct8ddUvijz4jWFMbJqB2DPD/amyT1YHQYxdFj8=;
        b=EQILu+QoVxVrSvyrrqichoB671r5dzH/PxNutDiIInW4T4/i52uDiDC/lbsZ2f0t/l
         3F9FdGOLNVJr5uO8cV6XSKK8qt7E8hs/ocbdLYu9HWh6LE0I4EC0nNMvDcJ5hiNoEQ02
         f/TrHX4ynXuvX4c1V8v3+DLXvUV/sZ6jrCEoo+tmZ0p3DM+gh2q1oiRoxMeiPpSsUKmF
         B1drQ3wgHN07p9TGiMA5pBPumdxPa4Ce5c43hrU5hY3FCcLb6qoyPf0aET7BZg5dkAHP
         IWJZ5A0TdiTSNa2iFixuwtT++F/LeBGXiMJ2gG+EMi9bMJZ7RMp7e9iATpd6Lcift33u
         zd2Q==
X-Gm-Message-State: AOAM532zhwIbDBcvFEGyHjafAzmg3bWUusKuPd76gKGVOBczrR0JWo6L
	JCoCdebyx1dAOypZsJMIQfHUuW1sc1u78g==
X-Google-Smtp-Source: ABdhPJzrwIFMOpPV5acZc2uSurduKXANL5Yt6MIgGJb6AifKisIfNqDLBNPzsc1uki+WPCCpx3HMbA==
X-Received: by 2002:a17:90a:326b:: with SMTP id k98mr25607968pjb.72.1597028420133;
        Sun, 09 Aug 2020 20:00:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/19] grub: set CVE_PRODUCT to grub2
Date: Sun,  9 Aug 2020 16:59:22 -1000
Message-Id: <ca39b482c4fed513e37a8b3af6b4547af78596bb.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Chen Qi <Qi.Chen@windriver.com>

grub and grub-efi recipes' CVE_PRODUCT should be grub2.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8682f6bc7e3e8d5fcf682647526f1a8430d08768)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b3291cb4b8..e796904f5b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -11,6 +11,8 @@ SECTION = "bootloaders"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+CVE_PRODUCT = "grub2"
+
 SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
-- 
2.17.1

