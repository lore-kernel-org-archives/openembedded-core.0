Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web09.12699.1604495758170049784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 05:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=JRwhixAv;
 spf=pass (domain: nathanrossi.com, ip: 209.85.210.195, mailfrom: nathan@nathanrossi.com)
Received: by mail-pf1-f195.google.com with SMTP id e7so17221877pfn.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 05:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=hqRFbA/UmZ/ry+aaW1CYlCI3KZcqk6xFpzsBLUvuKdo=;
        b=JRwhixAvsue5n/JFSTSXZ/9j/td5zs8ROlziEMSn0SUVZD3iw1H71gQmu11kbRAFnt
         UrsV+jI8DIiQTMPtvFH7Zl5w5NC8Wq4oY1hw9QClHivP7bLgoShzCiNbfCCXD59tck0H
         G2S9iNBADS3eKEzVgTgtC2hviMmAeNI2rjxS3wbJMLeonmyF5AzQCDmGw/UDKTu6FlkC
         soT3bAQKE32Ts/sSOlJi7E9BjOosPGhyBdGC7ntMMg4HkVevZa6SRg8YKdHiHpaOsOX5
         2u/+K5A4ktOv14cCOkNYZI/Irn8McqZTFuMcPAPIYuiL/J8hUjy0+x2wZd6FUAslHYHF
         eddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=hqRFbA/UmZ/ry+aaW1CYlCI3KZcqk6xFpzsBLUvuKdo=;
        b=YLNqZMaK0mv8yTqZNOuaHzo3VsdHmHNq6EZWDCbgW+AkFH7nJ8182J97J/8Yyom2ZD
         KCjqUNm15bTsI4kk6wi/y5pCoq7mnxiv1e4djRKQ84P/8O7x8n0l84yHjJmWFefxm5hz
         dBR5pzlOUDOosiXEQoUHFYxdnaLdddvDZYFjWfTqqczO446kiFu7/dkli7YeKqYGd+ez
         Mm3nevC7FgJ0scVNt0/+K4jmYhqfKfj2t8h+8/K8Hqou4+iCRKpRAzQpEvDPedfarYtw
         eq+vpqKMyAKZignoaydorwwE9ojdF3o+g3+BWSQgh/mLwY+oIgAPkWwc3dxWgAuEQqKL
         61lQ==
X-Gm-Message-State: AOAM532xx7lnZzh//vJ/zrZUsj2VrVJt6T7h+No7uc4uw0rgTyzbYf3k
	JhjMJLZAH6kWFRefkOWPsFQi7ImIU2KT+bq0
X-Google-Smtp-Source: ABdhPJyxOX7nJMn+TCG/hy0fPdk8A5cAMopiXDl98WzLp34uhslIFeUncZ7itoabWlX7qbdtIadriw==
X-Received: by 2002:a63:be43:: with SMTP id g3mr21540459pgo.266.1604495757455;
        Wed, 04 Nov 2020 05:15:57 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id g3sm2430294pgl.55.2020.11.04.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 05:15:56 -0800 (PST)
Date: Wed, 04 Nov 2020 13:15:46 +0000
Message-Id: <20201104131546.397426-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] diffstat: add native and nativesdk to BBCLASSEXTEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.63.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.63.bb b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
index ee0a7e7bd6..6c5168f43b 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.63.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
@@ -27,3 +27,5 @@ LDFLAGS += "${TOOLCHAIN_OPTIONS}"
 do_install_ptest() {
 	cp -r ${S}/testing ${D}${PTEST_PATH}
 }
+
+BBCLASSEXTEND += "native nativesdk"
---
2.28.0
