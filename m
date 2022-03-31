Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1781C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 15:06:56 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.8263.1648739215947277130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 08:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Qb/6nGvt;
 spf=pass (domain: linaro.org, ip: 209.85.219.46,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f46.google.com with SMTP id k7so19929781qvc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kQ5Y+djZoxXWRz/tw+ebnK9oMPizBr3tsV51mc9PQAU=;
        b=Qb/6nGvtdGU07vcU3coZY5z+uXyqD296hPfgq5OtZFOtPCkCJJUsJt2985bpFfNzD7
         dA08QFoTvsTmvVVVFOFQ/FpR4o9ec29DkOMae4GMv0KKWjTA/Qx3QJ0OLIxf8RsgsKr7
         x1rWrZ1xvECIdlv7/CB1KDMAJBApErYttpZH9g4ejjVlYVE/d8n8XFUYOekHGW5rG0Cb
         KbMmfpoU36d91EaOar1KP3xYGSHxBfsFxdwFCsTDlqzUME4V1TQsAwa0yrCia6g9hsNK
         7eiKNdjYtaP6kSdR3XZc3NnDzfp4f7vnMnbUdTG1qBVIkY5j6Brlk0cFK7Pg52EhJA2X
         BjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kQ5Y+djZoxXWRz/tw+ebnK9oMPizBr3tsV51mc9PQAU=;
        b=z4HkWTfJI14+WIhj9Hv4IbhT+tUycsjdKlxsgrEUYa0+p9g5lmDqUXVoRLN0Lp/h5X
         T/pIMEtBjTbYvd/SG/dgboDck6/MaHMREMUMzf9IBsWmtatIT/8NT4MNw9qxqpfg/ODY
         FnKadhHhG5dg5lvLdf+pslh4geTvtcG5JSJe/DFLohxcvBSXyn/kxiewEcCmPlRAO3oL
         q6fkKkmVTvffyao1AIcxu6jFu60JwPxlkI90KRdaBy879eDXMm11ho12VuD05NcpBsdV
         ZAbdfHZ7J4gGP4g+N+au4HLVDfhxhfxnoRhbmt4WmhNUFO8xuDAc8dirXwGuXmV5UnVu
         Q//Q==
X-Gm-Message-State: AOAM5320BknHR7KC0hX4PxXxak74Tzwi4NCbzekaIbp7PINDcI31Whqf
	8C0vE+G/pzs6htGpXDHyeHFJ2BuGgoNe3w==
X-Google-Smtp-Source: 
 ABdhPJxQXzYwpn18zZV5ceRc/lkYY/f185sIScJ1SeU4+NMgmNvHl82FfUlwveYmgP977J4ftx24jw==
X-Received: by 2002:a05:6214:d8c:b0:441:6597:6da2 with SMTP id
 e12-20020a0562140d8c00b0044165976da2mr4422648qve.116.1648739214945;
        Thu, 31 Mar 2022 08:06:54 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 n131-20020a372789000000b0067bce1ac001sm12455020qkn.71.2022.03.31.08.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 08:06:54 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] bind: update to 9.11.37
Date: Thu, 31 Mar 2022 11:06:51 -0400
Message-Id: <20220331150651.1526562-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 15:06:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163839

Security Fixes

The rules for acceptance of records into the cache have been tightened
to prevent the possibility of poisoning if forwarders send records
outside the configured bailiwick. (CVE-2021-25220)

License-Update: copyright years

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../bind/{bind_9.11.36.bb => bind_9.11.37.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.36.bb => bind_9.11.37.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.36.bb b/meta/recipes-connectivity/bind/bind_9.11.37.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.11.36.bb
rename to meta/recipes-connectivity/bind/bind_9.11.37.bb
index 872baf6d2f..afc8cf0b3b 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.36.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.37.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b88e7ca5f21908e1b2720169f6807cf6"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=89a97ebbf713f7125fe5c02223d3ae95"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "c953fcb6703b395aaa53e65ff8b2869b69a5303dd60507cba2201305e1811681"
+SRC_URI[sha256sum] = "0d8efbe7ec166ada90e46add4267b7e7c934790cba9bd5af6b8380a4fbfb5aff"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.25.1


