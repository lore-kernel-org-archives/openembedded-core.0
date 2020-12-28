Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.2421.1609185897436147074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X5wfFf8P;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id b2so10781755edm.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vj5mo3wIWHzOz0HQy2WiAFsTSl/VEpnxLnjLBy5EpCo=;
        b=X5wfFf8PV/6/XrkFN8KZjX7hfgH0aYHZfTshMoNpHk+uhQ/LrgV4LC2jnTloiYtnMP
         g18OfWJiPYTcuAoqE9KxJgKY0HDMPp7REtwEtFjo/4UY9qAm/7ue3JPuROQYxt2LKGL4
         qFPkjBdpSQfjUDnTaRcaYCRWAMIqB8mgsGQKb5szmZeiJxMyDIh3Iz2+zO/28YSjDH7A
         OzcdNVXD+EMRfkEUnOcYxSo7TgNOIGpplXoA1g4XAousM2hnXUfJS7fn8ocjfYBHfVYh
         KCyTiyDW3HO5Vp3tBbOHlgvXaVYVtuf2ohEQ77WPRByModkslwf0+MYmYpCSGHmd3W/1
         3qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vj5mo3wIWHzOz0HQy2WiAFsTSl/VEpnxLnjLBy5EpCo=;
        b=SXk8e80/i7SCizi4RPD+2o5y7fAGvtXiFku2AV15+miuW65FBAEv0USX5ZYOcepylC
         wCwIf90vizKPaO8T8QVtv/3B7+tc3EMUF600bKjQGHPnGf/5giqTKezOydRf/dq3wT1H
         g7DMo/Tw71Fr5br3TvdM8UEnaA5vNF1ht+1/aHfKtIda7svoJHGkEZPsIpqRATYazcbY
         daHqMOjf6nlw9Sd1gxw6Y8mb6UQ1i2+j3pV8AhO6zHMbjkECH6Hkky0rcYVGD7L9zpPq
         geqdYaUpLhX0o2EOB8YVxf7Z+raRkP8XkWHUazaGfBVGwJneE73QmiOqMlIVekR2itnJ
         bZlw==
X-Gm-Message-State: AOAM5336OM5PY/YwPfwFGir9XRC9GjfkS+HxZBlRYPIq2SuPCrx5RHQ/
	5lb3AgeBMpNefwRJwTiyuGUqaGEx2z0=
X-Google-Smtp-Source: ABdhPJzbbrhS93K4ukkHNh4NouOqDA8bbM/iFfNn8h/bEG6N1pIsqjI5bisumtA+lxlBcbPwtDJsGw==
X-Received: by 2002:aa7:cd63:: with SMTP id ca3mr41454220edb.164.1609185896040;
        Mon, 28 Dec 2020 12:04:56 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:55 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/22] gnu-config: update to latest revision
Date: Mon, 28 Dec 2020 21:04:31 +0100
Message-Id: <20201228200436.78130-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 980ed63415..32c1499a30 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "664b772118739dac69ef8c39abea7e02973ff316"
-PV = "20201018+git${SRCPV}"
+SRCREV = "c8ddc8472f8efcadafc1ef53ca1d863415fddd5f"
+PV = "20201227+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.29.2

