Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.4102.1588240718905157437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLGs/yZa;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id h4so1134003wmb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bmIENsdxWJd0vTpy/dZttCaA24MHG2cpcyJOhBlppG0=;
        b=hLGs/yZapfwIp30M86JtKDgNYG9au7QqgZOYJUIyWKT+OR0xUOg9QWyieKqUSE1CDQ
         UoCwHw8/aW2WATSYOOBbYwEYLrIVWkKcrjBWuIdye07fZRptLvC6YIl7decvNQBk5C5y
         N2M+/yKLKZKxMSxnTFAMWXy7Xa/gHFGT/s3XyI/ypHF2WOunNLu9Y8uf/fKouFQZhRt+
         +IZO16Av4tYFtwI9tIDcThvfEKiI3E5sGdLBWEtavdFFXjIt+M5fL8BO3gy7uutU6lne
         BocxciXJasKhQjlVjqf/Li8OBUvElIfK/vYTA9uqz5G6QiQKH6SgmBOV5lWsCzNskVxZ
         ipyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bmIENsdxWJd0vTpy/dZttCaA24MHG2cpcyJOhBlppG0=;
        b=aIlyPb+8cnUYUvSkzYcsF6uFtsIBnA3NlY61ejVEUMz60uXFIzmn8MksJ0bL5KDVPQ
         yFaNjCJUB3NXmW01cnbjN7HUxniGkaPyttWpm9W7F6krJWdqT+oqMs1YvLOu8xxpW9NT
         W7bHAnBRdt55b3xtjqrB6Zr8MFT52QyfCrn2xgHFhMvLyB4hv6cjwjixuvLIlFSY64gC
         0nXLjkdboQpUj5NeT7BGDgXVma6xbO6yiKLgjQ0rXnX1eMQFD1M5lHJzookUvHMQYcW7
         MCsXXXJttbtrT6zBpQuH5TQRu5WHtpfz5MsTV83YmsDV1mqVOuZ3sKB7Hmmr9W+3moAm
         V9PA==
X-Gm-Message-State: AGi0PuaQ/kqV1SOD2R3BvbEBLr+0M+JIKdjXxpZPrjz5KmC74kVHZmO8
	wQXnlArbFIp9HeaDlhPjZgkQRfpT
X-Google-Smtp-Source: APiQypLR/nDYM84Ja1ePjqEeq1RS0IYsjHe22lHr69edYRvDvig/gkddh0eG6y35fMr35HRLxlenKQ==
X-Received: by 2002:a1c:148:: with SMTP id 69mr2134407wmb.181.1588240717316;
        Thu, 30 Apr 2020 02:58:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/17] ghostscript: do not hardcode version in SRC_URI
Date: Thu, 30 Apr 2020 11:58:07 +0200
Message-Id: <20200430095815.2824-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.50.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb b/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
index 39c32644db..5e8af8dc11 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
@@ -19,7 +19,11 @@ DEPENDS_class-native = "libpng-native"
 UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs950/${BPN}-${PV}.tar.gz \
+def gs_verdir(v):
+    return "".join(v.split("."))
+
+
+SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://do-not-check-local-libpng-source.patch \
-- 
2.26.1

