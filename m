Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4746.1795121354145221436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 12:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PXNo03z9;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so82511f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795121352; x=1795726152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDrfGaEx8zpGcWQX4X/LNZ+KM0hAVNCKWLtbOnESC60=;
        b=PXNo03z9hKNlmr1tgax7HKi8gqgdypDVBn3vFz+Ml2aF86/ztSsBDb7iewcBH7SDcG
         EG2gHUdPMuAsfOty1goKT+DOfkYA+e5GBB1iq+xgywbMn/iqy1WqExFDgzfA9R1HSvVz
         JvobeHnuQye3vhjg/KgCE080pWbKzTxH5LUUlV8gSdN6mBI4WNgNM3PHhxpx9Dcbhb2G
         fVYTvLDgVlygErJf4llUt8AjLbeHRKFyGX2EzRqwZx0JYJdiFTt5MOyyyTzGnlb8xkJ5
         eyjeZ9vIy6vgeMh6cUGxL2csYp/ZT7h7vawcD/AMOYAQ9LYJ04h3PX8hbjpOo1K+IRwM
         CKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121352; x=1795726152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDrfGaEx8zpGcWQX4X/LNZ+KM0hAVNCKWLtbOnESC60=;
        b=WHuTbNUeIBI3MajBQ/DCrQ3Hwa479/+vuEP3i3wsEXqgP+7t5Lrgh5PiQU2DSUbLob
         REXljzQbD2JWLd/dDnZsN2LYHhMFduOPPaAXwo3uXOn3MxdvNfZjmH6ShUyy/7Xmm77d
         /kWixFwG2ge3fwT8O/Y3ZDnm38X4f5tXtQ+S8gJ5wOZFJQRS14nwHgKyWut668GvxP2u
         EeoBgPddAwYc+J/kBgDE+lyhEMoEyKQt+jiSPeKCfXOE238UNKqfl0dytZYYTAoqspF0
         56fUahWAY9sr4KXZfbbbUMr0A6S9Q8tCvT6IwFodbT7OWttQJ7+3DKKlJWCi85K7c+hF
         pUxA==
X-Gm-Message-State: APuU4Z9qOT6hbqAo7GsbGcr55uxahdv+sosUrBNZ9yU5k0GCOOn5jC2v
	TKeylkyMlAozksLdl9spR+84vsIJ2pYSU//Bge1cslQkQlQ3c1YOEEbDxbi6WHJq
X-Gm-Gg: AZFdTZcaZ1Zw96eWIDiova3eLjndJQmzECCBRSBRqC849+nJcD56992V+LuNMLHKuDo
	hrhIyefBF72HM87ULCcZtZsEj+9g+wcz1YXwG4B3UcZRXVvLt7g9acGtA2LSFJ6nTZg801EtavS
	JnsL7pppQOLDXJGJWMYMIc/hj5KyyXa0o2sArtITYP5xy0oD/v0BUZfluA/QzhE+CQRJbn1KFoB
	kjxqdBAwwAKQ4l+QcQ5sCvH3vwg0Lx3jRl1IMEkR2+ZOVhGGcqgK/YQJgXY9xTPX9cSFr+EcXrY
	Ydx90qSO2R0s5bb5dcaqxHQGNLCUWY3zTFBkaH/hyhWPg9VaUS391zXtl191MoWr8e3UOLzVTNQ
	oD9anm1FHLrscfJRgabeA7vyR4ayDuB5DryvuF42sVcszghptJCQwEzrKt+OXoJ72weji13ef3E
	TASNb7ZW1D2avrluMPfu8yfplLWYiTlrNoDHvOJDzUArV86uvGe9FiIHrHsB2iJjH8MuCi6SBSz
	C3lgYUOCnqoF1i0kIW81q0zl2OirgrTsrJrbw/+lXo6gokiXsLNVHmNmB0+KuEX7t9Y1XVre31l
	nb/gWE/F2ik=
X-Received: by 2002:a05:6000:4381:b0:4a6:5a2a:f5a3 with SMTP id ffacd0b85a97d-4abaa9773abmr1306358f8f.3.1795121352298;
        Thu, 19 Nov 2026 12:49:12 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm1606171f8f.57.2026.11.19.12.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:49:11 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v3 1/4] spdx30: Take name, version and PURL of downloads from the fetcher
Date: Thu, 19 Nov 2026 21:49:06 +0100
Message-ID: <20261119204909.2931233-2-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119204909.2931233-1-stondo@gmail.com>
References: <20261119204909.2931233-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 20:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250718
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
index 6eaa74ce3d..eded315819 100644
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
+        dl.name = identity.name
+        dl.software_packageVersion = identity.version
+        dl.software_packageUrl = identity.purl
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

