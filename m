Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D19FC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 12:26:54 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41384.1786105606853597186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 05:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DcgLNGNE;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1484; q=dns/txt;
  s=iport01; t=1786105606; x=1787315206;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/4Sucdpx/TPqJggV+jzjWNzeys5Er0F34tp2+I15ktI=;
  b=DcgLNGNEitmpcPJTwrOv/TYNqA8iGYCoV3Emm/zYGJQ0vTwi4ClXQqGT
   BVg7zxSRoCF2LV0zd6bZWU1DOXufo7Q3tfc3+XxjKkgU3941xANYKXKJB
   shSESFTm7dxSayqHDiMzU9QQwsNvFm/GWtQvoZZcjOZbrqAmyMkPPLyi+
   VzEvtKCU16u8MNHdXNpQ703guAyBvB7l+KLCTFiuGPj/qiraSi7GHftHP
   9XMMHYPVoEnC/IU5S8lSw9PmHwMnqCUesCEe65QNnCkp/QN6mJ56XcyKg
   RkzinaFmmLEIk3mNhbka0nfkYz9OqdZ2B4ZT1UvakDN6W47VPZRIjLEVK
   g==;
X-CSE-ConnectionGUID: UZz3QWXASA6fyglUEcpj3Q==
X-CSE-MsgGUID: +cjLmfheQlmql5PG9/lvvw==
X-IPAS-Result: =?us-ascii?q?A0BAAgAdznVq/48QJK1aglmCV3RfQkm0aIF+DwEBAQ8xI?=
 =?us-ascii?q?AQBAYUFjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?w2GXTYBRjBcRIMCAYJ0AgG/VYIsgQHeRYFmAQsUAQWBM4U/ModvhXInG4FJR?=
 =?us-ascii?q?IR+hRCFeASCIoEMkmhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bB?=
 =?us-ascii?q?wWBHYEohGcjGTZ6gQlegS0qZAESF4EJgkkCgnaBMAULGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?XghgkFZNYJppWWhD4QngWaKO5U6GjOFW6URmQikWoRpgWg8gVlNIxWDIglKG?=
 =?us-ascii?q?Q+Qfs1eJDU9AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:guL5vquK27Xc8QNxDi9d/m1ZMufnVHlfMUV32f8akzHdYApBsoF/q
 tZmKWDUMqqDNGXwe9xyaYS+9B4PscPcmIRnQAJuqCpgFSJGgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/Lb90s21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwx9RlWlhxx
 dUjAW4Dfx+Hus+92LDgc7w57igjBJGD0II3s3Vky3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgx/5JEWxI9EglHkczxetVmVrII84nPYy0p6172F3N/9KoTXFJUFwRbJz
 o7A1yfyADUfOtyS8D6A63bxvsCe2iflRp1HQdVU8dYv2jV/3Fc7ARkbRVK9reO0zESzX9ZYL
 U088C0psawz8gqgSdyVdxS8rW6suh8aRsZKFOs7+EeBx8L8+QeSBmEeQnhZdcYqtcIeQT0sy
 0+HmM7vCTVzsbqTD3WH+d+8qiu/PyUQJ2IOaSIICAAC+dTLpIAokgmJSc5uFqOwhND5FTz8h
 TeQo0ADa647hMoP0eC/uFvAmT/p/saPRQ8u7QKRVWWghu9kWLOYi0WTwQCzxZ59wEyxFDFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:6x4pv6B9VJlLowzlHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3AyELgaWiDu55BgeFQdf3f4lPcGjJuT0/Pl07vE2a?=
 =?us-ascii?q?DIDhnWbKRdHKb4KE/qp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AeFwV2g6Kk5v+iM/qVaB4y7BExowr6KaKDU4NnKw?=
 =?us-ascii?q?CvtCAaBRfanCZkiqoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,210,1779148800"; 
   d="scan'208";a="805988789"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Aug 2026 12:26:45 +0000
Received: from sjc-ads-8046.cisco.com (sjc-ads-8046.cisco.com [171.68.208.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id ACAA518000107;
	Fri,  7 Aug 2026 12:26:45 +0000 (GMT)
Received: by sjc-ads-8046.cisco.com (Postfix, from userid 1784405)
	id 3DADCCC160A; Fri,  7 Aug 2026 05:26:45 -0700 (PDT)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Shinu Chandran <shinucha@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] perf: drop newt from tui build requirements
Date: Fri,  7 Aug 2026 05:26:41 -0700
Message-Id: <20260807122641.2786789-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8046.cisco.com [171.68.208.84];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.84, sjc-ads-8046.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 12:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243011

From: Alexander Kanavin <alex@linutronix.de>

As the comment says this was used by very old kernels
(pre 3.10), and slang has been the only option for a
long time. Also, correct the option to disable slang TUI.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a36a84490b943e6f0638c0430ad1eac7740e9be3)
Signed-off-by: Shinu Chandran <shinucha@cisco.com>
---
 meta/recipes-kernel/perf/perf.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2d432f3f40..a4bc3c1319 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -14,10 +14,7 @@ PACKAGECONFIG ??= "python tui libunwind libtraceevent"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
 PACKAGECONFIG[perl] = ",NO_LIBPERL=1,perl"
 PACKAGECONFIG[python] = ",NO_LIBPYTHON=1,python3 python3-setuptools-native"
-# gui support was added with kernel 3.6.35
-# since 3.10 libnewt was replaced by slang
-# to cover a wide range of kernel we add both dependencies
-PACKAGECONFIG[tui] = ",NO_NEWT=1,libnewt slang"
+PACKAGECONFIG[tui] = ",NO_SLANG=1,slang"
 PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
 PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
 PACKAGECONFIG[bfd] = ",NO_LIBBFD=1"
-- 
2.35.6


