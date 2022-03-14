Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBACC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.3822.1647299853785742143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zogqiiho;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id k24so26388229wrd.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7VB6yIH9J2kpFeVF6knunXT2VY56yK65eX8D46Fekss=;
        b=ZogqiihoHXUYO/vcUYOqKX+dHi8llpOFzQAR9UoGdmalpEK1EWOD16ScA9J4F02L/R
         8eQNIbFU7iyeRz60aADTYe270NaiCB+dcGIgNpsmN03acKbiUsubXOdbuYcWn0qT4uaD
         +1YUhiXO0i76rI07UcTqVAqQLRJbsCRhwAC46T9UQW2FYCfll2PvavSMJbsAnmFF/eeB
         iKzGUAqBcjLVg3f98pYvkJ+1Yaktpzqmb/viUld9gBJvGhzWW2KxqjQfF/XPbgLlrx3y
         J9puRicY42V6+KDsDGyW6+Ls7GlLM4+7ZHvhOh1ehcQFHd6VV9YoZhm69L95/mRY2fxN
         vUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7VB6yIH9J2kpFeVF6knunXT2VY56yK65eX8D46Fekss=;
        b=oUKGFSZdAyCiOvtrKoi9itOCsoHwDuZQi37vqTlASybn8+DUqGJAP+kDj5iRw1PJXb
         mJnVxCpNY2kmtHtuVsK7KEXFlVsB/2LxovKILp4L1ukptYjm7nDQ7DTleTugpn6dCmJO
         XYjTU2ENCdITESGY0aPW/AppXyQWd2ICz05ik/w6BznXarWkcjjtD04bn2+J3B8yE2JI
         IfRkaFCmdjEokfdaiOiJyNqmb+P+4ZYBRz/nZQPqTY3OH0jIpUDbLIxwi2DsxzL7DAcL
         y2tgLglNwap7ZYN34E09fwpIJdSCMq+bXpcZm8IZfYmRgeYnftvxtEAR8vXCI6A+XDvi
         ugyg==
X-Gm-Message-State: AOAM532XrFRj8IDqtKfbV5oL1vLzbBm20y5HcXMA5P6ayD4puvUgdj2l
	T+5IKaWDX7/ZskwuN65UN8EDvgeK0Gk=
X-Google-Smtp-Source: 
 ABdhPJwvEuyws48ZBuVbtpgZQF1hb+tj0Yb9nDQFf9BMGuO0aql+HqGD08AG6pYVqPiLJSs5Li7zDg==
X-Received: by 2002:adf:a198:0:b0:1f0:2477:3b79 with SMTP id
 u24-20020adfa198000000b001f024773b79mr17666438wru.24.1647299852135;
        Mon, 14 Mar 2022 16:17:32 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:31 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 10/11] gstreamer1.0-python: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:11 +0000
Message-Id: <20220314231712.296796-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163214

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...reamer1.0-python_1.20.0.bb => gstreamer1.0-python_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.0.bb => gstreamer1.0-python_1.20.1.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
index 29d7c55acb..a8ae274631 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8f67bdc5606ba33606c6bc896e89de7dcd8cf4fca459f71389b1b6fe075b5e54"
+SRC_URI[sha256sum] = "ba6cd59faa3db3981d8c6982351c239d823c0b8e80b1acf58d2997b050289422"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.35.1


