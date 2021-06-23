Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.3799.1624428701442483514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 23:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BNq6TQKg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624428698; i=@fujitsu.com;
	bh=B6iWpDlKL/3ZnOC5KyFJXbcqxcRPXU2pdv8tCVKD9d8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BNq6TQKg2rp6ChV/vDlEogqbVaAOHhBjS1XTUNwVszmzxkNEf0emgw1jJAe7VKJYO
	 kweDVn8neMGEwsALg+quBdFhr9GAv9F2R+O7hrcgdaxyUvfTYP9fZJapkCnRiL8avQ
	 1o15w6aKRkKVxmNgGU40g9vI8WT+jrplfzp6iUCcjak5j5GYW10NH2JkP4H1YGlXGT
	 Od7PQubBH/wa9OhuVl+bVhLk50xHegpGSVDJqEpK/cU2ceHyjBQ+WfmSUWlBoKEHKm
	 tyTGYjkgIEAzx8nGXwAgV/VYchK0cBVSKbhR4oge00prErujQyrlgdULuEUe2a/got
	 psjzQM/ilyV6g==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 1E/41-19780-A90D2D06; Wed, 23 Jun 2021 06:11:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVXfmhUs
  JBsdmW1nc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBn7OuYzF/zjr7ixm6eB8RJfFyMXh5DALCaJ
  vg8T2CGcE4wSLUfPMHYxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfPewgtrCAlcTHB
  Y+YQWwWAVWJU3eegpXzCjhJXN1vCRKWEFCQmPLwPVgJr4CgxMmZT1ggxkhIHHzxghmiRlFi9u
  VmFgi7QuL14UvMExh5ZyFpmYWkZQEj0ypGy6SizPSMktzEzBxdQwMDXUNDY10gaWqol1ilm6i
  XWqqbnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAyulEKG6TsY17z5oHeIUZKDSUmU93r7pQQh
  vqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzq54FygkWp6akVaZk5wECHSUtw8CiJ8MaCpHmLCxJzi
  zPTIVKnGBWlxHkTQBICIImM0jy4Nlh0XWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzBt6Dm
  gKT2ZeCdz0V0CLmYAWK/y+CLK4JBEhJdXAxOv0qy3q312OpXW/jq8Pf2y9c+JSnXX5U5feP+v
  5Ufn8x7fFp9nm2nFUiR3bl7VjvZxqqNKJ6R7TLx7dGcU22/btcVbu4zO276tbUKt+7PauXZo5
  y75Pn1mjHyXdnPHjwAOt5HN1drxVhXo2vmJxIbtD+spW//S1+Mv5JtCNc1nis50VOyO3G+qdi
  fwqdD9yfbTwOeO19d9bLl5PKFl541Dfb+n5EjmtQXvTWqOfSKuqP0+o0Z7kmLT4RNcTwVdps9
  84t/MXiz852lxeKNLNvOxIaaNtnouXcN+fxc/OuGut80986dKTWzzhf5Wwv9KZNu36T1unnPj
  DvqXvtqOPgutkaXXBH0vmtb3mfmTApcRSnJFoqMVcVJwIAPK6LxYpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-228.messagelabs.com!1624428697!140362!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12814 invoked from network); 23 Jun 2021 06:11:37 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-20.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jun 2021 06:11:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15N6BTZt032005
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 07:11:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 23 Jun 2021 07:11:27 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libva: upgrade 2.11.0 -> 2.12.0
Date: Wed, 23 Jun 2021 14:11:04 +0800
Message-ID: <1624428666-81189-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libva/{libva-initial_2.11.0.bb => libva-initial_2.12.0.bb}  | 0
 .../libva/{libva-utils_2.11.1.bb => libva-utils_2.12.0.bb}      | 0
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.11.0.bb => libva_2.12.0.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.11.0.bb => libva-initial_2.12.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva-utils_2.11.1.bb => libva-utils_2.12.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.11.0.bb => libva_2.12.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.11.0.bb b/meta/recipes-graphics/libva/libva-initial_2.12.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.11.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.12.0.bb
diff --git a/meta/recipes-graphics/libva/libva-utils_2.11.1.bb b/meta/recipes-graphics/libva/libva-utils_2.12.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-utils_2.11.1.bb
rename to meta/recipes-graphics/libva/libva-utils_2.12.0.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 43d916cd1c..3d65ac501e 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "6e361117038b571ad4741d38c9280db8c140b17e76e8c01fc7a4d608d3ed7d5d"
+SRC_URI[sha256sum] = "d3f4873715077a8c969c9bfe4ba8455a133353176be0ffe0c41ffd4155c9a8c8"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.11.0.bb b/meta/recipes-graphics/libva/libva_2.12.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.11.0.bb
rename to meta/recipes-graphics/libva/libva_2.12.0.bb
-- 
2.25.1

