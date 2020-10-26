Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.11053.1603712361287909514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mLUJD2p7;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id n15so12072878wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 04:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vsWCr1hM5fdLzppy11r8P21st/KsPTGapSWo32aIEWU=;
        b=mLUJD2p7mXfQgOijhUnbnc/Nf8cyrqfnaFfxtPLKOvDdomhVZm10hcKnjkeFPeY3+6
         qxCdqXIlIU6ZvB1PRqPOdGOpDbUm2kBEffuDuS2Bost5W4TIP4ZTsAWoq6m87Fx2JK8i
         0wKXmBhic53+Su3mM1kRSOLaVVDd5ZGfJx066o7KZWdLNujSWsuvLHOFNoaBQQoP7E1M
         eiwW+kcek83F4ZP48x2UIvbUPLuyuizRHehV1xzEpuHhSneYVBDF/xzOsJHJ7OUzbp+Z
         LdMpiWnl28VfL3KXKvwxP5C5kab6Y7f9GhEBqzNAolh2DuCcXD0b0RgYMWBoF5ScDnbZ
         6eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vsWCr1hM5fdLzppy11r8P21st/KsPTGapSWo32aIEWU=;
        b=LgcoKcgp+lt8llYlP3+g80o//I8AQ3VT2hCM3NvgDueNy0VNO7ax6WjL4GjLxMSQFh
         FAjtEcMXxFFaRS1ZPIZfGd4veFmyti5q5ZNQVspESp80EjsM8Z8n7ojlai/o/DsyGrVW
         MPNZRbGQ+OvxNdaJLdX17ZdHgdzmRYcleiAR8qPInHR3L2x8DPRLXMigizdKAi3KYT6u
         wVnC3QPw9OyuZuopI+Ca99IGS2sJkKauDjxy5yAu94HjR3eUg5KRajUsOABSIo5vlmfW
         LOjCTaIiXo/Rn56R38QjZG3NioXJX/DIO8OEZgDC+OapGHirHLkwVAIPDB3tIVZlnKM3
         HhQg==
X-Gm-Message-State: AOAM533hOv1tHDyk6tytnMwktTXGQ/9l6X+QxyywIFscTYicirZC3PCm
	C9P0et7oyCOTDJy12hv9RL1J9YxcpFpwEVwa
X-Google-Smtp-Source: ABdhPJxxAqyDnqD2rsDd+GqMscbG2Ijs5FVIse7ZTyCZgWJrn7JHFC8/RCo7FlnRBkgUue/igc5/TA==
X-Received: by 2002:adf:cd0c:: with SMTP id w12mr16982026wrm.305.1603712359012;
        Mon, 26 Oct 2020 04:39:19 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id d129sm20348493wmf.19.2020.10.26.04.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 04:39:18 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 6/6] maintainers.inc: Add Jose Quaresma
Date: Mon, 26 Oct 2020 11:39:06 +0000
Message-Id: <20201026113906.2217226-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201026113906.2217226-1-quaresma.jose@gmail.com>
References: <20201026113906.2217226-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jose Quaresma is responsible for the maintenance as follows:

shaderc
glslang
spirv-tools

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7935f968c7..ff80ef687e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -213,6 +213,7 @@ RECIPE_MAINTAINER_pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-gmp = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-glslang = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER_pn-gnome-desktop-testing = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gnu-config = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-gnu-efi = "Yi Zhao <yi.zhao@windriver.com>"
@@ -641,6 +642,7 @@ RECIPE_MAINTAINER_pn-settings-daemon = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-shadow = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-shadow-securetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-shadow-sysroot = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER_pn-shaderc = = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER_pn-shared-mime-info = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-shutdown-desktop = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -648,6 +650,7 @@ RECIPE_MAINTAINER_pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-speex = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-speexdsp = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER_pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ssh-pregen-hostkeys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.29.0

