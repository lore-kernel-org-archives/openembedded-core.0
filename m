Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8010FF8873
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 18:37:48 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5768.1777574265147133987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 11:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y2/IRdZz;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: danismostlikely@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dbe437b072so842324a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 11:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777574264; x=1778179064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztpc4bvbNjnPTHw/7NhNZdHar/zBqzcRHJtLmRwTTK0=;
        b=Y2/IRdZzBztsS/Uz7JH13esgD4k+b+8XvA5T05sgbgL1lZIR0396h6nv0j37hr0ea2
         ZyWYcAAzYyZW2AydWICsJEYTJ/PoTrnZ2XWXZB13ZJjADHfk4Kmp63ZJpm62THFDp1mf
         tA7vRKesWXhWBE0uqTq7T+ZTBXlRTaz2+15z8XRoTlXXt83sod7fkxQv/VYb94mhWaqT
         wlS9BqMtaw5+fLvez7ot2SnhrtWOywvQo2ANbZQPNyCzkwOo4/3CgHI9dqJ1o78GKOn6
         LbaBp+r+KM37b7GP0jddnSuJKaPWBlWEJ3EBMTySbtkOzV8tfmRejm5EVk+Kb54BCUcS
         mJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777574264; x=1778179064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztpc4bvbNjnPTHw/7NhNZdHar/zBqzcRHJtLmRwTTK0=;
        b=haKkr7izJJJn1ivwH97M1gRziOi1Sx9098jSIAzUK5rkWuHYD1mbV3pFPWCkcjemyL
         +Pd2Qtl4qRj1X0Jeu7jaVkU8YU7ZMp19RwXLqeVAImkbc+3X15tVTO2A9vvQL9hYUy7L
         zFKEAThUBlHgiLg4vWOifTD35kOuHq3zvvQ+mVtx/mk8aMXZw5yqTfIW4dpMVs6r7O/z
         /xpkZRo1NtbKfsqNlJDBcNyVPEttZlZ0Ia3Z8S1NNX0YmTuc1PnOV+1wSpWDmrVpseJA
         bds4M8bnp1Befs9Ar+JtaVcpE81l24xrP08ydAUEWagbITfDWEnWQHGmI19zd6SMaAZM
         OF/g==
X-Gm-Message-State: AOJu0YxogX7yACrdq8TIcwezMeYdRDDLe+P04g6CLweO+OESG5LY5uPE
	L/a0/+f/DWZN+KyCkiDvCktC376su7EJZp4luHebA04xHBiPpSjAjkjLb8QxEg==
X-Gm-Gg: AeBDies9hE9zoE1qgHfrA6mpDqov3cvX89kncufmoli4/x6lLRh8YvELfZPAT5YVAaX
	EOA++utTfU3aRVmTFmxLtlLStCShReu6rPeFIv+NXRZZEfIv1eX1PElvN5dqyiA0UWfPy8GVlAK
	p+lYW3StuEaQ1JMEoGQ2qz9Cnl3T8aMB3OvfsZliS1ppZsryuRzs+YWQFtmjJ6GMyFZmSJi4PX6
	BdDVZv8dvAgnJJFUe9GxUOAcbsrQtMJRmvMJEj+QS9aLcb4KIURX8+27mr7nAF9PfSpr2O1d4XG
	uM320MxAdYjoUogYtu0zhnzBbxLdkik3RRLnu6K9VPwZ+o3RD9XUFyJO0ZvYDO3YsZFQ4jPubHV
	0xLM8cCPHbMit7sDWHXV/DJk2MLyJvO3uDkPybRSrxkCaedROQHLLLnhuX8fJJf8OzZFCld6PR2
	UjvrBm1ZKYtF0qQsSRTs1jr+Fn5QNP9arLqBZCK0sxRUVDvM7gzI0lBWlwmoVPaSW2yw==
X-Received: by 2002:a05:6830:4392:b0:7de:4fc6:a588 with SMTP id 46e09a7af769-7deba302d21mr2699472a34.23.1777574264025;
        Thu, 30 Apr 2026 11:37:44 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7decae680bdsm429016a34.27.2026.04.30.11.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:37:43 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [wrynose][PATCH v2] python3-requests: Increase chardet upper limit
Date: Thu, 30 Apr 2026 12:37:33 -0600
Message-ID: <20260430183733.88082-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 18:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236180

From: Daniel McGregor <daniel.mcgregor@vecima.com>

OE Core includes chardet 6.0, while requests warns for any version
greater than or equal to 6.0. Not for any real reason, but because
it was a higher version than what was released when requests 2.32
was released.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 ...01-Increase-chardet-upper-limit-to-8.patch | 25 +++++++++++++++++++
 .../python/python3-requests_2.32.5.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch

diff --git a/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch b/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch
new file mode 100644
index 00000000000..662049ef94d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch
@@ -0,0 +1,25 @@
+From c6a303bc6ea1d1d2ee5be86c4eed92cbb325c1fe Mon Sep 17 00:00:00 2001
+From: Dan Blanchard <dan.blanchard@gmail.com>
+Date: Mon, 2 Mar 2026 17:49:19 -0500
+Subject: [PATCH] Increase chardet upper limit to 8
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
+Upstream-Status: Backport [https://github.com/psf/requests/commit/b2a1d33f571518ca9a6148e7da787cc5827f897a]
+---
+ src/requests/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/requests/__init__.py b/src/requests/__init__.py
+index 051cda1..f22eb37 100644
+--- a/src/requests/__init__.py
++++ b/src/requests/__init__.py
+@@ -76,7 +76,7 @@ def check_compatibility(urllib3_version, chardet_version, charset_normalizer_ver
+         major, minor, patch = chardet_version.split(".")[:3]
+         major, minor, patch = int(major), int(minor), int(patch)
+         # chardet_version >= 3.0.2, < 6.0.0
+-        assert (3, 0, 2) <= (major, minor, patch) < (6, 0, 0)
++        assert (3, 0, 2) <= (major, minor, patch) < (8, 0, 0)
+     elif charset_normalizer_version:
+         major, minor, patch = charset_normalizer_version.split(".")[:3]
+         major, minor, patch = int(major), int(minor), int(patch)
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
index 3477a5d83e9..4c58436cef4 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -8,6 +8,7 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
 
 SRC_URI += "file://CVE-2026-25645.patch"
+SRC_URI += "file://0001-Increase-chardet-upper-limit-to-8.patch"
 SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
 
 do_install:append:class-nativesdk() {

