Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB08C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 21:09:57 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.98.1635455396171452814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=ho/mDvcW;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id p16so16395102lfa.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/eZl7Tpif/e2RvbCSHYt/pklc0uhqha+5FkRczn6Ck=;
        b=ho/mDvcW+t24t7yy0RjqHJnzsi/3lLd131ofGNMosDDqN8o8/vCEpoFGtmoklZeaPU
         MDpTjNxET5BtSjg4WSSPX/OU6lz4l8FSSJM322od/NkyaQKbbr334nvk9ds0i4YtjaA/
         goL1fXsTDwr4bi1lOp3N5at4bAe1jKea+i/pQmNy4k9jfudWTwlDoGAm5/L/IuB0oYjt
         FwOnFUTL0/plh8Ks0BnKBiEIW5xMRL4j7Zmm4yA3EAtYD5vFR8PbjXbTTe72qN+dvJqW
         136/4AS1nb44IoTSanIfDUS0zvLb9Jb5n9XVzePtkrk+I1keNHrpZXfu+j31LqBrPiOW
         tDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/eZl7Tpif/e2RvbCSHYt/pklc0uhqha+5FkRczn6Ck=;
        b=RUV1+e9wTT5uAkvHwNfMxTTQAugjz9UeRqruW4fZmSBGvs9nFppSYHocWuxvj2SSi5
         dq5Twqra8B5orOZJesrZVL6UTIffMD21mt8PV/ZeHQ4l7Qq2Y4hFPm0uM+8d1KGExQmk
         nCoAkTehojVlxvOwYHUCedzdO+/OMDdz+CKLK3y7O/uCMfsqd0NEG6mvKeZqw3Hw9195
         H3QlyTWmLavAF45VeYEZw323aTLzeCKjFIIsbxqESiO5Dsu3Z0OiwNqOqBWWL7pGah3y
         Z1qTUyASnE5qBsUqMPMuXHnmBO8/tQmd/R9rud358GcnHuIj1PWgG5j+n+hWCYDjknzm
         WhRQ==
X-Gm-Message-State: AOAM533SnyVxXpTqccC1Ljl3Li+IYH8oDDP4MARQnH3ot/Rtjvm79deS
	08XTj7JzyvgyEG9ujpUg5XifZwnN6dUGAb68
X-Google-Smtp-Source: 
 ABdhPJx05GUCWg+fYjR4c/NRWA4vNoeqWfHEU7zuJp7HJhIFzvh9i2Bt2Hg8vFYO4JMSWHa6DESuGA==
X-Received: by 2002:a05:6512:22cc:: with SMTP id
 g12mr6539917lfu.668.1635455393906;
        Thu, 28 Oct 2021 14:09:53 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 t2sm420371lff.165.2021.10.28.14.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:09:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 2/2] protobuf: update to 3.19.0
Date: Thu, 28 Oct 2021 23:09:49 +0200
Message-Id: <20211028210949.1273230-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028210949.1273230-1-open.source@oleksandr-kravchuk.com>
References: <20211028210949.1273230-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 21:09:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157607

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../protobuf/{protobuf_3.18.0.bb => protobuf_3.19.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.18.0.bb => protobuf_3.19.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.19.0.bb
index 46ebef978..94e8695af 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.0.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "89b14b1d16eba4d44af43256fc45b24a6a348557"
+SRCREV = "17b30e96476be70b8773b2b807bab857fd3ceb39"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.18.x \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
-- 
2.25.1


