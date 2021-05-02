Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.24783.1619986595437594589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 13:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KF9bK88n;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id b27so2761422pfp.9
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 13:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nJPvcIJFd8KHOGphWsNv4UdlFYHJ5qc6vrz2uRZkq74=;
        b=KF9bK88nbv4dLHoSb1KEoLu5DKQS1zCesh/F8ZSHYdr+MjsCAme7r1l7gja0bqUgKN
         BweCxRTF0iHIQrBhWGfP/suEBq3dq7aMYVP0tq/nwekH1fm5PcTBdgsp/aNMNz66/IbS
         qeq+RHmd0NdI/8cLyr6HUonIqaW5QRAqeLmWCeAtslOsvr5Llb9pke06n1w105nbtvQ5
         7m9nxZQQ5HJybqUHEAaksTKSE9p2N0rfAfYrZEVigx15aNN4n5m9hsK43ifr2bQ0nYoS
         4VaH8k6q1ewwdp2IgTePAhNDh548vrVztWGy1HdfK6yqQ7i1QRknNYF3biWOHRXX9UZa
         Fh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nJPvcIJFd8KHOGphWsNv4UdlFYHJ5qc6vrz2uRZkq74=;
        b=cSzNpodNdG+le6qQcxRFV6lLL7CnrAsXafYYgYumxot3bgav92YLp1HrI6+95CgDEf
         DNUKo92GwZJF16haTE+ORlHLU5uuX1uy6EAYbmahhDhTas7ywXEPpsFLefibebS/gRQ5
         THovHZawiAzGFz0oluWnVm7/B2acqGC/B6TunwLB0MEb+iif71jAN5JOGGEQPZSJV0FZ
         8kC+LsLJeNo3FhxiXpYCouhlIK04FlrRMzY0n8ocPVOvpH4BB0wYH488StzHrYljJC6/
         43x94T7LSQyKIyHLAUTKEsuGC97ap8qTq3VrQlj9i557vrKNYFy1D7Gukd2fMcMVc+y3
         5mIQ==
X-Gm-Message-State: AOAM530qTYfgZI1PEIgJlhrtvK+4ogBaLPqlfHyaJ+xNWGMvDqQbGme6
	2zMgmQDvJVwhhrob1uvVdBISnhAgGKts6w==
X-Google-Smtp-Source: ABdhPJxj9Hm64vcVlGJvlzNhZzSqOO0C5JIeXUk323aaIQD3fTnfpiMKW44ex5SGs1+DliIf8FCppg==
X-Received: by 2002:a63:5801:: with SMTP id m1mr14883593pgb.424.1619986594786;
        Sun, 02 May 2021 13:16:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id b21sm7385815pji.39.2021.05.02.13.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 13:16:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] webkitgtk: Update patch status
Date: Sun,  2 May 2021 13:16:31 -0700
Message-Id: <20210502201631.1490332-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210502201631.1490332-1-raj.khem@gmail.com>
References: <20210502201631.1490332-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches are accepted in webkit master ( 2.34+ )

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch  | 2 +-
 .../webkit/webkitgtk/0001-Fix-build-with-musl.patch             | 2 +-
 meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
index 93bda4d754..68195f8464 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
@@ -8,7 +8,7 @@ it can reflect broader range which is now checked
 
 Rename ATOMIC_INT64_IS_BUILTIN to ATOMICS_ARE_BUILTIN
 
-Upstream-Status: Submitted [https://bugs.webkit.org/attachment.cgi?bugid=222959]
+Upstream-Status: Accepted [https://bugs.webkit.org/attachment.cgi?bugid=222959]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Source/JavaScriptCore/CMakeLists.txt   |  2 +-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
index a13b394fd9..1ccef1fdc8 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 6 Oct 2017 17:00:08 +0300
 Subject: [PATCH] Fix build with musl
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
index dc3a71d932..5033de4196 100644
--- a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
@@ -13,7 +13,7 @@ setting DEFAULT_THREAD_STACK_SIZE_IN_KB alone is not enough either
 This patch only changes behavior when using musl, the defaults for
 glibc in OE remains same
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/Source/JavaScriptCore/runtime/OptionsList.h
-- 
2.31.1

