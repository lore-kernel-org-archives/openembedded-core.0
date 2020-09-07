Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.1716.1599498187543587794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Ule3gZlC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id jw11so825813pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=J7h5fzjlhQOqM25s0BcqPWxBVFh9aMDxrlwQ0duXVh4=;
        b=Ule3gZlCUnHFVsIOg+n50ygAif1nSD+a6uPeW9dNH/qWUm+8vS4jieuyr1aVQpfMOD
         wXRoUYj4gcdk4XsB2GOLRTs3PoYocg7M9NDC7gp1VOj+cyKx2oEUcIUR+RxwBicileJj
         rDqlLBtatMgR8aiEjsKIr+7bC7EPjAEnsBbO5naf2wlVfMgHZFKVSWjz7EserURDtPcX
         9wCzxYbAS8M/ZSzdfFiLK9JnR+HIoMzHdB99xhnIo+qcss78P+c4RZsEjMtpPaMSdQvk
         htkBTpPb0wwsTuk7xEzUZpH2xGL63POKTJsxFxV10n8SYoxdlbTQQYlgu2LhY6ACIrKH
         fNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=J7h5fzjlhQOqM25s0BcqPWxBVFh9aMDxrlwQ0duXVh4=;
        b=B0/RdXRo9HLqn3mJLYAobC3b7PmQ0MlH2dNhjYlI5aivwu90TZU/uStgnIFbSxJK7H
         ahuzVWV7f5rFZHXAhR7qHEAKFwVBHS6mJpPuIgfy7Bqcbvl1/IDmQyZNxArjrrM35JPn
         vCdTYvx4Cnz7PuR3Fv6vnjsIICXYsXJWgauOmJZTjEkvFrG1CCsceOZ7xbVR3EDlYFlH
         Yvfr7TrfI0dl07QZFuaL6IBRlZUm3LqsH8iK5bywsHWhGjQzqrehI+LyaIyKDq6kSkgc
         etGWcfiOKNw2y76xemjkNeSaz/x29Uym6nmoGWpBLhtB88XyRmAerK+iNfg2AuID9rSG
         whBA==
X-Gm-Message-State: AOAM531VyjeTBqr0KHyN6xbY+C2WfFQtE612+yhHf6VUE4tLam1Nh1DP
	5a/THvOapDQyOHPgxy656OX58i4Cv3njNB0w
X-Google-Smtp-Source: ABdhPJz6fUWLBcxGbeJdZn49YSnwUqS/kzY126YK4xbxAGCoB1JgECu3IPWbhLgsLADd19+5yQn1Tg==
X-Received: by 2002:a17:90a:4488:: with SMTP id t8mr201234pjg.191.1599498186670;
        Mon, 07 Sep 2020 10:03:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.03.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:03:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/18] linux-libc-headers: kernel headers are installed in STAGING_KERNEL_BUILDDIR
Date: Mon,  7 Sep 2020 07:02:16 -1000
Message-Id: <83b74458783aac5d1d5a3ea8a31ccb79de3719bc.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Since 'fido', kernel headers are installed in STAGING_KERNEL_BUILDDIR,
not STAGING_KERNEL_DIR. So this message in the linux-libc-headers
recipe is slightly misleading.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bdd06f8ed58ed1c4983f8188e98f1a132da91e3d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 4481aa430c..4ad74a27e9 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -16,7 +16,7 @@ LICENSE = "GPLv2"
 # and have a machine specific libc.
 #
 # But you have some kernel headers you need for some driver? That is fine
-# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
+# but get them from STAGING_KERNEL_BUILDDIR where the kernel installs itself.
 # This will make the package using them machine specific but this is much
 # better than having a machine specific C library. This does mean your
 # recipe needs a
-- 
2.17.1

