Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.36666.1612196768640938415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VlsHGu+4;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id n7so19345606oic.11
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+43IqXagrq1kVzebAr0oR19Hklc81odjV++RDBU4eCo=;
        b=VlsHGu+4MZX2ROIoLhrtsWcWjGeiDjnif9AHoV7V8X1rxJhCLHnOeSCPkgOFpvk5s0
         AMcnBiyUfqSQCWd/e2no8L0tBywTomXJNOxGrghQblc+J1hR6niX+1f7RbGz3htRLT6x
         sfujDpBxkwfK0S6iuyZJ6KWpHhc0v5H3L4z0lswsf4u/KQm4LE6Hz1OHLNXl4zZwtDDr
         +66g2Aj4bnli8vg+6sz9hjqUmBVir5ncamgCU7EH+dAHGYYqNPN0y0zrrcDVL4vFuPzh
         KPEX5GPBrw1pOFKbOqWkYmEtjo42p0TOcwlhnAYw7vaDpCpfFIsnRpXdKuVTnNINzT+s
         tEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+43IqXagrq1kVzebAr0oR19Hklc81odjV++RDBU4eCo=;
        b=fLHEuAfCZg1+wxomLnAsyZv/e77nUEQQ1+Y6O9LbF7LbgI4e1osLfq3k7tkX8A0jOY
         0vTI2Qy9sEuJ0/7IxnZU8lzlEq7RIY2TN8M3CGTJ5keRY6AV/moAI/UuI+JjQEMgfWQw
         oTSmuZEdk/YpakluaapD9jCc9z5Q9DjH75v0XLom1UVbE8xgELK+Dth9gtnjE4zm066E
         T3ud1MLQ7Syylk7QO21FaKtUZdAQCVAwIJ7T+yQc/Be8Nac8hVwbRRzWrU8pyo1iDC3n
         VvbPVaU9++itIjPO2Yf9QyuAE2lSkrVzpUn23Lq6yd4yC/YgT57H3IT/wtmcYl0fiMW3
         CnWA==
X-Gm-Message-State: AOAM531Y7Z38wMhcQj0ETdAClwICZhUPsjAAIwBSb5dbV7EuI7tXg68j
	4WIFvnXqId4S6sHH/gPh1DyZwwIpcEQ2hYq+Oj4=
X-Google-Smtp-Source: ABdhPJwe+4ACIGvHOLk46avnGKDw8FmzNI3rAVYZZvFAgl/Zfxr2rd5HqIJLTEzGOzCsvS2OOPflLw==
X-Received: by 2002:a05:6808:101:: with SMTP id b1mr11291749oie.25.1612196767611;
        Mon, 01 Feb 2021 08:26:07 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:07 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/21] toolchain-shar-relocate.sh: Fix handling files with colons
Date: Mon,  1 Feb 2021 06:24:38 -1000
Message-Id: <a4b72056e76f6c9b206cefacaab89a09b32948f6.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Oleksiy Obitotskyy yIEf0zt.mo" <oobitots@cisco.com>

Files could contain colons in name and we should not use
colons (':') as field separator. E.g. perl/python man
pages packages.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50d2ed0689f1aed6f33b4992d37e2e991c99eb07)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 94d288ce05..5433741296 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -55,7 +55,7 @@ fi
 for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
 	$SUDO_EXEC find $replace -type f
 done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
-    awk -F':' '{printf "\"%s\"\n", $1}' | \
+    awk -F': ' '{printf "\"%s\"\n", $1}' | \
     grep -Fv -e "$target_sdk_dir/environment-setup-" \
              -e "$target_sdk_dir/relocate_sdk" \
              -e "$target_sdk_dir/post-relocate-setup" \
-- 
2.25.1

