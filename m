Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FD6C10F31
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.70922.1670929891962143381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c75nIuxa;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h12so15198105wrv.10
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84mDLimNvm8JMxnjNq9t9LYk+kdty3UF0k2paROwB1w=;
        b=c75nIuxaQ21QNkuhVeT9YqTfVE2vdWngzaNI38CtFQSA0fI/jwc6eIc/otj+8tKIIP
         lU5XIDQUy1z16VLNVVXr2s/u3rUEOGPqbX4+3i1wsZ8DHGkCU31aAQOwMJb/67dlSaKs
         u1iu3CI+nrNUgjewDwLU+s+apPeBz50RGynQ2VUFZTLw9R8Widg5323kzLfDVPYw6tQ4
         RlQLDyD+RF8g1JRHs+Zg7rtJa5cPBmCOk6hIwlQ+MUGGxIk/v3XDhKcOmOgd0s4Yv2jN
         oWoXsohCknaY33lic3ycBO1PluSL0R8he5UUu6d/ke0xnoFYQfUmp/hJyLej8Sw47GDE
         DR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84mDLimNvm8JMxnjNq9t9LYk+kdty3UF0k2paROwB1w=;
        b=wPMa0C/Mm3TrS6kM1SmrCx0AYvuC5f04BINxjreE+Tvodol+GVxjJnu9HQR6EdXduQ
         aIEC0Gc5hGF9ndQyiQKNXhyOWIQiMsBS15iGH03LX1GZqZPj8iYQJ5qhsW3V2RF9fDVL
         zUIrVPe7LDaeJ9HdXNXvAPzNGke4RM03mCv3vPHfWOECXKngac8vNkSeS//1dg4IMlMp
         OxYPkCcOcKRp5MA0t+Th23S7FPtGjxPFdjanjt0IxKLdarAlJK+abt5Dsq1cY6+zkvNv
         K8Vu1J1Om3d1PjlrlZgy8vxCM1ost64zqYeYsMuK7zps9Y8yuWJiWZYnLFZ/kAg+lBTZ
         zIIw==
X-Gm-Message-State: ANoB5pko12ABnbsjhCwNNQd/SVKzUYvFlnz9cQeQNa5xAHSmvkhPGhK0
	bxn8lJY7PQ6cx+6rFiih9956e4fOaBU=
X-Google-Smtp-Source: AA0mqf4qKNwc4SIYJEHqGlm89KvWAEYJ+t0SYhWX4cqPqXr/ALJ9ZEpDnjwnZuSlXTOJDd+YIeOoJw==
X-Received: by 2002:a5d:5270:0:b0:242:82f4:94e8 with SMTP id l16-20020a5d5270000000b0024282f494e8mr11649670wrc.27.1670929890508;
        Tue, 13 Dec 2022 03:11:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/24] libxpm: update 3.5.13 -> 3.5.14
Date: Tue, 13 Dec 2022 12:11:05 +0100
Message-Id: <20221213111118.149697-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174521

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.14.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.14.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb
index 4f0a5d7ba0..1eafd8dbf9 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb
@@ -16,12 +16,12 @@ DEPENDS += "libxext libsm libxt gettext-native"
 PE = "1"
 
 XORG_PN = "libXpm"
+XORG_EXT = "tar.xz"
 
 PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[md5sum] = "6f0ecf8d103d528cfc803aa475137afa"
-SRC_URI[sha256sum] = "9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25"
+SRC_URI[sha256sum] = "f7eb8f69c039281def8258ae6859adb5f050fbe161ab3d6a2d6ef109a603eac2"
 
 BBCLASSEXTEND = "native"
-- 
2.30.2


