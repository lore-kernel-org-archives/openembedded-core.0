Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.15517.1598973764496766956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 08:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MU6Ha8Ki;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id t9so967174pfq.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZblVMNYusx7ATCrBp0b4uoClogJQbD06vDPEbAIJadU=;
        b=MU6Ha8KiTAYutS6BCHvlBVqGc7gDIs2wVzfuEpChgMLhe3Om3mOJ4y+DPhFQHn3eys
         rBqNlSslTw+mNqevgZNjlBHLJ31htr4XNfpcu7iiayTKYMmc9UQXukzLKeJwEJsWCCLN
         XIRn75TQo/PcAkiY3NgP5N1F1WfRjXPTGRxln97i09FQGhnKfYwaymhW6MfA+gnoxv0U
         kb3X/g0IwVNQVMH+rA0MWPGSYCsv6PEBIT9YWBNNYKXQOxOGvq8OZQw0ej2G9Grg5iZR
         lEvQBewL0cIRUzDyakAqcEJVp3pk29LnrGOhXWT3LaCdad9gCx48Lp+GwnLKMJm5jXbQ
         KBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZblVMNYusx7ATCrBp0b4uoClogJQbD06vDPEbAIJadU=;
        b=T0zWC3aXPSqSAyp9jjS3BTgBy7TubPXqWvwtqqNjh3+nPVJdlWMR0V8E0QvdzfyzIn
         cEoa0Kh+cV2BNR4a846BJIIrG30cBVpNCva/PoowGkUeY8+ewLDEi+cOvWmWGjD8JkBx
         IEVChEvFM2zKTTyMKK5R9Hw+RgQ0pd3uVKoTAR5+xQjp/DNWXVZJ47eJcBC9GkXrCRKz
         VBSmyDqmbBltKHSxkBhu94TTZMlzFaMhzE8pgVYodWp4K8SfnbMPSsOgWD0j4ZqSSPOB
         DgzphOBTMSv11b3adcNkoMJoddCISF6ij/vjL1UsFRCsgUyze5dCEUJFCUYh+AAqDJGH
         MXWg==
X-Gm-Message-State: AOAM532JoQ2ojF74l1A/dzSWG0Xt9jFpxCxrhFoHh1NU4+M70iNgB0wz
	tLoebOmkJtGDmcmSnVFoHj8mU5nmFBg=
X-Google-Smtp-Source: ABdhPJwyEPy7QG8ySFmsri2c++2RbzX9Y80ZbiIWbzzJZGMbZXbX2co3k9gVjCbtWEyOUfBll49wHg==
X-Received: by 2002:a63:e645:: with SMTP id p5mr1895721pgj.276.1598973763837;
        Tue, 01 Sep 2020 08:22:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9dcf:ebf9:1f19:e8a8])
        by smtp.gmail.com with ESMTPSA id u5sm2217917pfm.149.2020.09.01.08.22.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:22:43 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] maintainers.inc: Add me as dhcpd maintainer
Date: Tue,  1 Sep 2020 08:22:33 -0700
Message-Id: <20200901152236.9377-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901152236.9377-1-akuster808@gmail.com>
References: <20200901152236.9377-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b83be2c5f9e..27e3474da8b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -144,6 +144,7 @@ RECIPE_MAINTAINER_pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
 RECIPE_MAINTAINER_pn-depmodwrapper-cross = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-desktop-file-utils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-dhcp = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER_pn-dhcpd = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-diffoscope = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-diffstat = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-diffutils = "Chen Qi <Qi.Chen@windriver.com>"
-- 
2.17.1

