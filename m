Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.9499.1624979133110281687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 08:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JnTHlZX3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624979130; i=@fujitsu.com;
	bh=KrQAKeRK3FhocOF7xVw7sWD32F0r2U8G7ckwAe1Yefs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JnTHlZX3H51mS3yM+Rbzfs5ILfTx9dg4H6vLzi9MpQZ284zKGO6QpIYd9v8Q/24y3
	 zS2H9uB0io/fUfJ2UaCuwmgPAu/KDh5FX6hAiftwoPMVZoSFHSIcVlHHzIM7InZPXb
	 9wLwOmYAFGygq1N6P/NLRZhU6AN5AimrKKzG83NLN1Wwj7YxHtEVB6m1td2iCdwIJV
	 q5uHd6naP8iLxb6ONIi9ezZMj91JQf57w8nY8iGfWcb6fO/kFa5sxIDdqWWe/V6GMz
	 b32iFVT98WGnxXHygg2Mxa1MJ1t5Ou4f04TbYnsS2g0js86ORWlULEL7jacKszjbAi
	 4Ct9APAJgWJVA==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 8A/8C-27273-AB63BD06; Tue, 29 Jun 2021 15:05:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MRorvL7Ha
  CwYrXPBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bN6W+ZCh5wVGx69o6xgXESRxcjF4eQwCwm
  ib/71jFDOCcYJVY8esXUxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg9jCAm4S2
  5u+sILYLAKqEqc7rrOAlPMKOEnM7AcrkRBQkJjy8D0ziM0p4Cyxed9cRpASIaCSxZ8lQcK8Ao
  ISJ2c+YYGYLiFx8MULZohWRYnZl5tZIOwKideHLzFPYOSfhaRlFpKWBYxMqxgtk4oy0zNKchM
  zc3QNDQx0DQ2Ndc2BLFO9xCrdJL3UUt3k1LySokSgrF5iebFecWVuck6KXl5qySZGYDCmFLJn
  7mCc/OaD3iFGSQ4mJVHeS3q3E4T4kvJTKjMSizPii0pzUosPMcpwcChJ8F4wAcoJFqWmp1akZ
  eYAIwMmLcHBoyTCOxkkzVtckJhbnJkOkTrFqMtx+fq8RcxCLHn5ealS4rycpkBFAiBFGaV5cC
  NgUXqJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvbZBVPJl5JXCbXgEdwQR0xKInN0GOKEl
  ESEk1MLnbiC8zdGw4HHRFdka6+wzz94/2/t6ip7BdQ+/UTIYE9m12ksYhCXUqe78dXZchKTyJ
  3/bxf+U7hcwCF08FHTJ78Ly6kc/hbvl7EZ6rjzrbm2bNCjw34YdaomLfhxshsmsTPxltOp1Wn
  cvQpL185uXv0/7p21bf/b9rRk3IPcWejoLLS3rfsXnEbb17L/tsHJfcOf3FKkc8F69tEr2qfn
  it5b6FtcwfLba7uu37lXFHdf51poN7TftSXftCuzYKfJLKsc2eVrgz9eYEjz8xLTM5/x5Wsc/
  7peXwWYjrk3OBm1zi+c+bEz+dOqAnv4r/xTnBzY/jSxykGVZNWh9i+NekJNdi9hQB9Tkc7fdM
  rJRYijMSDbWYi4oTAbiXErZNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-238.messagelabs.com!1624979129!38806!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27653 invoked from network); 29 Jun 2021 15:05:30 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jun 2021 15:05:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15TF5QYm007165
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 16:05:29 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 16:05:27 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xf86-input-libinput: upgrade 1.0.1 -> 1.1.0
Date: Tue, 29 Jun 2021 23:04:53 +0800
Message-ID: <1624979093-98912-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624979093-98912-1-git-send-email-wangmy@fujitsu.com>
References: <1624979093-98912-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...f86-input-libinput_1.0.1.bb => xf86-input-libinput_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_1.0.1.bb => xf86-input-libinput_1.1.0.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.1.0.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.1.0.bb
index 1777492ed9..5688eb4767 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.1.0.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
 
 DEPENDS += "libinput"
 
-SRC_URI[sha256sum] = "fddec49c115591918475155bf16aaf23017d7f814cee7823a0c11f867aca245b"
+SRC_URI[sha256sum] = "e11d2a41419124a6e9b148f1df181bf7819fc7398c8ee9a1b6390b0742c68d16"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.25.1

