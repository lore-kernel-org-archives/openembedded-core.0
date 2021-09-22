Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web08.6924.1632316444442661570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 06:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EvD/Rkwr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632316442; i=@fujitsu.com;
	bh=nzRjrPCqSwDISUNn/MxDOm4r2jE8i0HJXZa7KHy9KSc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EvD/RkwrTn878/LDtgvB9E7GZCkk6yE6dlFVGxFMJ9Vl43EZqLVK4+hbbWdaWZbxg
	 l7Zji1yDEQ9sJbFIBmOJemjjcAbLPwFVy89Uz4HxmLIedqlpaSE7i6GtEYncPgvDXA
	 N537feRmeesjja60hVgdJU1+CYEn9o5223oJnsYibIfLfzi2dvtL5TsacNQIdlXIPL
	 PyL/zH+4wwAxrWCK5mVBCmOI3MIoi+zEwmgPeiqiKWjk60tXXxNAZ3Dy4VDhzZtcSq
	 9T43cTgFZKtEwjboZ7mW8zElxQHJw6ZMdATBZfvW0AEol4wIxT45SqOtz9SXjvC80V
	 0OwOf7wxZvMhw==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 5C/20-21838-A1C2B416; Wed, 22 Sep 2021 13:14:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxRVdKxzv
  RoG8jk8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtE2dw5zQQNHxYup11kaGBeydzFycQgJzGKS
  +DF5LRuEc4JR4sWJx0AZTg42ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7B6xEWMBKYvvpn
  YwgNouAqsT9jbOZQcp5BZwkGi+6gIQlBBQkpjx8zwxi8woISpyc+YQFYoyExMEXL5ghahQlZl
  9uZoGwKyRmzWpjmsDIOwtJyywkLQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWprrGhqb6yV
  W6SbppZbqlqcWl+ga6iWWF+sVV+Ym56To5aWWbGIEBldKwdHOHYy/Xn3QO8QoycGkJMordMUr
  UYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr4e2d6KQYFFqempFWmYOMNBh0hIcPEoivIIgad7ig
  sTc4sx0iNQpRkUpcd4IkIQASCKjNA+uDRZdlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80
  qBTOHJzCuBm/4KaDET0GL+lR4gi0sSEVJSDUz263atv/RtS8NLf6Nya87GCSWepsJ9+7QWpeb
  eqfV0K+pY0cY6eUNt9v+HN86tEr4iPW8hz+2vUXLp8htlhAXu9xx5sZBBzrHvhJnVzsygypd3
  64wKVj3wq39ScFj4jPa9tP/Cl0Vtd5ycev/jl+/KHXkz7x+o4le/9OaH94RZi/n2pUz58YfdM
  XU73wk2C7dpl4XVOX1F+rQ+urOujqqfPvHXV+nl+lIWmbvzS0+/vBG0ec7frXM1Hz7U/Rfz7o
  3vl/YVU3PalPa8twrYcSzS9XNdl1jXdkWVqNnz5Pzkex7kszz4vm3is5OBNpPz+K/2lJ2fN6t
  Jve7Ao9V6FZxSR3anCenu/bPUbqnEbU5vJZbijERDLeai4kQAUR/c2ikDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-285.messagelabs.com!1632316441!176085!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8812 invoked from network); 22 Sep 2021 13:14:02 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Sep 2021 13:14:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18MDDsu9001761
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 14:14:01 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 22 Sep 2021 14:13:53 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] acpid: upgrade 2.0.32 -> 2.0.33
Date: Wed, 22 Sep 2021 21:13:32 +0800
Message-ID: <1632316416-58153-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/acpid/{acpid_2.0.32.bb => acpid_2.0.33.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.32.bb => acpid_2.0.33.bb} (55%)

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.32.bb b/meta/recipes-bsp/acpid/acpid_2.0.33.bb
similarity index 55%
rename from meta/recipes-bsp/acpid/acpid_2.0.32.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.33.bb
index 227e4a4675..7094ba2662 100644
--- a/meta/recipes-bsp/acpid/acpid_2.0.32.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.33.bb
@@ -3,5 +3,4 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-SRC_URI[md5sum] = "248995264b9d1cd8bdb923d5b190fd44"
-SRC_URI[sha256sum] = "f2d2d30b3edc3234bd82f6f7186699a6aa3c85c8d20bc4e30e9b3c68a1ed157e"
+SRC_URI[sha256sum] = "0856f71b3eb34a1b663d0a8e6363dfcbc519e63d847330498898658e2972dbe8"
-- 
2.25.1

