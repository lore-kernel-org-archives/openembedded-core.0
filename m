Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.28284.1623669328977791169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 04:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=at+DIDYY;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: rahultaya96@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id ei4so9512241pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SOzN0qIuQ4D29xhIdWf12Kjo5Z7mTWtixivN9wWN8GM=;
        b=at+DIDYYXOQLA3sMnTAZYbN4YUx744ED/M+HCA0LSlZ9aooOErsr8H5ncbn3z6Eh9w
         h8J04Uy5YqJQCPMKj62OVk8t7MCWUciricEW887MXJA8cCWRyjRPQg+saXOQJ/wiNEMm
         k/tZCDMFmFUYATzC6Hp1wZTVwYkcoTA5LjDYq0+KDLwQqc4xH7m0tqIXCiPpmmzWXvAH
         FNNAYwKbwJR7cxVMOfcCorf8JA+AqJ/x/ul4Dj2CUXbkZQbWvnV+oxdM9Es/JqEpeSo9
         z22SQeNDx/8s5SyWxanuhrvXZSpfiQU5qOQJSTEE85j64HFZyTKzG3PK3hjc8EzHft0m
         /GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SOzN0qIuQ4D29xhIdWf12Kjo5Z7mTWtixivN9wWN8GM=;
        b=UT4pQPU/hWK41SELxBPUnuIctSd5wrX5H991a5bEN0+BYMU0SMA1g0tttZU1JMAFhr
         M9M3TmJn59rVbuhqZlDbCCISxXv4Cb/gEjJwZ9a6/PbAkpeHgB/56IyWV/hmFBam3cJh
         r1TeDEIXeYHa0lFyumX3XKkJ7hHfVyfzHWNdMzYFa1A0plxK+AdV+kR2ElvZbl+pO9Hk
         e9LH0tgfLorKHexJub/mSrtsGUlHMS1tizMZahAmUFewHGD0c7ynHutOvRIabZrtZ5Ib
         Hf0t+1S+s58utBh0O1cxNehZcey6bi64XfmIjfWriBLNEpwiKHQEj9lm4Yd6LDRHjDpu
         ssjw==
X-Gm-Message-State: AOAM5309JDSnulByuo+qP989j3txq8OLfi3ftNCQ/40T7sy8iygLx1mz
	xjNyQqEyN2SrfODjJ8FtSQ93nYVssLiUwj+M
X-Google-Smtp-Source: ABdhPJyN/+hGh/ht7psWNVpQf/ysZAaUy0fRwKtAwQAlw2qFmhPEi3MS1CPeeLP5AVBsMdZo0qCWXA==
X-Received: by 2002:a17:90a:2d8e:: with SMTP id p14mr17979377pjd.131.1623669328288;
        Mon, 14 Jun 2021 04:15:28 -0700 (PDT)
Return-Path: <rahultaya96@gmail.com>
Received: from localhost.localdomain ([103.93.114.191])
        by smtp.gmail.com with ESMTPSA id d5sm12370879pfd.115.2021.06.14.04.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 04:15:27 -0700 (PDT)
From: "RAHUL taya" <rahultaya96@gmail.com>
X-Google-Original-From: Rahul <Rahultaya96@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	purushottam.choudhary@kpit.com,
	Rahul Taya <Rahultaya96@gmail.com>
Subject: [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237
Date: Mon, 14 Jun 2021 16:45:15 +0530
Message-Id: <20210614111515.21348-1-Rahultaya96@gmail.com>
X-Mailer: git-send-email 2.17.1

As per below reference links this CVE issue seems to be minor and
harmless and as per upstream this is not a real issue in practice.

And as per red hat this issue is marked as low severity.

1. https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
2. https://security-tracker.debian.org/tracker/CVE-2015-5237
3. https://ubuntu.com/security/CVE-2015-5237
4. https://github.com/protocolbuffers/protobuf/issues/760

Signed-off-by: Rahul Taya <Rahultaya96@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
index 4d6c5b255..f845a72a0 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
@@ -88,3 +88,11 @@ LDFLAGS_append_arm = " -latomic"
 LDFLAGS_append_mips = " -latomic"
 LDFLAGS_append_powerpc = " -latomic"
 LDFLAGS_append_mipsel = " -latomic"
+
+# As per below links this issue is minor and harmless and
+# as per upstream this is not a real issue in practice.
+# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
+# https://security-tracker.debian.org/tracker/CVE-2015-5237
+# https://ubuntu.com/security/CVE-2015-5237
+# https://github.com/protocolbuffers/protobuf/issues/760
+CVE_CHECK_WHITELIST += "CVE-2015-5237"
-- 
2.17.1

