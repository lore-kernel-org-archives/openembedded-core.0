Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7282.1795734458857199956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 15:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=D4+cPjNO;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb61185057so48373675e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795734457; x=1796339257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HldrghvJlpN9mTMY86AyoE3qFpe/gYwg6+yoM3Mv+Y=;
        b=D4+cPjNOXbma0loLNAJgP7kf5dIQGDG15kRRT1EaVFJpu/c4rTNLkmwN97ZGrcEXFL
         sqAZ6XytkbsG3KdHkvTI/4ZDy75KwxV+n6q0G8CZ1Heg1iRmed5CgTb/iBVvBjqjJpr0
         OmOvVY/JfwuQDQ9qw2VM/IbsZXHFxJczgpeZLT2SOm+UwREZqUO2KPcgPfUplk7yr2Gk
         UYy4BMX//6mbyJynrlG5qYQb9uacvg6K5XZJXGYeezGxfLCKlSfWndir+GZTRi9jbFyz
         ma/6ZHh20PJimYxYgDtM7Oyn2E09RxUvhMR1NghGnKdTmRrmuHXm0Yhh3b/Lkj3hfpDM
         SSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734457; x=1796339257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HldrghvJlpN9mTMY86AyoE3qFpe/gYwg6+yoM3Mv+Y=;
        b=nxOzAjnmJPm93KT3b5RsaZ5+APDIGRd2zk/85UXNEp2HTgMx1ay4gFo2lUAd2LNX+I
         gdFyz1i5UPF4QnFq9lTguQlakS7yqDFWQ3dmJf0Zg9hrHOURGuZDG1gzdmxi3sCU4cXF
         dFvXToOg1ThCjIOKAN2BS+2ElyKdqbVT3+uarb8lmNP9zuzA51GO9udXfMPzV6HB9hJj
         HbyIrX/WxZKd0bXcQlYsghAYKoGxSQGX8alx5kTxPx5t6zPcuzOdMG5ayK7qyGNrSomr
         yrkgzSyHnr41CvLaVIdJMbH7Ti29OJGa5bb3idawVB5bpis4MU1lmLRrlkoWXtwG2ksB
         qX+Q==
X-Gm-Message-State: APuU4Z8oXwtoOIpUJcvdqbVGyWyaFbiKaQOhzR7WXv50i2CIDzXUbm6u
	krD1nHD05QJ80iKR4WFu3DvmAGTXfoYEmcYmEXrbSVR1YPXPW/jK6IigECFSSeSO
X-Gm-Gg: AZFdTZcsjfrIY/KuWu6pdei1iH1uhbZZ3yyjDPqBik7wu66XqjE2bB/KRpknD/zMVyL
	urFpHKkqr09SD3Sn4Q/g12Mn2FJ7liekzUwKd24c6fE2JjaW9m+5uWqKTcBdJq6wn6adcrv9HgO
	sc7A7a/m0Q/mKWXU9+oQko3uikv2WEYLfsi6u2YNF9dbhhy+EjOFCsHLnu/0yLWVCZHot4qsSV6
	6aQ3o11tMWnVlOoav62WAhVXq+bhI904961wupXXcy6qN4C5VMVkhZr7YVDuUjfy1Yo/Q+I42ty
	fSNuKYujNIaqW/DROJQ4IzIgmFKNZu17Hvxj0vdIEfskoVD5BGO8MSqWpZkPZMQb9isyYkPWGwz
	GTY+cZqZMJd1OcpED6INJBrlkMHduSM6G7Ant9dJXnrSPDZF2qZCkrkY0UMF02hdDL5smkNDUGW
	I/Liswzt0i2p05efsI19kPbk9DFrRa3Mx9B0Ay3a3k3/FQHj0O4YD1kc88fbm8Ly0h3Dxq9sBH/
	fC/CydWBEU7QbHuiEfpcDjE1JynCBIbPt036vMN1v6sXe5MFrZo6av0YzTt18SEgf0lM14K/Tgw
	P54L6CwYiuA=
X-Received: by 2002:a05:600c:a51:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb88828173mr444325245e9.33.1795734457073;
        Thu, 26 Nov 2026 15:07:37 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm748625525e9.11.2026.11.26.15.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:07:35 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	alex.kanavin@gmail.com,
	stefan.herbrechtsmeier@weidmueller.com,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	peter.marko@siemens.com,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v5 1/3] spdx30: Take name, version and PURL of downloads from the fetcher
Date: Fri, 27 Nov 2026 00:07:30 +0100
Message-ID: <20261126230732.2708012-2-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126230732.2708012-1-stondo@gmail.com>
References: <20261126230732.2708012-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 23:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251335
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

