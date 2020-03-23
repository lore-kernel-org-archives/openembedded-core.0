Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.47405.1584944093993240594
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2020 23:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WkU0avIi;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id q3so2473290pff.13
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2020 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AuQCtuY0ReKuTBsf8MsDLzNlvP2Z6C1B+cAgNyAq9R4=;
        b=WkU0avIiNe5tM4t3tVuUbO3Rc2DgaOYlZknrtbFPdNyJKIpSiB3/hUMvgaXH1hNomg
         8p34QkwkzSe/LMSpeu8VO4UCKFH4zwSKePO9MXvIGE0PDDrROJSpAr3rJF2+0Wog+DYY
         BTThgyBb6UXoeYZffbKmiK1fJ1jP8iT0apCLU6Wu21SfeBoRGOulSb3RNBB6gm4YzwZ5
         h4Y25euL8FqSq+rkncW7RaUTZq2yx6xS6XYdeU/us4+KpEucoP4HXGNXdFkknQYvVa95
         axNZfrBuRlq2wKcbG1iIup1YNDTsOsDsY4iqCfVpQPPviIWF4ulv26fc3Cfxgt7Tgrl5
         sJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AuQCtuY0ReKuTBsf8MsDLzNlvP2Z6C1B+cAgNyAq9R4=;
        b=ndYaiXKh/7HmAJgJxHICW+pVZjDzZfRbzZ6cdRH60/U4rCzUExLjqn0kPLSKAyQHUq
         L1nNOMKjxoivn0VeioNXc4uwmTJItz6U5O4lwIiaTOcvoU/XFRjSe4oXVoPPgQ1Be4dx
         9yo69pGBGK+ap6PTFhEO697UnzDDl0KyKtZ/1xV1YoQdikYnloeg3Lks+RrDeD6DxULf
         ZCimRkVAxx4l+CW966bMv25MGV1JUmCMp7aniIq1sWg2UU6o83DiCtxEVjE6N9oL6g7G
         Z3UaW0qaXRp5760eK13FtvrBz4+9BlRSI/JojTThbIdQhQynV0fLizAgOxv9OZdjtGCn
         S81Q==
X-Gm-Message-State: ANhLgQ0e+Jew3S0jdqKrp1UqF/Qb24K0EjmMBciFfX2sopeHmcTPStfC
	elnLHJzA+9wLTBwZ7r4qsI6Znf71f5c=
X-Google-Smtp-Source: ADFU+vvMBZcArwfs7cqGOL5qUhOlgL9QbDYix6dl1cbHG8SAwRd321XeQwIEofeaEeRL/lelOKQaug==
X-Received: by 2002:a63:b04f:: with SMTP id z15mr19839381pgo.58.1584944092921;
        Sun, 22 Mar 2020 23:14:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c406])
        by smtp.gmail.com with ESMTPSA id 6sm12037755pfx.69.2020.03.22.23.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 23:14:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go: Update to 1.14.1 minor release
Date: Sun, 22 Mar 2020 23:15:05 -0700
Message-Id: <20200323061505.267148-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index ac7b95cf03..c52593db6b 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ""
+GO_MINOR = ".1"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,4 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "7c97bdb3b5218a5089612efb3ed30345"
-SRC_URI[main.sha256sum] = "6d643e46ad565058c7a39dac01144172ef9bd476521f42148be59249e4b74389"
+SRC_URI[main.sha256sum] = "2ad2572115b0d1b4cb4c138e6b3a31cee6294cb48af75ee86bec3dca04507676"
-- 
2.25.2

