Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.2742.1605917665789072122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 16:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sUyZbJZF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id v5so5403991pff.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 16:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=932god6sAIF1zg32MSaSVGsFf6fbAUuaJVOc/FZLs8A=;
        b=sUyZbJZFCxoJQzwewqNEyVTZOPJABf5P+DWCsAoZ+u1/MPIlnkmoXTUHAtHGZtpXfF
         BITbCvrcL/Ps2koJmAQI4d+Pov0iiD7nIoM2DZyDlks0NymVMMARG7CFHhvlbKElsgow
         zMSvGstxafsu/WfzpkpnwqhmPlDyTLzBfwZauw5ZpRaiWSzngGXhT0twgB6suWnL/zQF
         RO2k4EbXFDri5AWC769wPEutXycDuWfyx5PKoT3NOrrWr2camMvS1iJXOluNoINAKYzI
         xv4tLu6DTdE8/v0xAxcnPy+8/XQmXlPDXbu09r87B+LGrCEeJbVng1ee4h+ecwkzElel
         2PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=932god6sAIF1zg32MSaSVGsFf6fbAUuaJVOc/FZLs8A=;
        b=ETpTkxPCps50FjEeIQsyVpFt6/BiG9/wCzwIC9RXMHCGy72aBRsHwzM500HSPav4DT
         3h9Yh3URjKEJNEQi54jU+vCA7wamGBjwHIkXtFYF+jMT4pqHh2efxeiBaja8m68q+KU1
         ppi6FXd5K2X2fp5qhncv9Br6aLKjRCsq2FAf63xvpik9I8lf8Iomsqz/JF/HTpIR98um
         Hl7i+sOSCnc9iuMEnJUsgCY5TQsFWaZYWAmOWZNliYy5wJ0FOCaK58qTaGzSEhGn2lwc
         FqHxLztQeZoDd/pRRuDRqZtY+pRrNr8CMl3wzjMzZgPqxxmnD5P4PWTpk6S6XGs4CD8O
         DXsw==
X-Gm-Message-State: AOAM533SZuegV53CInw0Hy6zN0LxVllMFAhrf2rDgR3CJHhC89rTtDSk
	HBSOn+0ZhbaFNPA2HJzK9Z6LllCHnpNREjaB
X-Google-Smtp-Source: ABdhPJyfAZ6Mgu1+QwQC+nYML49UPriDD+kQft9LOVmxyU2dJ1E0JyI7gbCze3EPW1419nZ+SGNF3g==
X-Received: by 2002:a63:2cc3:: with SMTP id s186mr18539880pgs.230.1605917664995;
        Fri, 20 Nov 2020 16:14:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d10sm5302419pjj.38.2020.11.20.16.14.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 16:14:24 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/5] bison: update to 3.5.4 for CVE-2020-14150
Date: Fri, 20 Nov 2020 14:14:01 -1000
Message-Id: <6e1647fe60004bd4989a65824f0bf02d37f5aeba.1605917505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605917505.git.steve@sakoman.com>
References: <cover.1605917505.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2020-04/msg00000.html

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/bison/{bison_3.5.3.bb => bison_3.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.5.3.bb => bison_3.5.4.bb} (94%)

diff --git a/meta/recipes-devtools/bison/bison_3.5.3.bb b/meta/recipes-devtools/bison/bison_3.5.4.bb
similarity index 94%
rename from meta/recipes-devtools/bison/bison_3.5.3.bb
rename to meta/recipes-devtools/bison/bison_3.5.4.bb
index e6c169e9db..9830721038 100644
--- a/meta/recipes-devtools/bison/bison_3.5.3.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-bison-fix-the-parallel-build.patch \
 "
-SRC_URI[sha256sum] = "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd982a7c4"
+SRC_URI[sha256sum] = "4c17e99881978fa32c05933c5262457fa5b2b611668454f8dc2a695cd6b3720c"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.17.1

