Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.15914.1603122184387790408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 08:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KwELheeL;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id qp15so14564118ejb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ghz9NWqyXflU9PdfE7+yoTrgzw47CIDE8AwAXz/5aeY=;
        b=KwELheeLu2EYbU6qtqYBElZGySlyuj3nYfqkpWsCNvQj5tnO65eg30BTa2M/GV5pV4
         b3RPonaFj/SR5tW2BK49PYF2lUBE+f1KNzlvwZC6eRDYJg6ygYGWr8/v8yybAZ2vZuZp
         BPW0Nz0XXd2qd7USHcEIAiizSW8fiJ/x9+MZwp1YnLqWMoyGdkEHZxQZi159/iThjNY2
         x67HRIPa/sYZSHiH/eN/tbJbYVff0GGRb9Jk1NLPkHjVtlRpeiWHC6c9BqABIjiX5k/8
         lNKd1cmGsG74aLcyHteZLxRiLPSAKcHQuBGuER4RvmkQQE4hPdCQ7dVsCOIDM4MxUSB4
         Qaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ghz9NWqyXflU9PdfE7+yoTrgzw47CIDE8AwAXz/5aeY=;
        b=kW/hLffsRNf+SPUM4lHNjVu6Z07XS3Sg3MZhumvnze7YV7SVcnMwaK73OH8/hR6T8v
         uJz8C+bGH3hiCe+dDR9jd52cCb3L//xiZdC2CcWvAVwxh5KD7U3oeqFZOWSCI9qgygGF
         WBz+UCzwgn8Zlki5bJ6/iQ4mXNbgtRKrpoLt6BW7CMYekExxX9MerLp0WTSGrS2IVSjZ
         2N5XCoXE4bmPV+pgCUpBOT8CVHneSB0SszFdXXt7RZAO5oMrZ3wlskMZz/I/TC2CfLHT
         dQ68tvyIflx4Z7vZqsAmPmvvM5UnAheSwjmZLhnMJWZiO7W8JgIMgLCSbxvG67hoI+iU
         GiiA==
X-Gm-Message-State: AOAM532+vC553Lp76f+Konx+wWdJfnz9l3mPrDnyxdqSX/sux4cKa6dr
	lAXa64tOpvgkhM5sO4XQQwOOWFNfFWk=
X-Google-Smtp-Source: ABdhPJxRFphehPPAjdzB8wd/SUMYA0T2DydOdpdLAJCM/vd3+gv9rpzYE5Yui3JHX3608ECJF1+Qpg==
X-Received: by 2002:a17:907:720f:: with SMTP id dr15mr441841ejc.447.1603122182606;
        Mon, 19 Oct 2020 08:43:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id o11sm497754ejd.60.2020.10.19.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 08:43:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/4] ncurses: only include upstream releases in version check
Date: Mon, 19 Oct 2020 17:42:53 +0200
Message-Id: <20201019154256.9519-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ncurses/ncurses_6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index 5c02db8541..f3c84c2877 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -7,7 +7,7 @@ SRC_URI += "file://0001-tic-hang.patch \
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 # This is needed when using patchlevel versions like 6.1+20181013
 #CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.28.0

