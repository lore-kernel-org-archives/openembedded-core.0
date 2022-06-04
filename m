Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABFDCCA481
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.8751.1654338400439277898
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KHZSEviJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so5448844wms.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CY8w04NpWD6CwPcYn/MWHCDfAdc5PTy6HmQiLv1gCvA=;
        b=KHZSEviJuhnnp2jJoQJmBHhUT28iAavhjm6l+04paWnK9IAEIw7zQ7x37MN383aRXT
         IoQ0K0WjV1ra+lJE2dVLzcnAlB80b/j1HZrs3FY5EVludCTAfW+q3pnJB54P5P0S+A7p
         axVEIxUk4nKeED3FM0ps1fY4k8B8eZto40lVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CY8w04NpWD6CwPcYn/MWHCDfAdc5PTy6HmQiLv1gCvA=;
        b=dplno6STg85K4vhVysVpE2hR4kmvprZ9frSv2gF2+ABYOtn/VCKHg4xJezt5Red0v9
         W/PhmmkFX/qK5LRbsf6ffinm/FXjhHwjZlUC7w37Bg43uhY0fAPWAsyeQ+rDbYma5mkE
         95KWRr8XM0NfzwHG7Kgfj169NyVHqKlOMHCj+uc092xQE7DTntUi2Rwgjq+R9nPEvCJD
         NNJGQ36Smu3pId2Yz5jm/FFP3EMrvboRMWkcZV70lhqPHr7IkgBFNIEhhqUxLRP8eRNt
         iF/F2+hAn06LQZqKht9g3qe0K4l0K/wR3DRLKA4cXBdvYpLd+xV/row+4b+4bNfmw8oM
         MWwA==
X-Gm-Message-State: AOAM532H+lmtE5p79U/bqM7hMAdn2SB+2HBR3jOCT/hUC81F/fW7CmpE
	Dshs1zbqCQwv0mL1mupMupT114DD3VuuDB4U
X-Google-Smtp-Source: 
 ABdhPJw7qXkyyfnjgFuDOd7dqtq4BwiwdbnAQCnl3BSLhSJoPWBqbWLFVVCR8/cY0Kw4iLIAyMO6qw==
X-Received: by 2002:a05:600c:214c:b0:39c:43b9:9d5f with SMTP id
 v12-20020a05600c214c00b0039c43b99d5fmr3951552wml.56.1654338398736;
        Sat, 04 Jun 2022 03:26:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/17] xwayland: upgrade 22.1.1 -> 22.1.2
Date: Sat,  4 Jun 2022 11:26:21 +0100
Message-Id: <20220604102625.199845-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166559

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xwayland/{xwayland_22.1.1.bb => xwayland_22.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.1.bb => xwayland_22.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
index b512b9932d4..8c526131093 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f5d0e0ba37e19bb87c62f61da5970bd204939f2120620964bed4cc8495baa657"
+SRC_URI[sha256sum] = "743c4d56cfc0818755e2281d625d51860b41a473c641e179649a4f41776d1fca"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


