Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 513227F62D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:48 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id h27so1596327pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jKTuw5p4q23Q1yID+WIkFdnjXZoviGQb2gXy0SlQUx0=;
	b=od0Xyq6HALeBkNssiJoVeJ7fpWLF9xNzLaP8OI+Kh81NYW6jz7nUFUlXJZiN1qdcE7
	Ry6YVZ+N4cNaemAaRLLcn3V3dpQEOEq1s1KVQS7tyNKq+SykSFolFjO5gUag27T8VXT4
	xRaKWBOJrOd+ruajXPFjHx9srubz2nkyVywfZXYM2OR71U8GjyMMN29bbafoJhsEapbV
	4Cc7UyWTOnm+OBzphe+921rI04DmBKW9gT+6eCvjC5C26mQ3D+0giaIqJOJMXSP9wmtN
	6EtaOBRGhAO8SinyQXFd0r37KTPloGNEb9znv4D9EukM9o0gw5jv0OYmC0ix+BY9/Hnu
	s0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jKTuw5p4q23Q1yID+WIkFdnjXZoviGQb2gXy0SlQUx0=;
	b=OPhKsU3ZIgGSmOem6XBu4xmMU1MCcjxzn30bdtBE/eRrRIiyqoIoMOSILVw9QH12Hr
	6OzyuRJqOncetZcOUhOjL7GdhCaBUMCUiPcG0CVUtjLYiL77gRUTFZSzEmeIUCSb7FFE
	ae0lDjU84S3re5IjDSKRNfPASafE7PT+tGkaV1lg98xvCZ0eY+uFHlvamjZQmEduApAD
	AUU7bBIMiDSMzsjrqwd/qyQzZj3X7cdlCCHqp5q8keOJLXygwBdr8vafA+VceZGLxRLG
	AGYSMuF1FBHrIJF+E+KjOPL5qTrkjmH0iOB/4xs1WOZSiLgJrHTlLyuqV+Gq8U73g7oo
	9O9Q==
X-Gm-Message-State: APjAAAW9R/K7JgaU1DVXBKyQEzacVm3Lt+sujxVzpyR4gZdKaF/DYYLs
	vLaDbzqVYa6tKL3evjWD5DjLYmKP
X-Google-Smtp-Source: APXvYqy8ZFzs0M5tcWfDhihQGY7a68MlI0lkbZp++xp2K2/sJKfQP9KyVNPLwRtAbBmGgT+WZArbAw==
X-Received: by 2002:a62:7847:: with SMTP id t68mr5176473pfc.140.1573658388879; 
	Wed, 13 Nov 2019 07:19:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:06 -0800
Message-Id: <ec563bf0009e1124adb966130f610b9df291fa19.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 03/25] nativesdk-meson: Remove some unused variables
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:48 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb
index 1549357..1756f34 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb
@@ -16,11 +16,6 @@ def meson_endian(prefix, d):
     else:
         bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
 
-MESON_TOOLCHAIN_ARGS = "${BUILDSDK_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CFLAGS}"
-MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CXXFLAGS}"
-MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_LDFLAGS}"
-
 # The cross file logic is similar but not identical to that in meson.bbclass,
 # since it's generating for an SDK rather than a cross-compile. Important
 # differences are:
-- 
2.7.4


