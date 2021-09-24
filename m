Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.8943.1632493003928261719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qfsFmQLC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id a7so6590288plm.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MgXnVobzta+wOeURUUiEmUtdPU3BTBWoSIbrdeUBtZ4=;
        b=qfsFmQLCnd7THmaalGTR+DZysyLxgUCgpkkkd4t2slDrd5q6qXTv03lDE1vsm2iJD1
         aXEYzMR1hXatiKrl2AfMXY8g9+z8xBaqXAp/mYNvSA3b19tx03AN7/W+koIcxB7ZtgBB
         frLZN+xJDgmVXc9j1XgKL8vAUeaDFnGg8+9OeYfn4QdbkAUxQMcs/5B/qZA/B4HdKBps
         BWkgHuHJd7+BGZHOS32OzYwp1cmejfABQAawm4DAtFWCwmKx5FvnneMRfxUr1vyq522Z
         o9zcvdy2xu5BBcDbMmaq45hIu4EZ5GJv+Qm9DUUsef/dZWoJz9RimoolLhTReLYsH0p7
         hwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MgXnVobzta+wOeURUUiEmUtdPU3BTBWoSIbrdeUBtZ4=;
        b=E1IJXhebrBE//foG8Q0sdk53v6VKOtcswKH84E1XbabmYcGg5XecJYZ6mbtP2mxAAV
         DwBZ7Bpo9d0KgND7DOIdQiJ8sgcyGQSscSneXcRfot9QUeAjD0K0uW1vej5edFeuuzsM
         R3awPpP+gfpoprCtN6ATl2ggs/BrIfBhyN51Ou4pskOoX3L28K9OyXEYyU5g8Rkiyoy9
         6HWX5uCBMq6WBKcoVcZFcKJYnqm/bCtglSBWddAlNvwKqo3beJamXD7/+fTd6MLb5Fjj
         B0UZjcY5UIt/Z9wiSfnKL9l2yVoPstGw6jb6kq0Jn/+sWbjw0N63Vq6xjPs5A8NwxFJ7
         FYqw==
X-Gm-Message-State: AOAM530MYeTCjlJUmNaiAugq92HM34Tm/1tHHV+b2gUe7FG1LJdVKBwy
	avO3ebTlZI528ftjLORI3WoDpiBDZmRe0PgqtI0=
X-Google-Smtp-Source: ABdhPJyi1ASjtwEEhRfPfwdjSv28OmSZ6lQO1SM768ZpNwFy6hcK0dwY+186bkMy2bgDofF6f6DPCg==
X-Received: by 2002:a17:90b:2015:: with SMTP id hs21mr2558855pjb.200.1632493002993;
        Fri, 24 Sep 2021 07:16:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/25] Update mailing list address
Date: Fri, 24 Sep 2021 04:15:24 -1000
Message-Id: <19fcf367c54e79a9a0553a01a850ae337f99eacb.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jon Mason <jdmason@kudzu.us>

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 83169c33f7585da25560784f79eaad2c6f029f3c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc                      | 2 +-
 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ef1e7fe2f4..895cf89487 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -4,7 +4,7 @@
 #
 # Please submit any patches against recipes in meta to the
 # OE-Core mail list (openembedded-core@lists.openembedded.org)
-# For recipes in meta-yocto please use the Poky list (poky@yoctoproject.org)
+# For recipes in meta-yocto please use the Poky list (poky@lists.yoctoproject.org)
 #
 # If you have problems with or questions about a particular recipe, feel
 # free to contact the maintainer directly (cc:ing the appropriate mailing list
diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch
index 52986e61c7..d1835c7a10 100644
--- a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch
+++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch
@@ -400,7 +400,7 @@ Index: ldconfig-native-2.12.1/ldconfig.c
    return 0;
  }
  
-+#define REPORT_BUGS_TO "mailing list : poky@yoctoproject.org"
++#define REPORT_BUGS_TO "mailing list : poky@lists.yoctoproject.org"
  /* Print bug-reporting information in the help message.  */
  static char *
  more_help (int key, const char *text, void *input)
-- 
2.25.1

