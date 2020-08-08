Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6714.1596898314798007223
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2020 07:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q9x9o7Dr;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id k13so2559688plk.13
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2020 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lc3vK8N4WGSpWowAn4pMve3VFu0ONL0ZQaFA0Ngexp4=;
        b=Q9x9o7DrNOvAhxwOz984xhoopCoBUMioE19Ij7lZ2Bk7QTgKYmlqaYAN3vmFxGjhbH
         0K6e8IULZe0sMMsbUOPjAihnmyfu4WeXUxeYWtZphnKFVMOHhrFAlb91DwtS8oaWe3vd
         H20Qnjp9aDIn6J18cLHlzs2VWCExBvEREGS4MjZaZZjdf7AZCx27+rEQB+FknJndr07c
         naSA5qfA30BJZ9vW11Ql8JkmBQsVMlfqHSaeR1A0cUYmRE9Q38dHRV77PAeX0oCRGORI
         aHbh3XQygLOZOH2gvMP+pJ7k4J0iN7qbqVVJEsYUqwmWvgaDMv6OEdGp1o8hDXGxRMZX
         UZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lc3vK8N4WGSpWowAn4pMve3VFu0ONL0ZQaFA0Ngexp4=;
        b=M1tpJOKe4ehT36vEfZ6IaBPQIxCPkkHQI4ZVd3bQq6/LZ2XxDqEKFt5MMbHOA2xSp2
         k+3SLCQgU5TyqEyVsFEb8i/WjgMv/bcMxnQiBcJsvI5y6XbaWSOfL22Uxs4w1Q12r2a4
         Xo66lDf6bvLSjV9eBRmjAfVpNTS8oYDrfcEYKpZu7pH78ILcgHmN89grpyeoTe1sIB1V
         ujPQOmZp/07MmF13nSk7slZvmpOvo6huJYX865LMM+rOY+Ke8CJKlmflTAlpE4HtSaFF
         5lcYM5/iLVGhjrfgiyfJYGNSRTug3+KtV158r8qJjoAytPviWZcE7A6AIAeo/yMSgIjv
         y/AQ==
X-Gm-Message-State: AOAM533BC5EizuxEbC+0+QPuizvWu3YgXjODFCzIaW60JB3kg9l9A6qY
	GAOmaAhkAl7rqOxs3aM6b65LyVr5
X-Google-Smtp-Source: ABdhPJwq6cMEJ8bnbVAHtkxA2sTRTcILYJ8Chkf+BPUMWndCItv60E/NuAZy/dUIMxlYu0suqXaXiA==
X-Received: by 2002:a17:90a:2a0d:: with SMTP id i13mr19029192pjd.92.1596898313959;
        Sat, 08 Aug 2020 07:51:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:ddd8:1d38:7eb0:693c])
        by smtp.gmail.com with ESMTPSA id u65sm14582643pjb.22.2020.08.08.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 07:51:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [zeus][PATCH 2/2] pypi.bbclass: use new pypi UPSTREAM_CHECK_URI
Date: Sat,  8 Aug 2020 07:51:50 -0700
Message-Id: <20200808145150.12949-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200808145150.12949-1-akuster808@gmail.com>
References: <20200808145150.12949-1-akuster808@gmail.com>

From: Tim Orling <timothy.t.orling@linux.intel.com>

Upstream https://pypi.python.org/pypi/${PYPI_PACKAGE}/
redirects to https://pypi.org/project/${PYPI_PACKAGE}/

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit e5f3f961242d888f3f786af8f793bf1d247fdff0)
[Yocto # 13990]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index ffa8aa3ff4..87b4c85fc0 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -22,5 +22,5 @@ SECTION = "devel/python"
 SRC_URI += "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
-UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
 UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.17.1

