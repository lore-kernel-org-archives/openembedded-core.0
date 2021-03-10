Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.8603.1615383456537404805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 05:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FdTtM0a2;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so10737081wmd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 05:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FTf1YzCfpVWnRQn+hVFCpDCuhyx1T+wDGbAED4wjrnI=;
        b=FdTtM0a2m/q30UTBIwnDijeJ0ULp+FAN7lKIG9IOi6Pi6c1bJkOntU3Gn9j3JkI5DR
         rD9z3oNA1IhPIvlDN73i+KwfyDCuc/2IOUfVFPuPtwwQRF1YO4L1zSwMsQCcRZJrcSBQ
         L+pxmEwbru+S0ue2BD278+9oU/ptiwIlyi52HPC9HSOWhFqO4KEbkxlszBx1pgRaC0Gb
         o7EfqxeCgUWYPNOU5sXHKiYxjoCamFyk3xCHo1MTvAZel0Xi+Obz5HNIB0hMRn1IoPnu
         NaWQdQQoe3qn1kQrzYKzsTzkBk1zyNtWK7PI142iDGozE0BWc9v2dF8buxgQpWGu1/U9
         cFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FTf1YzCfpVWnRQn+hVFCpDCuhyx1T+wDGbAED4wjrnI=;
        b=tSzN/fJIVTuzyn6u0VTVHNAwN6QVP3gZNtTF+l3by7GjEAEMvYwG+u0Xb2lEe4STSd
         XiRTBj0kJNoVSzTDH7UVBt/Vbx7AUIDn+uRNQtebEGvHAyln7oV0yut8pIgXWzbTUtsY
         tdpQAbazzWjOa5baNX/iebF1NAxRy/vcVhhhGnM4JOrCUoKvli882th7qDlYMpo4L/f/
         b3qpqEILGQO/1wIr5wYQdd3qPM5oKL1Nza2KUr2+5Hfg5thkv7xwqRkzliSwgMxeVwMB
         h6jdx4mKC4E96YuKRfzcF8VeT94omytnZdKcAU3JuAmcgaBY2LDmpUKp7aaEwqBW/bXC
         1g3g==
X-Gm-Message-State: AOAM5304vvENRBXFkgZ5QiaLoBfhnAIQUs84shCUUeGDXfi+oUII5I33
	EYDCKz8cTxmDVfggPdJTQgoosurzBJ8=
X-Google-Smtp-Source: ABdhPJx0iYOY0IDOdhVzejVYLJROxxdE7o0NpqGMf74EPFb7gHCpk6eFBUaEZJYmWY3ssC7sQ0NYAg==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr3426858wma.18.1615383455176;
        Wed, 10 Mar 2021 05:37:35 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e8sm9573196wme.14.2021.03.10.05.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:37:34 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] busybox-inittab: rename for PV to match with busybox's PV
Date: Wed, 10 Mar 2021 14:37:31 +0100
Message-Id: <20210310133731.1890031-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310133731.1890031-1-Martin.Jansa@gmail.com>
References: <20210310133731.1890031-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../{busybox-inittab_1.32.0.bb => busybox-inittab_1.33.0.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.32.0.bb => busybox-inittab_1.33.0.bb} (100%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.33.0.bb
-- 
2.30.1

