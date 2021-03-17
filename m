Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.1932.1616025213003469357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 16:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 73/EB-38244-A7692506; Wed, 17 Mar 2021 23:53:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRqls0LSj
  BYPE0TYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP3/4usBZ2cFZ3T9rA1ME7i6GLk4hAS2Mwk
  MfXhEnYI5wSjxJGd1xm7GDk52AQ0JXq3bAGyOThEBPQkrv4TBQkzC6hLXFrXwgJiCwtYS0xcv
  oANpIRFQFXi0ftiEJNXwFXi5UYNkAoJAQWJKQ/fM4PYvAKCEidnPmGBmCIhcfDFC2aIGkWJ2Z
  ebWSDsKok1HdPYJjDyzkLSMgtJywJGplWMlklFmekZJbmJmTm6hgYGuoaGxrqGukZGZnqJVbq
  JeqmlusmpeSVFiUBZvcTyYr3iytzknBS9vNSSTYzA4EopZHy0g/H06w96hxglOZiURHlZ+4MS
  hPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwnpsMlBMsSk1PrUjLzAEGOkxagoNHSYTXZipQmre4I
  DG3ODMdInWKUVFKnLd1ClBCACSRUZoH1waLrkuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhH
  lZQcbzZOaVwE1/BbSYCWhxBD/Y4pJEhJRUA1NIx7Mzu6NbXPW1qx6/LZrlcSJX2LdmnfmOIMO
  qqTYhAZt+mp287z83bJ+sh+S+h48NfrqYvqwvXCpy6tPn08sD+yz/MLEW539cdd2Y/dMiJal3
  KlO+58uU3XLv+izdMMVGUPWXW37St7wVFySV/93P+nT0w4zi5V2Vi+XfPuoQW73vt0GJcqTox
  3nnfl/1D1iVsTR363Xb8o9cm9dYbxWTDmgJt/93TeW4x73NLbqZ1nE3wm3lfO1WNL3UFZ1be7
  mhlXfO9Q3b/bgVDn7zVzvP9dBJ69M2cWO/L5kJs+4d9nr7MuhvqL/v2p6MZSE/S//0V06WeLl
  qh9wRq00tt1pXR29WLbp8bg7fk+wdR74osRRnJBpqMRcVJwIANvwSQikDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-228.messagelabs.com!1616025175!62080!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4132 invoked from network); 17 Mar 2021 23:53:17 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-20.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2021 23:53:17 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12HNqlnQ006387
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 23:52:54 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 17 Mar 2021 23:52:45 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gptfdisk: upgrade 1.0.6 -> 1.0.7
Date: Thu, 18 Mar 2021 07:52:35 +0800
Message-ID: <1616025155-24363-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../fdisk/{gptfdisk_1.0.6.bb => gptfdisk_1.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.6.bb => gptfdisk_1.0.7.bb} (93%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
similarity index 93%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
index 5112debf89..a697b74f98 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "util-linux"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
            "
-SRC_URI[sha256sum] = "ddc551d643a53f0bd4440345d3ae32c49b04a797e9c01036ea460b6bb4168ca8"
+SRC_URI[sha256sum] = "754004b7f85b279287c7ac3c0469b1d7e0eae043a97a2e587b0560ca5f3828c0"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.25.1

