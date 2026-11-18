Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9017.1794994172322220321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 01:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=H2brYiby;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6471265e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 01:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994170; x=1795598970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xO0OOZkadpAthd17lMA31hFxO3/QewgAd0/TDcrDg1w=;
        b=H2brYibysgaWw32mvARCZNPr1Buu47UQ0zW8IPNXr97MaCeSd/zyPtfT9fX4d6G/lu
         kv1IC7cw7DtCXHkZQ7p8j07zeaNm3EbA8zig2jcIh79ktR5+Y23UXoR0l47OqwrL1FL8
         agg/ocIPw1hfKeEYBxUeyh93/IEA5f3BefwDTub1L0uOmyiaI48MPpNjxf7JWlY76ulH
         TZ0LAxD86w4x0C7G08fUYza/Eg0uuLkEdsXWi8d32+nk2w2MMpkRi/DwM553Czswwwn2
         Zh16Bgwixpeh1L4jSjuRlXSenOOkxIcwz7VKqIYozn7AHOPwSIgAzxsRf6rd5Gj4zjkK
         NApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994170; x=1795598970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xO0OOZkadpAthd17lMA31hFxO3/QewgAd0/TDcrDg1w=;
        b=Vfi/lGUQuM6esABvk5Qdz3dQW8tTV9cJuW9kFVUbiFi/dC1h6WV8nKG04CfP4VT2x7
         mQ133OC4bZWjO5JSpvJw2jxq1wFM3m9djKGOLjUNZ2/3OFETs9HUk7h4Ni7dv4dcZCKk
         1mO2BVP/0y6w1bL6Y/KFkqfbsHa2wbpMM0hc9WogPQYCehSe75Nuwyx4vfEkovnoONoC
         IB7TeKhmaZsRiqqbA3NsHPBdI1n1oi8nvkHW+2I2iQcXZFtnwx8IabxHQFZCHiOdbqTj
         PHjqk4Q6stLn4WT+R5BdWREIQLKsC7M1jsq3YETAFMzpBvGHt7QO85RhRgqhyHtydN9B
         HRrw==
X-Gm-Message-State: APuU4Z+j8+pni6gGUYRGu9FB91kZ2da6hzeU58qYIIYB2qBi2CCfNtLp
	/Rp3xsvt+PHzg3ks7uQOx/1VnjZVF/n4u6S3DkbHlZI3mF2XdY7Hc1xeQNGuvQ==
X-Gm-Gg: AYBFou1edqkwkWcYCyOPMp/SviLGGKmCKkJvsHeXzcQEeCqX7t4UmJlosfWKZcVc+s8
	pYq4V5ScehRkUPPKj7ZJ77VUZjlCQZ354PxIK2s9gEwf2Dweedt1p4TzoGNVi0SZEEFlWA860P8
	deuWTd/ragmitmdCQDvyMBTJsaDTUiy62FrWYWJKsUTjteU2hVu1N+a9fx2xZEbVF22BURsjvQK
	/pq5e5HHdnXlCVVKkLXy/SDoYtCN5azREEbaMUOJwmXIpl25btdlfsAQb8/blad2QG98hNhWJj+
	yfW78OHigxm0MfqHwi0Jke4h74Qmyy68vZy5nSH2LF+sMxSxOPON2YOCcMz8XpbdzpOKle/0SNY
	Cr1RQ8FswoOPRZv8GBdKrkOZl+PcS9WZrD0cTsmqk1s0EETyUoFkT7dAzN81E/NAsg1dyxomBHr
	QSwFyUZ2Keuez+w01ROI4EUFm77qjokFz3KQYkT6m10u+O1rfsohTDkZKK+5DqZyEikrNIsUi5l
	IGubibUlZZK3Csj9nduheNR3bOF/hc8yrhl1thhMrrrITUOBCJ8OYPN2KCH/EncnUNc+GvOJIrv
	mIxeAmTZjam3Rof1bOdynkdJ6/nXcmGX
X-Received: by 2002:a05:600c:c167:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb7da238cemr34896085e9.11.1794994170544;
        Wed, 18 Nov 2026 01:29:30 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm55486755e9.0.2026.11.18.01.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:29:29 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Stefano Tondo <stondo@gmail.com>,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH 1/4] spdx30: Take name, version and PURL of downloads from the fetcher
Date: Wed, 18 Nov 2026 10:29:24 +0100
Message-ID: <20261118092927.204959-2-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118092927.204959-1-stondo@gmail.com>
References: <20261118092927.204959-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250527
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

