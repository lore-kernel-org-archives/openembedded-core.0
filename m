Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.3851.1603858149244114821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 21:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pl6dwmp3;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id a200so2152989pfa.10
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 21:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHjRA32SxNGycdTccQXJv8BQIIPqHxM0vV70larwozA=;
        b=Pl6dwmp3bPFrjIssdsi4jz5GzkVTTCQCFjXvcpq/aEps4iu/9s1SOi3zQyHmAzjUCB
         NyaZb0/nhSw0x8asO/FsfBqN2PUE8SVaSCdImiiIkZJpDZBcb4S0lQX96Wx2s0XEBTri
         WKq9Yr7B+0/ANeuGP+YKkWY3MVcT9gaJBsPqH0bh+y2kYCPf4QAUjHVfGnYBFadgmpk0
         6b5+2O6UjYKFev+kTkXqdkseDPf0RfJjAsfXW2k74PZOFJL3+iu0Wpl9XcrKtjVsqVJ8
         gtIGHUEH9tm6F07lOSHdEA8eZlNvSYq/fwPAEKt+Xmd4zgQtgBMUcl4WIoh4UdmLw3y9
         w2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHjRA32SxNGycdTccQXJv8BQIIPqHxM0vV70larwozA=;
        b=PzK1skHXh4/qoZOsgSFb/IdJZlOWek5ZSCRV5TBDWA7f9JwThwQP7SVcaQsVl+2fnT
         K/oS+PwkqvMBHWIawXvBpMgk3ELtuP+w3H0V1Ak7NI+yEMm4plRT38SQY1ffHGDUc5of
         RuNgTd2rovzrZzbX6x9I6higMIfLUDrPKfcKoupHYrzWM1vTpWMgghkkiO9ehhSUNCPi
         kO3hO6gVPtmztx01jWBqH7Mm7WWbGElyRWVYv+mthzdwW8bJj3t+xYIEoHvfOW1cq8q1
         BKpf1dNZEk92ArLe0SAGN6caLroM82OASS8OtIZC7yUjs7sIrxSNBSdmkouznKaNDelY
         3URg==
X-Gm-Message-State: AOAM533jlmNa9OTZkLAVmJaIJJ2FgSxml6jtlVJc24ndAM2/gITi9wEm
	bEUaxJRuSRuyLQFpgDzcWVBgFtsgqtgiUQ==
X-Google-Smtp-Source: ABdhPJxipU4W3GnJPwIFPmQuXlPzFErkG1/FJ5Qzt6FFFTrJqIrR/0T/ss+Iit+/+qfi8sZW2mdV6g==
X-Received: by 2002:a62:585:0:b029:163:b618:92c1 with SMTP id 127-20020a6205850000b0290163b61892c1mr5465206pff.41.1603858148418;
        Tue, 27 Oct 2020 21:09:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id c1sm4133410pfo.207.2020.10.27.21.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 21:09:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest master
Date: Tue, 27 Oct 2020 21:09:02 -0700
Message-Id: <20201028040904.3446105-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028040904.3446105-1-raj.khem@gmail.com>
References: <20201028040904.3446105-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in this revision bump are
* 0b87551b (upstream/master) lift sigaction abort locking to fix posix_spawn child deadlock
* 99d5098a update crypt_blowfish to support $2b$ prefix
* 957c2763 remove unused weak definition of __tl_sync in membarrier.c
* 55767360 move aio implementation details to a proper internal header
* 37337660 remove long-unused struct __timer from pthread_impl.h
* 85e16aec drop use of pthread_once in timer_create
* 6ae2568b remove unused SIGTIMER handler in timer_create
* 47baa030 remove incorrect fflush from assert failure handler
* da845d52 fix getgrouplist when nscd reports an empty list
* b7bc9665 fix posix_spawn interaction with fork and abort by taking lock
* 25ea9f71 fix unintended observability of SIGABRT disposition reset via sigaction
* bd153422 implement _Fork and refactor fork using it
* e1e98d86 rename fork source file
* 50716702 ldso: use pthread_t rather than kernel tid to track ctor visitor
* 1efc8eb2 fix stale lock when allocation of ctor queue fails during dlopen
* 69a1b390 drop use of pthread_once in mutexattr kernel support tests
* b115bee4 fix missing synchronization of fork with abort
* 3cd3de61 move __abort_lock to its own file and drop pointless weak_alias trick
* 34904d83 fix fork of processes with active async io contexts

Details are here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=a5aff1972c9e3981566414b09a28e331ccd2be5d..0b87551bdfb74ac411caa335d8ad0b89a7f139c6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9c0818cfa5..897e56e10f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "a5aff1972c9e3981566414b09a28e331ccd2be5d"
+SRCREV = "0b87551bdfb74ac411caa335d8ad0b89a7f139c6"
 
 BASEVER = "1.2.1"
 
-- 
2.29.1

