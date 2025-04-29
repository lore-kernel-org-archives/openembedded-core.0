Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B538C3ABA5
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 17:47:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.527.1745948854626594863
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 10:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwVHhLAh;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf257158fso36424145e9.2
        for <Openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745948853; x=1746553653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QtXAIqXkcVgmKiS+JMacnFxDw8kFIEEYTsUGKmZU76k=;
        b=UwVHhLAhp6uRuUNVoc2gwf/Yuef9ObQk5/5RC+SKcBtRx1+eb+gOyglb4rWAzVWo62
         ut7AGK33QwNXYq3ITILCk6TUAZxxaVyucybsM84itM4pHY59uhaT4u+uj6enS+aXROpk
         IvJjN19jk7ana4S8b+40FlszjfKa808SxiN81SF+fu6gtgDqjcBwWGca6WVzkbuVzeZQ
         UDotR6AYrWUhoVK2wS0L2uR5GINA9qh9cA+03Qbh/F0njWaPa8sgbwjnTgsBGLFtzcdD
         MhExUKumqezE6GIi02bbue9ikm9KGNuQi3Pe6o50fdyV+xEqVnh4yR8bgDFzqas3vdlJ
         7tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745948853; x=1746553653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtXAIqXkcVgmKiS+JMacnFxDw8kFIEEYTsUGKmZU76k=;
        b=Zq96MCset4GcSvGbkxaVTlFxp07RUnBJJ5NbpMLy37wU9SxfFG0yQ/74v4mtiWgKQz
         Yx8OW5MVmHutYfAaS8pMVTaUO6DQWYTlDvVMUI5TUoNbPZEClF9FQntlGfCF8zsbEgy9
         qZUia1boBUg7PZAwaKbb6buzukM/9dcRK7IPl4nEf9B6fdHHXKbSODjjGziQOUgjZ25M
         Xe/vLbb3X/SkZSkqbe/pArncL+nSEpcMbqUqDeC/7PwjbZ2IZBZRMZsELnWdkJVa5aL7
         VacQ6yUzKO7fAGJRGYl3EnRBjKHKfP0G6UYHEHcoHFRbsty7AiyRi7AdnFKQNF8+PVPM
         s0XQ==
X-Gm-Message-State: AOJu0Yzp1ND+0tr0Kxy26kfbb99kEuWLHARCZ9klJ75GtlJBcxKqvgS+
	55+fdSSTrVu2F6s/Ybi714iS8/oDrAV53snbRcgn/Po4mIBm8izGEfU+lgKW
X-Gm-Gg: ASbGnctcaRYpNfw8TdtwPfB3XI1aMRs2b5Ai9BXV1cRIiB4v/aqPHSOsANRrJhUxUWO
	8nBl0lejpiCYOMqx9yuT6SYx56wmPnwrnh6QdN0R7qnMriPPhcXihTkkfMo/VJDEaSKz8tkjGj7
	3rbrbBqYJwZHcmnJzaAdKg43wYklcqJnNah3Ir/drxy4sAUYIHm1CdD6XKAVwjao/R1ciJvyK71
	npzQkLuYfKv/uVwKCoInWDaFmJ0lha0V6NHqF8mB27kyp237nUbe48rrDezz/PWZH2w7H3SUFPS
	zjCMm99wuiKvk7gydgEzX+iCc68W7jrvQKAGieL+n0IQ+SGlaaPGqD+ve8A8dgfgbMrYTyMre8b
	m1tgd
X-Google-Smtp-Source: AGHT+IETD9IUZShFLP4S7Bbp6jWw/R/INA2orZlaDG0hea/56PIWGautLmkZ7NGvMeTo1Q6XZ3Ms0w==
X-Received: by 2002:a05:600c:3152:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-441b1f3a9cdmr1633175e9.18.1745948852308;
        Tue, 29 Apr 2025 10:47:32 -0700 (PDT)
Received: from slackware.local.localdomain ([154.47.27.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8479sm202393605e9.29.2025.04.29.10.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 10:47:31 -0700 (PDT)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Maciej Borzecki <maciej.borzecki@open-rnd.pl>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] systemd: Password agents shouldn't be optional
Date: Tue, 29 Apr 2025 19:46:50 +0200
Message-ID: <20250429174650.127823-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 17:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215684

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

If extra-utils package is not included in the image, you'll always see a
warning that password agent is missing whenever you start/stop a service:
Failed to execute /usr/bin/systemd-tty-ask-password-agent: No such file or directory

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/recipes-core/systemd/systemd_257.5.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.5.bb
index 2a18445eba..acf97517a9 100644
--- a/meta/recipes-core/systemd/systemd_257.5.bb
+++ b/meta/recipes-core/systemd/systemd_257.5.bb
@@ -602,26 +602,16 @@ FILES:${PN}-extra-utils = "\
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
                         ${nonarch_libdir}/systemd/systemd-resolve-host \
                         ${nonarch_libdir}/systemd/systemd-ac-power \
                         ${nonarch_libdir}/systemd/systemd-activate \
                         ${nonarch_libdir}/systemd/systemd-measure \
                         ${nonarch_libdir}/systemd/systemd-pcrphase \
                         ${nonarch_libdir}/systemd/systemd-socket-proxyd \
-                        ${nonarch_libdir}/systemd/systemd-reply-password \
                         ${nonarch_libdir}/systemd/systemd-sleep \
                         ${nonarch_libdir}/systemd/system-sleep \
                         ${systemd_system_unitdir}/systemd-hibernate.service \

