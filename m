Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.46240.1609166185542430344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 06:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=w3R+bac/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id g15so7416618pgu.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2TKk0FAcsOnSmaJRkqiA5TI6jS+rZwDtsLdjVPsi+do=;
        b=w3R+bac//xqbWBn1HkEsE+pIInPGpeXEWwitLfnOxEomm+ew1uyOqDkYKyWkH+vb92
         2xMC8Ab+GAinBzd11F4A4QL9dtMaSVyxgfp1CUfTSN8gFgWvbUvBObI2SzXZ0Vps1XN7
         QKNs0BcjEPayQgnrxfV+bTg9L6YiM6kWj9W3l45mIh4qWgj8tUnpE2E6wqp0vgaXTl3B
         CdnL0DOEMZshob0lh2+I/5jHfl+M2RdKHeOj6CPVOKr7yYQnbIofeQE3zdEaTECPqOA1
         iY7rVpfveCQhF/O3MjgNT+6njyVwjSbMutAxnmZwQ9ysKkn/rXmshS5sbdegJfE/ZHnO
         H2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2TKk0FAcsOnSmaJRkqiA5TI6jS+rZwDtsLdjVPsi+do=;
        b=ZXD+ToSBy34rZSxp+zHj6NWGXalM2zd8nULf2Z3q57kQW4PyT3sMo3dBWBhM7C3Fey
         FWOnfV4GhbRgE1A8xlwpJFD3RzX8deA4wY6S3vhywE8WXTJBBod1GJ2mXfLHRL1UDYHc
         Lq4pUXbKKmEZYi+V2UXbN4VQxKIPnTRb9+812Ace//HFOoNk17rW9JtLlUeJPHNa7kL9
         6/PHKHKAw1UOvrgUFNZR0VfMGNTyUAzIJ0nXhAqcAwNYeuWnBF6yovWXBX1P7kNJdpsy
         zXUapmPg7wXI+rFPEtnA2zDOTHigvdaaz8sVV6uHaU7OYETLJaqV3cwC/igRZKgr3NjG
         6gZQ==
X-Gm-Message-State: AOAM531yiviBtytsxCbf38+kUbO10C6u0eJbF6Or5Pm3BVwyhIKsZmZ5
	beLcRaeoxJoy599c2BXP6oc3213x3WudD2tBM+g=
X-Google-Smtp-Source: ABdhPJyXEYA1fspd2oh1JADafOvhYURgmFnYwJuZckiavJoE3+QdlcR5c700QFwJvK4hsO/WjhXIdA==
X-Received: by 2002:a65:6a0f:: with SMTP id m15mr8434871pgu.394.1609166184686;
        Mon, 28 Dec 2020 06:36:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b22sm36422469pfo.163.2020.12.28.06.36.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:36:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/8] selftest/reproducible: enable world reproducibility test
Date: Mon, 28 Dec 2020 04:35:46 -1000
Message-Id: <7b4a67d22be6508e912d70332354a37f639b59ef.1609165912.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609165912.git.steve@sakoman.com>
References: <cover.1609165912.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Add systemd and pam distro features, and commercial license flag
to include more recipes into the world set.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed8f94942c07784f9f6eef5c00b75aa9b398ea5e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 5d3959be77..89924f3b9e 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -79,7 +79,7 @@ def compare_file(reference, test, diffutils_sysroot):
 
 class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
-    images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
+    images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'world']
     save_results = False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
@@ -150,6 +150,8 @@ class ReproducibleTests(OESelftestTestCase):
             PACKAGE_CLASSES = "{package_classes}"
             INHIBIT_PACKAGE_STRIP = "1"
             TMPDIR = "{tmpdir}"
+            LICENSE_FLAGS_WHITELIST = "commercial"
+            DISTRO_FEATURES_append = ' systemd pam'
             ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
                         tmpdir=tmpdir)
 
-- 
2.17.1

