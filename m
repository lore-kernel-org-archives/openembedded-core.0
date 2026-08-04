Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10E0C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 20:04:52 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25352.1785873884541944998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 13:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Mbk3bzDK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026080420044605b05c8d30000207d3-59qwku@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026080420044605b05c8d30000207d3
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 22:04:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WyWaJUsFRGWUloFfHjwp9Fih22G3Xb8yp3ttzzOCsbg=;
 b=Mbk3bzDK7zhuwLD14vZ9coYvZqAcUEZqXVppPXXQebCVBc+l1Yw+Z+TAxexmEv1jM2bwXp
 Oox0ShuUt9oXddu6726wo7QasJxvXSYg00OCZ/7zd1lOeH0wpHIi6ZGThmQ3DrVLVLM91Xvx
 dzojFZk8JeVpxvIrOkb0DlpWZUCwR4a4cAhgXzv32vL7j+tgLJ80XuIg3SznaAMsS2rDQeMf
 3fA4uF1tDS4hdfabkwbVIFOCz/tUu80E3cKw3fflpp14JBEF7ySNKC7zJymw0s3nnjtHzE7/
 Z+bVtBjLuLbOixsSvEt8vdTeEBDj2Mn4rprk4bAO5h9KBI1fpNvMkDhw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 6/6] python3-cryptography(-vectors): upgrade 46.0.5 -> 46.0.7
Date: Tue,  4 Aug 2026 22:03:56 +0200
Message-ID: <20260804200356.2093270-6-peter.marko@siemens.com>
In-Reply-To: <20260804200356.2093270-1-peter.marko@siemens.com>
References: <20260804200356.2093270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 20:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242801

From: Peter Marko <peter.marko@siemens.com>

Both releases consists of single commit on [1]
Changelog [2]:

* 46.0.7 - 2026-01-27
  * SECURITY ISSUE: Fixed an issue where non-contiguous buffers could
    be passed to APIs that accept Python buffers, which could lead to
    buffer overflow. CVE-2026-39892
  * Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL
    3.5.6.
* 46.0.6 - 2026-03-25
  * SECURITY ISSUE: Fixed a bug where name constraints were not applied
    to peer names during verification when the leaf certificate contains
    a wildcard DNS SAN. Ordinary X.509 topologies are not affected by
    this bug, including those used by the Web PKI. Credit to Oleh Konko
    (1seal) for reporting the issue. CVE-2026-34073

[1] https://github.com/pyca/cryptography/commits/46.0.x/
[2] https://github.com/pyca/cryptography/blob/46.0.7/CHANGELOG.rst

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3-cryptography-common.inc | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 4e4434bd66..0515cf7705 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.5"
+PV = "46.0.7"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 800bf1b0e0..9047e690ea 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -12,7 +12,7 @@ require python3-cryptography-common.inc
 SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch \
             file://0001-bump-uv_build-to-0.10.0-14271.patch \
 "
-SRC_URI[sha256sum] = "ffbccee9455201c01b37c63d65d9f83b362d40c2bed9caac248ebbdfa4e4fc7c"
+SRC_URI[sha256sum] = "08f3d13846fdd86d4c1138a88c695cee203b3dd3825c784d64a3b06d000cdda1"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 42e8c5ff19..7f9bde15d0 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
+SRC_URI[sha256sum] = "e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c245aa5"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \

