Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60ADFCD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:22:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6274.1780660105837633982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 04:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k66vkeXC;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: adityags2004@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so1157884a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780660105; x=1781264905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc6FvWEyl7lwCrm9QTCofoRpuGGs4QVGamA3k5epgbA=;
        b=k66vkeXCgOsQ9jDXuq6mAVjjiVxfyTAcJbLInhfDx3PogIbGpeTC8BzbNJog9fquAb
         ej6QJHYfmikezzWkvPESk25twfPVe1AlHREaNswE3MyKXhvrIGjyXHv/54LdNoIbdq9t
         mLXAeZOxR592o2Yyg2T/MV755StJXSLxcT9k7vo51/eODOfU2hMFtqKYr40Lx7qaWjuV
         vjDHJ1L6E4fEjATbzS0ydJMSSIBY4YE1Wtw+PJMxLehQKzPmVw7nxDYV7DLuVoFXkS+P
         hsPhI/5eVrS497nxaqJ3u+o3lZouhqXVYu/TLqQCRix1uMMGDXmRcAkUR0EWjvlgrIj4
         2HDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660105; x=1781264905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dc6FvWEyl7lwCrm9QTCofoRpuGGs4QVGamA3k5epgbA=;
        b=SCE6Bwa/PBKtCnx7mu0iymCrwjy9DTsnq5OEmwSVGTBxDEmxACq5MVFI7QE1y8CjH6
         z46vdg/0+UFMnyHZRq3RydITSgjiKWo2YUYcmq9RoSgZcZuXQfn0DW0jhqzyDyIdoWLM
         tX5u4wOcgOgJYH2PAWpC+2rLQ6UDMFZ4i2oaRdGS67nNgtHuW4IS+oqQhRL2pNW2IYHJ
         0EFkT3F0PWu4LPd5nUeQcYVrtiFJJXFi/1rZfBQt9pIbPafi3uyVN/q15W7QA+xj7j3Q
         bdrywGG5YqMA7nCf18qpD7TamzVni7ViZfYjFGA5oDKwSiX1pBrNhSNk56a23SvWWHY8
         ebXw==
X-Gm-Message-State: AOJu0YwfOYkEAEZEUd5PFtNP5nyTBJ4JAAljpcXyHAdMfh7KMUVWdRpC
	9kLv4nDGoMNrbPDSd4J3Brs3AdYCxDzFKJAqJ6HASlF4tPCaqOwOuzy02y/ffoj+
X-Gm-Gg: Acq92OH6dNw5f+rlfSI7DnIuDBTg0oQaBw/ZnOmxk593HoMoYWb5Vzt7TvqMO4adzbu
	wP0weyCxWD3fG3SuT/R2ImD43z6kyYWYIsCWUZfjU+xVuKl1ZANU5Gy37qqL/z5XIoJnYA2E2b3
	Om3lq1xz5GgM/4Ch74zE3FeHS+JmZodJSb7bETOB1fE+U+UK0un8sLsMCNu60JaYfdnJ8wAi7R8
	i88ZnMdG55h7TAHm+8jqhW63RuEsJO5sN7hJyWCBFNrqAJQljbJebCJRKmGa9HXkPcZqN6+vHIh
	YJhlgpOp95OaGOK1AuDyIHkKUcXYzFmXmB6EJ2jAwQhSsPOHPOIb10ff5CfDENQ2wwXRbZnvnDr
	yb66Sctwtz4mjhuMJzX1l8NV0o7wjSPjS1eJQzAu4/eIz3QUu3VDOgON9AltevBefsKiidavIS8
	zU1KxzBUuHxMVfZIy3a54kPD6N7DnJYvOiI7PWQ6w78WAOdEtMnaexcTEYipoLu76vnR76BN1N+
	r6dGMFduVDcj/KxmQ==
X-Received: by 2002:a17:90b:5544:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-370ec0f41aemr3886337a91.0.1780660105077;
        Fri, 05 Jun 2026 04:48:25 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([152.57.30.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba82c6sm6182957a91.13.2026.06.05.04.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:48:24 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	richard.purdie@linuxfoundation.org,
	Aditya GS <adityags2004@gmail.com>
Subject: [PATCH] gawk: add Signed-off-by to randtest backport
Date: Fri,  5 Jun 2026 17:18:03 +0530
Message-Id: <20260605114804.2509-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 14:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238171

The previously merged randtest stability fix was missing the
Signed-off-by tag in the backported patch file.

Add the missing Signed-off-by to ensure proper attribution.

Signed-off-by: Aditya GS <adityags2004@gmail.com>
---
 meta/recipes-extended/gawk/files/randtest-fix.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/recipes-extended/gawk/files/randtest-fix.patch
index 216b14e314..ac26eef8d1 100644
--- a/meta/recipes-extended/gawk/files/randtest-fix.patch
+++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
@@ -8,6 +8,8 @@ when sigma is too small, avoiding intermittent failures.
 
 Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=f2250f4bc864913437619af7a983]
 
+Signed-off-by: Aditya GS <adityags2004@gmail.com>
+
 ---
 
 diff --git a/test/randtest.sh b/test/randtest.sh
-- 
2.34.1


