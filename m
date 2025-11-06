Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A793CCFA1B
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 11:16:57 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12590.1762427810258294755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 03:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k/oZWC9B;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so12291845ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 03:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762427809; x=1763032609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cn0BffuU1LIOmKhX9+70XCm25ElAeal28npI/U12ECY=;
        b=k/oZWC9Bwyf/JecHUOmpeHLCSGoDTerGHrA55pE5YBzMJlvQ5+1nzHpGodMs+DGyPF
         My6b/t+KgkWmYmMfaICCtvDB90nJ+DlPiRuMU5K8MGDuWoeJAzaIb6pLgyx1lfQO+jRR
         3h1jY6V5cndGzYLcJIq040DiFKxEsenzHAvtTWrElJriJyInltbVk0a69KGxbOlrCwXI
         SS6FzHaaFu+3t8DCY6o8aVXdF378kvxPxKf0JFTEbeKSVVqt2ylHO3/ZKp8MqwrpASWK
         /Dqpi+0d2s/hM3qdB/RKfANKwEIexBHpVdep7BAiKaBIHXrrjG2ozHIqP2/NkTBu6GpJ
         6ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762427809; x=1763032609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cn0BffuU1LIOmKhX9+70XCm25ElAeal28npI/U12ECY=;
        b=xG/YYMq93meZSm6L0QSqhIdVnIrsTZReXYKt8YFBm3sxuG9dSZqRXpNIV3FRoODhAT
         kD3lSbzuOtz102ZWGiPhITRjdjXil9d22rBQ7sDDeiyDJ/a7UW2ArhXz+6e5/UQKSv4P
         324/Ifhu+ObWmHx8/QiiSBo0EPplErNw6ByChxO3wEikmTgj/tT9jqbOxvcIWE8Efywq
         iwbdwm5Mu+A05Z+UtUpf95uO5sb19rILBNofMN5UFGDG3fhk0UXCKs4/8B/H71t5GP7m
         NtMUTgYUPIr2LSWQfhhQLQ42Rxzbj7A8N+YLp5q0NhORhPkauu5Z7AaK7qzbvZKOxvIh
         vSvA==
X-Gm-Message-State: AOJu0YzgoDqPx9/LpIxo0QIYKlDGAgSP++IhTzM4WapRgtIMb3duCamE
	WmjVJ/+DEXsRigTfvvrOt7VpisWQwaLQZKidt5M+iwS2IpjTupTnX2p096MZ4g==
X-Gm-Gg: ASbGncvL//di7kfEwdL9+0I9g4j0ImeWhriP8Odid0ZjXx8kjN8N4dHj4RDgN7fvjQq
	pt4JlHMl/IIjH7uIM9zvpjyjIJxxtcPwa6MKdwcrbhXMFrVgko9HL6qoR2xDf+GBk3jYQqq2QZw
	ZOq4Ebbb0/q360UgbyZOGyNvAKPOH3pkWeU01Ij5okzu+BVdi7q50yaM4rqDkqtHo5Hz8uDa9uv
	SE6qGPw28SdZebHbUrH+IW6eo+XVwdErujkWlp3w3ulMfewErP6e9IR4GTsXQQeEnBV4EtOvTym
	kbpsDbE4t5pDrbDTvfcni/p2Lhgbtr3oGSkZrM+RRP7XZSAxEzLK/AEWsT5eOCsLpORNjEU6Hmq
	l9uLcR6r4mjp+uMTwT3X//386y44mK9f7XhZ41jYxtMsJ6tlKFedVGMe7l/yH3koro2EH7VA379
	HHFaa32j1NP/DUPA==
X-Google-Smtp-Source: AGHT+IHUuNeVu96DwE0dU/acVA9DA1Xo7SBjW5D+5IlukZI+MF3R1hHzUFzARYaDXUae+4t0kGRyiQ==
X-Received: by 2002:a17:903:2ec7:b0:295:557e:746f with SMTP id d9443c01a7336-2962ad955a4mr79604985ad.32.1762427809439;
        Thu, 06 Nov 2025 03:16:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f201sm25235425ad.55.2025.11.06.03.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:16:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/5] lttng-modules: upgrade 2.14.2 -> 2.14.3
Date: Fri,  7 Nov 2025 00:16:25 +1300
Message-ID: <20251106111627.1264723-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106111627.1264723-1-ankur.tyagi85@gmail.com>
References: <20251106111627.1264723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 11:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225973

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

* Fix: Set CTF version in metadata packet headers for CTF2
* fix: always print to kernel log on module load failure
* fix: get_pfnblock_flags_mask / get_pfnblock_migratetype wrappers for v6.17
* fix: remove duplicated MODULE macros

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../lttng/{lttng-modules_2.14.2.bb => lttng-modules_2.14.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.2.bb => lttng-modules_2.14.3.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.3.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.14.3.bb
index c9c0b17291..6a1bd6a27d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
-SRC_URI[sha256sum] = "a581dd44ea61af869a935e71498d4273be59944d56f906135c6451d6548742a5"
+SRC_URI[sha256sum] = "35a1875ad96e8b4b6aa8729f59af350bfc788ba65c6856deaa84d33acc0f28c2"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 

