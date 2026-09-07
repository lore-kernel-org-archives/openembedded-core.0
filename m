Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84111C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34931.1788788163015793588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yK4yKimO;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495590dde14so51172705e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788161; x=1789392961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vjp3b/UMm5St/rUmHAgmWHzHBBqCUF4qFoxcnImb89A=;
        b=yK4yKimOweAW5oXk9u1kTDcPjf3EmfudA1YVQui2arn44gjdGMVoS3cH22XUprrQ7d
         WfeLNeyufdNb4n03wknXlidcNLogmmtJIyxZJmCojz9x8xGcLqgoX/V+FGNRR3bMM7wb
         uNTFPymteykQNPNapmXwUxAlNSfdMQzo7NKws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788161; x=1789392961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vjp3b/UMm5St/rUmHAgmWHzHBBqCUF4qFoxcnImb89A=;
        b=G+uHvqEOwa43LV7ZdtXGYJc/628s029HjR0ftwrsvdBvf6MghE4HJivcYMg5hL/At/
         H8xaD4QBgI4uKaVWIhStF2PmjZxKcslgn8pLM79133eVBUC9CpWgovKaoLjvMj7cootV
         FvfxjPqzK15ypPP3Noi7h/nVwwcczJNuk7T6YNwBT4jNbRxOpnbxNW3oY5YLkt1l+uOn
         3RdKD2iNtb41wmKCVN1WPUOEs/DUVobEXjLILTrKKl9/58rIMdFMQOTK3jTDnnaPvzp7
         UiLrRVuvKmaYcrLIsCzvzHNuI7mkr0PBHCpVY23bKFA7eMbQFAtrrjDd5ZztBkIR0yTr
         dmHw==
X-Gm-Message-State: AFuF++mvyEnDmw5oikVYVksW8iZGDMDxe8bqU3lh7giqtzqLpyMn6naz
	G8nSs4702gAJ3PyizfJ03tECSkJDKkC5hZ3H4R0knaIFHfEvxsonNr2W9+yJojPk3rlNv/8vrXM
	yPN8GHCw=
X-Gm-Gg: AYBFou173o2zBGRm7E8xa9jxBtiRDbEFf9mtkwg9a9+g3jnSxHA/cLiIaQoutCTEq0j
	LiqMuYh10aWLCcNJ5Q6FcgQU1DEe6nGv2S9RWSH+tFWsvPFUBYxjBfGoCIS+KUs+Xl0y6Kd+XAo
	baJD6e/hrB/67GLe0+ZEyIJnDe+pXvmKjDh+ESiRknQt8QvkZz8CLJhV8AWKqz0rP/B7aDJOr9r
	BCLwd8EVryNROYhK6eyhPF+9M+X8wyCMB4HRZ3FBrvomTpo0wsGZgedNrjgTOTQ6Prvt31KVDVX
	x/5XDDduqmurYNKv+Y9HqL+Cf30X1ncxUNznXpZj8hBlGQg2z7hwC6hINBD0L8F65mreHQSdKCX
	lnYCaZg/+Tm/05qxAruROwjEzhvcwTJoWRBl8oNg8vw3XjPFP1iEJdYzhUXy+woUin3hQ8Pybn7
	ku9JT7MPj9T9ODmDODx503Uh+cSA+Rv5dKsbDlYmE+oGnfY9OrLRsZ0eqkHX8nOfS+3OHiYWIV3
	zwEoLYhp5FK+xsB/YLKnpIXNHicFbDYlSPfZhcbDWOUwkz9Dfa3aQly9cylYbva
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr498819175e9.0.1788788161154;
        Mon, 07 Sep 2026 06:36:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/35] python3-numpy: fix CVE_PRODUCT
Date: Mon,  7 Sep 2026 15:35:15 +0200
Message-ID: <5e73d32ea99d8e909bfb861a9f9c291c39497233.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245277

From: Tim Orling <tim.orling@konsulko.com>

Without this change, 0 CVEs are reported.

With this change, 8 Patched CVEs are reported:
* CVE-2014-1858
* CVE-2014-1859
* CVE-2017-12852
* CVE-2019-6446
* CVE-2021-33430
* CVE-2021-34141
* CVE-2021-41495
* CVE-2021-41496

This can be verified with a query like:
$ cat .../core-image-ptest-python3-numpy-*.rootfs.sbom-cve-check.yocto.json \
  | jq '.package[] | select(.name == "python3-numpy") \
  | .issue[] | {id: .id, status: .status}'

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad623e71fadeddcb0b70bba8fbf28c75a976e596)
The current "python3-numpy" mapping has no matching NVD CPE or
configuration identity, so eight source-aligned CVE records are missed.
Use "numpy:numpy", the active NVD dictionary CPE and configuration
identity for the packaged NumPy source.

Note: The original commit targeted python3-numpy_2.5.2.bb. This is
adjusted for Scarthgap, where the recipe version is 1.26.4.
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-numpy_1.26.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
index ccd08147af6..9164874445e 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
+CVE_PRODUCT = "numpy:numpy"
+
 DEPENDS += "python3-cython-native"
 
 inherit ptest setuptools3 github-releases

