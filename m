Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A617C3ABDD
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 17:52:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.109139.1747245167058637413
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 10:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g8NCl2Yi;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso684675e9.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245165; x=1747849965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CbfkMpJOC67h2Bb/15uQtMhn6lrnZshAnzLyX/g0xOk=;
        b=g8NCl2Yi5v4lsrf3ZcDf/QxnIglvLYqS8FjSYqWhR46fWn4FesHkB+yHFBi+ev3SCZ
         Cdru7c3iZiSSoko+OzzGEOfVwRdRsvhPHR1znsC6aC7zGBl4E8ak+qofOi7jFzOtFpwy
         j1XbqkDKA7t3worw3wTy3Idr+L3RxrPtSgw60p6ChcnDpSOnkDoZQ0VeeIc1jHukf/qp
         nMXBDin5wCmhWBYfdJlQRB5bE6IfeexK0fY0D6FwUVV9EYfFDZKM0cIcCUeoPCQSHZIC
         jpmrRqWYAbYlKjZGP5KzWzoCld/bPERQat8EZ/1SA/tyl+SH5X3KBi4maPKyi7TDsclR
         1krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245165; x=1747849965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbfkMpJOC67h2Bb/15uQtMhn6lrnZshAnzLyX/g0xOk=;
        b=wFS1W7/qNR+peYg9CPCjUT7RVnSq+Whn9kF0pnb4NjLDWG4KLhVuD4jVd1a+qg18UV
         HleOU0maH5R/uJFd1kavWMRqa9i7aTc1v/4ds41Pa2YKdmS6b1SzTd+4Cuy+3pumJ4Ld
         tGchrsNSSucYEA1zfVi1Yer2Q93sItUuikXb5/zYofOmEG1DKIMPZ1tBwqZG3ORiG6uA
         4YMw85/ro8IPDTPw+vb7WBLsJ8uYinjtJeNYRb5S80l1A1Azxqm55l8j7uSYXwJTfY7u
         wG/IHqG9XyZgeAkP0N6lfG9XiDLLtGKwlC2LuA2mynmRrWcHMRP66mZvRtC7QELqe1un
         76rA==
X-Gm-Message-State: AOJu0YzFe6TiBhV5dp87hVT8KefP1xW7iXXlxVfv8pGrcK8Uq8yfV02k
	wgOK9ZintfC10KgKIoJ2763oUaNGsfTIIGEq2yoeunSmUCCGne/33mzaLTju
X-Gm-Gg: ASbGncvul76C0biPMeaiBvpUUCWXJP+XXAb2OKIBp2v1enBOgftURncYuESGPtDPq/K
	tMcuCmieb+AEcS7VK3LOzbAadNuccTGoe/n5VfA4A2cvMKI8bZCz1EtZhd6ROxxXwm/Xy9nEuBR
	GEh1zbGUvOoz3epi0g6ocMkcruSJ2aOlASZUTk0sgOn0MJCwtA/6PWF+tMnJsiUxp0co1GEVpX2
	dPcFKeSluYkYfwhJfeHj4dKsb5lek7S3QzD7pMNw/B+tgEl0gSvivQ923WkkSg7WkBpX8NozkyF
	IIZ5R4zXl08i51lf7TmcuCJO2pRdBLQ7idmFrfQEuuvnUvqvFobj/NMILvGX1xGABp8XRclPgAo
	O5GKCW4gHU4w4KeY=
X-Google-Smtp-Source: AGHT+IFX6wojcuN0AnVFm/APA/aSLF57Tb2iPvYFPCmKP/5QAXE0NG8C7dBfMX1x0QEJEpNmZcFSKw==
X-Received: by 2002:a05:600c:1e84:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-442f20bb18bmr41678305e9.4.1747245164692;
        Wed, 14 May 2025 10:52:44 -0700 (PDT)
Received: from slackware.local.localdomain ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8b1abb5sm631495e9.28.2025.05.14.10.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:52:44 -0700 (PDT)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [scarthgap][PATCH] systemd: Password agents shouldn't be optional
Date: Wed, 14 May 2025 19:52:10 +0200
Message-ID: <20250514175210.129210-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 17:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216519

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

If extra-utils package is not included in the image, you'll always
see a warning that password agent is missing whenever you start/stop a
service:

Failed to execute /usr/bin/systemd-tty-ask-password-agent: No such file or directory

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/recipes-core/systemd/systemd_255.18.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.18.bb b/meta/recipes-core/systemd/systemd_255.18.bb
index f85ad61080..bb9dc3da33 100644
--- a/meta/recipes-core/systemd/systemd_255.18.bb
+++ b/meta/recipes-core/systemd/systemd_255.18.bb
@@ -592,26 +592,16 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-cgls \
                         ${bindir}/systemd-cgtop \
                         ${bindir}/systemd-stdio-bridge \
-                        ${base_bindir}/systemd-ask-password \
-                        ${base_bindir}/systemd-tty-ask-password-agent \
                         ${base_sbindir}/mount.ddi \
                         ${systemd_system_unitdir}/initrd.target.wants/systemd-pcrphase-initrd.path \
-                        ${systemd_system_unitdir}/systemd-ask-password-console.path \
-                        ${systemd_system_unitdir}/systemd-ask-password-console.service \
-                        ${systemd_system_unitdir}/systemd-ask-password-wall.path \
-                        ${systemd_system_unitdir}/systemd-ask-password-wall.service \
-                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-console.path \
-                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-wall.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase-sysinit.path \
-                        ${systemd_system_unitdir}/multi-user.target.wants/systemd-ask-password-wall.path \
                         ${rootlibexecdir}/systemd/systemd-resolve-host \
                         ${rootlibexecdir}/systemd/systemd-ac-power \
                         ${rootlibexecdir}/systemd/systemd-activate \
                         ${rootlibexecdir}/systemd/systemd-measure \
                         ${rootlibexecdir}/systemd/systemd-pcrphase \
                         ${rootlibexecdir}/systemd/systemd-socket-proxyd \
-                        ${rootlibexecdir}/systemd/systemd-reply-password \
                         ${rootlibexecdir}/systemd/systemd-sleep \
                         ${rootlibexecdir}/systemd/system-sleep \
                         ${systemd_system_unitdir}/systemd-hibernate.service \

