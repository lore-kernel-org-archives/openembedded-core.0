Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.9615.1629636690093787022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZhFa2n+D;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso12132340wmc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fzIjG3nDp3gu6fL6EkdjtwFkeUz8M3fLUlg5RYUK9QM=;
        b=ZhFa2n+D1STICde1z/2a4p31PZgwhvjPLgtKINN3h+PQyePyPlTgf3X8+Tuaa55/ub
         4wMkySJ6iNJE2/LhhHF3AbFvdIshC75qwIXxyP+HFne/ZAD/gDnpYCQnU3A23c9l3Vvj
         9TsLCtDbL7bKjvgs65QA77oj/sxAOgScBdcR9Blfq6J9oXMV94/m4sbBsrU38KlW7z4N
         YGH+aLp+NuOgOq9JQoFL2/UrsXdY++vyuXyi+fVzk6bYBzIgsy5yDccEwEKmhF62R8N9
         AjQ1a51Rszq7KI1n7N4Jtlrf/s4/+hKBwN4B7Xe5tq1YckkT4IcvIMywnTDdfFhY+kjw
         LKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fzIjG3nDp3gu6fL6EkdjtwFkeUz8M3fLUlg5RYUK9QM=;
        b=IMQTVtK0xzy+6TVbtpfaC7v4dyt2t+5Q6x1ZIPnSzhdY8fchHevnYTIks0ip+svxa5
         YK9XDAKlSQF0GTbzgeDeHP3VD9z9koKR2/uYxLqYgERv5R/yPi+ZIDMxcMNr81gHTQeo
         wlNvtN8H8IyIf/Y4h7DyXsQazTsJLH5dG8TUkgA8MI/Ta2A9ox4lsoi6YZp3he7bgoR9
         76NAY5hvhCPcPMllJM5sILVmG8aw2c6uWt8T/S5Vr4uS8/Tgu5EIhLYS8XdqFDAtWvTM
         1MKxmVqSNaLNqqE1Al79430ZmGGrR+Msys/9mrK20TtNiAae3a1VBc6FyJyNJXilHdxP
         pmBA==
X-Gm-Message-State: AOAM532Jn5FrkuwUkRlJxEZnety4VmFTLt3uJfmFNuikhjqbQS6hdVX2
	EieC6cnpRZj2LU/Znxot/bv+cUIcroFJKQ==
X-Google-Smtp-Source: ABdhPJz8f1O6ALdewA/Y9ka4Dx85p35sjc4WYy1CpNhEBg3In3n07MQhymq81TSrEtBYynTxGG047w==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr4992658wmd.105.1629636688775;
        Sun, 22 Aug 2021 05:51:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/55] pkgconf: upgrade 1.7.4 -> 1.8.0
Date: Sun, 22 Aug 2021 14:50:34 +0200
Message-Id: <20210822125103.310416-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../pkgconf/{pkgconf_1.7.4.bb => pkgconf_1.8.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.7.4.bb => pkgconf_1.8.0.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.7.4.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.7.4.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
index 04991b1f01..29cf4a6a94 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.7.4.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "d73f32c248a4591139a6b17777c80d4deab6b414ec2b3d21d0a24be348c476ab"
+SRC_URI[sha256sum] = "ef9c7e61822b7cb8356e6e9e1dca58d9556f3200d78acab35e4347e9d4c2bbaf"
 
 inherit autotools
 
-- 
2.31.1

