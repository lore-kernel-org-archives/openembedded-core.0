Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE19CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 07:22:08 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.45658.1756711321120702362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 00:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rn7Dchr3;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: dpmin7@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-770530175a6so2360446b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 00:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756711320; x=1757316120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88YpHZ3iUy0Y3hFAU1mJUlyzVJcTLxvDIeg6i1x0unM=;
        b=Rn7Dchr37n05aRWA/pWl+6VhkfX0fgl4ttxxxbZFN4ubdrFuqKbimcX8iekEzz2c18
         mz4roplpejiR8gp4Qsy2cAkODy0zxo4UcQKfMUtRn9u2TPKnjvNE/i5d6RUFRqj7iC8L
         iVXqvmHuaP6YJgPGZCZTIJMqPHAvVfw3ET07WvnVGgGgUZgEAfnFgeYrnw2vf7lkbB8Q
         yBvhxwp7cp90MmE/AGGpWTCeZKZGyjfSh/sw0Uac2K+lznPmSu2yCViCyugrASG118FL
         sjxG9xVnCWtEDOsJI7r9S/na1/DXw1YAkKIyus+jh0i42tYKNstrJ4nbFQBdtgP2+Byd
         EBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756711320; x=1757316120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88YpHZ3iUy0Y3hFAU1mJUlyzVJcTLxvDIeg6i1x0unM=;
        b=xEK0iRLsJS3FXTEjGTPmMVD8/m8nAWBPQIhsivlO02q6VrDi5EhIW1B1eFJdixb6Ma
         Y3BFqyQWbmILQb4Hd79MIfokxt8G5buLzPVwVBdHaW5D3hsJyavrhAHtMrVRaAjNnBYW
         ln4BRl5nW+t/0joHKsWfmKdJDbEnixnvDwXb27tCvmMfDYaRVWUXX0HRJQx+e4KmPlIH
         1DzaYHTP40SRix4Mzwfa5u45WqOMx87/BXShQb72SsFe7isO/f7NDDDxyeXfjlnUKGur
         8ItN2vo0oZngsQ+2rr9lZ3YtqW7DZYh/Ruqg8LrVZ8WycEts1mjZkLPHQna+Q0HEidzQ
         d3og==
X-Gm-Message-State: AOJu0Yw/OAjAq+zAMyhrd+8uL8PEStudVyv/k35WEzDWxHQRcQTg+RJ+
	5UN9l/9iwZfT84rC8h/YS4KpN8iLFTRNU6/agmuZfaXYANeZ35sg1hCRaRYBZQ==
X-Gm-Gg: ASbGnct0xXpxDx5Fjtii3+RFUyqxT0Yyu3luZshW/s4JSd4Kdwr/O/PS+JtQAScgyy2
	4WOWeTckZ6cGTv3kwhpu2GmkiRouwosznDBXnWegp14NZFr0/6KT5rFNVNG2uwhRmroeB8XQiGK
	TeUcNjl3R7JM7mk6gIuWiaNv8wa6wfCedfMEbzmKfZNBpq3IQ4iFEatB4A6nKipDbcFP21kordX
	eF9Hj+LHsV3HXXm8XBJ1M4haUbeSgKAsxQfgsSeUqaINLEdtKrThZmb2Ir62LSwAfUKED4T51tr
	AGFg2zwwng3MyINpVpaRDO19h3kluSMYWOW9QkIdzfEKru6Bh4Rzl7OiEe9i4V3VAEyCOyr9NnL
	kPXQ0g+bz9n4=
X-Google-Smtp-Source: AGHT+IFF+LqKqm31fEG6k2ysYT4IHkUWQC5ts2LVj/Jt++DYLUqo1v6Hc6m6Ke9jLKiuUhN3uqlhrw==
X-Received: by 2002:a17:902:d4cb:b0:249:2c76:54fc with SMTP id d9443c01a7336-24944a9e7b4mr90971995ad.39.1756711319873;
        Mon, 01 Sep 2025 00:21:59 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903724b94sm93132305ad.35.2025.09.01.00.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:21:59 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [PATCH] pulseaudio: Add audio group explicitly
Date: Mon,  1 Sep 2025 16:21:54 +0900
Message-Id: <20250901072154.875646-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 07:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222640

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-atlas-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 695f4b676d..16c142130b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -155,7 +155,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

