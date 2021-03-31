Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.7481.1617200572549519685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ltKxQTzH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617200571; i=@fujitsu.com;
	bh=Irjyo/eM4E3Wa7yeRIPcIv4YIC/AtVofb6IjrGt+v/E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ltKxQTzHL3H7zulIMLQDCVUvrX2d0MoO+FB8Q8/sh0GrfQrbjZhabfNESigX93j2B
	 7IdzWSt2rXRcI9Gvx6dNkhuwBwLEFOwtSosw6hck1lr/m5VVN/jFIQKgB9G2WkPAS1
	 Ke6CSwFEvYsBUjXMbrhdcRN5kYdlSgaLIdQ+MI/0CXhJgL98nQq3Lg/R9RBM3v0Hj8
	 8gxnJasxKS06OUZMNLGEZ23TdZCPzMkfyH3+2qBFvSw2Se5x8EkJHZcRP1pXBNR5Yp
	 ULLLTFk63ECScIfmcH4FFyi02WMYhCR53yAUoFTF1hPX+y4OfqvtZcnbYQ3DVbpg5U
	 4RyrMwBK7T2dA==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id CF/A9-53635-AB584606; Wed, 31 Mar 2021 14:22:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRqrurNSX
  B4OZqFYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP363csBXfZK27+ncPSwPierYuRi0NIYCuT
  xMOV96CcE4wS36btBnI4OdgE1CSm37rB2sXIwSEioCdx9Z8oSJhZQEXixe8edhBbWMBE4sCvm
  SwgNouAqsSLZ93MIDavgJPEpIapjCC2hICCxJSH78HinALOEsdfLQAbLwRUM33BTjaIekGJkz
  OfsEDMl5A4+OIFM0SvosTsy80sEHaVROeH42wTGPlnIWmZhaRlASPTKkaLpKLM9IyS3MTMHF1
  DAwNdQ0MjXUNLIDYy00us0k3USy3VLU8tLtE11EssL9YrrsxNzknRy0st2cQIDMeUggN1Oxgf
  vP6gd4hRkoNJSZT3kX1KghBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3gUtQDnBotT01Iq0zBxgb
  MCkJTh4lER4PYDxIcRbXJCYW5yZDpE6xagoJc6rBpIQAElklObBtcHi8RKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYd6NINt5MvNK4Ka/AlrMBLT4yqNEkMUliQgpqQYmxcXx685ueHT3srN
  Z9zz+ps7gJYzPDOd9TQ2zf2TIHjy/dJ50Pevxk01dMjd0Dhw3EhB9crnC+n3S54sF5/bwTZ6c
  z+b7fILn48YdJ3IvaOeVrLvrOSNMecflkLXvNzwvW8j+8cfCSfFuZ3Z9uj+x7skp3hz/x8eCf
  t8+XdOTf2lZ9vTpa62uxb40sbzemeZm6sDrP3Hpa8F+h99llRH/L1k8vf7Pb1f2T1auw8uudF
  xa5tz27OwTry9cd37/3e7OcJzjd/QWnVPL3FZsKvvd90V49rSNLWJ3DHau0fXZ3/0vQ+U0M+f
  dXtPSSQc6OcM/Lu85dq3U7vT3icatlgaFxuzz86InBZp6Mff4bbdY+lOJpTgj0VCLuag4EQDa
  tMv6QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-265.messagelabs.com!1617200570!411644!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23514 invoked from network); 31 Mar 2021 14:22:50 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-22.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 14:22:50 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VEMk4a004354
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 15:22:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 15:22:47 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.38 -> 0.39
Date: Wed, 31 Mar 2021 22:22:27 +0800
Message-ID: <1617200547-62088-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
References: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.38.bb b/meta/recipes-core/ell/ell_0.39.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.38.bb
rename to meta/recipes-core/ell/ell_0.39.bb
index 7d3a339978..68ec4cb4a4 100644
--- a/meta/recipes-core/ell/ell_0.38.bb
+++ b/meta/recipes-core/ell/ell_0.39.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "c1b7ae5676eec310f08757b3d8652b8e818776be1897fb5deb59e55f02a012a7"
+SRC_URI[sha256sum] = "653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1

