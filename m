Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.8735.1621413347509204440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 01:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K0mpsQSw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso2926886wmm.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 May 2021 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IyB4WzCFvGPDeEXvldsDD+shaWX003ihvOQ9Upt/fvk=;
        b=K0mpsQSw3CzwR9pQFKOUm3rmFqWEpo1O3MDcnvu7O+etJAMW9fSKcexMnKWXIIDYhV
         CpxyM56mzZul1TXfu14GmYi/q2RkN7KD2nvKEpCRhjGY49h4ZkFf9yFJUfkMdRaKTTg8
         CkFjNcZkk9ni0hGkQv6V+0bp2kG8gCXrdCh6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IyB4WzCFvGPDeEXvldsDD+shaWX003ihvOQ9Upt/fvk=;
        b=mqv5GHwOHSfO7MGBPx2tdNJj8kqzdR/u2BhQ3SigCLrOzIeqW4wLeInujNqmBgLXnk
         M+WFNn+EqivCgO6HQJ7GdbaphuQvGZ75GlCS72tuscs9odprCfL1ngqVGTjkEQPLJ6Yy
         fdmhDecbsiBJ97aIZJKnmDqxKtBZutzMtBjGCZqvCXlXds4FaKpY2GY3lVms/USWvO12
         j/0UTc2JQfmBAAd025Ucj3OXFi0IKSrPIwQBBhK2bGWOjEkzRTbRl5fAG/7X+zyam+f3
         UhvzlXxQqzAkgVQxUK+npw5X+CtFm+jUIhnH2iUrbfnZoi2KMnXh6zd738mSLKKs95Tc
         XI3w==
X-Gm-Message-State: AOAM531IU/8YcQsqwI44+7Nw4KEKKaWpyfFShG/bk2YRjTV+cojh7uPf
	8OLmr3B5QLdSfO0H8zY0Pyl8G3CnS8f+IA==
X-Google-Smtp-Source: ABdhPJw41husJWRaTqjhlBRiq0T5N1sd4gVhip5du+sGd/Ws4KZTGr6W1y0hq2a66VHkh9c+bn9UxA==
X-Received: by 2002:a05:600c:3545:: with SMTP id i5mr9564341wmq.43.1621413345900;
        Wed, 19 May 2021 01:35:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5a03:58fe:8897:9b3])
        by smtp.gmail.com with ESMTPSA id b1sm20883381wmj.36.2021.05.19.01.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 01:35:45 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] uninative: Upgrade to 3.2 (gcc11 support)
Date: Wed, 19 May 2021 09:35:45 +0100
Message-Id: <20210519083545.2484833-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

This upgrade builds unnative with gcc11 allowing it to work with newer distros
using gcc 11.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 05b79d14c3f..740cca0ecfd 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.1/"
-UNINATIVE_CHECKSUM[aarch64] ?= "7fa12b9fe7a95934cc09beb0e8a25ff97179ef3105116015d32548eadd27b024"
-UNINATIVE_CHECKSUM[i686] ?= "bbfcdd48336800b5af97e294918c6586a0a8fa903f127f813b0bd5110de8c55c"
-UNINATIVE_CHECKSUM[x86_64] ?= "5d0611df544edff6428cef7d871257a91aa6ba1bd92f5365a2df8deb54b6b31e"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.2/"
+UNINATIVE_CHECKSUM[aarch64] ?= "4f0872cdca2775b637a8a99815ca5c8dd42146abe903a24a50ee0448358c764b"
+UNINATIVE_CHECKSUM[i686] ?= "e2eeab92e67263db37d9bb6d4c58579abd1f47ff4cded3171bde572fece124b2"
+UNINATIVE_CHECKSUM[x86_64] ?= "3ee8c7d55e2d4c7ae3887cddb97219f97b94efddfeee2e24923c0cb0e8ce84c6"
-- 
2.30.2

