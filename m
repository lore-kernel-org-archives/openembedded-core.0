Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2357.1794418535261896104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qYHYJnax;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28441005e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418533; x=1795023333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIhxHq7S1dQRfWiN1mClQ1d8pzQ280CBhe+8ChLMd5o=;
        b=qYHYJnaxYloTuqykSBABGt/j5dbtGcdkEFNVemQvt7fp552u9e0rcduGPqVv2RIxnM
         FKndpD27wZUVU3rmZPB8Cx0l15b3NSngUZJWUP0AwS6GMYAuVfyZlcF2vUMqW6CokOEn
         MDDsl2gFodRy2adD6aXjGeKNbX3s0yzQTCgYcBAv7EVMFqencTQ62YANOZyJW2iVINer
         8EhyNVI7NVYMeoGD4t/xKFA3DJA6UDoPuPmosJh1ehGEKZZJxcvMTOkzd3XVfgCv+oBA
         pMU4f+0BKrvW5yJvlLINX5/GaPFMOk54v0JHagUysyunoe7QmJd6sYTxaE7YhIXcM/Mf
         8QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418533; x=1795023333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yIhxHq7S1dQRfWiN1mClQ1d8pzQ280CBhe+8ChLMd5o=;
        b=1dM3SOwcie4zGkCsXtWMGZdwT6FFH29/fswvm99fn3CgQAQHHiOGuvG2i8pap46pAz
         dSBUMimtbL5OjMKqsy+7bAJIPSBkFkVy/fOfza9zngCgu4UY3jyiLB3Q27LaxBbiV23u
         59EluQXDEmIPZNvY9I16kiObjfMfl6we0YQ0kJv8QmLIrLdvMKkeoX+Nr8JhT1wrxa89
         kvBYruETSvUU1ssWP+UbYTUe1ClVRyOJ5tu3Mlk5FlC2VCYEEmmDUhnqduAw68pNoN8J
         Vkowffhe390xxjWAZmH1aWh+mWKolvsShz8sDXdlaG5MvhvwEB4voc32KQfZsQO6CyYg
         31Hw==
X-Gm-Message-State: APuU4Z+KDjKgrgKCr1dSEjsEC0+/daVnAiDueQwblN0QYZP1bFhEo3c7
	4faM+3fOVOTgQBOGn+3BsYk/gFiMYn7grXknOyFQkS4q5TJIzNlN4/fOjZ+GVT05
X-Gm-Gg: AYBFou20j9xaFRRF23HI+K0OUwQOyDA3JWg84fNId0qvmq7mt+qukhkxm/eJ3BlkjFQ
	eEDrsuHC0z/phR69yjA8BhOT73D9Ege9Kp989C9ikXITWRp1jRUMO02RbKTPP8kykKEj8jaeaaO
	wb/ucoMMWRumMgB9a/arOzQpYXurrjUY750hViVvjBQ1D1ZfLAzpGmemtghUaEvOl3/VBVkHr28
	04o252J5mObBgLPXOyHtC1GbBr3eVKIayj0OYxXg0mANCQ1rLkFGMAbfGK42wJEG9Gnd2EdgfzR
	1Njjlyfpapkm9jhW7wjR0fPaYr05RwoUkT99KQCpijAvsn2yoORCtAP3CL5/ZY4ZjubtNcB/FLX
	lnKp6Sy76GAjsKm3xVI0hxWvGZkooN+QWClJWaCXfpbc+4tWpcYPIQ6yA8UDSp+vur+VXLR3XXO
	mUF2mAFcPSwjT016HCIRquVZe3DFDz3E1+C0fwLWoHLCigpxOm05WbIzJ1LHp1EWEsyWvSWts+Z
	uCCIXA/2BKiKmAwlexg+xr9eMP5dpn9s5c6w4iL0XFpwYyDmA1G7kgKx+5+uBnwF1CmiGmBZpfT
	LS5FqflXf3Ad40rLZMcZfzVG6zku/rQCqksmdfsNjODC7WOfUxC6I3E5YJRPeH4OxHHd
X-Received: by 2002:a05:600c:3e86:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4ba091a607dmr58531505e9.0.1794418533349;
        Wed, 11 Nov 2026 09:35:33 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm12214329f8f.37.2026.11.11.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:35:32 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	patrick.wicki@siemens.com,
	stefano.tondo.ext@siemens.com,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [blacksail][PATCH 1/3] spdx30: Make source download enrichment part of the task signature
Date: Wed, 11 Nov 2026 18:35:24 +0100
Message-ID: <20261111173526.3653122-2-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111173526.3653122-1-stondo@gmail.com>
References: <20261111173526.3653122-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250042
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

bitbake does not track module functions whose names start with an
underscore when it computes task signatures. _enrich_source_package()
and _generate_git_purl() were therefore not part of the do_create_spdx
signature, and neither was SPDX_GIT_PURL_MAPPINGS, which
_generate_git_purl() reads. Changing the mappings or this code did not
rerun do_create_spdx, and the previous SPDX was restored from sstate.

Rename both functions so that bitbake tracks them. This changes the
do_create_spdx signature of every recipe once.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e57ec14f8d9bbe2e789163739df5c991e2eebe5e)
Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index b6456a214a..19661152ff 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -337,7 +337,7 @@ def collect_dep_sources(dep_objsets, dest):
             index_sources_by_hash(e.to, dest)
 
 
-def _generate_git_purl(d, download_location, srcrev):
+def generate_git_purl(d, download_location, srcrev):
     """Generate a Package URL for a Git source from its download location.
 
     Parses the Git URL to identify the hosting service and generates the
@@ -395,7 +395,7 @@ def _generate_git_purl(d, download_location, srcrev):
     return None
 
 
-def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
+def enrich_source_package(d, dl, fd, file_name, primary_purpose):
     """Enrich a Git source download package with version, PURL, and external refs.
 
     For Git sources, extracts the full SHA-1 from SRCREV as the version,
@@ -414,7 +414,7 @@ def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
         # Generate PURL for Git hosting services
         download_location = getattr(dl, "software_downloadLocation", None)
         if version and download_location:
-            purl = _generate_git_purl(d, download_location, version)
+            purl = generate_git_purl(d, download_location, version)
 
     if version:
         dl.software_packageVersion = version
@@ -502,7 +502,7 @@ def add_download_files(d, objset):
                 )
             )
 
-            _enrich_source_package(d, dl, fd, file_name, primary_purpose)
+            enrich_source_package(d, dl, fd, file_name, primary_purpose)
 
             if fd.method.supports_checksum(fd):
                 for checksum_id in bb.fetch.CHECKSUM_LIST:
-- 
2.56.0

