Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1266F10775E2
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:12:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18197.1773850350332429256
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 09:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bvEXBemN;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so156995e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773850348; x=1774455148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59uk4xg/HBz4StSD3zsyEE0VfsVQPxHvu/Tlo8UVCcs=;
        b=bvEXBemNWpqN/uxGP4c5kT5+T1BAFxDMu5sErsfp3bSNAyaLyxeYqemaQW7SoBNMNF
         lmbVtLsDdseZz+pLM3hWQhU6cw7TerHLCNzHEVJRF6gmthHSTxxmm5rO3biEaTokZjxO
         dW7Fkd6/iTpf8zZq5f9g4TKh+xj7frQavkGsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850348; x=1774455148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59uk4xg/HBz4StSD3zsyEE0VfsVQPxHvu/Tlo8UVCcs=;
        b=b+iHMAPkVG4VZPpW//BFo+ktareZDQWcqKM4wLw5C1KqQ0jugH44/59OXwU5vopkoc
         93F3qRVT/pBfwSXlgBKGQiCuETSdiEsdy+rURESNXS82Qm45huI+Hic3wq52PhYmCS2L
         i52Wq5A6vfxec1/1JCu9MzOmbuGcRVl5CdRaGBMoDIRYMmBiR6zJCHc2S47svsUdo3H7
         Yw/qWARRP8Ecdmwv4gMz02UhRP4IxAMQ7lAtjnY63R2NXSivAaQ0m/L8rvxrJ6tEkj+c
         KuoXczv+IbSgSIfqoib+iUBS8VWRlN8iCMZaXpNzW+Fpxz6Oe36T95xHzBRB1hYtD5uL
         1eLQ==
X-Gm-Message-State: AOJu0YwFGnIbWEszTEnSu0EjRObO+Nhwbm0cH7hxHcQDlHDSkhRzFD8v
	IVHqSx9VgaTNy4YTQi0EiMwM9Tm6XX6C3N4RmnaMFU1Et2vX1f8hGxqvwkZlh9EN/XYxVjWkPIL
	tH8VW
X-Gm-Gg: ATEYQzxyk3BbPusqT59pFGzg083DTiJ643Wn6IinPeHZJMebhMxMuLOucokKFroLuv/
	4hr+k60lXtETBi6bPhlmE0jTixJYpFK/9v42rdVqh2Ah53xr4jnYgdlPookQkpYfFu3aJtbTJMz
	raTzhPGBkOHUcTajw31+psNZhg5OuCK+l2x4xvdHTGRdesoXzKmFQ0nyxWEh9pcPRp/4GqqPmtP
	lk9exoBgiGHJvTA8MxBXsSnKNP1XHbWCI2FeKjOq+W0F5Xg5474PsQt8nwU2gzepuBjK1yhFviE
	CujJnGulaJ5Tg8q4ECXe8t/Vf2h7vIvYyK7DDex4UlOIGh3gmpxBDt2QOr+h+UYF7mqR0f4IctY
	cUZlH6XsaQekdjxbVeIK6hGyd6UAbSraS+zgn2EnfvsegsKBXxZqikKLLaQ+nO7bUm+jzu71OhJ
	72hVD5YBvFtSyYz/s3v0BaVC2DCSWbgp+nRm4/HZJi0ehRA1lUOu70SgT78A5k87BHt4Vr2cuRk
	7Kwxpey+W9dQSP/Ji8Ie1cEmI2+2Kz/wejyaC4olKS3Sg==
X-Received: by 2002:a05:600c:198f:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-486f446cfe2mr68902075e9.18.1773850348452;
        Wed, 18 Mar 2026 09:12:28 -0700 (PDT)
Received: from P-ASN-DERVAUX.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f45d8e3dsm23629365e9.0.2026.03.18.09.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:12:28 -0700 (PDT)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH 1/3] patchtest: add --error-on-failure option
Date: Wed, 18 Mar 2026 17:12:07 +0100
Message-Id: <20260318161209.54396-1-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 16:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233412

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Add a command line option to make patchtest return a non-zero exit
status when a test fails.

This keeps the current default behavior unchanged while allowing calling
scripts and shells to detect test failures through the process exit
status when explicitly requested.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/patchtest_parser.py | 3 +++
 scripts/patchtest                      | 8 ++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/patchtest_parser.py b/meta/lib/patchtest/patchtest_parser.py
index 2a11cb76c2..ba5a171e27 100644
--- a/meta/lib/patchtest/patchtest_parser.py
+++ b/meta/lib/patchtest/patchtest_parser.py
@@ -73,6 +73,9 @@ class PatchtestParser(object):
                             action='store_true', 
                             help='Enable logging to a file matching the target patch name with ".testresult" appended')
 
+        parser.add_argument('--error-on-failure',
+                            action='store_true',
+                            help='Return non-zero exit status if a test fails')
 
         return parser
 
diff --git a/scripts/patchtest b/scripts/patchtest
index 9218db232a..653f2b217a 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -183,6 +183,7 @@ def print_result_message(preresult, postresult):
     print("----------------------------------------------------------------------\n")
 
 def main():
+    ret = 0
     tmp_patch = False
     patch_path = PatchtestParser.patch_path
     log_results = PatchtestParser.log_results
@@ -214,13 +215,16 @@ def main():
 
         try:
             if log_path:
-                run(patch, log_path)
+                ret = run(patch, log_path)
             else:
-                run(patch)
+                ret = run(patch)
         finally:
             if tmp_patch:
                 os.remove(patch)
 
+        if PatchtestParser.error_on_failure and ret != 0:
+            return ret
+
 if __name__ == '__main__':
     ret = 1
 

