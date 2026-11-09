Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9898.1794192578683404347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 18:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WnYYTjJ8;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso319848c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 18:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794192578; x=1794797378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uErU273+EVLk07jQL++6+f+kfCMBcFP8TjSN4yHW08Q=;
        b=WnYYTjJ84LpUDosEK4C5Mq9Hy1ntXgFSP8J1fZp3dafzEffr7CluX8o9Ak3cuaee63
         wzJ+Q+t46lW8GK7ScphSyUshkSe1MLkySwXhLA6UssJ+Tq8KWvNh7N5X45iHlylIE707
         6POtfKIqt8chE3pWrY5DcXUiOB/r9tFjkk7J/wj0rVf9pzuFMput0zjokWpeRobnm39V
         dK3AIMoYpTUmsV3jO/c9tRZnEK/ul7PtCL5ironPSqjNqr1wWeyGLJ9Rfs+me86/9ewN
         LGXLEbxs93KvvfPfg8oiu8Kq54+ZwyXnPpo1h6j5yEBCE9nJXrdWfeZeevy+DuSLTMUV
         32iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192578; x=1794797378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uErU273+EVLk07jQL++6+f+kfCMBcFP8TjSN4yHW08Q=;
        b=RVl3X2/L1twR6epEaoyYfiwIdGIRef7If6gKiZYkdG7NBo6EGjbNhqMaZHjlucLG5S
         BnWJ+tSPXvUGcyTLH6p5GaWPT+Vc3aCzJDfyWbaIB0QO5FPox+YEBXf28PQOrc/WrTGk
         T1KOk3e7IBKWvVwTwfBHZP2K9R5qi3zDFcbIysFTB3tQByFA3ys2FQYuvs+IvkTQFbqh
         0TJTGJs998GgDqxCng/2xll7hVCXfTjp3X1EXx8CFFtG/CL23vkcPHpRyhNh8nlEjoqn
         3FlnnYN197SgaqCLRfEnaR1ri3whYiFYYeoOuYhBlP7vMInmtwzwUTjxOW50gNHVasyZ
         5+jQ==
X-Gm-Message-State: APuU4Z+O8L5Yk6whHoCl/STT5debzb4iP6eMtJRXyh5KzDSUW/LahsVq
	RJeATPfJCfPXNN/P9ECN7K2UMNSex2nnr5W8VjwO5IA9x1kA5Q6Xe6nycGu8jOETDLI=
X-Gm-Gg: AYBFou2ph2ciI+kUBa4u76M0zx29k7xsihqvmysGZLrXnA7uGIPMoTbjtAt6T5FWbYH
	J28ZXoubdlKuFenZvAYGMU3z0Mc+rNL8wOcLAJ6HqrkqrCG17hgvHkFjyRZEHZbLi9Jzy4Hum2/
	y5hzmHVuDQbZAVu2V7SveYR6ssT/5siaaxMH4rXNoG/bkCAStOT9mn+wh5S6sfiI68xUNt3Q72f
	GEKsWvgOcMq+uuDyCMSsL47ck5tYpfAHNhjASY8mRriU0y+9qogCvbgkwssW1dwRAKPBw4Z0oga
	v81roUsvU1X1NnYcCfnbxqBxGJe7+aiLEaCi5FoY2hfZxjz8UusuOf+f8gTC+w75g4FPiSwkKxT
	TXgk53Huxrpah4JH8eadrpBG1BSGKm1XfyZvT2YP+z8G44ASeNauvjcZ+/WJLJn65T4RmvO/GEy
	5XFJ9dJ6+p5iU9I90F31HCIzTEFoo+Etbz1SsP3MFMWMCqBNC2kwvX09Gu1k4qhqras3IPBAhkX
	ES/KqgX5tzGEcPWIo/LdoDfWvx/pSchEXeRi50dH5UH1WySnuFZ7HyoQ8f6+lEVzp7B8xjHHmpO
	hMo6mRlrGyHlp8jV8nnjKCVeIB5rVHI3Fd7KnXA3yoAXhb3yqkfQCv6Gz3sKdPu0H89YXOtuwp1
	W6mpIJNirudrx1TZ20niB2zxhfWauMMfkdSA56xB2mFLSadDH02y+Bo+3HfVOLzlOrwItFUy9at
	cqAVAq1gxBecDFlDnbFvHJjWmXT5hX0omlFggzN5K7mOLg6ogbKHLwo9X2niv6y4iPc9+vk43Fl
	U3IPn9aRWE7uux9rJoG+GE/G3AyAvBk79oomT4VGTff2BV6A9cpCiwtAK6jK/WHdWga75GWbT9Q
	QbeA
X-Received: by 2002:a05:701b:2306:b0:192:a481:361 with SMTP id a92af1059eb24-1b39fe8a504mr3747851c88.7.1794192577342;
        Sun, 08 Nov 2026 18:49:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771f0e0fsm12497226c88.20.2026.11.08.18.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:49:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] dbus: Create the transient services directory before running ptests
Date: Sun,  8 Nov 2026 18:49:31 -0800
Message-ID: <20261109024931.93787-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 02:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249782
Content-Type: text/plain; charset="utf-8"

integration/transient-services.sh bails out when
$XDG_RUNTIME_DIR/dbus-1/services does not exist:

  Bail out! /run/user/0/dbus-1/services is not a directory
  FAIL: dbus/integration/transient-services.sh_with_config.test

dbus-daemon creates that directory when it starts as a session bus.
dbus-broker, which provides the user bus when VIRTUAL-RUNTIME_dbus is
dbus-broker, reads service files from it but leaves creating it to
its users. The test only passed when an earlier test in the randomized
order had started a dbus-daemon with the session config and so created
the directory.

Create it from run-ptest, owned by the user and mode 0700, the way
dbus-daemon would.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/dbus/dbus/run-ptest | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
index 54f43e1f68..71e142a706 100755
--- a/meta/recipes-core/dbus/dbus/run-ptest
+++ b/meta/recipes-core/dbus/dbus/run-ptest
@@ -1,3 +1,9 @@
 #!/bin/sh
-gnome-desktop-testing-runner dbus
 
+# dbus-daemon creates the transient services directory when it starts as the
+# session bus, dbus-broker does not
+if [ -n "$XDG_RUNTIME_DIR" ] && [ -O "$XDG_RUNTIME_DIR" ]; then
+	(umask 077 && mkdir -p "$XDG_RUNTIME_DIR/dbus-1/services")
+fi
+
+gnome-desktop-testing-runner dbus
