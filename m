Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.10930.1625238836101059764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 08:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=clO7T6qf;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id z3so9661835qkl.4
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iOc1kdr/LeiIHXhU2C72M7VM82WUqS9KFn1DqOoobFE=;
        b=clO7T6qfY7ZIS7TkFGtwTgvSkVuP9WeqWQLLbZtwz/ZFaK9SKiVVVEExa1fqpPXpEj
         eUIE35P58GJk8H9jhgIBHP1KPzuCANK/Xn9Vrsndm12haeVH+Wjbreqt5ogVPpCfoxw0
         cFy9wU92KQSoZr95M/L91Y9ycJgPmqNxX4639oMgSXFWSH4Up/g2a+w2wjdJxevvSZ/h
         UGrQ/KYufZqr0Eh7P7yGq2kTJuTwfcSCo/Ujw7vMeHqeVG8gQoAjT11STfZgK2L2pTF7
         P26JjX4yotsig2eVZAEyJdyIXup4iXbghlA5kuj24gjiKlCDIi/TwidFuP4SQZNXpWep
         kWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iOc1kdr/LeiIHXhU2C72M7VM82WUqS9KFn1DqOoobFE=;
        b=aQy6ug7eYytwGsEtAIhyn+mItTBPHHr8bddjmM3Ra02fE2emSjGkvm1OIN6JHwd/GF
         PNcYSPa7QTrMI2U6xsRIDFKfDhjVpQSk+136Z6Ey3zjjDZYLvkA93aaP6LNH3ZpqqHKJ
         SiP4eOgncDte+ZuB4jHgBhY7eZybD0e1LimsSdFxWnmeAyd0yVbt8YfxzLkYu86j2TSt
         B1RK+Zc0zIgftbvFf1q1VKpeGGFwwOBJIiD3ItjmHEx2SMZa65TT4ddnnsIP5g/Jhpi5
         GvUmc7YbLJw1+nzE7jWCM7NdrKz6zC2/lpwjkyOaweJmbpRSwMkoS4EYZwR+XNTlhi1y
         dUPQ==
X-Gm-Message-State: AOAM530L9bNgrEVUPDsHIFob6VlqFUZev7RcTssjfdvDXwjctj/qgYjO
	51kg+00H9NHtXAzxuZZ3alos8+t22jXKAxF1
X-Google-Smtp-Source: ABdhPJyo0ocNm8FuJG3XhJQJ5IatOaajz6bQSAYv8X9W9mr47lDl3fqeEB313FgSk5+IHvVlcSuiqA==
X-Received: by 2002:a05:620a:4045:: with SMTP id i5mr326374qko.310.1625238835213;
        Fri, 02 Jul 2021 08:13:55 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id o200sm1466800qke.105.2021.07.02.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:13:54 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-libc-headers: update to 5.13
Date: Fri,  2 Jul 2021 11:13:44 -0400
Message-Id: <781bf3c1a48245f2a1cfc4ba66bf085c348fa9ae.1625238537.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1625238537.git.bruce.ashfield@gmail.com>
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the libc-headers to match the latest OE core reference
kernel.

We refresh one of the musl patches to udpate to the 5.12+ context of
the header, but otherwise everything is unchanged.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc          |  2 +-
 ...3-remove-inclusion-of-sysinfo.h-in-kernel.h.patch | 12 ++++++------
 ...bc-headers_5.10.bb => linux-libc-headers_5.13.bb} |  5 ++---
 3 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.10.bb => linux-libc-headers_5.13.bb} (80%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c6e5ac61d7..68e5d848ba 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.36%"
 GDBVERSION ?= "10.%"
 GLIBCVERSION ?= "2.33"
-LINUXLIBCVERSION ?= "5.10%"
+LINUXLIBCVERSION ?= "5.13%"
 QEMUVERSION ?= "6.0%"
 GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
index b5c4e1750e..b0e7014138 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
@@ -13,17 +13,17 @@ Upstream-Status: Submitted
  include/uapi/linux/kernel.h | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: linux-4.8-rc4/include/uapi/linux/kernel.h
+Index: linux-5.12.11/include/uapi/linux/kernel.h
 ===================================================================
---- linux-4.8-rc4.orig/include/uapi/linux/kernel.h
-+++ linux-4.8-rc4/include/uapi/linux/kernel.h
-@@ -1,7 +1,9 @@
+--- linux-5.12.11.orig/include/uapi/linux/kernel.h
++++ linux-5.12.11/include/uapi/linux/kernel.h
+@@ -2,7 +2,9 @@
  #ifndef _UAPI_LINUX_KERNEL_H
  #define _UAPI_LINUX_KERNEL_H
  
 +#ifdef __GLIBC__
  #include <linux/sysinfo.h>
+ #include <linux/const.h>
 +#endif
  
- /*
-  * 'kernel.h' contains some often-used function prototypes etc
+ #endif /* _UAPI_LINUX_KERNEL_H */
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
similarity index 80%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
index d6a4d5aa61..251d00440d 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
@@ -14,6 +14,5 @@ SRC_URI_append = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[md5sum] = "753adc474bf799d569dec4f165ed92c3"
-SRC_URI[sha256sum] = "dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43"
-
+SRC_URI[md5sum] = "76c60fb304510a7bbd9c838790bc5fe4"
+SRC_URI[sha256sum] = "3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9"
-- 
2.19.1

