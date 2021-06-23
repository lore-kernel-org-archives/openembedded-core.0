Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.3797.1624428700619670213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 23:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FPmPGoQX;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624428698; i=@fujitsu.com;
	bh=6L5RuZfsEk33P6X9GQM1+vgJSX0YtzsV74+F4VQ7jeI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FPmPGoQXQB9Ajp0GnNkHEcp4NmNrCeOkB8kAhFtzgXMkdZuIsJTvxVluc/QwTO9Vn
	 apyA6WwvHkOiVdC7m3TuzBj4uOU2Qkv7WiCRDCa7Yzmc9N2jqHQDY5+bfjaCO2dG6D
	 px6I0Mvfb7gpG6l/Da25cb35Z7Ch0jD2RgHZfpAyc4TH7IAe8xDwdLvbHC7xjSpzsU
	 ueERPOfW8H73gfFHdoND2aZg2NXwCN9AwI44gKMRc7EmualJ2lchHE4bCrpSFQZ7o4
	 XpNOMZGt+xq0BFY8ooZKi1wSF5wMtiyuAEUPwXFbDU0M+tXSz1IOT5hmtwZXp/pR+C
	 qDvmB/aArYFYg==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 1D/0B-08493-990D2D06; Wed, 23 Jun 2021 06:11:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVXfmhUs
  JBt1PVS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyDXbEFn3kqJiz7wN7A+JC7i5GLQ0hgFpPE
  1wVz2CCcE4wSGxcuY+1i5ORgE1CTmH7rBpDNwSEioCdx9Z8oSJhZQEXixe8edhBbWMBO4u/zZ
  SwgNouAqsTstTOZQGxeASeJh3fmgdVICChITHn4nhnE5hRwlrixfy8biC0EVPPs2w52iHpBiZ
  Mzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcTrw5eYJzDyz0LSMgtJywJGplWMFklFmekZJbmJmTm
  6hgYGuoaGRrqGlma6RqameolVukl6qaW65anFJbqGeonlxXrFlbnJOSl6eaklmxiBwZhScOT/
  Dsblbz7oHWKU5GBSEuW93n4pQYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr/p5oJxgUWp6akVaZ
  g4wMmDSEhw8SiK8sSBp3uKCxNzizHSI1ClGRSlx3gSQhABIIqM0D64NFo2XGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnzhp4DmsKTmVcCN/0V0GImoMUKvy+CLC5JREhJNTAteLg9peD67xv
  Z19q77zZttXkR+IuH+Xf8r2cXbWQZGVbUCvXnVm9wU/bxOfNPfnpM+Mf3UWnPNn+fLSh5UK9i
  0R3tDc2XDhQL64qt977lU2KzlOXQrpm2x376z97vcKJzo0WtQMnJpkmLHxTce1Gr9K5+0qvlf
  rM+cGVOCVx8dYu2yl233Dc8f1XDdrc3R3/dat/peNeh7kGgR3nz4ze+XElxz7tttK/5bVyu9G
  i7xHltx0mf/nzSNv2aGpWhIj3PPSOzqmLhc763Cl7L5W3r6/PXyvzsutJ7Wu/O7Zs3XU08eDU
  XukrVF+t+kbF/4pYUNEnv4tSn1kcvc60Nvnt5bUZqBMv523uVLuz1qF2lxFKckWioxVxUnAgA
  tSK7p0EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-287.messagelabs.com!1624428697!118003!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5795 invoked from network); 23 Jun 2021 06:11:37 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-7.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jun 2021 06:11:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15N6BTZv032005
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 07:11:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 23 Jun 2021 07:11:30 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxcrypt: upgrade 4.4.22 -> 4.4.23
Date: Wed, 23 Jun 2021 14:11:05 +0800
Message-ID: <1624428666-81189-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624428666-81189-1-git-send-email-wangmy@fujitsu.com>
References: <1624428666-81189-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libxcrypt-compat_4.4.22.bb => libxcrypt-compat_4.4.23.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.22.bb => libxcrypt_4.4.23.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.22.bb => libxcrypt-compat_4.4.23.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.22.bb => libxcrypt_4.4.23.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.22.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.23.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.22.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.23.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index e4505a666d..79a2aa49d6 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "3df9620d08db207367c0c5152148665b5ce422e1"
+SRCREV = "5dcc36aeeb053654659e898fd3de7f365c1c4df5"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.22.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.23.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.22.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.23.bb
-- 
2.25.1

