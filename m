Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.4375.1617862162540614324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 23:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fLnLVSsv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617862160; i=@fujitsu.com;
	bh=1eIRJUWFpFoS/He27TE7aZ58EZe0s3ynDUrYk+Ff8zY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fLnLVSsvsdp1UXNEoVEEuwz23iM5xfJN3BVw48hApcyI3FfwBJW6pXYWbbeacNCHs
	 A9P4U/BUFtp/MpxLIz7iMYXE3w/19nvPdlEC869G45qdfhxH0Z69Ydso45/Pndmk6o
	 8D9rxCELPnL6qf/ZR68zgq13PSTsoqMpFWviawdtFIKLJkhKxCSiNBcEGxWcX2aQWG
	 RLQs025HaP6liXclAxOnl+tl0RE1JAPDPhC3reF0nQ8BUYOhnqsVZSxp5KHtDPdlhF
	 phEdBvn6Rupkww3Bn7jO4V4FUo0L9wms5cn+2bSqYAaHYEar/7UIi9xsNf1GYqH9b4
	 LdPSeRm5c6a6A==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 53/2D-14281-01E9E606; Thu, 08 Apr 2021 06:09:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRWlGSWpSXmKPExsViZ8MRoiswLy/
  B4MQOIYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPJOr+CyRwVz+dfZ2lg3MXexcjJISSwhUli
  7v4oCPs4o8SvleYgNpuAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+N0D1iosYCtx6/B1sBIWo
  Pj7lWUgYV4BR4m3Lc3MILaEgILElIfvmSHighInZz5hgRgjIXHwxQuoGkWJ2ZebWSDsKonOD8
  fZJjDyzkLSMgtJywJGplWMlklFmekZJbmJmTm6hgYGuoaGxrqmukYmhnqJVbpJeqmlusmpeSV
  FiUBZvcTyYr3iytzknBS9vNSSTYzAwEopZP24g/HQ6w96hxglOZiURHmzJuUlCPEl5adUZiQW
  Z8QXleakFh9ilOHgUJLg7Z8LlBMsSk1PrUjLzAEGOUxagoNHSYS3bDZQmre4IDG3ODMdInWKU
  VFKnPfIHKCEAEgiozQPrg0WWZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPuB5nCk5lXAj
  f9FdBiJqDFJQdzQRaXJCKkpBqYApfqG+//f6O/Z4XCW0+VB6/nBV3S5lj6kS9jFvu8pT9c21b
  sjLp3fOulf88XHnPzNg/59ri2Z7fJh+f5zz93rax2jDgWqr73gpEj+zO5xMr0F2m1a1KOpG5j
  UJr7NvVHrM7DXLGlvzny2jdcWnrovbbT83+cFi9yszWTAtMTl/GVFrCkaVdxHE2wtBaU2m/fx
  9N83Fzhas4lnU3zWJMfPNg62y34yoXl8k+X78/ezTMxnbv2M5vZHP6/wSoRzBomu8Qmaz86Lj
  q/KXXfS8Wa1L21NQfdXQx6H7F1BS1vrd9YqN8Q/Nx506Zy7q//VsbrVOitbmw8NO3IzD9zTSx
  jWaMe+26dJL3/oppUf4+TEktxRqKhFnNRcSIAu/BpqicDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-248.messagelabs.com!1617862159!518032!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12237 invoked from network); 8 Apr 2021 06:09:20 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-25.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 06:09:20 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13869F8N021143
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 07:09:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 07:09:13 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] help2man: upgrade 1.48.2 -> 1.48.3
Date: Thu, 8 Apr 2021 14:09:02 +0800
Message-ID: <1617862144-5153-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../help2man/{help2man_1.48.2.bb => help2man_1.48.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.48.2.bb => help2man_1.48.3.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.48.2.bb b/meta/recipes-devtools/help2man/help2man_1.48.3.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.48.2.bb
rename to meta/recipes-devtools/help2man/help2man_1.48.3.bb
index 3e9b509ed4..a612c0896c 100644
--- a/meta/recipes-devtools/help2man/help2man_1.48.2.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.48.3.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "20cb36111df91d61741a20680912ab0e4c59da479c3fb05837c6f0a8cb7cb467"
+SRC_URI[sha256sum] = "8361ff3c643fbd391064e97e5f54592ca28b880eaffbf566a68e0ad800d1a8ac"
 
 inherit autotools
 
-- 
2.25.1

