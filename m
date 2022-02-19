Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E1BC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:59 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.14158.1645301758462244233
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j6NG39rj;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id m27so8347017wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5j5Qs0F+KfWjKugtC5mvLha5vsBxwqwjgGvOFtgdeFQ=;
        b=j6NG39rjfUXwTsJtJpOZpqpyOKiVmdtx4qYHNemLgu2Dk/2BUvnbMXgk2DoEm10ZU4
         RtfRhsMMKUS1wldmvLLVKKFbAlX5X4CNMTqjt7zjeo3YAR79buBNmVdjDsSD8aP2FlOL
         m8mjgQyxAPDUo/9v9K6QVMWNJavJ+jOISFAuneEiXkMxT86I0TQlsbNC6ECNv7esQJnr
         4rAbkxKQ13bI8/W2604zk0UCEsZJD/HWH9MslVXVbUqKl5AY+039YNyibvB8gzYciJjl
         KN7oifUkengQtJ9u1mBBcg4xwRvgFRek1VYHM0yCs/xgVdsY5WtGvuvSEDDtlgUNMquV
         gJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5j5Qs0F+KfWjKugtC5mvLha5vsBxwqwjgGvOFtgdeFQ=;
        b=zARHZpqsBK1VlZNJbgfamNVHpAHIU+kOKxHrbwsG0KGIZGq09qIuCdhkH6+g5/c4WC
         a2cfAUaUTWCYSSAZxLe8dbcMc3Wcr0wTt4c/3kZCAdIZphdXAENPjY5EmNIBmlIrKfzy
         ZVoCICymrjlGYPVPA6gu+fCvlzCX9K/gVwFD56YcIsvKeM7hxUy5G0Kb/nLWN4w/xBuQ
         N27iFEyTmIQ6NVw6XeUEMVLEDd5FQ+UQYebMXejNErBkqhYABZLNTCoueFKLoyyWgoyI
         T7swk/3wRE44gMVN632ERUUDry6UmvI6lYTpSeIVPCBzJfs28uIbrW7+8u8Szh9YRQBR
         O/RA==
X-Gm-Message-State: AOAM531G8yBfaS0SnC6HiD/LLyfcszF2qYd4ZE1kbwCpBr6aVrrs2ZDC
	rIS5z3dRZNmIG/s+xgemN+zcaAwUKZU=
X-Google-Smtp-Source: 
 ABdhPJyxjYotwFjp2EIOgfbmxUj/yAYSNEuVbeQweYcet+jFgGyJ6g6vnpXF49tuKh56gPRCWsEcNg==
X-Received: by 2002:a5d:4750:0:b0:1e7:be55:693b with SMTP id
 o16-20020a5d4750000000b001e7be55693bmr10525244wrs.715.1645301756713;
        Sat, 19 Feb 2022 12:15:56 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:56 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 11/12] gst-devtools: 1.18.5 -> 1.18.6
Date: Sat, 19 Feb 2022 20:15:13 +0000
Message-Id: <20220219201514.1551306-11-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161975

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-devtools_1.18.5.bb => gst-devtools_1.18.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb => gst-devtools_1.18.6.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.18.6.bb
index 1b46b89cb9..4f4ded8d24 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "fecffc86447daf5c2a06843c757a991d745caa2069446a0d746e99b13f7cb079"
+SRC_URI[sha256sum] = "3725622c740a635452e54b79d065f963ab7706ca2403de6c43072ae7610a0de4"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.35.1


