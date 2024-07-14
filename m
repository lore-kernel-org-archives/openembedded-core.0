Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47322C3DA4A
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.15296.1720960784802352154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wZ7jpwRY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fbda48631cso24885115ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960784; x=1721565584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYmB6qOzLY/M2dpzrYgV3F0AGh2Tsfrb73BGhgrS7+c=;
        b=wZ7jpwRY0Y2D1ZnNGlzHM0HC1RGUxfwrgmVTH8+klAhR2akVwvZ1tkUGQgkzucPArZ
         Bzxa9QSdNQDxvYp+uPZy53SRd6RmCHYXMRPyCICHF9beqCDHUyZatdWG78RDb+JbBjug
         G5XbRimc6B9U/JPdXWaMi+A/Qr65T6SOvK/ZU7dpVkeyxfYAKOKkH9M+0HNDQ+HPsSYk
         27MvwyoYQgVW49XFvg0NCrfXma+JaX+yXVJnlzQc1lyxBzQK1HtGnv6+oRHPeU9RUf5z
         1JRDbD81zlATk0SK1EKNt4czS4b6qwfJ6JnaKX3WQ2oJq/Q+pOKhghmHu05iGnVQtC4F
         HM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960784; x=1721565584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYmB6qOzLY/M2dpzrYgV3F0AGh2Tsfrb73BGhgrS7+c=;
        b=AderJjwSUVxYyZQuDxLZswU8/xseLtZQIFJ+jiCfrBUX2zpdpt92AHQYotPG1gp9Qo
         3LGRjx8AzCUFMEUdO542aG9mOsfFhSsj92bN9L4CdLcVd1jrrTjcqgdm5GtjYlzxSDnM
         P9PdOKWR8vrlwAPZ6Qa2NHfsVasbLdoEOaGv/8NcpjaNDzaAYYUCJzQQ0sane9cyMuuZ
         lCon6AwAmQqrd2ROdnqCYAm6xCOkcgi4qmHjufTLd8juO7G0RQpd5zY97Z+/fHZFEC0y
         JsbnP4U5bPY9YMVs6KADvVsFGTIg48iho9SZS89U/5pT4dHDJ4AuslnluvJZEIYheIKj
         c5ag==
X-Gm-Message-State: AOJu0YzPX9nJlLq1plh5TNlMMIfCE97VzHtfPNOkD6+8VFQrqoYVAb24
	hBW+cG5xMH3OYXtkdNNcGhk4VoUldZgk/U2xhOiTKLEiqpQgD2ZDvnfMuF2R67W0MCvbKzCUE4y
	Z9Qg=
X-Google-Smtp-Source: AGHT+IH+Q8lit46SzYn7dxzBBcvYXNxRN8zoy0r19wsqgKH88ED8msVkFln/S8BUKM8J9XoYYyUXjg==
X-Received: by 2002:a17:902:e54e:b0:1fb:9cb0:3e46 with SMTP id d9443c01a7336-1fc0b4b6453mr66572025ad.7.1720960783893;
        Sun, 14 Jul 2024 05:39:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/27] vorbis: mark patch as Inactive-Upstream
Date: Sun, 14 Jul 2024 05:38:50 -0700
Message-Id: <1b3da78af1ea569ac8cbf135159a3f6e7f4f471c.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201880

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 618bb8994d66d7d24cca2fb6885a510d69406437)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libvorbis/libvorbis/0001-configure-Check-for-clang.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
index b06029b98b..d4fac605b6 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
@@ -5,9 +5,9 @@ Subject: [PATCH] configure: Check for clang
 
 Disable gcc specific options if using clang
 
+Upstream-Status: Inactive-Upstream [https://gitlab.xiph.org/xiph/vorbis,https://github.com/xiph/vorbis]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
 
  configure.ac | 19 +++++++++++++++++--
  1 file changed, 17 insertions(+), 2 deletions(-)
-- 
2.34.1


