Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.1404.1621468459128091280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 16:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cBumNebt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621468456; i=@fujitsu.com;
	bh=W/gAdK5naU8H7KE2amCrDcpT+oWrJbJgfaq5tLDUzjE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cBumNebtDdEqyrQyFW3muzfc/7yhJqSp7oL5fZCUEO58KJajhmi8xCtTdAtMreyo3
	 3D8m2pBBVONdm67RPrKNqfK6mHK9huFjLIOJORxRJlpLTJVKed08M7FS6cHOXwe8uc
	 nVOKCC9CFmlAaDG0Ms8mKPg5X4KYMBSYIJ0RpuOM7noCbgaNhTy4ymmt69x8qVpY8X
	 6njWB1LtCmTkmSO3z9dJfJwnF/2r1g1s5WugEEQYilQK/oltumc1pP/9xviPD6BMhn
	 odn4G6myVh8eIA5oyVEQfWkmIrB/lo0Kc0IZtNZxKxxZk9NvG7gk/8up95X2Gb8EF6
	 b7+TRcyR3GJvw==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 7B/FE-63525-725A5A06; Wed, 19 May 2021 23:54:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVVd96dI
  Eg49vVSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxtL08zF5xjr7jftY2lgfExWxcjF4eQwCwm
  ibZb7UxdjJxAzglGif1zskBsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu4cdxBYWsJW48
  GUqmM0ioCqx4+RyMJtXwEni6eHtrCC2hICCxJSH75lBbE4BZ4l17a/YIVY5SaxZtYUZol5Q4u
  TMJywQ8yUkDr54wQzRqygx+3IzC4RdIfH68CXmCYz8s5C0zELSsoCRaRWjZVJRZnpGSW5iZo6
  uoYGBrqGhsa6xrqGliV5ilW6iXmqpbnJqXklRIlBWL7G8WK+4Mjc5J0UvL7VkEyMwHFMKmQ/t
  YHzy+oPeIUZJDiYlUV6z+4sShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwTlu8NEFIsCg1PbUiL
  TMHGBswaQkOHiURXo0pQGne4oLE3OLMdIjUKUZFKXHe2UuAEgIgiYzSPLg2WDxeYpSVEuZlZG
  BgEOIpSC3KzSxBlX/FKM7BqCTMawkyhSczrwRu+iugxUxAi/83LgJZXJKIkJJqYCpiSHPKYa5
  Utdl+U9rqwZdXcT99nR88t78444fA/UkWd91bpvN7bpy28qyUu6PXIRmNunf79xQy3Grc5WPP
  eezQnP0uXwXEXjyxvbZ9ou0eCdmTctN/SrBH9C9Wi7v7af7NN4JmAU7OebOfTZV7ECI+UWTR8
  4kN3ebxr1mypi0vjjEomZeafLyVsfFIjsx8vb8LZ+3MYAqx3zxX78DlV6/XCka6fjjAeN9C/S
  Tbm6wIwZ3GnDxJkvyuKk92sk42r0naY/5bTbPsFZP/sVV9/pXOt951CSZfeZBdnl7xosJ2W47
  fxRYX+xUN+2qu18YZSCzbdvEdx4u1+/xynvudfRrJpceTs8QjmDPnoGjfJSWW4oxEQy3mouJE
  AGEnYWRCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-232.messagelabs.com!1621468454!35556!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2456 invoked from network); 19 May 2021 23:54:15 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 May 2021 23:54:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14JNsE6w027582
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 00:54:14 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 00:54:12 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.105 -> 2.4.106
Date: Thu, 20 May 2021 07:53:52 +0800
Message-ID: <1621468435-21509-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
References: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.105.bb => libdrm_2.4.106.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.105.bb => libdrm_2.4.106.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.105.bb b/meta/recipes-graphics/drm/libdrm_2.4.106.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.105.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.106.bb
index 8cb82ad123..2f63489021 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.105.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.106.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "1d1d024b7cadc63e2b59cddaca94f78864940ab440843841113fbac6afaf2a46"
+SRC_URI[sha256sum] = "92d8ac54429b171e087e61c2894dc5399fe6a549b1fbba09fa6a3cb9d4e57bd4"
 
 inherit meson pkgconfig manpages
 
-- 
2.25.1

