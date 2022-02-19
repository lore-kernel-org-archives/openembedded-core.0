Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05087C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.14144.1645301754398607954
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oov2GdL6;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so8732868wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FOgG3SsyxpvGFlM3cFXKzcn3LFo/nxorhHe7VYnmyho=;
        b=oov2GdL6ybs2CnI+pXSV+v19o4awFKGYvi42FHW8sjBGHcBRTZn67/ruWDm2F+Xzfd
         ABJ6c0y8I9lVSqzIwmysJDrZ3ZSWgkILjveSNfdgBUgJMUVlhKc22rADIrVyEA9nm77v
         Wsw2lkZvrd9OiBVlktngc3WO/5hPzy34LS5eqTXGA+ueenLk9slZo+RL1ei/m1UlMSNL
         o1Yp+N6U+s6uTbLWDaNNrXs2COAVGOfLJXtB4el5v8sOwlp+akRq1JNOVvlhzAtQ5O8D
         ghc96ujBP7UywUU1j2y81aEQ1+nlyDJ0tW79XX2NlAPcykaG782CEQna8NlX34SGiHBl
         xeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FOgG3SsyxpvGFlM3cFXKzcn3LFo/nxorhHe7VYnmyho=;
        b=HOhLErhA5a9JAJq23eC7qCfwhBcJxT5jxU6TJqcHChj46FIR96Hzupz15PjuTyN9ou
         5KSJIUK8ta87eohLEoOo/DHByNlqRIO25iQSDWmLOtdcy9RPKmVLPGkWy263yGUJ1dRs
         92IftBagypd3qFR5iMDXy6gCnms3VtuN0kzmxnG3AuizhlWtzcH4uMcqdcBXpVBuXVVv
         IB0tPy1WVxMHZyQc4ajUedUsRrFb4mu0MS79VMYdr5c2bq+BAreaWcJYFJ89RhHAlA+B
         py2m9vsFFFjEA58Xvb0SbAm7sPUn6sOswlNAMwpj7+dKMpKuyanfoTDKyOmIiAy/HAlt
         0g/w==
X-Gm-Message-State: AOAM531mTABnOpybzUfmYh1jFk6W5FA8BNQvu1G5swsX2ll+j5NwA/uk
	fSGLM+mO6MhS8mV8fI/LtKMrxkpclEg=
X-Google-Smtp-Source: 
 ABdhPJyTZlPuyXiVljWwUAVlE2tq5XsNt0j0AtXh/zoxNKp3fiGyocj0KnJCPLcxJDcVgYVThejCEA==
X-Received: by 2002:a05:600c:6018:b0:373:7b9b:92ff with SMTP id
 az24-20020a05600c601800b003737b9b92ffmr15642339wmb.49.1645301752581;
        Sat, 19 Feb 2022 12:15:52 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:52 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 08/12] gstreamer1.0-omx: 1.18.5 -> 1.18.6
Date: Sat, 19 Feb 2022 20:15:10 +0000
Message-Id: <20220219201514.1551306-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161972

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gstreamer1.0-omx_1.18.5.bb => gstreamer1.0-omx_1.18.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb => gstreamer1.0-omx_1.18.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.6.bb
index b2c1eb3ea0..a220d677aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b1453a32e7be93b42"
+SRC_URI[sha256sum] = "b5281c938e959fd2418e989cfb6065fdd9fe5f6f87ee86236c9427166e708163"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.35.1


