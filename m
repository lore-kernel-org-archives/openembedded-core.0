Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48617.1795631779464494774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 10:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VBJZ2+Sl;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3590647f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631778; x=1796236578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HldrghvJlpN9mTMY86AyoE3qFpe/gYwg6+yoM3Mv+Y=;
        b=VBJZ2+Sl4GxOmSquoSY+sUyFbhnS7e3BHygEbl6vFcNHTM/uwRxTCT/HAjeApEY578
         oNAQgdLUNEj4s7VFXAVrrmQmrSdt/zJLdGgMdS1XX7KXoKfovCoVgcVnExgaE4WyYUYs
         ONcUYzIHd9U8ASD3TkG1ImrwTzeXa+q1QTd8U6dAzjY+ZLPD/nZq85IeZeqna6yr3WyT
         MGSsZQB/rBUe3rJ4r91uebfZSViOQCUFwWGHWt1JWSerif2FVWlwv3CYczoS3VQTyIXE
         DDSxmNlP7TMptgWX2G9iprMAkm1xjvQexBWeRbAVk0VtUPfYPx8rVDc2KDiBOYrNzPNN
         E4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631778; x=1796236578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HldrghvJlpN9mTMY86AyoE3qFpe/gYwg6+yoM3Mv+Y=;
        b=xKAiHV2jPC3FH17+tws+pZJZQpzVna4FOMEPsFml0cTk/ygpmjfy1BBswpPbcVdERW
         bNUs3G+7x6BlB4VcQvg2qDS2hI85/QgzIHfemODvxyFqZW4ghc2bv4E8iPxBLHPyydAm
         iD0s/lhWM4FiibfnHuaJ7KhXO2son+SA5X+dB2DDZ/r1p85eHnWei3Fb0PYPWnxjgcr4
         f9W82Hw4NyYmY+DE+hUnT1n7jw31wlRLFmx/+zmgb6v9wsiOwkF3sflzdt17TvJvDJjp
         egubog6m//gh7BDZ++je++dB77kDQIMAOg3jRmYYPfOQ0xsedjjWW8F1ZXsA3b0s2AJ7
         lOLA==
X-Gm-Message-State: APuU4Z9FDrb5jU+VfmUainLAWy2LPhZy+8z+TFI9b33YpiTiWEmcMWG2
	NwjjQdyFjV5GYxD3NzLjx54qBwJTEfzLYzSCNjOBfvbOWtY/EWoDNSHvUs9+Fks6
X-Gm-Gg: AZFdTZcebQxL7qw4Z4S9cdiQoboGhCfsNz/DA0KaDWOrRIYYvfoypwVfHlD+BZmdm4a
	uR0qVyhqXnvUbBvBb5mPBh3kdmiDrWSaeObxurWCaahfQ8y59f0M+gOUrDmijJ2oKyf2Rvtk93k
	jJxz8os6Q9bfM8ytm5Yv1vOi4GyF236gMaT5UBjJgXcfRm+oNvwy20RV0JETgehcC8azDy+2ZiS
	6n7zfEfwJUVVBgRf4bspnJHh/+Pyl0JTFxsbg7qdw2QVTpmjBEakclO+CC0JAWisV5/jKnY78EK
	u2Ed9VExCBul7jJIAXxRvg+w6buOuMWNDxMANbX02KDATdG7oswTJb4PSirUcSKN2jPTXrhdtPq
	E/5SkE0Q6wNhe7DQjfm+oBUrHmNwyWJLicLgKhlsSu+mU8k13Gw0np8/on6UgUgeUvgHR/mR3ZS
	3P2PLgdAtkSPRTjZLJK17ZYLtp1RX4fSh2C1dgQ4scE5bKoSpTqfQAMRO3BC6WKAM3cz3FYpBzS
	VVdQgp3cTPtsXcACXDpkRx+qSh81LSC04d/qTLU06VYRlrZZVRKfsKBJlZhnBbAoy0IY9B+W9Ap
	XZuAuSPmWXPx
X-Received: by 2002:adf:e013:0:10b0:4a6:c3f:9d22 with SMTP id ffacd0b85a97d-4abb32a41fdmr25566331f8f.39.1795631777542;
        Wed, 25 Nov 2026 10:36:17 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm36941016f8f.2.2026.11.25.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:36:16 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v4 1/4] spdx30: Take name, version and PURL of downloads from the fetcher
Date: Wed, 25 Nov 2026 19:36:10 +0100
Message-ID: <20261125183613.1335718-2-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125183613.1335718-1-stondo@gmail.com>
References: <20261125183613.1335718-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251237
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
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
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

