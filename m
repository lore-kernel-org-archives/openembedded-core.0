Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.21186.1613329971619241123
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 11:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WKEhYx+8;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id i3so5716540oif.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 11:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QlnpjQOeCEBJcNGufhHg6NU2ouPL4BhenL0qgPt6iwk=;
        b=WKEhYx+8de14gF1/FhD/WmdQCLUZbgjRfz5yyYGLJDOIOiyLOdLUDM8CcVuDx1YWpQ
         W3b0CmTgz/gd6Lr7PAvtG8q0EK2x8KEMX5OB9znCjQPK4JEluNWn0H1g922ePFC8cgqm
         kuXueFW+DY4fjJznYneffZBzRoxxkxaamw/XHZwXw9ywRtivQ75cit3AnLoSRXAMbINN
         Q7DFy/YTi8dioyk8EoHS5wTBU3hfZP/Sjbk82wKzZt7gXHsXyK8oMxJb/5RVTO4DAl+e
         TnSKxJWs+LpSDiyqviUIgsBOxc9sh4TjuOBBj5qs67pN2k2Hvozp+B/VCdEmhYmiiQap
         5STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QlnpjQOeCEBJcNGufhHg6NU2ouPL4BhenL0qgPt6iwk=;
        b=fY1TgCXSc1iN0qt/wNS8+SeaaSxg2t9n+ZtB2SgTXLHYf0J3CoqkwbDj/nBhXJHQKu
         OXSeLeSy8t5PllMVsDBSoQqz+hSpeC6Rz2L74IrprBzABHYu0hDUucu2CKx/872a6ziT
         bc7fzVEp4pqM6z39PFzBCG7osLP58HWVFtITWJ7ghXpZH24U7rdTKcN5NkanRSVfYAPM
         XBV+SS4gaQTNmcXLOLBZqW9ZI6jIt3s0+p9sjZVV9zHKlMpJd1qs/9MeqaVHtoRLmoJj
         s2HGuk4Lu+J92cYykfqAbbNw414eAvHh7jGens2Amvwgr8zQrBmYWSuDQOmecBpZXlvW
         8zdg==
X-Gm-Message-State: AOAM5321zveyPD/JA0eS3/ms3MoOCBuFku9unSONcsUX80lVSE2QCnDA
	ZsnK9+SYe0Mam8EIHQOK93LYouQf83Y=
X-Google-Smtp-Source: ABdhPJya1VtjPZmr8OvvSuDSwPM8hID/nMmLwOwBV3JLIJkVuYm42XOV9383E8X/scYlbygnq8ln5A==
X-Received: by 2002:aca:1c17:: with SMTP id c23mr6324235oic.132.1613329970804;
        Sun, 14 Feb 2021 11:12:50 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y8sm2753065oov.18.2021.02.14.11.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 11:12:50 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] oeqa: reproducible: Fix SSTATE_MIRRORS variable
Date: Sun, 14 Feb 2021 13:12:41 -0600
Message-Id: <20210214191241.19878-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SSTATE_MIRRORS variable was misspelled, which allowed the "clean"
test build to pull from the mirror.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index cb4c59ca6f..7bc578a20f 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -258,7 +258,7 @@ class ReproducibleTests(OESelftestTestCase):
             # mirror, forcing a complete build from scratch
             config += textwrap.dedent('''\
                 SSTATE_DIR = "${TMPDIR}/sstate"
-                SSTATE_MIRROR = ""
+                SSTATE_MIRRORS = ""
                 ''')
 
         self.write_config(config)
-- 
2.30.0

