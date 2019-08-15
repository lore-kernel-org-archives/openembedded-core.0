Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 00C4D7F285
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 01:17:01 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id o70so450335pfg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 18:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qWOLcsAEcGWIlMHNIpjEXwOwhsaJCqpk0YSvOhG+4iI=;
	b=LwGXv5aKrQufIhufw1xTARXLuwSQlALJ3VoURihhgMMytnysu1XowkgFxMeNgQzsVg
	ulUXiAcBxXac/SQKxlWPV+S4iLnDlYY/PPu2uC1zD0mx9+kRz02etDzoLl6ek0DEXE/T
	aKZRqlxg0wKQmAiyCaIgmrwq2yU026i8pNuNZnMagnw5sYJRFxjb2z1QxSfbXTB27JjK
	2rJufkwF8jOPglzUxGX2zJGC575Dq8VHrnL1rbSba7NKI2/1PHDCNLZ0WGM9w8t7tjqf
	cmRdLmrL6f5h08RoWf42AGKR5VZbPzI2Jm0cLK29UcI9hQFrOWkSXTME5Jia9ZSEDTVs
	BY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qWOLcsAEcGWIlMHNIpjEXwOwhsaJCqpk0YSvOhG+4iI=;
	b=kKyNU88fWITNuHLoCDjUbC6+BUs+nzQj2JaUhzkKHDoyPt3T1Wpe/RpqcJLOId4OiY
	lHzRs7xi04UmX+OcgsEKv3R+IHrZ3WVBx2SPC6Un26wn4MuWiA7e3D3jtE8vlzx7up6m
	zAj99ldyfSUH84NSvF7FIfFUZKfCpeex4sWF7aHm/Lfrq7Mt6mM2SrQmiotslH3Aph/t
	idH6GEWOTU+r+dDl4lorHmp/uls/UTVUxtMteIl7U17PG3WXYZoMfDvukkh1RKtWdFUh
	OL5w2J95zbl4B8zVorfxBRlGkNr5GLECJn5cRNOrXNria9UHzcoX2+PgYYT2YX5JFXm9
	8EvQ==
X-Gm-Message-State: APjAAAVgYSo6MZHh/gxeZkaqtRF2gqLFSnOEAzSOzCYx1t2JDIXlvJ+2
	oXyVY1zMQY8yIkxY244mc7z64OyAtv0=
X-Google-Smtp-Source: APXvYqwSiUNKl87TDIXY3lLWZ0hRhhRqRHDfIaZwQEuC4lF9nScsI8cB1YRCc+AlV5ViI6Ms1v/f8Q==
X-Received: by 2002:a63:eb51:: with SMTP id b17mr1557289pgk.384.1565831821731; 
	Wed, 14 Aug 2019 18:17:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k5sm1201154pfg.167.2019.08.14.18.17.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 18:17:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 18:16:43 -0700
Message-Id: <20190815011644.24474-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190815011644.24474-1-raj.khem@gmail.com>
References: <20190815011644.24474-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] systemd: Drop musl __secure_getenv patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2019 01:17:02 -0000
Content-Transfer-Encoding: 8bit

This API is now implemented in musl [1]

[1] https://git.musl-libc.org/cgit/musl/commit/?id=7844ecb590893f8344324837956718001402d297

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...en-secure-versions-are-not-available.patch | 32 -------------------
 meta/recipes-core/systemd/systemd_242.bb      |  2 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
deleted file mode 100644
index 37979755d0..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b8055a61b5df6b43b8d3117936587b874b0a339b Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 11:01:18 +0800
-Subject: [PATCH 01/24] Use getenv when secure versions are not available
-
-musl doesnt implement secure version, so we default
-to it if configure does not detect a secure implementation
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Denied
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/missing_stdlib.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 188a8d4..c0ffe86 100644
---- a/src/basic/missing_stdlib.h
-+++ b/src/basic/missing_stdlib.h
-@@ -8,6 +8,6 @@
- #  if HAVE___SECURE_GETENV
- #    define secure_getenv __secure_getenv
- #  else
--#    error "neither secure_getenv nor __secure_getenv are available"
-+#    define secure_getenv getenv
- #  endif
- #endif
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 1953fef413..6992062cef 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -32,7 +32,7 @@ SRC_URI += "file://touchscreen.rules \
 
 # patches needed by musl
 SRC_URI_append_libc-musl = " ${SRC_URI_MUSL}"
-SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
+SRC_URI_MUSL = "\
                file://0002-don-t-use-glibc-specific-qsort_r.patch \
                file://0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch \
                file://0004-add-fallback-parse_printf_format-implementation.patch \
-- 
2.22.0


