Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.5460.1627534209525029262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 21:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gwvO+3J3;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id a19so3117646qtx.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 21:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/YOXo0PdIcl/d9obMDr7oXrRwA2oumMTuUKJNUfDA5I=;
        b=gwvO+3J3Al3FEnhpXkqVgmLYJ3z4J/DPJY7RnI2Xo9l+CL4Vj1OildEFsLjux8IKV5
         ynRYYR0UWQK6nk5whBPZaYKFdZHZPYV54jCxdGtLDEH7FWQNIceJnGcZcXJ7o+EDg/sx
         8lSxSaKFALsLmNxyfUcuSBgs6ozmWgyGim/KKa91wX+3Ds9eNnVJZ6Ub7kaRrCj2HeCJ
         0jOHR1Z3hWr2t8CJP9DUE+dGjL7/inb+MFfFDi2mVXPjfkqKrPdf5hhOzNZuKrmLsKAc
         Afva5sIrnzxVfyVv2wWj6wZa2M6dDGzIh1mUIzkP6/pHLKebQC1r8lNyODEA/ENZgpPz
         Jw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/YOXo0PdIcl/d9obMDr7oXrRwA2oumMTuUKJNUfDA5I=;
        b=d2r3tH9vvvSwpnMbeX0u7/mjaULQ8swWaohknAHgovRc8cKFhK6FH7DS5VcW+MKvo8
         duNUqlTb7NXnsW7wvXIJZDTUwyGF8IoYEe84xKEck3rAjGFrztPbrhEKUh/Q5wx2keZ6
         PLaf3HMKsMZYVPhoRUEDK6SdHmcZe3BywU7Nq9g39YeVQMkzv2jWVmjCt7QysrB+KCRM
         +VUMIExJuTC2y9yXLJoGtA0L6eim5m52BkZdx8BsAFWbvj8B7dd7X3ZO7haH9fOkuku6
         cp06H9VLGmthE1nuaNuor4aV3N3ySQFrL8UGNWu52gdsPp4JaLVqHH0YSNI7Dxl3U0kV
         s9Kg==
X-Gm-Message-State: AOAM530MCgglSU5YgKQHy6KRDWTziuk0Fisf/Fze1/vFyTn61e+9vyw9
	RuT6jdd3nfa8otexN2SL9Ao=
X-Google-Smtp-Source: ABdhPJxdbAEiDLSWrOQ5avFM5fGPb/cKeTnWxZE5XpzAwqsKbdG3kHlOFbBId4W3QsUbqy7TGfRVBw==
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr2635699qtc.229.1627534208688;
        Wed, 28 Jul 2021 21:50:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id t26sm826147qtc.44.2021.07.28.21.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:50:08 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto-rt/5.10: update to -rt47
Date: Thu, 29 Jul 2021 00:50:01 -0400
Message-Id: <995c98e734969f5207db85fdf776da5894c87dea.1627533955.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1627533955.git.bruce.ashfield@gmail.com>
References: <cover.1627533955.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    969fef49cbbc Linux 5.10.52-rt47
    bb5ff998ba62 Linux 5.10.47-rt46
    340f6b6cdd37 sched: Don't defer CPU pick to migration_cpu_stop()
    f3d0be7cdae8 sched: Simplify set_affinity_pending refcounts
    6b28888ca42a sched: Fix affine_move_task() self-concurrency
    ea66e426a3b7 sched: Optimize migration_cpu_stop()
    ac73ac41db62 sched: Collate affine_move_task() stoppers
    6963e6b6e008 sched: Simplify migration_cpu_stop()
    d3a5a12fd350 sched: Fix migration_cpu_stop() requeueing
    28dda3752954 Linux 5.10.47-rt45
    d5f6c5f008ee Linux 5.10.44-rt44
    ec9978fdc6aa Linux 5.10.42-rt43

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 2e46d72dfa..944d171928 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e1b9700217e1dd963f9b034ffde9863abb53a92d"
+SRCREV_machine ?= "969fef49cbbc8639e9622e6a0655337fbfcc7627"
 SRCREV_meta ?= "26a2a3cf764dde593325b8c08024f5990a5f6f02"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

