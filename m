Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36498C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 10:23:24 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16376.1784888595301070797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 03:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nK0VWCnD;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e7109321dso133721a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784888595; x=1785493395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJd9pVcoSIzVt8OqEISnUf4+LMqijNnbkNCptABVFGs=;
        b=nK0VWCnDGEWkBZwC/njfQWbu6zYNxL5Ye1OzVZhbnC3OiAd3e/+4FV2H7mozPmCpNk
         qOYcXf5Q72WLLg9LhCXW7PNSwM5rZYLUatB5cexdjhHBqAezMlpG8veZ++gE+EXAp0ew
         uTSU+qWxqJjWVqREmrYwdqwYZQt4HnKw3wV61lUKn9MdjOeXssv7hxaR1vXr/1D+js5i
         JzJe/OppLTNuqfKyNBr4x/Am+FTEUPZKX7fIAK8IQax72i2g4ggD/TqlRj79dTgOkHFf
         /NydlAWsayWYLuH+d/d+E1j+DpbfGYZZOMfPLL5rwRJk4MksXbH01V3CgUztTefEXFPX
         tQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888595; x=1785493395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJd9pVcoSIzVt8OqEISnUf4+LMqijNnbkNCptABVFGs=;
        b=U+dLTSmcsiq8wP9J3YjNX9b42yViR3GKmN2J69rqXCwjWknrLMs4WWK0QT/iq9/Z7s
         nelWAe+fvJ4piWdQTJebNdiSu0XUJWMFQV+vosYG6A52YmtH+uujP0r4be0i7bmEhPOX
         oDHavEwMRBsg1JfslrGc8Ftxi1tothqEKXL7lSmc9ygwrVi0vMpubRSeclDo2ZK8VNQ7
         CT76BqzmXGyLZ2vefgdHRcjE8Aozf09CwrOtU6j743DOXIsuLCgSYNzDdUGQbWDIvr8V
         eewiR86qH6aUD9a/Xw0FfS2b5tH3uG/Fzx0moELIKH0GsYBlJqp153wR0kiFDO8hycPR
         //AQ==
X-Gm-Message-State: AOJu0YxxWiETFPJENKDWOwpYJCilBvIwVJdJdDSWN/yrhIYMaiiqr0Kz
	Ll80gnXOViEHBwGjH83q7oTvyjXqtJC1VTloUdsrk+iEb//O79uZimMWk5fKtg==
X-Gm-Gg: AR+sD11JALGHOq/2HEIUz5BbIf5zBf/KNivyY+nCQOQ3LZueaAdiom6Wb9wHCY3y77x
	rbA4oxIP/+Jr0tAQ0TbsqUCu+w1RXkeP+Tda2Wcvh71iUXFJ8F12kqo3Qh3SJuF+VZ8iFwHhLry
	qdnrpc761eLA+Ok5Ohskypft406imz9pNjINNaEfYANvPnyZly1xD23MNMCPtqR3vVvWEw61uzW
	mOXHpXxjgYjh+flZaCuC64Jidot05O6YmSa4Dej2tRnQ5Rs4o4AByxSc3Qb3mYgi5PfgeO4wQPl
	AgmWcurRWnnDv33LUHC8y2UICXzXRMr08rFIDYIvYbb8xPdf/CACSkd/RhUhR9SApDdPVRLAFs3
	G/C2hu9IXhgKfa6xmjwXcF9G8Qli7EZUiQUll+kSy3HH79iGgNkOyY+q4vk5f7a/0Tl5aGqarNM
	+bg/fyuCmdHzbOyTG0wg==
X-Received: by 2002:a17:90b:2ccb:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38ec6617ddemr6972139a91.28.1784888594583;
        Fri, 24 Jul 2026 03:23:14 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:14d6:1b7:ca60:af92])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13002f39sm25174459c88.1.2026.07.24.03.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:23:13 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [wrynose][PATCH] package.bbclass: fix execution order bug in emit_pkgdata
Date: Fri, 24 Jul 2026 15:52:44 +0530
Message-ID: <20260724102244.2712719-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 10:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241926

emit_pkgdata was previously part of the PACKAGEFUNCS list.
Because other layers and recipes often append custom cleanup or processing
functions to PACKAGEFUNCS , those ended up running after
emit_pkgdata

To fix this, pull emit_pkgdata out of PACKAGEFUNCS and call it explicitly
at the very end of do_package() ensuring it always runs last.

(From OE-Core rev aa85baff9ebdd3f932811c3b43d1918c38373cb9)

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/classes-global/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 67148fc1ac..0d1be442c1 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -472,8 +472,7 @@ PACKAGEFUNCS += " \
                 package_do_shlibs \
                 package_do_pkgconfig \
                 read_shlibdeps \
-                package_depchains \
-                emit_pkgdata"
+                package_depchains"
 
 python do_package () {
     # Change the following version to cause sstate to invalidate the package
@@ -564,9 +563,13 @@ python do_package () {
             for file in files:
                 pkgfiles[pkg].append(walkroot + os.sep + file)
 
+
+    # We want emit_pkgdata to run last, after everything
     for f in (d.getVar('PACKAGEFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
+    bb.build.exec_func("emit_pkgdata", d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.43.0


