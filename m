Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web12.16792.1605656890014629289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YMWGvTvO;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id c80so195192oib.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IoGM9iOVJ0xWNluL3jKVmNZAswAKTPAmOS/dIdv7Dk0=;
        b=YMWGvTvOD2oX4CsSjJtN6isX6RnTudBIj6lEEmfNG7lNUOde0pGG21h0JIvo/lL/GN
         SojX+W3rj8nly64YJPZ1xMtbOCv+SBtzyNMDnfoVj/kQIt+cc/chef935FQMd0i5wYcg
         IcA+lK1VZTjDqIsY+9LNvDGByOVbe80waVL0vlWz73qnIqsmkWVzlwFuho2cFgETAFYC
         Yw2mA83f2dDUofOsClj9B+udoypX2SOWOtAk3Q0424jcc0s7RyL1snjPQIuBqyMddTa8
         eyvbXuPKh4v6auIJTPDCBVW505weGDmI4kBPYltqJVLj6x3X0sgX4+p+U6fA8BV10BYZ
         zlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IoGM9iOVJ0xWNluL3jKVmNZAswAKTPAmOS/dIdv7Dk0=;
        b=RZd57dm1xNxAAZuIMADTD+sotOpGqSWZ/yAA0Rty+aLW6Z4X9Emx00uk42lT42H97d
         6KnyjPG3skUNRGZTRf6cbk0MOf7PRgY85/JTAzcrlTaImZkYWBe1ewRHD4IiXx0mLqMD
         Xftb2tMrQl+8kKK7/eMKsQUtv7zDI+K+/un2n0qLIjS1HXyvCyU0CQ+0mMumcskhKtF2
         TrRYw23xHEBLRsT2IW8Fw95mi0CwkGvTW2VnYX1AzUYtPhmVFecFX++s1PQOCBFxfoW3
         xmAU+pBV1QRf1KVADtU/LapuXjmSh4vk81/WOZgBJ7SmDGC5Cc9mSszznpGJERhxL8PZ
         uFww==
X-Gm-Message-State: AOAM5337T5GWOukAJfoSSAkE3vVPxrMveyYiCrwQAV8LmfTqunTqAmP0
	UeU5eTxCIWt8HwojvahgWDJmtfFlfP2O4MA+
X-Google-Smtp-Source: ABdhPJwhWnY+pdlelDh9Vclts29OmDySkgFKBPdSFVoBytGZ0uDA99anupqO2IVojn8YmuwOLzIe4w==
X-Received: by 2002:aca:d502:: with SMTP id m2mr1142740oig.105.1605656889000;
        Tue, 17 Nov 2020 15:48:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.48.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:08 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/9] libbsd: Remove BSD-4-Clause from main package
Date: Tue, 17 Nov 2020 13:47:31 -1000
Message-Id: <5ff745ae91540e1a664647aff7ad5ea8bd39c01f.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605656725.git.steve@sakoman.com>
References: <cover.1605656725.git.steve@sakoman.com>

From: Mark Jonas <toertel@gmail.com>

libbsd contains a multitude of licenses. For (commercial) projects the
3rd clause of the BSD-4-Clause license can be problematic. But only a
few man pages use this license. This means that the main package
containing the binary library itself is not under BSD-4-Clause ruling.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c3e3f83b5fb162d161a7b9773d426418a22c05f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libbsd/libbsd_0.10.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libbsd/libbsd_0.10.0.bb b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
index 3b9ac5a01f..5b32b9af41 100644
--- a/meta/recipes-support/libbsd/libbsd_0.10.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
@@ -27,7 +27,8 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: ISC-Original
 # License: public-domain
 # License: public-domain-Colin-Plumb
-LICENSE = "BSD-4-Clause & ISC & PD"
+LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE_${PN} = "BSD-3-Clause & ISC & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2120be0173469a06ed185b688e0e1ae0"
 SECTION = "libs"
 
-- 
2.17.1

