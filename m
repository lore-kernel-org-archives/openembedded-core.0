Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062F8C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:58 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.13924.1645301757208270486
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jtWOsWws;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id o24so20164792wro.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6vy03y5PHu82/x/XtlUxzzSJ1sFqB6ZjtefMeME2F6A=;
        b=jtWOsWwsMuplrIysnq/YgYSbQZekvrYMun5Qk4IN5QbB/BTat1PdE64pmt1p1okt3x
         AroDEJ25nlq9EWDDD13k4JlHvRZM5XSDUrwrUwYbXnB6rlW3YzmVXytDFxK3nWE8SrZ9
         HE7kTUbf+SyDedRuF5Dom07xqxUtFhIR049rYZiCuXjSwsxwOSIlYdz9sIxO4+6XgPkv
         YaHrCKxXwaKwfTzt7DmZUZ5DWe/vYRUjzhKQhEcxEJhztT4yjwf6GRCuGc70rzfWiBWW
         +5pyBgCwkKltvcCpjwLtDECQsRTHCvpxrdmJ1n4P005IzWUAgS+U+ZI8GnX6RySZxPUp
         nI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6vy03y5PHu82/x/XtlUxzzSJ1sFqB6ZjtefMeME2F6A=;
        b=pzu1bkuXjEabSRsDyDUb2SqG5R6zKrqFhkSll0zx3Cs8xYDtmBYwU+BryitW5uabub
         eQEuYtUu0Xw7aX8FLPUVFK57k628T4UcTc7ugaEdPrtOqznDD/ktfjckhEvc/Gx0pjsQ
         9JGsrpwn58yOEvJ/rukGP5vD9uw4nvqFWms0+8L/630+/GVqISLoLsx5E2REiIUgukLM
         3poJM0hdzORQ4mtMxn0Thq8QF6TqHxGhH0ne/WEeNg9DDR7VWoGw84nO73tcr5rksigL
         SdXzD+Q3DZRTMOEwulr+8piAEx70fPWj3rIJjczmj89x0KvhSOYk3ZIm7nLoqpMFx4YX
         iwsA==
X-Gm-Message-State: AOAM530yLlWDiC6XXhTR7Zh6Slew9xKI4iL4PWNBPRpfwtcaDp0rLKEu
	PwoPp1CstAW7wffZGtPdqVekMpJmfXc=
X-Google-Smtp-Source: 
 ABdhPJwtV5wkzCXl1O5GhVI2dOhpyFaGZzbJxeij8m0rRMFA8ph761aYgRlak2LxThHL96SgfchnYw==
X-Received: by 2002:adf:ec51:0:b0:1e3:d68:6398 with SMTP id
 w17-20020adfec51000000b001e30d686398mr10068278wrn.203.1645301755186;
        Sat, 19 Feb 2022 12:15:55 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:54 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 10/12] gstreamer1.0-python: 1.18.5 ->
 1.18.6
Date: Sat, 19 Feb 2022 20:15:12 +0000
Message-Id: <20220219201514.1551306-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161974

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...reamer1.0-python_1.18.5.bb => gstreamer1.0-python_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb => gstreamer1.0-python_1.18.6.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.6.bb
index 74dd15b3eb..c80c3928eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.6.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32c5a6543e72e5bc52"
+SRC_URI[sha256sum] = "bdc0ea22fbd7335ad9decc151561aacc53c51206a9735b81eac700ce5b0bbd4a"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.35.1


