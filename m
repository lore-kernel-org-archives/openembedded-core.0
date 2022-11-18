Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5DCC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 12:46:50 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.10642.1668775608219550681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 04:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GJDpJ3JJ;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id u2so6651336ljl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 04:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRfsXeD6phZ+URmsg3U5Z6Z+6E1z31axga3YhtVX+mw=;
        b=GJDpJ3JJNptQivwDNDYQ18ZttggQPKq82jspqdPhNgn14jDO2+Q7882PlLc3hQ3QSA
         I8ncRPWDd3SHJyfGWMFVvxV2MucY9PSgpVVkvYpssPlSzfB12gsq8EDHY8KcG0BAoJLt
         Qh1CqBr4WbLFEyWD+6QmrUUDW/FT44P9wUrrbcYnWzZOeXDqEGbTLPqS2xPcfBv5WpAm
         /c0oW1SW7MAPKEM47X/W4NIk+IgPEry6TDKX/Lgqh6sj5YUmQ+khF/+4K1626zaIQF8I
         0qJxW6C8sXY++NE5odXseBkyLYkgRehIslk0vGcDyLRMbIm37lMPWW8DevPx9DXkx673
         05CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRfsXeD6phZ+URmsg3U5Z6Z+6E1z31axga3YhtVX+mw=;
        b=1ffhWkzwalB6lYtIUXlolqt/O+YXIfk4v1hujTHcuODqFY37F+3vNaUVZPOqv6+zj5
         j+yQTo3IIer+Uzz45hB04YeDqv1vMpyDeZewiwW4ezaLSrYkMIHV64k0qw5y7nRE0q5S
         0oD9alFMOINrBX0chvT2sVOdU6Mgo/BqiAu+QTSUn39R4Hv8ayi22SWCw+K0kVYO47Qh
         4d7vG1NDS2BAkr3U3tyBhP2yioxHIBFnrEhksKSED0lDe9j6bqj0ARLq2zNjjewLFA2v
         xowXUq6dtoShWJR2cKKTqeC43NWEK7FC1FqyPCrIMJr2v/BO0q+GGd3iOh3uX/DCoxzE
         zLYg==
X-Gm-Message-State: ANoB5pm6qMHZKxmR/TjZHdzCq9GnKLe9Z/TqMZeP4dTxvPmLLfySpIOC
	Nn2hYrpgdvWT3hZIwXUw2RzkJkTcVeTNVw==
X-Google-Smtp-Source: AA0mqf6p6voE1bjLJylIIleYeBt6WPOz0XsX7k0/q5MotTnbGQ5Bs95FTGA9XXhWpJN6VVKN65Xo4g==
X-Received: by 2002:a2e:bc2a:0:b0:277:13a5:806f with SMTP id b42-20020a2ebc2a000000b0027713a5806fmr2344291ljf.144.1668775605901;
        Fri, 18 Nov 2022 04:46:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t11-20020ac243ab000000b004a03eb21c4fsm643407lfl.288.2022.11.18.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:46:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH 1/2] linux-firmware: upgrade 20221012 -> 20221109
Date: Fri, 18 Nov 2022 15:46:38 +0300
Message-Id: <20221118124639.553228-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 12:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173456

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...{linux-firmware_20221012.bb => linux-firmware_20221109.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221012.bb => linux-firmware_20221109.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
index c7ecee0d9a84..dc977c2bb780 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "d6d9d74a344a78028e6b0f1df80db14b"
+WHENCE_CHKSUM  = "ab4ba608dc4b757716871f9be033f0f1"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5"
+SRC_URI[sha256sum] = "c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701"
 
 inherit allarch
 
-- 
2.30.2


