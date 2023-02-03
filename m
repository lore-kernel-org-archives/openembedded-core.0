Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421B0C636D4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:01 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.17899.1675446659369502713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPMbZiYm;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id bx22so2840637pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvFdPos7LEuqBFM204cCLLaGfuL3cN5imeg4nHKkNxM=;
        b=hPMbZiYmuT14hExQor3Kq/gWhZ1gOw+Wtr5iDy6EF3j590M5WxdZBFypb3i0HIrZIn
         uPE3oAE7DRY0JfB1hdo/jH1MdJIF/wK53MQJjrU6LfBzcgyuX8os9qlHJI26FnJl9tGR
         exUwJCytjO9Ylq3qhOzE0gfrTrrrAliT8lJl5JVI8dJ/zomtvXSfZn4ZgRCulCcUFrAd
         KFDLQIH4lNhv6v8AoqQ3UkfA426RIZjIlLpEAZCBchPeeWKihmd6qUpYojq7mJVFcRM3
         9Mk5Qtk6kgBymjQsPDzNZG7AhSinAWrC/xHk/0PtMLdNmyM5cUmJw1q7vf8pBwrG7VGB
         PMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvFdPos7LEuqBFM204cCLLaGfuL3cN5imeg4nHKkNxM=;
        b=Wg2oNdyfv+f46cBC6p+uD4mEwuhW3djXSQKCew2f0+moKwf9TeY8gwEK8ORxLX2yL6
         nOFSvvWWn/BJRJ5vRJxsYLgr8Mq+jkYaaV0bX7ulFl5hveksncwsZWf6USkwbXqwZkNH
         1+8n0PYKhld+ziiKidfRmlXpLwiKsQAuiwbH3HAj+F6chuFk0bdXRjaGcNSFrlGDlyM5
         jyr8jDI/GQNA6GPcqSD3oFOTsb2aisOMq3PHnNTj+tCxTaZ8tYwUYVmQRKa30KsS0/R1
         ilbWUr7SmPbqJ3XRJACHP9r94XVNbLiiZgrbzfw8r9EvJvpDdDaZYMG2xJEclyo2l5da
         VJvQ==
X-Gm-Message-State: AO0yUKU9UuP2c66/YxmmvggN2ecXNyuXaGBWqGwo4wz5u9SsQXmkc/wf
	csU5w26X784bYZ3X4UAHO7mjXFlAPfM=
X-Google-Smtp-Source: AK7set/Sz2kQQhjMC+e3GICV6emKI+8448YCwZ55PXnYZPnnQd7weQNrJPRpga62e5x8JD1fKw2GSQ==
X-Received: by 2002:a17:903:1205:b0:196:15af:e6de with SMTP id l5-20020a170903120500b0019615afe6demr13626167plh.68.1675446658341;
        Fri, 03 Feb 2023 09:50:58 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.50.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:50:57 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/14] python3-poetry-core: upgrade 1.4.0 -> 1.5.0
Date: Fri,  3 Feb 2023 09:50:25 -0800
Message-Id: <daa8c442de92995ef7bd3d831a2cdff060abeaf2.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176738

* Drop deterministic.patch; merged https://github.com/python-poetry/poetry-core/pull/545
* Drop vendored pyparsing LICENSE; no longer vendored

https://github.com/python-poetry/poetry-core/blob/main/CHANGELOG.md#150---2023-01-27

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python3-poetry-core/deterministic.patch   | 23 -------------------
 ..._1.4.0.bb => python3-poetry-core_1.5.0.bb} |  5 +---
 2 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-poetry-core/deterministic.patch
 rename meta/recipes-devtools/python/{python3-poetry-core_1.4.0.bb => python3-poetry-core_1.5.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core/deterministic.patch b/meta/recipes-devtools/python/python3-poetry-core/deterministic.patch
deleted file mode 100644
index 402ee530944..00000000000
--- a/meta/recipes-devtools/python/python3-poetry-core/deterministic.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-builders/wheel: Ensure dist-info is written determinisically
-
-glob() returns values in "on disk" order. To make the RECORD file
-deterministic and consistent between builds we need to sort the
-data before adding to the records list.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://github.com/python-poetry/poetry-core/pull/545]
-
-Index: builders/wheel.py
-===================================================================
---- a/src/poetry/core/masonry/builders/wheel.py
-+++ b/src/poetry/core/masonry/builders/wheel.py
-@@ -294,7 +294,7 @@ class WheelBuilder(Builder):
- 
-     def _copy_dist_info(self, wheel: zipfile.ZipFile, source: Path) -> None:
-         dist_info = Path(self.dist_info)
--        for file in source.glob("**/*"):
-+        for file in sorted(source.glob("**/*") ):
-             if not file.is_file():
-                 continue
- 
diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.5.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.5.0.bb
index 8a950220125..03db426b39a 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.5.0.bb
@@ -14,20 +14,17 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
     file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
     file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
-    file://src/poetry/core/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
     file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e \
     file://src/poetry/core/_vendor/tomlkit/LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82 \
     file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
 "
 
-SRC_URI[sha256sum] = "514bd33c30e0bf56b0ed44ee15e120d7e47b61ad908b2b1011da68c48a84ada9"
+SRC_URI[sha256sum] = "253521bb7104e1df81f64d7b49ea1825057c91fa156d7d0bd752fefdad6f8c7a"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
 S = "${WORKDIR}/poetry_core-${PV}"
 
-SRC_URI += "file://deterministic.patch"
-
 RDEPENDS:${PN}:append:class-target = "\
     python3-compression \
     python3-core \
-- 
2.30.2


