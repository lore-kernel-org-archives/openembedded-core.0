Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.17651.1590940449786655227
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JtF8xwCm;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id a2so6834362ejb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JGDc78y1RwO+2QtI1mCFmLpT3UL2Ya1i4Hk3ohEiLOo=;
        b=JtF8xwCmD2po6MtKt9UmmnagouIOPn0o//aIoJFNFHcNIFQYixbpiTjhLWEofkUGTf
         i+pRXj0nsXS6a8+yKbhwv1ZVsp4dnA7pwgQccbGJMbXxbvnA7P+Mg2PuYDq+s9iRm/1C
         NKl8ycZNjAdiRPFHL6eDCPw2TEDLP7QQ2gzYK0DCCaXWfKQTOTd6pBb0vs7yv4TbBM9i
         sTwOOT+7fJVPI+OAGWvZHJDjKvtDWOBSzG0ar623ZX5PGf+q9L9WrcmUyS6Ps6Zbk1N7
         /ofu/aEipNt7L6+WvGH2b2HMcZ7MEHYwCHKZqGA+5qatqC5Lu8nk9D86nXpW5WQGjtkG
         dKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JGDc78y1RwO+2QtI1mCFmLpT3UL2Ya1i4Hk3ohEiLOo=;
        b=Wy3em8Pwh6fB5UqF2Cjo/LBFEPQc+wDW9IjKat5dygqHZcM1icoX+dAnYwPJtKVC7l
         WFkBhl8hHAlu16knrMlEVoi/2qa6frQpPhuYZU+iRCeo9YHK2FqTnU9hXAx5iPtDi0EA
         87VYIBQiNrCo5L2iqDstbM9w1XTE2EGxXqH90WaHVJJy5ByCZwRhRM9rw8QVjklmNMIp
         EhHpSNeAtowsCNfiTSxQ0X+bibstgm9CJSevOjbW+wdaAYw+VEhQeEcJatCBhqPrJLK9
         teTyNiePYohWYrGKFm9QY7RR2i5QInrmSz2JwhvFdWlSX0nAHMBx1X0YG9lQQzLmSIC0
         eUmQ==
X-Gm-Message-State: AOAM532RJejuYrIguu/5h7gPqv2csoVM8yggjVHiG8Z9YrlmlHkFgQTU
	f/95jQj2/jJEj3HLGPtII608qFYY
X-Google-Smtp-Source: ABdhPJwiWaVfrh69AIXBAI4/M7E0B+5B5T0viTZ4MWTTOX3WfFcgGFyko4ILz+Toh+lJuUs6rjFtug==
X-Received: by 2002:a17:906:9404:: with SMTP id q4mr15730249ejx.138.1590940448169;
        Sun, 31 May 2020 08:54:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 47/70] babeltrace: correct the git SRC_URI
Date: Sun, 31 May 2020 17:52:31 +0200
Message-Id: <20200531155254.10283-47-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous one seems to be gone.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb | 2 +-
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
index 0791c654f9..7777f9b39b 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
 	   file://run-ptest \
 	   file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
index 4d2492a170..9e5d3a7a97 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5 \
 	   file://run-ptest \
 	  "
 SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
-- 
2.26.2

