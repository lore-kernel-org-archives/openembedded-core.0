Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E276ECD5BB5
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.950.1779233428840990688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zZLJLKIf;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a5174670eso2339009f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233427; x=1779838227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Byr2DJiLDcuepDfs8WDKma8Gg647t61r7Tuty5jeuvc=;
        b=zZLJLKIfom31MwYjWLnLqvuPbO63B6BO3YAXtqwuRD1Tcm/kVaQ+ypQsVAczd7AcQU
         Q4KSF8jsPwkrl3qqbWexfn6KMQmt5QNNsKwKt6n01NlzLi5UVXKl35PAtHviMTho6ItQ
         cB8vEi0JP7bJvUc9qgkh5xmHnUWLKKzj0hssQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233427; x=1779838227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Byr2DJiLDcuepDfs8WDKma8Gg647t61r7Tuty5jeuvc=;
        b=AaPIS13WqT4bMjjg71b5yg9v52ZTzqX2Z0liFmhaP0P/NvFReIIVQC0YtJYKGRvrW8
         G0WfnyUDpV2ZPj5F8GL7MgaEtL+DRpgPvac2+uCiRQy9HAanmRo2WUEesFg+oLFz1Tng
         YuMU+DdLn+eg/65n9IuzG0QBx1J/1g69YP2guPbnOCwZtn2CR5BD/nJ+3B1DRH9VoLzB
         lKj3wPWvT5bNHZ8D5WyU11uFGNi72tEnCMuMuxRXubgCdnXwnsJ5eSgf8idnYAUxagPc
         cpCkQ5cx+yvSM71/uKCVWadmzFnn75yP8U8sDzXiUoKPUxnW0nsVzZorJyl4XLm1EvUp
         lGfA==
X-Gm-Message-State: AOJu0Yxswt4cRIY2V4WY8qyqi5DpD+IZGmZlq1ELF6BjeeTqjMxho//s
	dHEQYR2T99SdVyMO8fkOmrKnOj2lnRad+tu0pcm/O0M2C+GeBkOKhKchEg11QsPWgSR7c0B0wCS
	47qRL
X-Gm-Gg: Acq92OFdNRGdCPuS4GCHgDo2OBccrJzggue6VTI4ARggRb/6d1b1aF5mJd5lbiQZ5Lw
	/jkEFckLh1gDqluxTfWN9gG19E23+FAbl+8IgBN4HRYTW0yeVwPWKOcUr96MP0E6Fc73oCh66e7
	JomHBU9fFohTl3vBfvhKwMTUOk6JgWdb8qIe40PFiQx8wdBvAeLstQ/KV7oyGcvTsIXFXxxTXmo
	UamjQyIILy3EU7YMbChZ5puPmzuA+aQhU34ZiuJjYwClEF/qIoT2CYGByeQlJKA4bCkojaXkXNH
	iF2hA1zdOO+UadALUEvc8QIalWACwRTgJ0TL0qGTDluDnEqQIohPEhDS6+bk53cAkKyJefIQUoo
	VSrTZESIui6WkX9GwdFyx1K2go6efuwPCi1A5q00BTbPk6C43i0D2UVrJzf9ikCyTpX9SMvz7Z3
	DJspoQGjGrQq4MvL6eVpGiy2JTIHTJUxtUrYGrH9KJ+T9QirNy3P5wla8tXwShrsxSCNoE63NZa
	PscDuBG8v7dQ4AryLQgtqlsKKxRpVpLy9KqIA==
X-Received: by 2002:a05:600c:8b45:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48fe63253f3mr320471915e9.21.1779233427083;
        Tue, 19 May 2026 16:30:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/28] python3-requests: Increase chardet upper limit
Date: Wed, 20 May 2026 01:29:39 +0200
Message-ID: <545fadfed8c87d1d7d112eb78d59dfa9e815b1d4.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237349

From: Daniel McGregor <daniel.mcgregor@vecima.com>

OE Core includes chardet 6.0, while requests warns for any version
greater than or equal to 6.0. Not for any real reason, but because
it was a higher version than what was released when requests 2.32
was released.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

