Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A135C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.16543.1644196121991051818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A42E7HoG;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h6so3255428wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lw6FMJRg3I2PSlbZMi05sktd1+/RehcJ2Onr06SBCgE=;
        b=A42E7HoGW5TvbnjBba1JrXjciqmVtVDM619CQ87fR78LNwdkwrzXCOVp1pwVzkHpmT
         AF+F6N0rPLZIypDLSP26vfox2PabhYMW8HcrfDSOxdjeDhB44Gl42Ds8Pe9MklPIRBSN
         tZNVv+TFoGFYkD0TkSNkeJWFukKH3vn1SSKBMKRaNe1fRM5LZ+buQAzlwhbJQPHl5R0/
         ihWkwMhQomyq7T6Lxht0tQgTw09kqg7q3mMBYd35JiFwNvjVEi1aY/EzsRddi/J9FvGK
         4/UwM13GnHKfsRBqJyEBWa8O6ltbDc6aY6ta0zdfgHb+88WX6uSqkqabCdq+IQofnQhw
         P3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lw6FMJRg3I2PSlbZMi05sktd1+/RehcJ2Onr06SBCgE=;
        b=bNyNw/03NSx3vytPrEGPpHlKrJakuWJ7pTW0VW2+omMtk2FRiCq+TyJWNseTcjwUWn
         UCqbmJrjobZM6YttGbD7KN2ZunGRy+05KwejmpmNfdPNp3qF1O5f5dX3gmPuptkif3e6
         3DRzI2WrK9WhhwKa/GVU+k+gmVvyMkrKJvU0c0E0Xt21EaBPhKjuekRkCni8mAuY0wOy
         /Y2aTkok0epS/ni4g8y80BE2ApQDBU7KePmmSifwaozpLrlyMnEjzCzVCYDjpHu53+W0
         9dHODQfCcFRRvPHSLOOAiFyXfG1YmY11842DralLAXcOKaTLW//RHF7YRbsuOI6mja93
         amlQ==
X-Gm-Message-State: AOAM531FJ+dYhWGymp8YfmeOqConp8LweiSIHshDMVb8lDnZPrEREQUn
	F2ci+KJdESCnE0bWx+Cgb/Rr00/8Fjk=
X-Google-Smtp-Source: 
 ABdhPJynFk4/6w+cKuDkwDD+YSgSKRoGSR8ZpYZvVmeyPWGkAnBjJmyu4ZLOkX2M6ttawQPBkkpAcQ==
X-Received: by 2002:a05:6000:16c8:: with SMTP id
 h8mr7907449wrf.693.1644196120331;
        Sun, 06 Feb 2022 17:08:40 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:39 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 03/17] spirv-tools: upgrade 2021.4 -> 2022.1
Date: Mon,  7 Feb 2022 01:08:09 +0000
Message-Id: <20220207010823.143664-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161423

- General
 - Add SPIR-V 1.6 support to wasm build (#4674)
 - Improvements to disassembly within PassManager (#4677)
 - Basic support for SPIR-V 1.6 (#4663)
 - reflect debug (#4662)
 - Fix endianness of string literals (#4622)
- Optimizer
 - spirv-opt: add pass to Spread Volatile semantics (#4667)
 - Fix constant propagation and folding of FClamp instructions (#4651)
 - Manually fold floating point division by zero (#4637)
 - Allow ADCE to remove dead inputs (#4629)
- Linker
 - Linker improvements (#4679)
   * test/linker: Code factorisation and small tweaks
   * linker: Do not fail when going over limits
- Validator
  - val: interface struct with builtins must be Block (#4665)
- Fuzzer
  - Avoid id bound errors during opt fuzzing (#4658)
  - Avoid uninitialised read when parsing hex float (#4646)

https://github.com/KhronosGroup/SPIRV-Tools/blob/b1877de5cd776117050bd42f08d04b52bce16099/CHANGES

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../spir/{spirv-tools_2021.4.bb => spirv-tools_2022.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_2021.4.bb => spirv-tools_2022.1.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2021.4.bb b/meta/recipes-graphics/spir/spirv-tools_2022.1.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_2021.4.bb
rename to meta/recipes-graphics/spir/spirv-tools_2022.1.bb
index ed56f4668f..24142a4fe0 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2021.4.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2022.1.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "ab8eb607750208066e2d57eff6a34dbaf05f5ada"
+SRCREV = "b1877de5cd776117050bd42f08d04b52bce16099"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.35.1


