Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10939.1793927637309559096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 17:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QKXwbKOv;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f6295304dso137542eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 17:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927636; x=1794532436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exG029InAKqsUnF3KC1GwoOh3B1V02ux0Y+C8uywZA0=;
        b=QKXwbKOva5omS/2Uq1ZCi0NXULttim9zfRmMqEIvMUrm6RvTSuuZdSQrYYiVq2eHei
         +rtudsuUrQEHD3/cC9gfe5A1z2Pn9z0K/uwuI2hNYHFaw+djrkgiZQjAPNrbnlT3j83Y
         +hZqvXp3XsWNOVfVOkWJRAZLCig5ekLTBX6GDS8mE5Nzszes6WbM1RNqMIK1QKfKAzbN
         CXANmTD9rzJ9Jomj2/ew8EgtA1PztPXj536kKC3z76lph41o/IztzX0XOEfkyvN6eUwy
         CPEqFuzsrX4P7nb1EU6CoMrXcHfGvuq7KFLW68MDPoYN9AIdsx9tkYWaYhGdp+5AFOgq
         /RNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927636; x=1794532436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=exG029InAKqsUnF3KC1GwoOh3B1V02ux0Y+C8uywZA0=;
        b=mlEunTXANWJurDCJH4+7tGvIA9kGZIhkQcdUSaXK63OL2Y/d1j1Pf0WzPRX9rFA2jJ
         If57eR6eRgoeVCR+B4sIwwGQnU4UD8dUuYC0VhnQpYAJwegbaZwE0nbhoVL8Sov9JsP5
         1rail0y/r+GZvt8PFlTHVUCc1fE3TigC45P+oprQtQShdo9NZn7qoHqjBJ9b2Rs3Rl1H
         uNlAnTCpXM3FYvm92HrWs9Gy2wLA4HpNjBv2m28vsEbpmKV3F2X3+A6MyWtX1rnhYLXX
         9lntzXfre9zWs/x64IFJaEjTa5gpVXPdUcujWcavhNWWN3jQqgHdz05NYYEB5PONQPGZ
         UbVw==
X-Gm-Message-State: APuU4Z/wln+b4EBLYXLc9jYgvsAcCzfSDchL62PyG7XkBazl4Ds2QvN/
	zXD3X1DL72F0g52CrNwB8iX9cNtTArm03wDYjFn2A7iw9rF7YcV31YYMLOCJ3w==
X-Gm-Gg: AYBFou0cu0/eFvgAyglcPBDsY2UXxPhaqHYN+koAElFlF7kZz0v54TQPiHUXoWkG/cP
	ZdY2RpKtoBu0BuH7w/YK5uXNWNn4zbwzx11LUsrRPh77Ma84hNL7o2vaJJtRhSdLyhL/AXcAGaa
	9ab2NyUU7s0OGCOu9wqgAQHShw+x3gY16ECzp+bf9/4uQsrywJe2MApDxIra+cFZ/xTDfhqKO3E
	6lbtUNGz6tp9+s6PF76ejxkxLlTPVVQhh2Pi518L3e4pikBBfIeat6S2YYtsYTnE4aH15+6PE8O
	iMVIrYXTANj/sNWbYYgeHwHvbv5R9d+MdG5U9LQ9ejqyb0k0Hsn9RhqpBtld4chUsM6ZJEIT26+
	ugI6Of2rkPew0QvnpNTZPB85iGcfV8WK3/KyTj43e7aMGkhogt+NfT490VihcD9Wq/r6aQhkofs
	wSrnbEniAujISGA8/JP+8u/yuDl+KyVX6LJ0od1g/s6hX0HwlWVQ1q6284bToMPNgxqddJbdPYL
	1jLgCTBq0RTD9t6T3oiDiYANIF3DuMcgaIy/m1tJ5TbW6Agv4Hrrfb6hHbybmc3SGRoeGE0/A5+
	UUHIKwym31WUhCjzpkE0r7HCEFk57I9J/uTuj9A6W1g1x1wOGBC2Zc5z0+G2tlfMYDqKcVvMeoI
	CejAyQItk3Q==
X-Received: by 2002:a05:7301:d805:b0:36b:f09f:924a with SMTP id 5a478bee46e88-36f7592e4d4mr721686eec.14.1793927636246;
        Thu, 05 Nov 2026 17:13:56 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm1166949eec.10.2026.11.05.17.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:13:55 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	peter.marko@siemens.com,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
Date: Fri,  6 Nov 2026 10:13:24 +0900
Message-Id: <20261106011324.626292-2-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106011324.626292-1-ragaprasanth@gmail.com>
References: <20261106011324.626292-1-ragaprasanth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 01:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249582
Content-Type: text/plain; charset="utf-8"

CVE-2026-76844 is a webpack-dev-middleware CVE. Its record got the zlib
gz_vacate details by mistake; the zlib CVE for that bug is
CVE-2026-85091 [1].

[1] https://github.com/madler/zlib/issues/1330

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 meta/recipes-core/zlib/zlib_1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.4.bb b/meta/recipes-core/zlib/zlib_1.4.bb
index 18b27df878..2bc1967c0e 100644
--- a/meta/recipes-core/zlib/zlib_1.4.bb
+++ b/meta/recipes-core/zlib/zlib_1.4.bb
@@ -47,3 +47,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
 CVE_PRODUCT = "zlib:zlib gnu:zlib"
+
+CVE_STATUS[CVE-2026-76844] = "cpe-incorrect: this CVE is for webpack-dev-middleware, the zlib details were added in error"
-- 
2.34.1

