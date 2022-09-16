Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3E1C6FA86
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:25 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.893.1663362502519820215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hM5HqNKH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id cc5so28101173wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=s7jme5nl6Il8aSjNgddpzGHiOTaST6qudJQfUwIP5ec=;
        b=hM5HqNKHWV0nBCF1MkZf0WGPYD2sK2YfZdC3irzX3HZ6kx00iXaqtGFcnXrTdeqy4A
         hvsZYEQjwqM7Gd5FIDIgSJ2YDgq3YDIEGMKfO4d7tWKtGvm32u/Bl8xesCmfWy0zkTCf
         vIhjwLdR0pdmzoKI39EmjxWEN0hUZBJFGOIFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s7jme5nl6Il8aSjNgddpzGHiOTaST6qudJQfUwIP5ec=;
        b=CD/tznI57GfE9E4C0w3+BqmT3oN8xPVX+2lcwFucB1i48ItKVTKAP1dTrEG/Dr658M
         mGruSPRondG9vXFGnDNPeG6u5xsltT2OrWwbFY2/AT9TRQAGrnipBQ2TEWsvdyX3aQzG
         np467ylueIFLVw827f035vZsh6mHrHUlNtnESRdzzvqH8mWL2ZiRyuEl2hZfuO1wQJEp
         yghVEjmGr5Q2Qcrs5z7nriXEILgCKjgnLP7ciH1CsOxZJ3lnRG/t+nZXoy/hgCeVGNL6
         H8vFflgUQNVxeAbAgnoRdewuWjqUJxT7/JPcbDDOm2VfIS/ems+SqUIiF82+g5toZ1Qj
         Uhag==
X-Gm-Message-State: ACrzQf0PWvxAGJ4Yy2u1O3nr6V1OVj5htI6DZiHisecNQT3KCpHtJ2aq
	xvPv/WnkCuxASXK6utS1ZmQZveDJ0LvA3g==
X-Google-Smtp-Source: 
 AMsMyM6wYFZRdKif8qGhoazclh3QB0HtS2wdzLtiAuL2COnZKH7DPoUgAmdCVSCCbt+6KkixfRAoaA==
X-Received: by 2002:adf:fd05:0:b0:22a:292f:1908 with SMTP id
 e5-20020adffd05000000b0022a292f1908mr3891668wrr.85.1663362500804;
        Fri, 16 Sep 2022 14:08:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/24] ofono: upgrade 1.34 -> 2.0
Date: Fri, 16 Sep 2022 22:07:56 +0100
Message-Id: <20220916210818.1228761-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170799

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/ofono/{ofono_1.34.bb => ofono_2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.34.bb => ofono_2.0.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_2.0.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_1.34.bb
rename to meta/recipes-connectivity/ofono/ofono_2.0.bb
index 23631747a73..afd43d26f31 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
+SRC_URI[sha256sum] = "b0a31bf4d8ff3030c4aef9f8413df999c54df9db2ff0a1d3ec1710e0a9d1a49e"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1


