Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CD8C761A6
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:24 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.44328.1679494942412575729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=bZHS2p8R;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id dw14so5803030pfb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B74jqWLB9XXwlw2wCPzDds5oIQPGutBAYE7ULCW2jV4=;
        b=bZHS2p8RSeekPW+/ecHM+PYJjMyVxuHC1E+uuqQ4W9TO4FdpK5a9aS9OB86lIE4eOZ
         E3JQxX3LamGYk1w8LyeARHvocBPFe7oAwcFofUL7xJmEZwXrKNJnBmFGQm4CpjvCK5LR
         lSKV4zeoTW6PcEHOHMrcOuAJUGGPhEIXrTcjFqyuDRn2XkPbgQrKrnsps/++pkfI9Kx2
         9ptPjByuKVXkvH4HQ3T9OxDO0X0koDPQKqcWDOLG2oendBiMU3ns9AI5LpQUepoAQyQz
         BzJkURmBweD6Gt53x3QjZJWaURJqI+Q1WxBg7NK4ufk5snVYgy2A5nMvIMd/yrxRYgKF
         KgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B74jqWLB9XXwlw2wCPzDds5oIQPGutBAYE7ULCW2jV4=;
        b=qymG4iQFTe/74xyD3LZIcweaUpvJeuvkS5m8R7BoE3ccEF9V3FUHyhM9Lmez1HBaOY
         Ow47OXswpA4zizdDmcLS0RN54X/iuohIdDxmAqr75XyxTFisD/tfuxJXavIpK4Jw+mnS
         a1xib8OoPn32jGpA+zGaOa5KBZb/uItOa4xylkV4tdu2YXyEx0UI1hOxido7a8jlXwFM
         vfP4Ext691wLYdL6zq1HK4KDKqQ8GWOmfXXz+4Z2HWt8ZjBX50eSCUeTMF3j+X1/uZyv
         R0vahyfQ8D34s4/Namc+RS694ugVzZkunAXnmW84r+Pg0G8poLr1aB+p8E3je7llP7RZ
         1kGQ==
X-Gm-Message-State: AO0yUKUC3BeTBl/jTy6pR9e2ekp+zR6v5NJDsNSOdR/7N33nZO+1rddw
	i5lWQbDS1fJ4CyHSnj/r5QTEQVVyeTwwf4vvf8w=
X-Google-Smtp-Source: AK7set9b7tl5849tCixaAqXC0AL3UhGFi39TAxqBrC2c0P2ryhXleWpoXH4Wc1z3A2anjwJWz7li+w==
X-Received: by 2002:a05:6a00:2914:b0:627:de16:889c with SMTP id cg20-20020a056a00291400b00627de16889cmr2419063pfb.4.1679494941455;
        Wed, 22 Mar 2023 07:22:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/21] cracklib: update github branch to 'main'
Date: Wed, 22 Mar 2023 04:21:38 -1000
Message-Id: <726bd3b50209660151be7743533bddaa2d0da360.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178944

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab041ca5d036c2a1a1514893c6ffb5c7188ff00f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.8.bb b/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
index 786940a7e0..a3db6eb394 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
@@ -9,7 +9,7 @@ DEPENDS = "cracklib-native zlib"
 
 EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
-SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=master \
+SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch \
            "
-- 
2.34.1


