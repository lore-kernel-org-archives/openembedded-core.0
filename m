Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854A4C9832F
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 15:07:34 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15758.1768748846053357775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jan 2026 07:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RLX5W/iw;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1233bb90317so2777519c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 07:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768748845; x=1769353645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4qQYiINPmcARgmjVWeHkXvgjz8Yi6Gmp7xuPZ9y1Oo=;
        b=RLX5W/iwS0LtFhE0HMg1rRwboE5wcBF3FN4abzEOozHvN2Okz+YP7ER8ri4p6p0oFL
         GW2voHGGwiHtpSKopkyt10P14sGE4AKdTgOYavtZVdCUQBX1t4W+QU3Sx92DwJAyyr5H
         bsn6CeEcBqiZ29If4S0bfjpgxbW70kHVpCPxLtnaalL3PON1BQv2UksMgYkHLg7jm6uB
         5rywY6Q+P7UeYrDCHS72CTGlkUyVIP4z281if4hVHU3nA8z+8sU6NgKLrKsq7ZUqPXZk
         Naxhuc2jQ8PFDjZTW1wocmZH3stbBAReTj80Q6dP0wvMDX2RpPoxogmVnhKiH30AkFNK
         xkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768748845; x=1769353645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4qQYiINPmcARgmjVWeHkXvgjz8Yi6Gmp7xuPZ9y1Oo=;
        b=b7BAl2HMlZ4IbuvjHHTIZhnZm3xsMNA1YaU24pDMng7z+M3lrXSfdH0ENn+MzM9uoS
         LtCVUM18KvfrC3vH6pVmh4SpjirzM4ySu4faansMLodD7mIyBnX0pxBHnitMllwdMwU/
         G7rmhhe3nX9wFZWuQ5kWOLrT29NEUsJhHICAvnRqg6lqlCTiEdq/in9JmeeBzW+KjysL
         jlntGyY6rR4y7nn9OMFnZrteMV1OF4zsxk2h6Yk2JXlJvgfBeolE5Ae+Al8zMprW7QoT
         hsoBYqnOYHFsd2r79vMO0TAPek6n6bxeQgIRY+0l0D3Qz9/7hpzesxB+kXblvsCVxJqc
         5Mpw==
X-Gm-Message-State: AOJu0YyIpzNXpDdFrI2rsxsi3rps337InkRULNekQFjZIj/CkTDSFSrC
	+Hcpiz1HNeyqqs6zob9y9zQ/i3QgamIN6lfEq/LPRcAfTs+PN2nlIwkQAinBuQ==
X-Gm-Gg: AY/fxX6ZCU8phwIia5DfIq49qS9+4uGKJMv7IUXpE67/0rBsskMDOB96H1EE1cZvcYK
	MooPETcBmOP5uNgPvKZPgnOMzjdThsXNFZTT4JIx25QlxOU5axOXoQmio8nTJ4Nti97oig8Qlxu
	GcC0TVD+92FdfrnYNxiiqt0ns1JE/CsTT6kIt8aFtBNcgN8bauV8uRlZVHrJFNIiJqOMX5IbKcm
	5cF+B2GHX+TbsHG2x5aaH5gqpvtUQ0DurT8Fd0POXjD1g15N6VaJW+h21NCNpsIuqoLglXHlu2e
	IkgT5vWDKsTcV5cKDARx0uYk1qeHBieNb2oXCgy0UbfyGOkass5n0flhj8TyqJ0uYBAIAaFbVZf
	A9+QuY3OE9aNstyQEQfCiRt18O9zD4AQw6L6prZNml1km6OWVdgorjWuQEYCGE1Paq4p8kiPkH3
	Eu5xZPn0vbCkg/+VYaHiweky/Tz1Hw+6mhBlsJUzBNTA7htbeYTswM1OxSYLbeXl3vfkLz3Cm3w
	fSlXBxGhUVLdsZlJkU8MWB/or7wfIA=
X-Received: by 2002:a05:7022:e21:b0:119:e569:f875 with SMTP id a92af1059eb24-1244ae9c26cmr7270724c88.18.1768748844535;
        Sun, 18 Jan 2026 07:07:24 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefa7c5sm12274637c88.10.2026.01.18.07.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:07:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] re2c: upgrade 4.3.1 -> 4.4
Date: Sun, 18 Jan 2026 07:07:20 -0800
Message-ID: <20260118150722.2045208-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 15:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229580

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/re2c/{re2c_4.3.1.bb => re2c_4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.3.1.bb => re2c_4.4.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.3.1.bb b/meta/recipes-support/re2c/re2c_4.4.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.3.1.bb
rename to meta/recipes-support/re2c/re2c_4.4.bb
index bead73279f..3be66d1388 100644
--- a/meta/recipes-support/re2c/re2c_4.3.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.4.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5f5e8a618960f68bb46ee8728ecd4132e1275b595cfc7a48476f977afd01d0cc"
+SRC_URI[sha256sum] = "6b6b865924447ef992d5db4e52fb9307e5f65f26edd43efa91395da810f4280a"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"

