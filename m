Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web10.927.1587585471557464190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 12:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@northern.tech header.s=google header.b=S7tCzxa1;
 spf=pass (domain: northern.tech, ip: 209.85.222.65, mailfrom: drew.moseley@northern.tech)
Received: by mail-ua1-f65.google.com with SMTP id t8so3180223uap.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northern.tech; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RvpWm2GwsvJ3ROtyl2ow/X3fgOXhCuG0mUbnrI3jg/Q=;
        b=S7tCzxa1qLH7W+xm2UeMdO+D3TIfEck/hS0GDGT7ruWOQlsrY4M2xpGJ5GgmAR65ms
         sMNLq+nfKfSGabgpu5L20EmxB/9d4sHpAmpAbvo5UYDFMzlS4/AF4R6sE2UVC7YE7ysg
         wKFbA833rXJCRZDgxjAlelaf7U8BTawv2vafbsCLcrcdUOcJVmys6BXf+Jve1+1yMRrf
         U3dRHHe2cFu+KXLm5uDaVsdUipM0Tm2edCrCDRosh+ZyZbinfwPuQE6SEXV8mbFlHs2d
         oYBy8BO252oXAewYINVkVylEs2woORYQPiUyG7FCV36lwzrP22H0F16sR8B3Ysz1v/F1
         Meog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RvpWm2GwsvJ3ROtyl2ow/X3fgOXhCuG0mUbnrI3jg/Q=;
        b=pA0y6BVYxHMa7zYl2noxoCAnpiq3PwEGBF2QqdMI+IEI92oVsZ9zrmP7XFZU++3kav
         FrcyUAriI6DOd2ajjpbIx41h2t/omMRawq+y30vY3342RL/p2bGxwsvRPLIEs/yhxZR5
         qQvVsQQAeoxfPaIV+J1Jx1hGIUAkESI4ErKpNDZcX7rWj7O0mO+cJYof2TNUcybQeCko
         hIwLCoCtdh0qrhO5ByhHCagI4FG39HXXIHFh8ywM9dwVMgMmgiddZnN5Nw8eFzF2IijU
         2IYeIuddDW3pFPq7GlWFz6/jqhqGfMLQtfC9s0qWkkxju9/OAEeb1+jbsMlkKbGRHrlI
         XA8Q==
X-Gm-Message-State: AGi0PuYhaWuV/9E1QrPNinYddPDkuW4WkLKlbJT0/RsAsMfLiQ8pYKnw
	Ik82KCql9Rv/PMCUqbhI1uMXK70FKJ0=
X-Google-Smtp-Source: APiQypIefS0rjzqY95XCEeJc9IfntloAuZN+DwEnsCtpFL8MBcMdN/9/e939qfdQ6Ze1F30on+8vTg==
X-Received: by 2002:a67:3343:: with SMTP id z64mr489553vsz.108.1587585470078;
        Wed, 22 Apr 2020 12:57:50 -0700 (PDT)
Return-Path: <drew.moseley@northern.tech>
Received: from dmoseley-build.c.developers-build-hub.internal (189.109.211.35.bc.googleusercontent.com. [35.211.109.189])
        by smtp.googlemail.com with ESMTPSA id q21sm90734uam.7.2020.04.22.12.57.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 12:57:49 -0700 (PDT)
From: "Drew Moseley" <drew.moseley@northern.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: Add missing dependency for tie-hash on carp.
Date: Wed, 22 Apr 2020 19:56:57 +0000
Message-Id: <20200422195657.1634-1-drew.moseley@northern.tech>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Drew Moseley <drew.moseley@northern.tech>

Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
---
 meta/recipes-devtools/perl/files/perl-rdepends.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/files/perl-rdepends.txt b/meta/recipes-devtools/perl/files/perl-rdepends.txt
index 331a44d308..9ecfce0011 100644
--- a/meta/recipes-devtools/perl/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl/files/perl-rdepends.txt
@@ -2218,6 +2218,7 @@ RDEPENDS_perl-module-tie-handle += "perl-module-warnings-register"
 RDEPENDS_perl-module-tie-hash-namedcapture += "perl-module-strict"
 RDEPENDS_perl-module-tie-hash-namedcapture += "perl-module-xsloader"
 RDEPENDS_perl-module-tie-hash += "perl-module-warnings-register"
+RDEPENDS_perl-module-tie-hash += "perl-module-carp"
 RDEPENDS_perl-module-tie-memoize += "perl-module-strict"
 RDEPENDS_perl-module-tie-memoize += "perl-module-tie-hash"
 RDEPENDS_perl-module-tie-refhash += "perl-module-config"
-- 
2.25.0

