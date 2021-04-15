Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.4621.1618479283694997636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 02:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f//4KxmR;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so7542022pja.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OgbTtJOyKHa/X9IuhGfXUEQqzPBSoOp6K0VDV1r8R+M=;
        b=f//4KxmRmfNMOKPQLK74/lLGdx993wcdfYAzIFOims1i9vpyBKV984n7s1GUji48ic
         1Rhm0NopcaNITOigM9XFBjvCVEqcKA5fbFWSBK3j7zYbzkmJMJmgbWqv/GNQriFX/P3n
         EsEJysQa0chLg8kfjAuwyqdeAzu6simZ/d3GUIuDZoJzOdT9KHfdaAQ92uxhB+f6zE+t
         G91jT0A+NTaWQ8mOCOYhMTrXHJrbImPhmhJLRXy1P2crFysCKHEZmksa7SeatGxaGoug
         GbMABuTR4SnSkb7/j3FlA8U24DWCnIlLdtwNOy8aiBDR4TZU2HvAB8MJ6jmG5JmW6kcU
         XzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OgbTtJOyKHa/X9IuhGfXUEQqzPBSoOp6K0VDV1r8R+M=;
        b=BS9Ypsp4pJgBNQ2H8tQTjDf1Zl5GCmYpDOjXjbRaAbmAwRrqAw66bFllSTD+UkG0b+
         6qQz/QDAIgq/daXeRt9D8RPRzoYd0nxGLBDpHMfwt2w+4wA7VdxPRXSwXqfzbbmbgYsb
         jO94X3b/WPKgNLPd/GCkPXYYrjftVoXSMi4EPWWLYubDv0vazVxJAuoJ2tsYaYAbDdqR
         Z65w1+kf8kiYWZ/odFap87/eFXwPkHkQe1ufi0iqh2uq6gjl0vR6cs5dx255G3roLrSi
         hIvjwuTxa/OM3eK57Gc5XuG7bRg12paKhRKlOdgMIzrKlpgoWD2yZ7Imf5XhjK0j4ByY
         FryA==
X-Gm-Message-State: AOAM532gss7mYTw7+q6gZnQwmgkIIy8sKvfgmyWAv9mOHOfdZcAfbFCo
	g4au2wp7fgAxJ9lpLJl1RpisBu/ZKmNRseUU
X-Google-Smtp-Source: ABdhPJznyPHWzfiaP59mKDpHriOMN+F169XItabCuFScEvRvvG1891w/VSLWECeLIuDtsj0bYlYxaQ==
X-Received: by 2002:a17:902:8ec1:b029:e9:998d:91f3 with SMTP id x1-20020a1709028ec1b02900e9998d91f3mr2861244plo.59.1618479283040;
        Thu, 15 Apr 2021 02:34:43 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id ms9sm1994851pjb.32.2021.04.15.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:34:42 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH 5/8] There are some error messages like, "error: linker `cc` not found" got fixed by adding "cc" in hosttools.
Date: Thu, 15 Apr 2021 02:32:24 -0700
Message-Id: <20210415093227.175608-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415093227.175608-1-vinay.m.engg@gmail.com>
References: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
 <20210415093227.175608-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3438be92b7..83e1b68071 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -483,7 +483,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
-    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
+    fgrep file find flock g++ gawk gcc cc getconf getopt git grep gunzip gzip \
     head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
-- 
2.17.1

