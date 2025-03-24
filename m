Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0167DC36013
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:03 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.44225.1742834039039028704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dOREEWpy;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301e05b90caso7003316a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834038; x=1743438838; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZKdzr/bs9AplR2gaWJ84GFzyDjtoBCTeSELl3D01vg=;
        b=dOREEWpy6ibGhasnLV9pE0nKhansbViirw/n3BdZZTe7GAI/a4bcMptMu7daU03L9j
         R2D8KSIeA5aqRsc7t7Y4pYDylgEPeo24IUS+Z9LZL+rpfe/ytpn4/4XwxfvVZmY9tUHE
         G1jb7Bs7eCNXzYs7yYkMMwNDh2m5Q9qKSWS9c+ruXZux5S7QmUabXgXX0Z5FW/U1AT80
         2fZqAVyIj6PT4PGN563T8c69FZOE1p4VXPMnJE31EiMLkIsc7aMGdOlPv7TwEpA75Dfz
         Hiafte1BOWtw8Jxm7CM/IYVmzNU3C5jOJy80xFXCjNHbS+vOAoas6ugQcbeCRlo4ps+e
         DT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834038; x=1743438838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZKdzr/bs9AplR2gaWJ84GFzyDjtoBCTeSELl3D01vg=;
        b=SvpRZZZ8lxAbBhjRnd0vwXWQF5zZuEY1DCEkBbyT/B0plCkf83SBW8yPGw2dSgVbKF
         IxguSA3YOWRtLMDcyBIcvxrD8Ek/Dn1R5q+oZREOiAO6RZOdVDIwEDt2p3SS3nHbj9Ev
         xfLfEi/FXZw1SHrJEuDcDH9kOXRb2OoRuM1WOe0VNkueJ+DnFqUKjKX3e9lf7TDX49ro
         bTwPnbj5TC6TlAk+yANUMox6SD0rl8UC4ie0cMn9ti30O+9+YGOJUR5dICMCCeogEA+u
         pd3IoECMTIAWh5DL4FLEL/lVooHrz1TJSJMtDeKLkB006RZ55gdVm4XNIYZLAVL24msq
         nVHA==
X-Gm-Message-State: AOJu0YwXEfFHO22WkZqzVvzaMaXSCpld1gakxPXcdKfIVv70nuSgi55X
	tMG+Lr5USK9CCruXZdEfqh9UfEMhhoTRPuzsOMoAQXGC9+y+R43oLQZ3xfgj
X-Gm-Gg: ASbGncvd3SzQk6Cnlz2D5hoCsSQpqC2qFNEwCliUL8RBUHdZxuCLxiXBpjj6jTZkud5
	EdNPSVr4kB7yMvIrnDemCRC4YWOvzHuX6ycNQKRxKqOsIHJAQdjBhR0ALUCJn8qHq0tEGvsvf0x
	9QKCDijYvV6dyiuUb/1IJ5v/i1htjjpuKxjkGfYI2BQ2nHvYjr1DKn4EHv4KLeukY30W6pIhtiT
	b24OlNW4n8YRrOuqEInrnKL8AeF8GZyGokoj+A1WNadpoaoFO5/EZ1GIdwudwFiVzkvQ06N7IbA
	Og/CH4aZo6Ug2Fs30TsVr925SAdX006/XNGA
X-Google-Smtp-Source: AGHT+IFQI2t/MCXxQDu47fKhgamfBvLH2ppeJl4I5y08vrn2XRHZM2y8JOESSUmmgMVAP59+QSyjgw==
X-Received: by 2002:a05:6a21:339e:b0:1fd:f46c:fb42 with SMTP id adf61e73a8af0-1fe432060dcmr27846967637.31.1742834038330;
        Mon, 24 Mar 2025 09:33:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:37 -0700
Subject: [PATCH 16/21] lrzsz: Drop setting md5sum for SRC_URI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-16-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213548

Its deprecated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 7825932674f0efda76c9cb895eb82f73e37d0647..777560bd22faac12689a3a12ed5b032a5861ec51 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -21,8 +21,6 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://0001-Fix-cross-compilation-using-autoconf-detected-AR.patch \
            file://0001-Fix-build-with-GCC-15.patch \
            "
-
-SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
 UPSTREAM_CHECK_URI = "http://ohse.de/uwe/software/lrzsz.html"

-- 
2.49.0


