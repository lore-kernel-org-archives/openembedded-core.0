Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2382.1794418545403294408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=O42iRYMh;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so27018305e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418544; x=1795023344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aEejM8kd0gd3jbiSE8wFglsXrPFyTw0OcIX8e7rT7I=;
        b=O42iRYMhNNcO2904Ff5aB7W2wT5JIUBWH1KtjcVIoJYY9zgiC+dsaAVfpJ98WAdIgA
         k0HzzIxyZg0JiurFZgTLsPnFNAiEs6y9rX6YZ4OwPZh2XSkCNwkJOBgYXIrY3rXVZT2V
         RfFd23m1yuMyFBSDZgQ49JCqCTSX/fO4iHWB67d7kpqRbEiLqDE4Ffb9PhM471gcqiM0
         G5qE9UGA+vu/XxxTg61aCj5kjpT/XSUOc2D45xK0+twAQ0Cn2JL8FaLdhXGjJ6ArG823
         GnG+DgN4Am2q597Vr4ihx5MbsMm3o6w2skAsiQCU/PgtN7bql5GFVBppZenKuBCCrTV/
         HNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418544; x=1795023344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7aEejM8kd0gd3jbiSE8wFglsXrPFyTw0OcIX8e7rT7I=;
        b=kWkrkc7Ybu7Bjv40c9e13rQEmaBZlWgzYaIkvp+mb9aeD+3Pg595Qgzt1O1hfFWkG7
         H+Z1GJ9jNyhSBjuNcognoyRhzaWCl943lX9OgvRGs1vAVQPLc+BddJvbeb7hH2KM1yI0
         tOU9Xkgs+KFoQdeqbl7pa+r4BtKS+KbDe6/EmtsHkstyMSEYIArpsMaAeWzs6bzKu+qA
         DIZ//0y3Y+ckiHDcBpgvGFAV089BcLYADCtz4M5P0qnlWqiilP17JHEPiIUm7Ok7kzHH
         HnTlqS5k+ldEDbMJ33aQPSad7zO2LgzT+lp6nMiVNUr6FDQT+GviXQHXjrDj2T8nqj8n
         yLgw==
X-Gm-Message-State: APuU4Z9F31MJaGIzi7Xt4MzLqGiXyu2kfCpEtn7rpBFDRVQgEHlt3rQ9
	k50AhSU60I0ed73bnaX7wYKJHZUQ5Sah8tBmAzF5xOkahm/dUvDZFJxtraLTsFy0
X-Gm-Gg: AYBFou3dBlAWifz7eZYq1kkFe/F6nlIJQ0jk45Rnvi9AMYocTk2aItRYy9PoN6YRqU9
	37l5vu5PGfEKvbhXxeQYjyNJohrUgEGlXi35qASVv2US6HCEsImCheM5XYxkpPj4G8kRO/3FZTc
	2v7YK6/F/fiDnqVC0T/xR4AnDvJS8kwHwIqeQm1ykDvf1w1jRkEnE5i5X6wuS8R2YfqJRMfwfwC
	VWJv1n1Q56U3QC4eZeHWlSQJICCrgLT9GcqEydT92uIObdEhzkdUSUiQp3E+TAVAuft4aSa3vKH
	dV0O2icz6U9xsUiMUcOfEOmIYiT0ExNN8bPCakAAS0eOkAu/mZihIb3bx3lHFERcGZV+L548kY7
	JUXSfCuWWiogsaE0VTzLzWv87zoA0XY2wPJbUYNtfk/mYd6jAGO51AvU2YKp6x8tG0wApgLtHko
	pwg+99IS/zw/EBhIZ7+vQtx8vx7hdzl/lv2P2rwkdt5IF6NjWNZhRvV24RzWZk8tBdx86ChUqZV
	SQnhhYHrUw4RjG3koy4zIMAVoDRjTmSpwhZX1RArtTCaDDXZr+uZT5PpR4wxU2BP9khk+HZzGOR
	aW5bq8vUIxWfApwWLPTIMNnLXawioJ72Oci916Qb10xw3A==
X-Received: by 2002:a05:600c:19d0:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4ba093805dfmr54097885e9.9.1794418543638;
        Wed, 11 Nov 2026 09:35:43 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0950394fsm54823785e9.2.2026.11.11.09.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:35:42 -0800 (PST)
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
Subject: [wrynose][PATCH 2/4] spdx30: Make source download enrichment part of the task signature
Date: Wed, 11 Nov 2026 18:35:35 +0100
Message-ID: <20261111173537.3653558-3-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111173537.3653558-1-stondo@gmail.com>
References: <20261111173537.3653558-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250047
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
index d5128fff52..9fb2dcc36f 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -383,7 +383,7 @@ def collect_dep_sources(dep_objsets, dest):
 
 
 
-def _generate_git_purl(d, download_location, srcrev):
+def generate_git_purl(d, download_location, srcrev):
     """Generate a Package URL for a Git source from its download location.
 
     Parses the Git URL to identify the hosting service and generates the
@@ -439,7 +439,7 @@ def _generate_git_purl(d, download_location, srcrev):
     return None
 
 
-def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
+def enrich_source_package(d, dl, fd, file_name, primary_purpose):
     """Enrich a Git source download package with version, PURL, and external refs.
 
     For Git sources, extracts the full SHA-1 from SRCREV as the version,
@@ -458,7 +458,7 @@ def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
         # Generate PURL for Git hosting services
         download_location = getattr(dl, 'software_downloadLocation', None)
         if version and download_location:
-            purl = _generate_git_purl(d, download_location, version)
+            purl = generate_git_purl(d, download_location, version)
 
     if version:
         dl.software_packageVersion = version
@@ -547,7 +547,7 @@ def add_download_files(d, objset):
                 )
             )
 
-            _enrich_source_package(d, dl, fd, file_name, primary_purpose)
+            enrich_source_package(d, dl, fd, file_name, primary_purpose)
 
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
-- 
2.56.0

