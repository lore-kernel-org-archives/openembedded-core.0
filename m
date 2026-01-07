Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD74FD0D175
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 20:32:48 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16140.1767817958761146838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 12:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cbm+IrnT;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7a02592efaso418926066b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767817956; x=1768422756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OUdlpO4lz9oozghQ0VWxKeVQp/DuOh3S4VI5D5TYFzI=;
        b=cbm+IrnTLDf3v2KX4ChsYhW5MSVG+Yu8qyRSfGCDeaJdKQoNpFV3wmJ93iBNemXZ9V
         by98CCXDAVb6EQ9Yvs3k2e3fTzwlSmu8WTzLSVnaLy6Rvpz9uhHkCqcswVFBAZvePPqK
         wJE61vZvViM4C1fyfI2PB9rvYI487kXHBZa3Jvo2o90PpKPG4DWQ6qVequkF78t7q6pD
         lOESxvknFFtI8Ohr7xbXLwZ7/DZ/D9+zjHp7T6LhjHGeKu13uScQL1wrYta1wjxz97H9
         JYDlc3/AEVbJLyPjsfmVM5j4WxjVMmaQqevKE7mTSINujr1Ht1+G3VA3VP6BCZVS22ka
         WgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767817956; x=1768422756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUdlpO4lz9oozghQ0VWxKeVQp/DuOh3S4VI5D5TYFzI=;
        b=RBJDukW8Rgqsvxi3G60JFPwhJcuGInILrAxGdkGz75syn69SjlCOZucT8EptaPrxw7
         p3ha2qCug7xySnVppxlo0H/QYszc5XnWQkjBCNZ6/uOrILrrvtkkiyXHzbNkrwU8lM5Y
         wCxYeW08rTBGrOgywRG6wnYyST9ZhUAeJo8Iv9R25NkrmRgkbw0a0IOolVAriTNCz27+
         RY4Nl/CZlr6MgfZ6MmmsItjlvO0TwkCoUHkt9f6eM4dZ5Xn2EpF4zajVU3RgeGheXAe0
         PUMaaOognSwi00CtSwvmnq2oo21ZitlixNNN8UytgcrCL/yZ1G95zBzbnLwG+mcfQ7lV
         xGSw==
X-Gm-Message-State: AOJu0YyW1A1Nfr3TYyBC36mW9h1vRLR9/CWgqXSIDQWzo+BftyPncDQm
	0NrkB6o24nUvWHO0czJJ7rfks4wVobYj5VLVHIpFKZRQ+uHS/wul/57kL8rPN6kt
X-Gm-Gg: AY/fxX4oTirlVGiSYC74Uv4jbfAxmA+KhuKwtqGuayzCHs4cYgU3pwJc9+AkUJnWlge
	FTbREEwrRuev26ZyHoKzxAM1HaRyFRE+tNR5YMZ1G4r6eAMRQknodDzQCyuN0IXZhqsx4VrFxAJ
	5Um2CdXydttLM9VmfQluIVz2TSZQBvbgTiEFgZw6V7iD3+pMvYnLxy4kihL3s6k6CTrC9i9wJPj
	5geBMPZ/tp79FYBnmhC2FU/wOSfpH93BYjQSzfexufN5RLwGsc2qA/Z3g7TBVFBNGRr5gqRk+uh
	5buT7kNMN6d0Na9c4FZxTGLi7L2Y1bbFYBXQCKa3rWQZWsmB/oUeWJQey1sEj2gQanabUPV4ZS7
	kY0OOjOVLIgH3yd7XU/NbmVMQC9XZ09l2xIp7lLJqj1STKCOyfH7jFfJutc+6mXmW5bQMeR8wW0
	hSQCtDQNfzZbspD/4Lx5cRzqhxg3BxM9mxK5wx7VZ0aUvpSOggCTc43543GSImFEo+Nl9CGmMN/
	Js=
X-Google-Smtp-Source: AGHT+IF2mYlwuWXgLWSBbdITHSfNB+UmRgid/5vUiAIstJ5JTnssq8aZWpZMraGuSL5ZPuRvP4hGNQ==
X-Received: by 2002:a17:906:f5a1:b0:b7a:72bd:ac65 with SMTP id a640c23a62f3a-b8444c3fc39mr375188166b.9.1767817956300;
        Wed, 07 Jan 2026 12:32:36 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511551sm593862766b.53.2026.01.07.12.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 12:32:35 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kanavin <alex.kanavin@gmail.com>,
	Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH V2] qemurunner: Improve qmp module detection PKG_CONFIG_SYSROOT_DIR for qmp module path
Date: Wed,  7 Jan 2026 21:25:55 +0100
Message-ID: <20260107202553.2965393-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 20:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229032

Instead of using logfile to detect where qmp is located we can use PKG_CONFIG_SYSROOT_DIR, passed via ENV to the launch function as this will point to the image recipe for which launch is called.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c4db0cf038..dd1ff42b0f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -186,11 +186,9 @@ class QemuRunner:
         return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
 
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
-        # use logfile to determine the recipe-sysroot-native path and
-        # then add in the site-packages path components and add that
-        # to the python sys.path so the qmp module can be found.
-        python_path = os.path.dirname(os.path.dirname(self.logfile))
-        python_path += "/recipe-sysroot-native/usr/lib/qemu-python"
+        # Use PKG_CONFIG_SYSROOT_DIR from env as a starting point for finding qmp module
+        python_path = env.get("PKG_CONFIG_SYSROOT_DIR", "")
+        python_path += "/../recipe-sysroot-native/usr/lib/qemu-python"
         sys.path.append(python_path)
         importlib.invalidate_caches()
         try:
-- 
2.43.0


