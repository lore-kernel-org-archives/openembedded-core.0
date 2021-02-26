Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web12.9968.1614349515057624424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Hq67PuoH;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id e2so8139820ilu.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JIIvTGksfUISbaovpqMONA6v4h//Ry/V5POeh1Vg7SY=;
        b=Hq67PuoH207F8+5Wu+jnSLjsP/jjh9qhgZ4ZbUeW147WUCOXT+mLoXTbfaz0TfU4ze
         2EFHdOm3MBPvJYd7lC4MtpmdHGZq0YxklDeDsZMIcEsmiotIEfEWaTG7Yw7FZi8S5jJs
         3SBq6tW9j/WzmpWJhTIG7nz00Cb1ZDrMHV6LsOCHVdQCtTrI3dQae1ZMl9Azrt7vHRqM
         Tchb69Asz198p5Jv6xlXUaDYsoU2A/ntpgsqto1y8ZhQxAr835YLcSdurguQ+bOJzZ69
         AVKVog+XHTjLwt3Xxnph9bbdJLh0/ueX3olIQ73jnEdmGVxadIHQXR7LpgLZNipkk0aF
         PCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JIIvTGksfUISbaovpqMONA6v4h//Ry/V5POeh1Vg7SY=;
        b=HGBLgg1ctAK4xVZPuPTj5SozpbpPmy/pWSL+kMBN+Cpe5LLNwMaWADqvTjt7szjePx
         TZc8KisUcCohG5MvcSdsuqmzvygdKo3jXW3Aupl33O94ke7E3quJzvoYtlqD9Rwj136T
         gmdATEc74VqXWB92fAL0WZfcG6FDbfFAhOemNr4TO0s5DHsviT1pUQ1QZLIzeYsy2Eu9
         cTH3eSrdvq/Avk/kNxFU6EozjhMNcDOK7l/cXdQfhC8FmH7LLqPQvQz6EMkI2X2SGBxG
         NwA0Kb81CUk7ODNSeclordxvgxzI0vCD4Y6Wqmrh1AD/FiK1nskmsGyFfP3ZWVDeY2Nk
         OnYw==
X-Gm-Message-State: AOAM530fD6EtJe3rAm1S370dn1/51NE+faGZaRQ5H/kM/sWIavf5yt2n
	49KvmC0hT/eVCAG+K6Ms+x4D5vWw5IRaVa0C
X-Google-Smtp-Source: ABdhPJwJ+qcFCiTVS70hP74hWEsMXZpLb/XBHNFuFG3diw3Ii/Sjd5rZMnv9iiHjrO8YiyphfmW77g==
X-Received: by 2002:a92:d90e:: with SMTP id s14mr2601595iln.291.1614349514042;
        Fri, 26 Feb 2021 06:25:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:13 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/40] pseudo: Update to include fixes for glibc 2.33
Date: Fri, 26 Feb 2021 04:23:46 -1000
Message-Id: <b09b9a28f8ab26b5ce5a21e1f3f1d05eb3540d61.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in the changes:
makewrappers: Fix glibc 2.33 fstatat usage issues
ports/linux: Add wrapper for fstatat/fstatat64 in glibc 2.33

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfcb1c5eb2690046f96c2bb6724e091028ddc3ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4287cfcf93..17bd02c27c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "d03de55845edf68908879db841834584d4724c43"
+SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

