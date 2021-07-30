Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.22040.1627637150620045489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 02:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=focqHKaK;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id j2so12182318edp.11
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 02:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xyp4ATMIbIqPO0VxIneHwcaUOIsgD8Ul8FXGGp1UPL0=;
        b=focqHKaK/Vf7SJd5bXwAzbYD9Fq6DfrMsOO4Id5auu8j+r6mvoN9e8Zogi5phCWKFH
         wkWA0EcJ+49fGzRT6JbGMrO5JnTDyqthv0uZYeZTwWIi8k1SpvKl8zS5SosDdir4oWZr
         YVzM5kvsaryi09Bzpi7WZniqzLS6Fgs5fn/7EzKKnn6WOcCjQhm6zqB6Sol/cmhcOYT2
         E9fBAOScxDn92voMpkkgZ83ULGD2aAD3pkxfb7NLXxR1oh9prDBuDNPgFt2o+Ss8T3D7
         FejWIfdRJN+CoiwoxS+sO5P5QRq+kVSqvH3/FPB/fjPTF6Cu37eg7HcFoBC/2k3E7gIa
         OuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xyp4ATMIbIqPO0VxIneHwcaUOIsgD8Ul8FXGGp1UPL0=;
        b=pkfOJ6xK60V29gRQvPrdm9xdFE5iZetb1206lw+FJerZBMVifwDC3t0AoMsfgzRXAb
         AoRCpK/EdtW+k4jMfLzXo0aIeEGo3HnlcXFQzCKuc1tB5uKR6pbVZDVpxUXrAdoA8vJu
         kO6LScAR+9jIdV1mGEpKJsrjAMBD1364liJxkUWGlIK9FuAgiKjNmCFaYtdey7myQHIW
         +sM/xhLfmhQUnK27vytgRCT6K2i3ytRvzChimXW9ECBrb3HUYYi/UrTUHwl+sjv5AFM6
         if/5/lKaVXL+GreRuWc2f548a6KbB40nis6Z7LSuUllrw39JAYYakYoHALvVYNFBPDm1
         U51A==
X-Gm-Message-State: AOAM532w0NaJ0DNZTX7QvxnN+5U1/DQtrzrGVStmopqD0PaEZtX2Tket
	RItreEgKRBlywjxPUECTOMMkJiPZJmpSiQ==
X-Google-Smtp-Source: ABdhPJyLqZnLf+8URyM3gZcLxwHiyKiQufLuQ9iU0eF4hqhXrk0xVW03J8CYaT1gT2PHG5GT5GMsBw==
X-Received: by 2002:a50:d548:: with SMTP id f8mr1899194edj.357.1627637148974;
        Fri, 30 Jul 2021 02:25:48 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id br3sm358680ejb.103.2021.07.30.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 02:25:48 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] convert-overrides.py: remove base_dep_prepend and autotools_dep_prepend exception
Date: Fri, 30 Jul 2021 11:25:45 +0200
Message-Id: <20210730092545.14678-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730092545.14678-1-Martin.Jansa@gmail.com>
References: <20210730092545.14678-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* the functions were renamed in:
  https://git.openembedded.org/openembedded-core/commit/?id=9d002acae720b0a8e96a6734424a142b86880461

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/contrib/convert-overrides.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 68ae356083..057758f1bb 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -102,12 +102,6 @@ def processfile(fn):
                             skip = True
                             if "ptest_append" in line or "ptest_remove" in line or "ptest_prepend" in line:
                                 skip = False
-                    if "base_dep_prepend" in line and line.startswith("BASEDEPENDS_class"):
-                        line = line.replace("BASEDEPENDS_class", "BASEDEPENDS:class")
-                        skip = True
-                    if "autotools_dep_prepend" in line and line.startswith("DEPENDS_prepend"):
-                        line = line.replace("DEPENDS_prepend", "DEPENDS:prepend")
-                        skip = True
                     for sub in subs:
                         if sub in line:
                             line = line.replace(sub, subs[sub])
-- 
2.30.2

