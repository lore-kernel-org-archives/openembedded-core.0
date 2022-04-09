Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509FAC636FF
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.6638.1649513711599560942
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=wTnB6pkz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id e16so19384606lfc.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0+4bUuY3nu+GTr+MlyeHr53Mre7L8RK6KYkgvJO97d8=;
        b=wTnB6pkzCF8jXl+qZicJo5B0iY3pmc779ZlX7ecFAD/uUJYAS2KcakmUMkzW4W3u6r
         nNuSPgepFYE19ieRaSHWBRIHOdShMxuHOCa2d3D/n8jk6xz/wyG76dP3wCdLqFKWWRj4
         jI2yS8GOHBdJ2NUQo8HwoJ1AnN0hJjrN+3vHma+VVW4MRpKBPGf6hMmKwk3I5pHhDqw9
         ByEmwFq5CcWMcKLXqPXzBerImleu9EvCLoxadd+IowLQud7VRgv6i+u6xvlwqGMA5nN7
         Ly5E/Sv73+gCuLa4ll1tPg6wp3VlM9+OyHs4KpIHN5lEqafbmNJu31N9sRqJmPkTIDoX
         WPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0+4bUuY3nu+GTr+MlyeHr53Mre7L8RK6KYkgvJO97d8=;
        b=17tY7fom9ya/RdEmjyWIDZ4VoJiZqvxxbJFexmyiyM5p5/fBfsa+Fs8idq3QYmNwDu
         NyELpmaci6RRwfeYiNaYsV2tWJCmDViltgVx3w4AcMVXlz8l4wD6HJ7aPpIaG/z/da90
         One8I/O+MzEwe5DCoWQGI88Kr/p3x1EHhJQsCYCJuVwN73sWR746fo7QWQ5JtQMwGcCb
         h25UROLbbuevEMpeh59ahIG+z2YkPwE2jfs5Ibl1bKmW1lz1U1H+s+vOAHeXA43QcFba
         hLKATDgzuw+/BuP9bQJ66BTQOv3niliZZmIVmjImAxPaO3VpIJZ4ZKkHG51r93Vjtg1q
         ZRQQ==
X-Gm-Message-State: AOAM532hLB+cYCV5Lm4Ee4nduYBGvnc3bwwlCpfadS7xB2apTG6b6O1E
	XGaXq2caB+nNULIKF44W+nCKDYHSTatunXlh
X-Google-Smtp-Source: 
 ABdhPJySZe3oJ3txpyYBPAdTZbdddWcQLuBvxpES3K2r4ECHWD3mBEJt0gqeXDaEaxqraB2xSUl9Iw==
X-Received: by 2002:a05:6512:3f1f:b0:44a:a85d:a0e0 with SMTP id
 y31-20020a0565123f1f00b0044aa85da0e0mr15569264lfa.170.1649513708957;
        Sat, 09 Apr 2022 07:15:08 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 e28-20020ac25cbc000000b00464f918102dsm685654lfq.174.2022.04.09.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 07:15:08 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 2/2] mesa: update to 22.0.1
Date: Sat,  9 Apr 2022 16:15:00 +0200
Message-Id: <20220409141500.815506-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409141500.815506-1-open.source@oleksandr-kravchuk.com>
References: <20220409141500.815506-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164188

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-graphics/mesa/mesa.inc                           | 4 ++--
 meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.1.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 21fa1a6a9e..20295a0ff0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            "
 
-SRC_URI[sha256sum] = "e6c41928b5b9917485bd67cec22d15e62cad7a358bf4c711a647979987601250"
+SRC_URI[sha256sum] = "c05f9682c54560b36e0afa70896233fc73f1ed715e10d1a028b0eb84fd04426f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -34,7 +34,7 @@ do_install:append() {
     fi
 }
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pygments-native python3-markupsafe-native"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
diff --git a/meta/recipes-graphics/mesa/mesa_22.0.0.bb b/meta/recipes-graphics/mesa/mesa_22.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_22.0.1.bb
-- 
2.25.1


