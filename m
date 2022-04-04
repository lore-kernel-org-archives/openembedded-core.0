Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842F1C4332F
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:44 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.30379.1649039476655103755
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wzz8BcMG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so3688611pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Nzqb/30ef+ssptPMRDxRFkv8jNTkp7PxxWQuMJIvks0=;
        b=wzz8BcMGIGETCiWsTS5LTSnDn7Y8UA5IJip/z63qCB47tT5Dbcz2QzVvsyYQcsoUb3
         U7l3MWyG59R6rNfI+KnkDipQ9hWZh85EplhncOS/8UbIXJS/Ic03IRDBz6RIbF3Kejj8
         k21+5hVB8yonFZg1Cz3sgBxrzF/QXVeyQn+2fn6VJIWPIZFichnmpUn8Yu/369U/G3FL
         HSeexs+oxZqrHz9zbMUujpDhr1m8nctyQ8oAtSR4C8Y4Fopb80zXJgiNFiQ7OhL99ZR4
         sCXxyVWHG8EEs4JT5YB63LNV0rkJjkt2yU+ysUAsiczOASjcILukB0GFnLmuwA7WJnJ4
         ypow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nzqb/30ef+ssptPMRDxRFkv8jNTkp7PxxWQuMJIvks0=;
        b=F/kAt036LRuSwotlEhiPYfhIPhauVaPQlBDnUhAjSQ1ZoRuRKgY3nlA6P2qzjXI/cj
         cmBKg3REqiU+ZGzitsgfuzeqMmLsN6SSdIQqjvlWYb3uU4hrWYKmuedyqFgzAvAya6rJ
         APk4NDF8wrNUwTji5F9CCaGhaHGJhZrGVGDysvSgcryWPGhpAwHKlBBjlO0wzQhb6uZ1
         uJ9u4hYbyXO/N8IdVt9Zk4K103F5Lb9v35FeebyXAHcir2ZK0tHGvu0Xlt7hthfLCaeX
         suBx+xeD88e72nyuBNvaesUvIxC5crmLV0DEr/LWfKM9s84/mPrcG8RXuOtARkX/TTDh
         GQcg==
X-Gm-Message-State: AOAM531Ve4D2Lgt6yCVhpmTLtMe0RL9QHCx/FqpJmqHV+svM6pAFI36R
	dv8AfOdgNF/c6XqY79aprMefo5KVHaoxpXSMlDw=
X-Google-Smtp-Source: 
 ABdhPJxZ/+hJ8TsFEb2W2A5vZjbhRYmsXGuroqzl9V3IklnDX2/bcwtuv04FfRBVStAAPzJ5GRVbTg==
X-Received: by 2002:a17:90b:2246:b0:1c6:5781:7193 with SMTP id
 hk6-20020a17090b224600b001c657817193mr24419048pjb.48.1649039475795;
        Sun, 03 Apr 2022 19:31:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8471117pgd.33.2022.04.03.19.31.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 19:31:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/8] tzdata: update to 2022a
Date: Sun,  3 Apr 2022 16:30:29 -1000
Message-Id: 
 <d1ccbfedc6812e57a848feea2dcf8c339028e4c7.1649026624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649026624.git.steve@sakoman.com>
References: <cover.1649026624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163980

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b280aecd79e95811f8baec6c4479c5752c54d9e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 43d14d7f12..cdd1a2ac3c 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2021e"
+PV = "2022a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "584666393a5424d13d27ec01183da17703273664742e049d4f62f62dab631775"
-SRC_URI[tzdata.sha256sum] = "07ec42b737d0d3c6be9c337f8abb5f00554a0f9cc4fcf01a703d69403b6bb2b1"
+SRC_URI[tzcode.sha256sum] = "f8575e7e33be9ee265df2081092526b81c80abac3f4a04399ae9d4d91cdadac7"
+SRC_URI[tzdata.sha256sum] = "ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664"
 
-- 
2.25.1


