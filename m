Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.3562.1616143514068915618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gsGeLsJ1;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id l4so8357393ejc.10
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pFPWL7Pyoap44OphJ8MfCCic5muuPa4LHW/gpKiD6rk=;
        b=gsGeLsJ1b8h2wW1J4woIC83XFmgVweObRf5OWy2FZMd9Gx6xuPfRT5mjBIYMFDJBfk
         m6YErcIJVdUbJaLe7b2/iVYoPubFF7Sngl71QvYt7JKGNL0lx9AKMdb28F4OO8Hd3bN8
         +YkT9rK89uMxS2Irp8hvvzDt+Ke6V+VfimEC/UyhI5MyaWn5Jhe3RDuVSKghauwLpCxu
         1Y1qqukPy2Sqg6IcF4aOmgUUwnCimrnFc+x7cDOgFFSUEfoAn3x8hN9gZRkYivSiAJtq
         bPqP5lWmVTIWiZoYYOK5JsE4pxJY7/0V/dK1n/7sRQklA25SM88t53kc913znD7qZnM4
         O1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pFPWL7Pyoap44OphJ8MfCCic5muuPa4LHW/gpKiD6rk=;
        b=ny560R+eehXiGKnPkWuWYcNePGFamxtgvMPP0UmFrZTqnMAU4ddX7uBYCyL2kuRpuq
         K1u8M9ZnB6/vpFicdXiPJ8j6aSBvMlPnAiDEx9vUkku2OslrcPVEFOjiHT21PwbKx1kc
         10POd938xMjySPdDIaAfWoNdNFeNm7f12z5BseD88vTwOGqVewQKaruGZt/HmjTldNkR
         4huCGgKPZqcC3i/KnkUyNsxIRWRqlKrVR8j3CwGfUtBvFTcm5y2y6pcxmo/mcLISak1q
         j3WmaA/8TA4sj8KncfL8hCzxkdLT+3Z24ju7yJSsOc4/AcI1m+qwLEUL1+kPM9Q4z6rD
         TGBQ==
X-Gm-Message-State: AOAM530tq96VQAwtVtsZQDqA3UpVeXLdnxeTu1ihP90Ki/F8x8ycSph9
	LHauVkDLlyTqeKCTyfINa8rs5m0MqMCt0A==
X-Google-Smtp-Source: ABdhPJw+Lh2bSz8y+IsY0BP7hLKKUzkuMhDXR+WtGcKOfGxjVqBLi48GXQ8p6ETQ/vDsCR6mcvb2tw==
X-Received: by 2002:a17:907:76ed:: with SMTP id kg13mr2876130ejc.99.1616143512605;
        Fri, 19 Mar 2021 01:45:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/16] attr: update 2.4.48 -> 2.5.1
Date: Fri, 19 Mar 2021 09:43:53 +0100
Message-Id: <20210319084401.576728-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/attr/attr_2.4.48.bb | 6 ------
 meta/recipes-support/attr/attr_2.5.1.bb  | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-support/attr/attr_2.4.48.bb
 create mode 100644 meta/recipes-support/attr/attr_2.5.1.bb

diff --git a/meta/recipes-support/attr/attr_2.4.48.bb b/meta/recipes-support/attr/attr_2.4.48.bb
deleted file mode 100644
index 530d4e4883..0000000000
--- a/meta/recipes-support/attr/attr_2.4.48.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require attr.inc
-
-SRC_URI[md5sum] = "bc1e5cb5c96d99b24886f1f527d3bb3d"
-SRC_URI[sha256sum] = "5ead72b358ec709ed00bbf7a9eaef1654baad937c001c044fe8b74c57f5324e7"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/attr/attr_2.5.1.bb b/meta/recipes-support/attr/attr_2.5.1.bb
new file mode 100644
index 0000000000..5c5f7bcffb
--- /dev/null
+++ b/meta/recipes-support/attr/attr_2.5.1.bb
@@ -0,0 +1,5 @@
+require attr.inc
+
+SRC_URI[sha256sum] = "bae1c6949b258a0d68001367ce0c741cebdacdd3b62965d17e5eb23cd78adaf8"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

