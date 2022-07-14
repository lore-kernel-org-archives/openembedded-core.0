Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E97C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:59 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.3970.1657773409353945734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GQNGGqn5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id b8so1387900pjo.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7zjFmqS9IQSrkxtSYb692E0SnfQEqebmTuXpET2vzbI=;
        b=GQNGGqn5h9zQ1F5yN6oVxiZyZrfsrfpq8mkH9oqXlIVnVxosCsr08YAKNPNhNBfhWh
         xj1DAS0G5Frk9o6GoW+bY4H/ilwMWOy2WVoY+ItfkCuhLrSBdLwOI4tOEViRPRGAZ8g0
         HevKxDN3avSO+khsrBdnXz0djWOvPkDMZdYzpf8YGOBmYVfWKttccQDIlELjA4/4n7gN
         s+m1i1Kt36O/9X1v/r4FtGHLFlAxQDo2Jnq6eyPTjHSvqD8KONL/QI9KubNoo8WJkCsT
         Jz/Bub4dR3pDTWTIbjZuSoJ5S4WYC0egJWnRLxLANexgI/QHsuBZ+XpgNL2yZCkefKKp
         4MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7zjFmqS9IQSrkxtSYb692E0SnfQEqebmTuXpET2vzbI=;
        b=IWhy5JA0NE+eRAqroEgfuZ3CNeBv8lASuYWAunVxRqku029O9WgdUPHAiv2GW+J5HH
         PIN4VJdwqOrVV827ylyymZjS4WAXbp46mISQuVuE7fzHDFl0FdTZ7qLIhvcbHucSHWQT
         NrM1vbXD5kHuQyru9LlYIfC9rPW/4PHI3MgFQBkOkiTyIBoyRw53dsggkx9NrCHNwXdh
         nwoO9l2hb+rePOfOAKzgzKjjhgLSzlMVEAnzn/fWUzQEP8KPCTPYhFN3j2nx8de0bJPk
         HwmjvhIvlymne3GK/IMvDlc056qnnFW7HtyhNzq88penzyp/qP1VhwRWs5W6a+m4truD
         rlKw==
X-Gm-Message-State: AJIora8iDO9aeD+XOOkZDZtIINmN5ggLaZyJIv0UUu6/yAwXqvCuIMHx
	ssUEnrUms1gbRnUVN7voOezPdkjou0IyuZVr
X-Google-Smtp-Source: 
 AGRyM1uK9vjnACglLLBJs/vt3fik4oWqL0/687hEJc81hme4ME2qhsilXwGVIeSq7E9CtPCTbtDOAQ==
X-Received: by 2002:a17:90b:3850:b0:1f0:6b50:c888 with SMTP id
 nl16-20020a17090b385000b001f06b50c888mr11823210pjb.130.1657773408392;
        Wed, 13 Jul 2022 21:36:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/27] gstreamer1.0-omx: upgrade 1.20.2 -> 1.20.3
Date: Wed, 13 Jul 2022 18:35:36 -1000
Message-Id: 
 <e190d67fedd728066de9b941b5aaf9ec54cc2ff5.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168013

From: wangmy <wangmy@fujitsu.com>

No changes from version 1.20.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f63d78d68258d68bfa24a13ea3b023b198499929)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gstreamer1.0-omx_1.20.2.bb => gstreamer1.0-omx_1.20.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.2.bb => gstreamer1.0-omx_1.20.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
index c4f5d719bb..fb48562a2b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "7efed7cc5b0acf9a669e38c5360a7892430a4e86c858daac6faa1ade2b151668"
+SRC_URI[sha256sum] = "8db48040bb41f09edf8d17ff6d16c54888d7777ba4501c2c69f0083350ea9a15"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.25.1


