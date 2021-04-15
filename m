Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.3355.1618467756389223608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NKM+q6bZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618467754; i=@fujitsu.com;
	bh=uKQjAoHW+Yq51Kk5DWbZT8QKfi3PEv4tQc9xJJT0bvY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NKM+q6bZflMgmMBAiCnyWOzuNUOfvpSaRFHuIOUiGR78aWOJF5gNGGkGV/ux3c2uz
	 j8+5eNH2VDtqmEASHIzh4k+iyEACaZO5ZICppoG6UArXjSgxhE6u1lBl/7Og1mT0Bk
	 UppH+9qFN4JeNiIKLARRA354p/LIwgRRdAuElfQVSn5AMS5YC3R91gi2ro/ZaboB7c
	 0gw2J61WkAz/OtwC+FbwY0eCS5TlXziDf50k0G7/ZraeF7pZUeSuuBy8UWv9mhN/xX
	 kvyxOlpIDLoDylxkBbp0TtSYV3Pp5oiWTFv+a16nl3SOUUCDncxn/NLrTEWoZPLMIN
	 IBKq/OaU0Augw==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id F8/D5-46412-AABD7706; Thu, 15 Apr 2021 06:22:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MRqrvqdnm
  CwZyjfBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aiN/9YCu6JVHS2nGBqYLwm1MXIxSEkMItJ
  4kjrBFYIZzejxLa+tUxdjJwcbAK6Eucer2XvYuTgEBHQk7j6TxQkLCxgK3Gzt4cVJMwioCrxo
  ksdJMwr4CEx58QVNhBbQkBBYsrD98wQcUGJkzOfsIDYzAISEgdfvGAGaZUQUJSYPV0eorxSYv
  u0s4wTGHlmIemYhaRjASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLC11DYwO9xCrdJL3UUt3
  y1OISXUO9xPJiveLK3OScFL281JJNjMAQSik41rSD8eTrD3qHGCU5mJREeQ+tKEsQ4kvKT6nM
  SCzOiC8qzUktPsQow8GhJMG751Z5gpBgUWp6akVaZg4wnGHSEhw8SiK8ujeB0rzFBYm5xZnpE
  KlTjLoc734uXsQsxJKXn5cqJc4rAowOIQGQoozSPLgRsNi6xCgrJczLyMDAIMRTkFqUm1mCKv
  +KUZyDUUmYNxlkCk9mXgncpldARzABHVGxqhTkiJJEhJRUA9MKMddVLfmeclnWm3tyHvKkSgc
  cTotctv6kWu2/X7eUj/L6S/lWzJe6ua+MsVrzckx/tgWrgBTLAuE4jfkmOxmjlr1eWhpbXJrI
  WD9x3qNPez66/l/Uobblz/MroaHuxXJaF152qOnd3hEuEHBPx5FJSrV/37Sy0qLporYbPYQXP
  S7yOGd78Ma27O7IMH/B1If7T3z4M/3p/vRz9i/uR+00mrr2wbX8BaZGmbevb31zLVFpRvkzF9
  99zp/3/Ph0zqqo/11opsbcLwe4JuwTjeEQWPHyNItXsvJLmX0/89dl/YzSOvdV+2uuEc/JX9s
  0uc7OebSeK3+7l90drbkCnPI76x0P8byfYiDXwOTDXqLEUpyRaKjFXFScCADGQ5ekKAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-291.messagelabs.com!1618467753!1070067!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15399 invoked from network); 15 Apr 2021 06:22:34 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-5.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:22:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F6MXId032551
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:22:33 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:22:32 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.104 -> 2.4.105
Date: Thu, 15 Apr 2021 22:54:16 +0800
Message-ID: <1618498456-53236-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-meson-Also-search-for-rst2man.py.patch
removed since it is included in 2.4.105

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...001-meson-Also-search-for-rst2man.py.patch | 30 -------------------
 .../{libdrm_2.4.104.bb => libdrm_2.4.105.bb}  |  3 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/0001-meson-Also-search-for-rst2man.py.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.104.bb => libdrm_2.4.105.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm/0001-meson-Also-search-for-rst2man.py.patch b/meta/recipes-graphics/drm/libdrm/0001-meson-Also-search-for-rst2man.py.patch
deleted file mode 100644
index 67fafd40c3..0000000000
--- a/meta/recipes-graphics/drm/libdrm/0001-meson-Also-search-for-rst2man.py.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4129a8c6911b6b0ef3665cb167da6b635c29614d Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@cn.fujitsu.com>
-Date: Mon, 8 Feb 2021 17:30:52 +0900
-Subject: [PATCH] meson: Also search for rst2man.py
-
-That's what upstream docutils installs by default.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/drm/-/commit/62b9a3eee9bdaafa766e92d5bebeb4e59845c45a]
-
-Signed-off-by: Heiko Becker's avatarHeiko Becker <heirecka@exherbo.org>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index a4d8d70..07d2e08 100644
---- a/meson.build
-+++ b/meson.build
-@@ -261,7 +261,7 @@ else
- endif
- 
- with_man_pages = get_option('man-pages')
--prog_rst2man = find_program('rst2man', required: with_man_pages == 'true')
-+prog_rst2man = find_program('rst2man', 'rst2man.py', required: with_man_pages == 'true')
- with_man_pages = with_man_pages != 'false' and prog_rst2man.found()
- 
- config.set10('HAVE_VISIBILITY',
--- 
-2.25.1
-
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.104.bb b/meta/recipes-graphics/drm/libdrm_2.4.105.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.104.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.105.bb
index ff869d6db9..8cb82ad123 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.104.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.105.bb
@@ -11,10 +11,9 @@ PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
-           file://0001-meson-Also-search-for-rst2man.py.patch \
           "
 
-SRC_URI[sha256sum] = "d66ad8b5c2441015ac1333e40137bb803c3bde3612ff040286fcc12158ea1bcb"
+SRC_URI[sha256sum] = "1d1d024b7cadc63e2b59cddaca94f78864940ab440843841113fbac6afaf2a46"
 
 inherit meson pkgconfig manpages
 
-- 
2.25.1

