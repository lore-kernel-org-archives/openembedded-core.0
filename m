Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web12.8233.1630503947084822483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eS8AoAK+;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id t1-20020a4a54010000b02902638ef0f883so824469ooa.11
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rp1YHRqTa7TrfclDOnXzY+E1nw5BHwNuFJtn6QTWd9o=;
        b=eS8AoAK+NoclNh5J2vPw23erMrGQrxycXMQ4ib42MipIow4sJ87yyFTGAmPg3oiYbv
         uCvFHCk688qoQmCZMx3YU3dbk7IHavrIVvsvIwlLkuwwAOoSQVddC4lOInSGwnc/itsW
         Ii+C+a2qIw9NYceBshCdsoZ001R7Y0S8PdIIpAuyeL4s0chZ5+DQwuyYPjMYOVwvJvT4
         P4Ha55gfuUl/ohGLfSMCmbyVtFGC2TX9vpRdIMYeI+chNm2Qy/NTx0GGAdJLgawtr3q8
         T+CguWbVEbz3mNgO56qbMkWVLZgb1crJZjzFVrt7D1gomJDa2rqorXw7BvnsDcEG6J/q
         izcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rp1YHRqTa7TrfclDOnXzY+E1nw5BHwNuFJtn6QTWd9o=;
        b=HYJxPWGnQDETmTkVLNx21HkgKsK1LYep7CSGHPKbiHsbNa2h6qPX9Y4VuBCHv7dGqD
         AIJovbbougiX3rcUvpFVHksbkynL0bxho1c2OrooPjHQ3fw6+itEWi0CmI2NY0WcPYXX
         9F1/Nz7H12TRj/yMa0FWCOngkLoTRZd6fOXmfEVC18SexvCJAwyxZioKs258K3sIvbRl
         UvuyIZLD3MsBRT5Qvv0cCh3wCaPJuPPAPuGCN9CNnXLhqO88+r4LWBai8qWL5caKMewc
         OWG53W5eOraArc1dqdcKo+t2ragLMwSBg0vbtyI8MoAyBBNw0UsQVWuFLSVpzj0N/aoK
         vmIQ==
X-Gm-Message-State: AOAM532hohSc4wBXINaR3IO5aC8sT2WqHNTYLDQ20VOzgFLuMb8GJqtt
	gbeNJIDfMUWIQmoQ+Zapi+IzembM1qI=
X-Google-Smtp-Source: ABdhPJwUOhhlm2TybNTgpJ4A5X3Pksqsf/lUv85xVYdmjLW04AW72GVSgNUEhKUPxSsHPfs5wj813g==
X-Received: by 2002:a4a:7504:: with SMTP id j4mr18967629ooc.55.1630503946135;
        Wed, 01 Sep 2021 06:45:46 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:45 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 28/31] libx11: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:07 -0500
Message-Id: <20210901134510.29561-29-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
index c84f33e92c..7ee2a9c16a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "1cfa35e37aaabbe4792e9bb690468efefbfbf6b147d9c69d6f90d13c30
 PROVIDES = "virtual/libx11"
 
 XORG_PN = "libX11"
-LICENSE = "MIT & MIT-style & BSD"
+LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
 DEPENDS += "xorgproto xtrans libxcb"
-- 
2.32.0

