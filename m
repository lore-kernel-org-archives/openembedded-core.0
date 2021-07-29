Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.5337.1627534211037521257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 21:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J7ZiriPQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id t66so4783746qkb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 21:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r8WEjK5WwR++Sf6BYnwU4Fcuwx/VbbTFVNdmG0IBcQk=;
        b=J7ZiriPQX788AED6g8VTlJqgxEdyh8M5tqiACVIY3NzpYXinYYrZRowaynDtLSgO7k
         lsbJ9eQ6RF8YCn+V2iThXvbRpZUwMExC+l+iZHutRvqGy7Fiz2XGcpHHr6TK0B/Dn5w6
         NPyTcvVEcdkI/g2LCRXwtQ6QV2VX4MN1Rm7PjleDSqii3fe6pSvT1illByzbzmsVmECm
         aOG/iyw1fcYH/gwBgRemnOzvy3d/Pey02AQCqmtspKOz7g9sqoo4Csphww1Mh8EMMxiW
         /o0qeCRYOvNwR5clBF2rVy4BHA3//rAhq7QWh/wpF7O2ZG4GPuk4d82RnP1ex7us16Lh
         /S8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r8WEjK5WwR++Sf6BYnwU4Fcuwx/VbbTFVNdmG0IBcQk=;
        b=RihYd+iwjJ8bkTHEgqXKH2ZPT5jlQwXp/RXk1GAECfvj0bVq5NGOmxBVR5HR/TsncQ
         lnmsvn4beAHwSj7QGFXkjOXSnGbvUjzl5xC6zNT8TaTODRhEVrAYGELfgtek44vEI/px
         8B+78xQR33V+OWrM7p5OOC0XQQLf7QXPDA2ZROYg5a/Hq+fRecEF4b1aNLNTM7rkWP/D
         pIfSHdg87LSPwkTwTdlcMFtz5Hh57dxaHpk5O41HSd21ubsi8rLo6/V0mcvfWrogTevq
         eM7lhlFHiDiOe3BQ1zgiT2QWILEd6iYU1qsLHLnmJcRr1mckETRcRmfTMEFMleldjrv7
         Fm6g==
X-Gm-Message-State: AOAM531wEAi9f0Zv+UKcy0AnfDe9f4TMYDe6aWIauorXSk6Mh3iAIlDk
	6Qy8BpZXRUZK8GEHWRliqT0=
X-Google-Smtp-Source: ABdhPJyJpTmDBefEUiWbkJc4l4MlLlyLIgy3ZYa+BznWN9hMGlddIxZScqKxcFA2PK+pGZX+qYThTQ==
X-Received: by 2002:a37:9c04:: with SMTP id f4mr3255553qke.173.1627534210225;
        Wed, 28 Jul 2021 21:50:10 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id t26sm826147qtc.44.2021.07.28.21.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:50:09 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/5.13: enable TYPEC_TCPCI in usbc fragment
Date: Thu, 29 Jul 2021 00:50:03 -0400
Message-Id: <94196b0e2d1b21a95f1c0b4f959c7bde024dbaa2.1627533955.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1627533955.git.bruce.ashfield@gmail.com>
References: <cover.1627533955.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To make the usbc fragment more generally usable, we enable
the Type-C Port Controller driver for TCPCI-compliant controller.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.13.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index feaad79d92..30c602fda5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "f7609685b99c816483dd1eb4d3d7cfd236abcd8a"
-SRCREV_meta ?= "676addb3befc0f44818ed231d90c58d8e4fc005f"
+SRCREV_meta ?= "45ba17c2208f4b39c36fdb748df5929b8f6b6f83"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index b2e7a2f512..33fe1ea62b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "52d457436c83b3ce994a12d5387c532df7859e3d"
 SRCREV_machine ?= "e167b61e5f9f6e6de8d57f72ed022ea6cdf9ba85"
-SRCREV_meta ?= "676addb3befc0f44818ed231d90c58d8e4fc005f"
+SRCREV_meta ?= "45ba17c2208f4b39c36fdb748df5929b8f6b6f83"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index b26bb22f3f..6e08bae30a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
 SRCREV_machine_qemux86-64 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
 SRCREV_machine_qemumips64 ?= "c6c25c0c1a64480f255a9c2e86895db0aea8b92b"
 SRCREV_machine ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
-SRCREV_meta ?= "676addb3befc0f44818ed231d90c58d8e4fc005f"
+SRCREV_meta ?= "45ba17c2208f4b39c36fdb748df5929b8f6b6f83"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1

