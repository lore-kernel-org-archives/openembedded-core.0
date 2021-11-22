Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08040C433FE
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 14:58:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.7399.1637593136363992294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 06:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BHOutjZY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593134; i=@fujitsu.com;
	bh=mkOneX6qStcqJlAf4pk8nfAtUjAcuZa8RWZSa7PUkJY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BHOutjZY8iMafh8fbOjIRbRRig7I7PIWlT3mUPo1o8EY5OYhdcerK3jHUSdlCGqS2
	 2/sPHfGmYTMxqDOTd7zgaysYXbdPhybOzj0shhgdweqaRyAjbqQPpHAwe6uh29bX+M
	 nrdN+PXVYqwdheUwB0zRTz+ZqZDKskBzvW31XV1ZP9tCf1JM1yFgGw3K3T8LBVZphH
	 6ato3xXujrYO8j0RU6jdE/nCLmTUjSyL/vIWle+ZdU6+QHSs2uu0qF46xD3t7nDn2C
	 myPXk2xImONqRQX3FHVojwzy/K8/IlGk0z97y4RliCqWTOgvgIl/LVjQIFHDOkJL7p
	 XKa+ldAhLIM9Q==
Received: from [100.115.36.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 5A/4A-01854-E20BB916;
 Mon, 22 Nov 2021 14:58:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSVdvw+x
  Eg0kvRCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxnXU2MBSdEKr71VTQw/hfsYuTiEBJ4zCix
  cvlbZgjnPJPE4fmdTF2MnEDOCUaJ3t4YEJtNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuY
  QexhQUcJC5NncAMYrMIqEq8Pj2RBcTmFXCSOLujlw3ElhBQkJjy8D1YDaeAs8TtBVuYIVY5Sa
  yac4kRol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaN1UlFmekZJbmJmjq6hgYGuoaGprrGJrpGBqV5ilW6iXmqpbnlqcYmukV5iebFeanGx
  XnFlbnJOil5easkmRmAIpxQrnd3B2Pv1h94hRkkOJiVRXqPZsxOF+JLyUyozEosz4otKc1KLD
  zHKcHAoSfA+XgeUEyxKTU+tSMvMAcYTTFqCg0dJhNcBJM1bXJCYW5yZDpE6xagoJc57GyQhAJ
  LIKM2Da4PF8CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz264Gm8GTmlcBNfwW0mAlo8en
  j00EWlyQipKQamK77zL0qfiWjx+x62jJpoYuL9Dmq3oesTjkUsFxo5d/8Nf37Bb6enSdYNL9z
  c12MnPeJ66pvNjzkKMqs/WKdd95pbWBQwN3P169YOk7S4ghx3TJ7zawLnkubriybJ/2r/9QJV
  +Y3Dy61VqS93fzXZ1HfximKyffqnS6nCq7aKajyXDxLXmqW6SvzzaFLJr3P12K9+/Gszunmpf
  P8m389WlgVZvCBTX7K0isbz78sWPh03d6oHQZvJW48/vZwba9tUbCqf+GqhyX839IWVLx/xVj
  nnVe9ZIbtVe7loVOUnt6Wn/znyM6/+X59Mq6NUzKcDvd+Ud1iysZk/fJ3KNezyUbr4s52PWpU
  5/7WFbSPr2SaEktxRqKhFnNRcSIAY05qmVwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1637593134!236103!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29246 invoked from network); 22 Nov 2021 14:58:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 14:58:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BD06C10045A
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:58:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8C82310046F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:58:53 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 14:58:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libjpeg-turbo: upgrade 2.1.1 -> 2.1.2
Date: Mon, 22 Nov 2021 22:58:31 +0800
Message-ID: <1637593113-99188-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593113-99188-1-git-send-email-wangmy@fujitsu.com>
References: <1637593113-99188-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 14:58:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158571

Significant changes relative to 2.1.1:
Fixed a regression introduced by 2.1 beta1[13] that caused the remaining
GAS implementations of AArch64 (Arm 64-bit) Neon SIMD functions
(which are used by default with GCC for performance reasons) to be placed in
the .rodata section rather than in the .text section.
This caused the GNU linker to automatically place the .rodata section in
an executable segment, which prevented libjpeg-turbo from working properly
with other linkers and also represented a potential security risk.

Fixed an issue whereby the tjTransform() function incorrectly computed the
MCU block size for 4:4:4 JPEG images with non-unary sampling factors and
thus unduly rejected some cropping regions, even though those regions aligned
with 8x8 MCU block boundaries.

Fixed a regression introduced by 2.1 beta1[13] that caused the build system
to enable the Arm Neon SIMD extensions when targetting Armv6 and other legacy
architectures that do not support Neon instructions.

libjpeg-turbo now performs run-time detection of AltiVec instructions on
FreeBSD/PowerPC systems if AltiVec instructions are not enabled at compile time.
This allows both AltiVec-equipped and non-AltiVec-equipped CPUs to be supported
using the same build of libjpeg-turbo.

cjpeg now accepts a -strict argument similar to that of djpeg and jpegtran,
which causes the compressor to abort if an LZW-compressed GIF input image
contains incomplete or corrupt image data.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jpeg/{libjpeg-turbo_2.1.1.bb => libjpeg-turbo_2.1.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.1.bb => libjpeg-turbo_2.1.2.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.2.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.1.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.2.bb
index fbed6eeca7..25b83f72f7 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "b76aaedefb71ba882cbad4e9275b30c2ae493e3195be0a099425b5c6b99bd510"
+SRC_URI[sha256sum] = "09b96cb8cbff9ea556a9c2d173485fd19488844d55276ed4f42240e1e2073ce5"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.25.1


