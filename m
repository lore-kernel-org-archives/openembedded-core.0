Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.19117.1608974865556326121
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sFsVNyp4;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id j22so8249950eja.13
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D4iWgwagd8VztPdGh1RwCo6Vh6RgNxp2P1s/gyRd0xA=;
        b=sFsVNyp4RIeWhp99L8lkdrKORo+7qMLHYsx5q8/jFBmZPDC+jiRoaSWLKHwwT6nulH
         ReU6AvjzGImN+q5dxF7x3MnuQdmzzOEgalt/jVM23kz6yKoeFsXDEl2Arfg89HmTs8Zo
         SQRcMXVumuRhvZ3PORsV936SDxYQZqkNJZUaZBf9ii/HleniehvX6xmx+QI+p/rp4ZfG
         MxO0eZetB3guwybAo9yHXz61uRBQSAANXAhjaSOkpGJTGai1i+ns7PbDvCjdGZw8ukEK
         bhk/hHEwi8DUfYylTqKMoet6X8K6Un1gVWWbMB1xjY22VdELdj9xorQaWzM/1YS5OMKB
         +I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D4iWgwagd8VztPdGh1RwCo6Vh6RgNxp2P1s/gyRd0xA=;
        b=iuvcseBwqxWgBrAkxcq1q9YFTFNDlZJtiPSniRz49UsXi6f4u+/qdRhcm2i5HFP/r0
         2zluTNYA+QmmlI41h1O/3uRSAcE+MLMdKXhkVeWfDYxNyE9E8rBwclcUAt3I2yVD2WSi
         JzCp3peUh7CQrxHwL8F/QtzDskMUy7iV3X0OdKkF5zSHoHawiSx9I9/u+lNVmkNu9p7T
         SwIB/TdVb7vuIyDfKx1wqexxK8xKYfB+Zzgxc0psE9qdtdBKrIMnhvCXHik8vT9ujIzg
         NGlJdKgHMbTIUb4WXGv6wZaRo8sCxxhWlRUbaKylm+BflyG4qu6pzctXZUSB+b394pNg
         pN5Q==
X-Gm-Message-State: AOAM5324E1C9aAZvz+WZQh0oI0JymYcFRMjIxt4Yum+FUYpjwGUZ/ya4
	ZchkvS72bN9j+Iyw6Szn8Hr9nnZrE+k=
X-Google-Smtp-Source: ABdhPJxPcMFjzQ/S5jwWXq3NNcUKS1VYlS58pbKv/ehM8VVjmJsaNBSpRSpqokISlhCOUJyhRVckVA==
X-Received: by 2002:a17:906:c289:: with SMTP id r9mr33105562ejz.311.1608974864222;
        Sat, 26 Dec 2020 01:27:44 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:43 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/48] acpica: upgrade 20201113 -> 20201217
Date: Sat, 26 Dec 2020 10:26:46 +0100
Message-Id: <20201226092732.52323-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20201113.bb => acpica_20201217.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20201113.bb => acpica_20201217.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20201113.bb b/meta/recipes-extended/acpica/acpica_20201217.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20201113.bb
rename to meta/recipes-extended/acpica/acpica_20201217.bb
index f2d17ca54e..91bcd8a46d 100644
--- a/meta/recipes-extended/acpica/acpica_20201113.bb
+++ b/meta/recipes-extended/acpica/acpica_20201217.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "48c4e0c07b42581d017487cc9264470e6420605ddd24cbb5d16410d02a771461"
+SRC_URI[sha256sum] = "df6bb667c60577c89df5abe3270539c1b9716b69409d1074d6a7fc5c2fea087b"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.29.2

