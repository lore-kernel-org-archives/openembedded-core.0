Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.6844.1611307815920600821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 01:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hw5d7ouP;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id b5so4379191wrr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 01:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RWoi8xpZMbju2cPJfRsUBxEsi6Fn7X722pTvDaQ2DSU=;
        b=Hw5d7ouPxJJ+FT1zpzkQIE+g9gyu1myD/EJps1gGcESy4ZpLF6RW4Gz2NlEhYtUXdZ
         8RIj0To0AGghWFE9o391PaXi8iBcOWwualYBgos5kBv6LQqu2VsNHRHIARDeiqEhNZQJ
         hLAjrXsOiBh1ImT4sthasgwwiQ9BdYfEsHdgz4BFQqJvGEGH8C2i4m8w1pdKR1R0Oh2v
         q1J0fGjHcgcFIRZ0oEyQMneS89Y5HNjE+C4LPfbufNRoxHVypZFQprdaIHtwRzvoGy+0
         +nLtBia0POgSmTCgGothKI+MASHAT3JtGzC+zAAPWU17e7dC7yaX3kYJG7z79ehG8d7G
         Hifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RWoi8xpZMbju2cPJfRsUBxEsi6Fn7X722pTvDaQ2DSU=;
        b=GH+1EEn10PHkQ/AEfp8Nb8a8AHdVKUaFPcO4eDf5kdfG2qgFYoHPAY+pvVpMsNNpor
         xta59qn9GQM8zpiTFIkSD5mC97KzzwqtdKcK9NRKekeeisaI6qjV4QdY3z/QUNz4Icwu
         1NtKQ1vfnHAjncnvlARS1L6K/5XGS5i2rv9AaEc7Xhkq5o9Q37RdeIPD42ltlaayTxRI
         jleEpLrRcJE8xi/dwyRalmVMYEuLxZ57SPO4mIICangxnJhZ6r4p0e91tTjsXL/b6o8p
         uUDKFos8djQqdpXF62bg9H4v73VwbayFGwuTBEnLzV0OOR3wbuM/oJpWy6V3kcTwWAh5
         mlnA==
X-Gm-Message-State: AOAM5333AngBUDe4GmLJ07EsmwayEwgE8D1D3Kvu1LA9PtMuMicHLDY9
	fTxXMFX36JcbO0K4RGyVqYiO+f6MO2leHA==
X-Google-Smtp-Source: ABdhPJw/aCtanNjf7kWxm7hFvx63B61qgUPf0HpVHuZujjM6KhG125g01Qg3Ioy2bcLF0ZhStczHww==
X-Received: by 2002:adf:ce10:: with SMTP id p16mr3675933wrn.97.1611307814594;
        Fri, 22 Jan 2021 01:30:14 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id o14sm11184399wri.48.2021.01.22.01.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 01:30:13 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 2/2] glslang: upgrade 8.13.3743 -> 11.1.0
Date: Fri, 22 Jan 2021 09:30:13 +0000
Message-Id: <20210122093013.642421-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210122093013.642421-1-quaresma.jose@gmail.com>
References: <20210122093013.642421-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Add additional licenses

- [1] BSD-2-Clause & MIT & Apache-2.0
- [2] GPL-3-with-bison-exception

[1] https://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c609289666b60741b8
[2] https://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3fbe6a4d54e3817a8

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb} (73%)

diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
similarity index 73%
rename from meta/recipes-graphics/glslang/glslang_8.13.3743.bb
rename to meta/recipes-graphics/glslang/glslang_11.1.0.bb
index 2c4f4be5a2..eb37683abf 100644
--- a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -5,15 +5,15 @@ of the specifications for these languages. It is open and free for anyone to use
 either from a command line or programmatically."
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "e05cc20ec20a154d94256c744a3837c23719c0f9"
+SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-PV = "8.13.3743+git${SRCPV}"
+PV = "11.1.0"
 
 inherit cmake python3native
 
-- 
2.30.0

