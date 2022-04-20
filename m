Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4823C636F6
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.8165.1650463781926620588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3ULqIP6d;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id bo5so2041414pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E4csr6at3uzgxfeqmWCEM3wMczRTKvT5rFpuXO+vNqE=;
        b=3ULqIP6dHfdpjAzE12jOuFMq4O4XU2RbTqWh2fIOwn0oMV2IKv/gOpW78n365Kkhqx
         15GQIDjWQCBBFQWoVPbC1k9zWn/i6Du3X1n0CZ3EVeoLGRjCGbf5huo0JNxtWNlJrcE3
         wM+74ooPzupIuccHao7rvDVqmSnCxYxHyo1u/VexRYQEElVdQIe1L39q+Zv5RuJPTc2J
         rinDtR71KFTq6oWMxsgObEJmqA4FAAJiq0F1h3yA6LFgT5ZzJ2aK/HM5OvPwj9lNqmIW
         gLoneUcmKyrh/3hHoe2Q69B0vbnMEAFVeY7ohRR3kRHCzvqhlsONS5kM7WF/SBJjnViL
         dMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E4csr6at3uzgxfeqmWCEM3wMczRTKvT5rFpuXO+vNqE=;
        b=XVYpv/IuGBGPQ845JxfFeZaQwGMsGYMMcHUq6BZlpdX97/hvjBBEyEnNrLEyBTx0SG
         xOqJP3LEONr8jbJ/cvdMfwtwrDN/KMqrvGSmEOccDwgL3gZctI52C2t76ezD17CWgWZy
         FMedhF9kfaL1i18O+A3yRgMqYt0vy6dFFxC9ZRZi5Op59kKoZg4IziAzHI9BEZOZKCLC
         9ihjeM/+60bqOIj66akLVeG3LGIfaFmRgw/RsOM4m+1HX+7IH/9tuJbl3k8kqZBLCz3c
         k0svPW6f4c248q+RZ58rV0KlJVn6aidB+Ox5RgUrS4ej7FsUGsU4QTMLsduBPLeps0tk
         RXPA==
X-Gm-Message-State: AOAM531NED2vAZK4QacsJkBtXlY1rEX5Y5qi3RtakdsmwNHd/inLykgo
	r28qnhx9tdA8Qt+rWA18drFTQZb992MpnpvTWR8=
X-Google-Smtp-Source: 
 ABdhPJxUtlY62wAu1KUrLEtp2REqMFNLNkjOb6MrNSK+34wVOYK3GlttDqm3KvnXROcnUMT5E8bzFg==
X-Received: by 2002:a05:6a00:198b:b0:50a:90fd:59f8 with SMTP id
 d11-20020a056a00198b00b0050a90fd59f8mr10928038pfl.22.1650463781055;
        Wed, 20 Apr 2022 07:09:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/27] libusb1: upgrade 1.0.25 -> 1.0.26
Date: Wed, 20 Apr 2022 04:08:12 -1000
Message-Id: 
 <9329fd3b1c705b7711adc71bdbf8f9e33f1058a8.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164692

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
* Fix regression with transfer free's after closing device
* Fix regression with destroyed context if API is misused
* Workaround for applications using missing default context
* Fix hotplog enumeration regression
* Fix Windows isochronous transfer regression since 1.0.24
* Fix macOS exit crash in some multi-context cases
* Build fixes for various platforms and configurations
* Fix Windows HID multi-interface product string retrieval
* Update isochronous OUT packet actual lengths on Windows
* Add interface bound checking for broken devices
* Add umockdev tests on Linux

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7353489980600af07d0771654da6a8a3b0df7572)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libusb/{libusb1_1.0.25.bb => libusb1_1.0.26.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.25.bb => libusb1_1.0.26.bb} (94%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.25.bb b/meta/recipes-support/libusb/libusb1_1.0.26.bb
similarity index 94%
rename from meta/recipes-support/libusb/libusb1_1.0.25.bb
rename to meta/recipes-support/libusb/libusb1_1.0.26.bb
index 64cc19e47d..fd63e7adc2 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.25.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/libusb/libusb/releases/download/v${PV}/libusb-${PV
 
 UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb/releases"
 
-SRC_URI[sha256sum] = "8a28ef197a797ebac2702f095e81975e2b02b2eeff2774fa909c78a74ef50849"
+SRC_URI[sha256sum] = "12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.25.1


