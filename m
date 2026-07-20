Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04FBC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 04:24:08 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2080.1784521444399392545
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 21:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wl8P/NSv;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so6062535a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 21:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784521444; x=1785126244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WV7E1bH8jvrrSNBCQulAccKuMu0SUp6L0UV8SMiQ898=;
        b=Wl8P/NSvCc27kAjt9whXsFnXOzPYIK++rJHUtOcSIO2QG/im/nuq5gr+Eu05uQFkTl
         trBr5MnjygQxJjFISbxRDtK+QHfUtZzQr5yAJOcetC84+66kowLU7sYvS0lA4ueUeijR
         4EoYGeMlimnbDxqDV+G5GS39JRfLcILulJcginvCtwkUWu2pWRnxU55gKeM2Pg4HgOH5
         KXzQkvaQEO5cEyGMLG2NPrbLeChcquhWNsKYoBNZ9d+H0V6UxZQVUrc+tPLn3Db5+Nx9
         Fo4aZ7r/Y8mNK9gTyyqMC5kGRVrKXWcu89rvRc7YiqCnqajj9IBVZUmHYiZk/6kJcX6D
         OUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784521444; x=1785126244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WV7E1bH8jvrrSNBCQulAccKuMu0SUp6L0UV8SMiQ898=;
        b=Roich27Mh8OkAXiLwa4oPUARoHjbWBRGPr4xktdVrumR2hokZqSDXVgLKJQxbRrShD
         Iz/EAsV9+Fy6V4ZVv0fmEPkCdVLyE7UcwwOQtjUiGzRjS8RapmsbKrshfHdg2FXnFWOg
         YwjBpwbj+bJEV56cpsUV7I6+YTRJZen7HWKSyHAe/X9D7k+GY5Q6UOgiT/5zoeSmrFWV
         LJqFJGxyXf8oEsLI+lIFPECXCAW4IzNJ7CwkC4MozrfIW7hI3W+UoZXq6qdCUyOtwvlA
         AWNSUB1tKZROjHpebnHY32TwCOkk2aQwQbUWG/NAHPQB5voY8mCfe9Xz656lLM6NLaJ8
         Lmrw==
X-Gm-Message-State: AOJu0Yyu8tMxK6pMeWE5PTEScnaLr1xt2hq5BhI9DviWKjbx1m3bdpqt
	wqlgnsrJGHlQXg4ujDfFegR1RIlDiixrKglAiIhqfOmJP5JH6jLC6N8d3bsvQw==
X-Gm-Gg: AfdE7cmwteBJgY/drISaeonF7EiLuxOgOn/zNOVSi+5qE6QEr8ReHAWEJaTCm1EfRsw
	2Kd91uRvfzV5giKPXxeyxGx6jn2gmTnLhtwMatEka5SeYb05IyNHkXVokgf4BiQrNilV5dpPFV5
	b8xMDqzySffkrU8m8ml9f1pMHjSey4mws6D2wDTU2bPZj7XMKVGKCidMt2K+/4YIR1SeIttDbEg
	qLJsFKKeJLIh92tWtN3Q8skN8FltW+6p+pjI0Jan5eSbd4eSBHseYcNg9BJZRGYabL2XAoUfLX6
	mXixXkrkX8+mDvcOj+eJX+lonEml7uglsBl/p3RBTVTjOhujZtpZrpOl6cqWn4dN1Ux6/rlvezG
	l+NnSXcWDdN/Vi37vm4enAm7gaODGsW7orQt51iP18+fjfH5l3jvNjgJjNssVcr4z95oXdkp01J
	A3nQy6HG160O6Lxh2rjQO0FVmr+g==
X-Received: by 2002:a05:6a21:4a97:b0:3c3:812a:2198 with SMTP id adf61e73a8af0-3c3ad5a9421mr14119246637.4.1784521443779;
        Sun, 19 Jul 2026 21:24:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdcaefsm31046004eec.10.2026.07.19.21.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 21:24:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 3/3] ca-certificates: upgrade 20260223 -> 20260601
Date: Mon, 20 Jul 2026 16:23:44 +1200
Message-ID: <20260720042344.695725-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720042344.695725-1-ankur.tyagi85@gmail.com>
References: <20260720042344.695725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 04:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241313

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: ca-certificates-local example removed[1]

[1] https://salsa.debian.org/debian/ca-certificates/-/commit/0ba2e089daf128206b0a13423ceede612bb60270

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 366cfc1103661f98020d7b7c8d249f2b7f9432af)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...a-certificates_20260223.bb => ca-certificates_20260601.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (94%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
similarity index 94%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
index 9cf6d5afc7..b23f20a782 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
@@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0-or-later & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=ae5b36b514e3f12ce1aa8e2ee67f3d7e"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=dab7c7cea776d1a1648deb0052c72647"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
+SRC_URI[sha256sum] = "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f4649854cf4b0d4bea21"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \

