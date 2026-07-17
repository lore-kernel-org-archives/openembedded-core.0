Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7785C44520
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:54:18 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12716.1784292852845158547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C7sHV/XD;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso1863228a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784292851; x=1784897651; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kVcb7XK1kbVNefulPjAgir0eXvXWuXORFE8lTrcA2mI=;
        b=C7sHV/XDgg3n5npfqEomB0pTjWCsv+stxBSNzqSYtL5Xug4iKjzsDGqxKWYAYETSMn
         ojeGbcth7rp6ZpCatt3DcdgocM3+FCsZRrzLI9nnZZRvNJZUtME7kdjwYN6LxvkU7SpZ
         71HAlv9kN/pDkN900jhVeex9NyBRpKZ92lS/YsX5MyWn/sN6nJKL60SKWyDodztg7ZV+
         4Ue8cJJqvptbyCLp2twVdNC7/NTMaS2xztlKdJtuiuHRIJHiwMMtca9U6UyYtTvYUEVj
         SKgqgpQGNdn7NzrXD4DbvxPFjN+bObDRmnyu+l7nQy6Gfgrx7DeO2WePrzIL9R5p2oiV
         u6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292851; x=1784897651;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kVcb7XK1kbVNefulPjAgir0eXvXWuXORFE8lTrcA2mI=;
        b=ZrSG4uUYE7o8y8D2xqCeC0KRAnRHJLd6keEJ3pWh5mtRHP4HHRv/f4vPdal5/D65Pm
         LYrWHVAS/y1ylhtVA2R00TI831QufHL9dW05Mw5ciKQZvRpWbeuAyCNrvhMGSXjNGzcI
         MW3IUmnCpdjgcGyeSNhjjGLFSPxPmOFwYaUk2LTtR58JfGuGsk+VhwskLXVvUKTV1cuf
         BWDL5KLz919rd8n31e9TfaTqlvgIHjJ1avVp5ZPUCjEd89eZL/Vm26OGhFVYRe4cXnOO
         56BOFFcWUOgjaXxO1cAjt3uENNShn8+DU7jMiUBfaskvNr5JXOPK1qfTTu9+LFbQrjiQ
         ou9A==
X-Gm-Message-State: AOJu0Yw5OtlkYXVj/u5ulqbm0jeLar2s1aA9NGqqqZuwzsFnzHUSZnsJ
	ApQzpu8jMNkYvPbLagLaJtzMDo0vn43Xt3ka7mdAgEWh7wJny0PzjeWGK0dlJQ==
X-Gm-Gg: AfdE7ckVAfTkF5DC5/e/QWJO2KnJp+100T5wEtU1Ew1AS0rR864hn0nLvKMT/1kpO7M
	A4HbTWPI9QLDWY6ldNhCWB3r26cOxxo15XerMjqyORj9J+3A3LBgUDWBolItt+0abv0vFtExXZA
	KD9dQsbHbX2t6UV+q6+Z0f1UTLnTk3FyW3YDiKBGnJ2SqCHu0gdTPTQlHfRvVS2DcrMGdF/7N+4
	2QPq7HpDvVHNZi+0uIUGQtXEgO8qnWAF/Q8eOa/Hp+q6PqD80R8QR/0o6+VmcIcQ40QhFim8scf
	/WESGMElriBhuJjIH7qflITm/Riej392GgEbKl1GxZc0MyJFUOFOWp46NAxUNxPCRLgBzcHl+7x
	pWGTSlfqWamDKAcWGI7wYlFam6L0CWRhalh4s1eRxZlyHFNwT4EP5CgehPKRXCpa4/8BHMcRL+y
	DEz/g/hCNhlAeviXVXp+it1XOGxXXjxNaXYtPlbkqWCA==
X-Received: by 2002:a17:907:6b0d:b0:c12:6bf9:af64 with SMTP id a640c23a62f3a-c1692465e85mr327070366b.30.1784292850644;
        Fri, 17 Jul 2026 05:54:10 -0700 (PDT)
Received: from [127.0.1.1] (185-164-140-173.cgnat.inetia.pl. [185.164.140.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbbf4dsm618199a12.16.2026.07.17.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:54:09 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH 0/4] quota related improvements
Date: Fri, 17 Jul 2026 14:53:52 +0200
Message-Id: <20260717-rpcbind-quota-dep-v1-0-55bc86f09e41@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAlWmoC/yXMTQ7CIBBA4as0s3YSilWIVzEu+Bl0XFAKrTEh3
 L1Yl9/ivQqFMlOB21Ah04cLz7FjPA3gXiY+Cdl3gxTyKtSoMCdnOXpctnk16CkhCTdpKcJFhzP
 0LmUK/D2e98ffZbNvcutvBK3tjO+Wp3UAAAA=
X-Change-ID: 20260717-rpcbind-quota-dep-e0c4820f58f3
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241171

While investigating why non-systemd rootfs was pulling in dbus I noticed
an unnecessary dependency on quota in rpcbind.

There are also some PACKAGECONFIG improvements in the quota recipe.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
Michal Sieron (4):
      rpcbind: Drop dependency on quota
      quota: Drop gettext-native from DEPENDS
      quota: Move e2fsprogs dependency to PACKAGECONFIG
      quota: Move dbus, libnl dependencies to PACKAGECONFIG

 meta/recipes-extended/quota/quota_4.11.bb      | 8 ++++----
 meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: 171af3b2915dd076c8d1b205ff75eac1ebd5a586
change-id: 20260717-rpcbind-quota-dep-e0c4820f58f3

Best regards,
--  
Michal Sieron <michalwsieron@gmail.com>


