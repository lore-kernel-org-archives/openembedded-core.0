Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4152.1795045472952607606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 15:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ch4Uvi9Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so830057f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045471; x=1795650271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xO0OOZkadpAthd17lMA31hFxO3/QewgAd0/TDcrDg1w=;
        b=Ch4Uvi9Z02Xe1X6b2o0ncJ3okChz1V4UO4l5sOHoBlL5qsU72/56z2hmW9+JI2R5IF
         jL9f+z5KUfjkqrALIZFMjDenOPhZe0w3qeDB0sqxFCnwOoYtVjG5Apwit/81QpjXKs/Y
         vfdMEly8BJJbpVhNC0GU34wkNOJoDMp6p+HmSddtQJJ+jSbtIjqrzKFnKq439nWlNVF6
         abnHxumk+mwczn6YpVqOk3gOOKVo2AI94k+wyE2X/tE45W7FrhNiJS8xiEXd8jmaLMaI
         fphfYRRolEX7M/W8PE2ciJgbWMqUGQVs2tiDeQybbCpZ5XbyMHQkVr26HgdKb5DI6sKG
         6LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045471; x=1795650271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xO0OOZkadpAthd17lMA31hFxO3/QewgAd0/TDcrDg1w=;
        b=bEJVnMqgwQAjqTXOF1NKyDxi550/TzjhC0kKWGrMyPSgXr7V4LYK7yPx0iT2kMDZ0C
         7DhGH8Tkp3kcQGdlXk0ozxl+0nDEcnkkkig4x1MoYzWtIyI5U46F+TbvDasKjMkUPSj6
         XYTtoEjitp1Th3vswoBfNDUngUQVSelNhm/hslWc7ftj26al8n2qIXMOg32BKN51bRFH
         vLMTweAzgVUqd0lWlWKYl1/lNqXsckZFDWuJEvq9JlyqPNPTiFhCTBve3nxs+A1DPXv2
         nrs3SkAzuJH2UnyvnZgXslPr/95NjiPtnvxFHiFeBYMEOyOPGwHzwdFbNXYUlTGBRQUD
         iI2A==
X-Gm-Message-State: APuU4Z+RPy0cK3djWx9fdtFw3tXCeo2cL3qdaNw2nv9QiJvzL5sQIZk4
	+L0pvf8oA9iYnv+y739Phf8SHcAP/evN0zV0wvDgEUGh6Z7jId/WC0bz722buQ==
X-Gm-Gg: AZFdTZcAY4j85BwHHxa8Un+qzODKoi365ajlNsJNoKme8KEYULocJyzTeqbZGorl6y4
	IkiT2vzv38UVMgkUukKab7qhYT6NE9hVqLBjS2+DKW8NPrxrPORYoV5yrDkRGFKtbXC8rGobeq+
	87Wp2/BN6gaapSHb3jcMQU1nEMn8rY3uqMQtJrbjSEaUf/3miYAkSQKbgq0NhQ/foIgKBre6wQm
	pON3exiM3t+ODlwAEMUI548YcDEQSu6rbu7N0qbnWNJ3WTrbf2hVMaL4WB4GJXFxBAF4O5gkyNl
	aPoeC3tNXMZki5p53a+YMHLdEpgFyNVAdZ17hDKxGJRszsaf1lFbiutCdT/psB3aE/9rBIbDN5k
	PiNPZnxkaM0KlaVKc5QW9gnyf/MhIGARMLAVBdXkaAVK3A/cEZlNtWUwoNLQ7a2sOTTUHpR1L1Y
	hQRgpj1D+Ytov3SvbZeC+FjTGk6X5tdj/38OWp9dj/kbNUmoKpSYxcM5gmqzuOr354gW1Lk13SX
	HyDtvNXA1Fo3QQQXSGN0IgBz2SATiOrdfC7nasq/NaOLwkquJsRDpJ0YprlJcmpHIB7P8vtv1fK
	iTerMuPwcGFx
X-Received: by 2002:a05:6000:4a07:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-4a63f64e505mr8642851f8f.53.1795045471028;
        Wed, 18 Nov 2026 15:44:31 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm6730718f8f.19.2026.11.18.15.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:44:29 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v2 1/4] spdx30: Take name, version and PURL of downloads from the fetcher
Date: Thu, 19 Nov 2026 00:44:22 +0100
Message-ID: <20261118234425.3681880-2-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118234425.3681880-1-stondo@gmail.com>
References: <20261118234425.3681880-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 23:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250601
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

The fetchers of package registries (crate, gomod, npm) know the name
and the version of each package they download. Today the SPDX of such
a download only has the file name, so an SBOM scanner cannot match
the dependency.

Ask the fetcher with package_identity() and set the name, the version
and the PURL of the download. This needs package_identity() in
bitbake.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 6eaa74ce3d..58fe45ec7e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -463,6 +463,19 @@ def enrich_source_package(d, dl, fd, file_name, primary_purpose):
             )
 
 
+def set_package_identity(d, dl, fd):
+    """Set name, version and PURL of a download that names a package.
+
+    Fetchers of package registries (crate, gomod, npm) know which package
+    a URL downloads, see FetchMethod.package_identity() in bitbake.
+    """
+    identity = fd.method.package_identity(fd, d)
+    if identity:
+        dl.name = identity["name"]
+        dl.software_packageVersion = identity["version"]
+        dl.software_packageUrl = identity["purl"]
+
+
 def add_download_files(d, objset):
     inputs = set()
     release_date = get_release_date(d)
@@ -528,6 +541,7 @@ def add_download_files(d, objset):
             )
 
             enrich_source_package(d, dl, fd, file_name, primary_purpose)
+            set_package_identity(d, dl, fd)
 
             if release_date is not None:
                 dl.releaseTime = release_date
-- 
2.56.1

