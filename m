Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web12.9981.1614349581331457974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xQWIyTmB;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.169, mailfrom: steve@sakoman.com)
Received: by mail-il1-f169.google.com with SMTP id i18so8105162ilq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hBN+PIhFyyYtW0YThuRfbzcsxkoqkCB/eCTcJ6VE/rI=;
        b=xQWIyTmBhbrJAYS9PISGJJjPRY/IA3on3Ckqi3T5YY+QgDlxwssP6sGxrIl1Suk47X
         jfR0ZuWlseMVQNxA2KV8u9ZnJsR9fPmOCc37mZ/+AjDZzDXbl/kZhU4pBz9CdSVsBjk0
         UFAo+XsTxhkBUroa64ArQglt/rWOrSAv6Y0Qs3xPY5y6apE2/8U6w555k+rY6J80vWEV
         Il16pV6vM6Ipc846lXuvujZVE+HaWtgb+OgJbmuosqQDGEx1IgBctv/SwRj28ibu1utl
         YZIsFrQQKwTYWSyTY56F/GJn3AZoFiJHnn4vVkM9i2oftwBljTC7KuZB3k9UoaiJKNmF
         uFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hBN+PIhFyyYtW0YThuRfbzcsxkoqkCB/eCTcJ6VE/rI=;
        b=GIjAcLqnlP9a52imvpN6hOz3eokGxJqfadDF5qb389Aqs8HpX1FvFcO+tigycBl/vb
         fv04seXdpmM0WWu3oAxVs0Xc9+AyEsZn+f/rPboQXFUnQy14CJ1KHKeOAhGLhq+hVD90
         3FxIOlkTKR/H2Mebf8GRGaN/sEJlSZOOG6C8JoCDJlvRE7gDFJpgKafcpwZYnAXKgyJq
         XFx8fHwMoeutOo/3mp7BsDnGoYAbOxznBTItNMHw+TL/LtahTSZD5LbQRyUwy76q2Zhb
         Ue2szxni2C3jIiBGz+bqLisyLdBwS9spO0j3/tWMRihFsi6eHyjMbV9uzHju/nh4P/Te
         pAMQ==
X-Gm-Message-State: AOAM531+Ts/tKkUrKXoVzRjnvZk6bJWlfk3XUGaR3FFK7gGZkLRTELJX
	v58hxGlRqw9oeM7FwLIErYzld6mCGUocB5FI
X-Google-Smtp-Source: ABdhPJzthymNvdhY0tnI6xgQToQ9FtAnbCr8jqoPCJ6RP6/9PExfQq20v6pkyirvvG6lMNrumoW1wg==
X-Received: by 2002:a05:6e02:1a8e:: with SMTP id k14mr2671385ilv.308.1614349580232;
        Fri, 26 Feb 2021 06:26:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/40] oeqa: reproducible: Fix SSTATE_MIRRORS variable
Date: Fri, 26 Feb 2021 04:23:59 -1000
Message-Id: <fff6759b3606157adb6a285e5746a8835743897d.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

The SSTATE_MIRRORS variable was misspelled, which allowed the "clean"
test build to pull from the mirror.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e42497bd84d0bb370a9f7b0448bff29f01fd1b0c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 5d3959be77..d01a2665c2 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -158,7 +158,7 @@ class ReproducibleTests(OESelftestTestCase):
             # mirror, forcing a complete build from scratch
             config += textwrap.dedent('''\
                 SSTATE_DIR = "${TMPDIR}/sstate"
-                SSTATE_MIRROR = ""
+                SSTATE_MIRRORS = ""
                 ''')
 
         self.write_config(config)
-- 
2.25.1

