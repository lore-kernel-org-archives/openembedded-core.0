Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web10.4243.1630571690172934380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 01:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YBc3xu9Q;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630571687; i=@fujitsu.com;
	bh=QGUAa5mPuwVDihrJVnNeKDXVh2N76WdHPFIuIkDrsYI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YBc3xu9QXjutqFyv2wrgaXtxkbri2oe7Bn5UD4gLdXZM76z4/uFA41FynVhHqmM7i
	 OtNJCisecWMkwIcdx1W2+f5U8AfCjGXbkqzOcTJb9fw9849bLAZTwwhp2i8Xoorwp/
	 Ripv/ob2tbDCxSxevDhefR8oVb45FPlgPrdOo2uiyFuNrlm6I5/KF7HGzoNlXIn6b5
	 IZm4b/ypo5ozuEM1LBrbCJThe73zbiK/IwYUFVb7YZbhVO1+HnElqWYrWJ+UraAR2E
	 EHWEY8BCg33e5YVcHRHMc8insvc+kJr1dyMSpT/7dWcU6eTAkIuBbVkufLnRcc93bi
	 laa6+ovInNOcw==
Received: from [100.112.194.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 45/A2-14609-7AC80316; Thu, 02 Sep 2021 08:34:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxRXdZj0G
  iwbXNFhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8avxQtZC97xVNx4cY+5gXEvdxcjF4eQwEwm
  ifaf/9kgnOOMEhvfbmTvYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vASoQFbCQWb
  rwLZrMAxRd0v2IDsXkFHCVuHPjKAmJLCChITHn4nhkiLihxcuYTFog5EhIHX7xghqhRlJh9uR
  mqvkJi1qw2pgmMvLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoSUQm5joJVbpJuq
  lluqWpxaX6BrqJZYX6xVX5ibnpOjlpZZsYgSGV0rBgQk7GPe//qB3iFGSg0lJlNetyiBRiC8p
  P6UyI7E4I76oNCe1+BCjDAeHkgSvVAdQTrAoNT21Ii0zBxjqMGkJDh4lEd7j7UBp3uKCxNziz
  HSI1ClGXY5VB6avYhZiycvPS5US53XtBioSACnKKM2DGwGLu0uMslLCvIwMDAxCPAWpRbmZJa
  jyrxjFORiVhHmjGoGm8GTmlcBtegV0BBPQETw/dECOKElESEk1MM078knu7Qy161tf1k1dIxI
  zuSOd//U8aet47ZgIGe7XXDtP/gr89fynxjPtSbLzIwvu1G/662Lh+flwYOaL8hdfs3xamVin
  9u81rJOIvL508YGg25arZrc0q3F8kZNs2PB39SqbN1OeiEv7RvCqzdcNCmDYujzx5BUvxanzR
  DdeeRP0ufRR4rqcy5YPHA/uUj7s+X7XtcaLvmp73q6qmJph9tg/QCr9pEkM19UDJ1ecuL09uu
  QA86/W9bctt377IrsrXLAq4H0Iz88/s1433DvC0WplG8MeOSufTWW7SniekPurGyUVt769NZF
  gOPG74ZriNyF9Z9MYLQVxDpa7gXPOscmJ2/TPltq4X62yfKMSS3FGoqEWc1FxIgD8A+VONgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1630571686!117220!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21084 invoked from network); 2 Sep 2021 08:34:46 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Sep 2021 08:34:46 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1828Yea2021008
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Sep 2021 09:34:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 2 Sep 2021 09:34:39 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] glslang: upgrade 11.5.0 -> 11.6.0
Date: Thu, 2 Sep 2021 16:34:31 +0800
Message-ID: <1630571671-1794-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

## 11.6.0 2021-08-25

### Other changes

* Atomic memory function only for shader storage block member or shared variable
* Add support for gl_MaxVaryingVectors for ogl
* Fix loading bool arrays from interface blocks
* Generate separate stores for partially swizzled memory stores
* Allow layout(std430) uniform with GL_EXT_scalar_block_layout
* Support for pragma STDGL invariant(all)
* Support for GL_NV_ray_tracing_motion_blur

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glslang/{glslang_11.5.0.bb => glslang_11.6.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_11.5.0.bb => glslang_11.6.0.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_11.5.0.bb b/meta/recipes-graphics/glslang/glslang_11.6.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_11.5.0.bb
rename to meta/recipes-graphics/glslang/glslang_11.6.0.bb
index 2f076e5684..c39be55d5f 100644
--- a/meta/recipes-graphics/glslang/glslang_11.5.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.6.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "ae2a562936cc8504c9ef2757cceaff163147834f"
+SRCREV = "2fb89a0072ae7316af1c856f22663fde4928128a"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
-- 
2.25.1

