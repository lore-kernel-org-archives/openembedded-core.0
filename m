Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7055.1793791382585769156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ieVEN831;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so6025455e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 03:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793791381; x=1794396181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OdtrTjwz7XgShoHrt0fj+1ta31ytmv/KAZA53UklIuE=;
        b=ieVEN831BbroyO/g04arX6ecoMD0BDU55wMAMhLe3TObll0bmLSD7F97ASdPgwyQp4
         dCLEjS649EqQ1NBz1ti45Nsoc1PiyxbCvtoYsp6Ijfx1p4O3MhhChJrqA3Eus15cfu+Z
         CjMw9mYdTGWt7oq1M92F7A1bkUpEvOmuu+/zsRzDuSCJi1pXltYAC1lQIk51yGZ6zKf+
         JmL5mgXHNzteTytcg2IfCMYYcWpP1CJyBAprIxeEf7LqrRb+/T/36Btb6zsGUafcdObB
         xNbMTd0IoD82hZnk0siAzoTkXW0OLO2T/NHT8I9fdfTO4iovgBTqpp3ZlrYRRtzO6v7+
         P2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791381; x=1794396181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OdtrTjwz7XgShoHrt0fj+1ta31ytmv/KAZA53UklIuE=;
        b=M36x37TaTOVt30Iug5Fj5gdPmylQsEMNazPKgLKI21FguI40fwQneQwdiWhhTmQ6U6
         lx3noTdDKi7J92XrkZaYB5Rv1NlhDFks5I2j4K+WjGaVJvFV8WbvfifNiZU28Oqe9tig
         aw6IlTLCjjd4ugDpxD9xsME5Jq775DoRDZy6LyMYiN7QEXgvXYxuzAxeeuB61cINnNwF
         JGl6uo+Ju+EKC/20LwF465FUVW5GS+txRT87nn3voKAJYW0FYrd43cJqpcqHttDHeV31
         ZhWqRq2aN+pJhMXK6VsMG5wbHzhTDWz0fnWusnIqO66IpvQFfmUHk8mLnj050f/KjKI7
         FyIQ==
X-Gm-Message-State: APuU4Z8DEuBMOtuAnCrfgv3H38MIBpi4/0Rc2hIHq8UEykCTZdNTCSIp
	43ZYzNuDu6JQzS334yQg6iGMjPwB37LzSnHN721bVmZlkCq6Qq5mJ9HhhCHnCw==
X-Gm-Gg: AYBFou2Ddzs8SprwfAVYhGTOAk2bNQYEmiwZ5MU9rBnhZHil5vAYToqdRF/P5pEMlnN
	TCtwvig3TvBV+AOCsgDWrOJjjRGUNAqsFpGCIDMQtDhdYmX5Tea5S4ZoERMs3lVyahjTGTn1w9z
	Hl6s+cWDrLfpBjGD7+Hd8gAe1sGf1sTCAo/9vk7raEFeo8LU6u5Z7lzqxC6aeHK8trh82q5b8gY
	v8kxBCDP+2Xzcf++4A9N+4tssJhc3PB9X10T1P15uAbSFbc7GGYjUAFZq/o69lgW+B2EI1KVWA3
	vKHRy7fLNt5q2UNf31vGo+OAR+VE4S5FaLHzcB4w/6E/k8bCJ3N5qPNk70AzmFgJl41VHQyIgYM
	ZabdYEVwrgthrKrTeOst2M7blT7YVAbzHkCOKKht6ExNIWCXhUa2XMuhGHvVi6ENYQyCfi0QOgZ
	9YrkDIDc7GM3OFpZq/zGLc4sv61F6qFCQemZPV46SiG16lwrJU5JfD/83LZYB20712xpimSwGaO
	G11UKkvvk0C+1ztblf25KAaDvCLP1j4HZFl2RhBWdb9usLpzx5v30hel76gS8g3KT78r4p4NF7c
	3Utbk0KkZdw=
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr382586005e9.9.1793791380563;
        Wed, 04 Nov 2026 03:23:00 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b412e48fd8sm45024275e9.1.2026.11.04.03.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:22:59 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	Stefano Tondo <stondo@gmail.com>,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH 1/3] spdx30: Make source download enrichment part of the task signature
Date: Wed,  4 Nov 2026 12:22:55 +0100
Message-ID: <20261104112257.866914-2-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104112257.866914-1-stondo@gmail.com>
References: <20261104112257.866914-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249364
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
---
 meta/lib/oe/spdx30_tasks.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 646ec7d074..803a9e05a9 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -358,7 +358,7 @@ def collect_dep_sources(dep_objsets, dest):
             index_sources_by_hash(e.to, dest)
 
 
-def _generate_git_purl(d, download_location, srcrev):
+def generate_git_purl(d, download_location, srcrev):
     """Generate a Package URL for a Git source from its download location.
 
     Parses the Git URL to identify the hosting service and generates the
@@ -416,7 +416,7 @@ def _generate_git_purl(d, download_location, srcrev):
     return None
 
 
-def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
+def enrich_source_package(d, dl, fd, file_name, primary_purpose):
     """Enrich a Git source download package with version, PURL, and external refs.
 
     For Git sources, extracts the full SHA-1 from SRCREV as the version,
@@ -435,7 +435,7 @@ def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
         # Generate PURL for Git hosting services
         download_location = getattr(dl, "software_downloadLocation", None)
         if version and download_location:
-            purl = _generate_git_purl(d, download_location, version)
+            purl = generate_git_purl(d, download_location, version)
 
     if version:
         dl.software_packageVersion = version
@@ -524,7 +524,7 @@ def add_download_files(d, objset):
                 )
             )
 
-            _enrich_source_package(d, dl, fd, file_name, primary_purpose)
+            enrich_source_package(d, dl, fd, file_name, primary_purpose)
 
             if release_date is not None:
                 dl.releaseTime = release_date
-- 
2.56.0

