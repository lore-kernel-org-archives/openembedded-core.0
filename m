Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.6437.1623744780224971651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HSz0g4nA;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id b11so49894609edy.4
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sOdSGVtqnAuPxkAgCju465Z4C5B45eQ9JW0PaGOB0OI=;
        b=HSz0g4nA2/9/LsmqD1ONpNA3I6Fw40CCQcd22q8akx8920fCrXVqSDHdvVEk0uY0v4
         pzIWiv1o8mZVeFMagYzfX9Q4+w/wvNDIlbvhc5yjJ9/07cwZ/2MJPOeE2zs7kq5/RhS6
         pUwBaaWHESPG2O77KbbiRKS6Kwe5H6sdAih/A69whJUbljer5ofgjdEu1heqWDYkTULi
         vA7m09sHqxpcsbilRRvlOqNyXsCQ9yDaUD820jme8imUF6fWU1Gss5zxYzJ6wu2KIoLA
         eg7sIlohQF+vXcHoa0nNKTil2eY4F16+2aWDObV+PhPhpRFN1KoFkRVnoNcWKxR3CM0/
         QWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sOdSGVtqnAuPxkAgCju465Z4C5B45eQ9JW0PaGOB0OI=;
        b=lW88Gk8fCg0mlj0iui9dtOrgz/Tw6+wLG4DkJLX8dWNtrt0V4DFHE1n6aJqQK4qdtM
         qZtFWgBb4q1kUn038F/PM8Y00EAi0Iog+R/iUgb84CM/vpasJrxjKJWCMto9tkCsb8AY
         BJUuGcO0xBcGz3Y4XlJyh6OkAkG67+Ys4cCYop/21cF3iVTespjQTZ0MguzcsVFs+4qo
         fqdbBTsb5r+o0fNFNB9YvhfbsTrHIMAKWhXFjjBLK1iTBKStw8whF+/jL4Ni75ms+XfX
         Mn+h4q+gK+Feniflb8Ne0yhBQxczPCm7CiucIupDYcWbXdYVEvAmKzpKNsVCvv64Hsp/
         R7lg==
X-Gm-Message-State: AOAM530Gm83fPAtX06Z2r/lNQT7hbGaS7/HoSpIBKZTZmDnYbIg5GZmn
	xD6CGXu20tNO0oIetV0lFSbzTI2ZiOISZg==
X-Google-Smtp-Source: ABdhPJwkLyJsUG20rPNljYj9SIWlOqr0joZnOn7oWTnpS80tCVtZMkWRaNjlwUZwhaP/iB/uV0OYzQ==
X-Received: by 2002:a05:6402:1e8b:: with SMTP id f11mr22051936edf.86.1623744778832;
        Tue, 15 Jun 2021 01:12:58 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:58 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/31] libpcap: upgrade 1.10.0 -> 1.10.1
Date: Tue, 15 Jun 2021 10:12:29 +0200
Message-Id: <20210615081240.1734087-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libpcap/{libpcap_1.10.0.bb => libpcap_1.10.1.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.0.bb => libpcap_1.10.1.bb} (92%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
similarity index 92%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
index 967eabcc13..3225b3f100 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
@@ -12,8 +12,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[md5sum] = "8c12dc19dd7e0d02d2bb6596eb5a71c7"
-SRC_URI[sha256sum] = "8d12b42623eeefee872f123bd0dc85d535b00df4d42e865f993c40f7bfc92b1e"
+SRC_URI[sha256sum] = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.31.1

