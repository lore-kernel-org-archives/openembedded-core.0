Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63758C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:54:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.7306.1646135658560258326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CJDHhzQ2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646135656; i=@fujitsu.com;
	bh=LxiIuUS9+U/B+nXO1b1HvMUdnjjN7R6czWMQDHduECo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CJDHhzQ2kxrwdA7Jo+gzeFjdiN3i6PS8wHpyIHUJ7lopVseX6OKpbNC5ho2GaySPu
	 twBzIxsXJz0RhgWHHsm2yOLp3iZfvxaO1/XZ/hTScOkg8rL5NIAAdWSTTsGRV5T+Tm
	 mmypcJ4UqWYhngRCZxfCbrgMD5I51Xuk5uqWrgATjQzb2PJ2d/dCNB9wHnQ0WZ5XrA
	 r5DVwFCKfGt8TG4zvLZqqcCjdrSmz6i2W2D7OzGUaAW4XM2l93HSw3TmX5trFG4uo/
	 pSPNPZPsGbGJsc4bYGzeY3S76Zx3R7bam4hKvJ+bXe3rwXFBkOeUmVdjyx85gZbSQH
	 2rcBVPoADZ9Og==
Received: from [100.115.35.140] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 44/6F-14616-8690E126;
 Tue, 01 Mar 2022 11:54:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSTeDUy7
  JYM0sFos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeNU4x/Wgj2iFV8ufWZuYNwn1MXIxSEk8JhR
  4v/jXUwQznkmiX13j7NAOMcZJbqf3gXKcHKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAg8Sqlg52kBIWoPiXvTIgYV4BJ4nTj/exgtgSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itE4qykzPKMlNzMzRNTQ
  w0DU0NNU1NtE1MrTQS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMqUYqVb
  Oxg3rPqpd4hRkoNJSZRX7aZskhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3u3scklCgkWp6akVa
  Zk5wAiBSUtw8CiJ8MaxAKV5iwsSc4sz0yFSpxgVpcR5j3MAJQRAEhmleXBtsKi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYdwvIFJ7MvBK46a+AFjMBLf4bLAWyuCQRISXVwDTvMZcQnwK
  /5ssdhzValNdMZb1x/3SinaS+24kPv536XWb5Z3nuvai0UMs9/IDhrC1Fm497Hl6yVONt+MtU
  7a6VoimZPf4RG44LebnyKdb8qpzadFTWQZ7bb9bbpsnbw/N1nO0u+JxbGvl/3fOteQovmovnJ
  yaa/rzL9P5X4s6rH18qPub9I5PSldvd3laWetAzYK5mzb6dEyY43jPXtJsa6qYdMSUwiHthhI
  bWHptHevX5z7cwaBneUZ5yamHMr1XT/wrdWzlp2o25D+Tv/Svfaf171tu3z+vnLswsW7z06P3
  4fYfP28rfS9o3//4uW8b5dx1YguZMf6nHuTN7G+trBaE/K/RP5PJsfrjhXGG9EktxRqKhFnNR
  cSIANqhqMkUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1646135655!21315!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24725 invoked from network); 1 Mar 2022 11:54:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 11:54:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B1AE8100453
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:54:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A428B100445
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:54:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 11:54:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libjpeg-turbo: upgrade 2.1.2 -> 2.1.3
Date: Tue, 1 Mar 2022 19:53:51 +0800
Message-ID: <1646135633-39009-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 11:54:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162547

License-Update: year updated to 2022

Changelog:
==========
1. Fixed a regression introduced by 2.0 beta1[7] whereby cjpeg compressed PGM
input files into full-color JPEG images unless the '-grayscale' option was
used.

2. cjpeg now automatically compresses GIF and 8-bit BMP input files into
grayscale JPEG images if the input files contain only shades of gray.

3. The build system now enables the intrinsics implementation of the AArch64
(Arm 64-bit) Neon SIMD extensions by default when using GCC 12 or later.

4. Fixed a segfault that occurred while decompressing a 4:2:0 JPEG image using
the merged (non-fancy) upsampling algorithms (that is, with
'cinfo.do_fancy_upsampling' set to 'FALSE') along with 'jpeg_crop_scanline()'.
Specifically, the segfault occurred if the number of bytes remaining in the
output buffer was less than the number of bytes required to represent one
uncropped scanline of the output image.  For that reason, the issue could only
be reproduced using the libjpeg API, not using djpeg.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jpeg/{libjpeg-turbo_2.1.2.bb => libjpeg-turbo_2.1.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.2.bb => libjpeg-turbo_2.1.3.bb} (94%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb
similarity index 94%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.2.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb
index 25b83f72f7..fdc035d5f7 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://libjpeg-turbo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=8a61af33cc1c681cd5cc297150bbb5bd \
                     file://jpeglib.h;endline=16;md5=52b5eaade8d5b6a452a7693dfe52c084 \
-                    file://djpeg.c;endline=11;md5=b61f01ad6aff437b34d1f9e8004280a4 \
+                    file://djpeg.c;endline=11;md5=510b386442ab6a27ee241fc5669bc5ea \
                     "
 DEPENDS:append:x86-64:class-target = " nasm-native"
 DEPENDS:append:x86:class-target = " nasm-native"
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "09b96cb8cbff9ea556a9c2d173485fd19488844d55276ed4f42240e1e2073ce5"
+SRC_URI[sha256sum] = "467b310903832b033fe56cd37720d1b73a6a3bd0171dbf6ff0b620385f4f76d0"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.25.1


