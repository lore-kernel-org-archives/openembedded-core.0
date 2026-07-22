Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2CCC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:11:53 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46626.1784722309341620316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N0XOnyEU;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848743155bcso3540099b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784722309; x=1785327109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IDnPR+0Jy35jDA2sbKV9xw5TX0QRR3NOjsGYIUFsSIQ=;
        b=N0XOnyEU+skKMSf0NYwsNoozOkUgbWxGWln/OqzPi/YSdJHaaTeFqhzfjBbdaJ5oPM
         trWU1binoJNpVPrPN1C1wMXlmk5o0qNy7jFsvsttV1MCmMYUdg+abNbz7VtDvhHxLT+V
         Ndr7AamHsaC/fxW5Nj9jfVFWN/5jkfarmWS7Rwxd+IGPVMgw0fgk90lElK3IhgcrgQY9
         /8+CXpC7srMSJFxRF2EslcodBepuQJGDi7mO6qMCSYcUH4wFZturdFDzF+E6TQF5i1UE
         sP+NONeD/scLr6t5nUcZdbDqRq7/zzbK4OHvGOw2Y7kN/I2c7TmEly6m5GuKL5Y3KI2g
         MNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722309; x=1785327109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDnPR+0Jy35jDA2sbKV9xw5TX0QRR3NOjsGYIUFsSIQ=;
        b=JWixAZQLaZWf5lCzz7C+llJmVKsrbsdN5J1rtOKhej2zYm6kkPmuPOausImQ9p7XGj
         aFZ7Cc1oNrA//j2MZ8919SRgdSRw+k3ySE+8WF8VqpfZa6L6+6zWUYwobZAochtnNxdw
         Y2ll+NkDXSXj2/AfAAOrJGDT9TkKJ1fwanPH5c3Aaa7WIRkEwXBMntf5I5gk/QHPvhsP
         Ih2WR2Pc7NbHDJBIR7KHpK8KowNvGH7C/iZk6ZqsrxtEDGpiFJhBj93W5lAbPiJI/ZVT
         oPeIma43KBz0a+6ybuZ1GBt+4osIUs72/QFKT0zSZ1lKnaejUpPjZrn4q8YVTKQXOXm+
         DvdQ==
X-Gm-Message-State: AOJu0YxtbfD1KsOQAgReWr29xsNkAo6o1jZqqeOgQnkRs1NRPNNdETxU
	cJ0JHHy+bx2m5ucke4NADk3cvlMxhqQKxbl/e7ssIx/PAKVOl/Z+glGztTes4A==
X-Gm-Gg: AR+sD111ydjPxIW41RnlqOB8tys+68I7KId6DDuWBpsnnGyFa/AjMCfA73S8epQhY3/
	SFESi3FJSLn68l0OlequwB4OESz19ma4iQE5IXSre1MamtFpBCynOvsnzO4W/R4KQXUeuqUD12I
	ia7NY0sASX5DxTWzJlKlMAimhHJCCv2wvanT+rSKP1LsWudCRayt+jzJ4KrtWo9fLZHYtqWPbus
	Id5DJLcBy9vtpZwBuEQrS3IfHrddPmET+gyQbZdGZiQbfmkTHp8nXn5Wurhq2FGFBrklPqsW91G
	mPJCZJHazre3zupGPr2nYvP/PIe6B8F6RneNmLrBGwClKrORZm/TGku3lgx+KHqQTo0VW2dQ4hS
	svFKTBd7lkDRcUVBleMHFwEHg357Lw2ZekcqA0FgzIXWxbioed1k0iB2RRjHQrV5ul+whi3d78/
	anI1edoppzp3MJvFkV
X-Received: by 2002:a05:6a21:ae11:b0:3c3:c130:3532 with SMTP id adf61e73a8af0-3c3c13044f6mr16020797637.41.1784722308467;
        Wed, 22 Jul 2026 05:11:48 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:442f:bee:d40:b285])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc8b0cdsm9154492eec.11.2026.07.22.05.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:11:48 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [scarthgap][PATCH] package.bbclass: fix execution order bug in emit_pkgdata
Date: Wed, 22 Jul 2026 17:41:19 +0530
Message-ID: <20260722121119.888611-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241662

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
index aa1eb5e901..ffe3ed93ef 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -468,8 +468,7 @@ PACKAGEFUNCS += " \
                 package_do_shlibs \
                 package_do_pkgconfig \
                 read_shlibdeps \
-                package_depchains \
-                emit_pkgdata"
+                package_depchains"
 
 python do_package () {
     # Change the following version to cause sstate to invalidate the package
@@ -561,9 +560,13 @@ python do_package () {
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


