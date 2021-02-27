Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web10.638.1614401337777023586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 20:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 29/D9-03420-D2FC9306; Sat, 27 Feb 2021 04:48:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxRVfnvGW
  CwcQJehZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bDpC72gtscFdsPn2JvYHzO3sXIxSEkMINJ
  4sXM14wQznFGiSV/37J2MXJysAloSvRu2QKU4OAQEdCTuPpPFCTMLKAucWldCwuILSxgK/Fj7
  QUWkBIWAVWJeXfEQcK8Aq4Sp6Z0s4PYEgIKElMevmcGsTkF3CTWX5jACGILAdV0n97FCFEvKH
  Fy5hMWiPESEgdfvGCG6FWUmH25mQXCrpTYs/kh6wRG/llIWmYhaVnAyLSK0TKpKDM9oyQ3MTN
  H19DAQNfQ0FgXSBob6CVW6SbqpZbqJqfmlRQlAmX1EsuL9Yorc5NzUvTyUks2MQLDMaWQoWkH
  47tXH/QOMUpyMCmJ8jo2WyYI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCddxYoJ1iUmp5akZaZA
  4wNmLQEB4+SCG/NOaA0b3FBYm5xZjpE6hSjopQ4bzRInwBIIqM0D64NFo+XGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnzzgMZz5OZVwI3/RXQYiagxVdizEAWlyQipKQamM45nfYSZUj2epN
  zaLvVGf3ap5+tZrjVGrBbe3YyFu3rPzlX2U/G268+uSRkYrBr1a5auTUSUrmilR8M9/8QZC17
  fSR/ZgyL+RKNk1zS0xZ910mwqnYutZ9pJCW9b/fEZ4sKJy+61ql+7N+ivXdWzdhRGqf+JlX+2
  yNNK2bPF/uiba5eDI1Qm1040X7GNNfTi3li53SIbjhh8P9DddqNw/9Va3OO3qvWuPVi5hqW+3
  b6DYoCL5Zam3fv+Sk6X5C7c6XuA3Ye41pnpcVf7ycfELJudT9e9n+HWNKVRW/2fZlbOrdhYdf
  ixMtNKz6rSRz6Xr73t4zjCW0pv2dmpcYTPmx/pnp+u+mSt85z2g3YuZRYijMSDbWYi4oTAZiG
  E5hCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-228.messagelabs.com!1614401324!780819!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8841 invoked from network); 27 Feb 2021 04:48:44 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2021 04:48:44 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11R4miO0007550
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 04:48:44 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 27 Feb 2021 04:48:42 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] iproute2: upgrade 5.10.0 -> 5.11.0
Date: Sat, 27 Feb 2021 12:48:16 +0800
Message-ID: <1614401296-27095-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1614401296-27095-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1614401296-27095-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../iproute2/{iproute2_5.10.0.bb => iproute2_5.11.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.10.0.bb => iproute2_5.11.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb
index 4be9c82474..e27b42d232 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "a54a34ae309c0406b2d1fb3a46158613ffb83d33fefd5d4a27f0010237ac53e9"
+SRC_URI[sha256sum] = "c5e2ea108212b3445051b35953ec267f9f3469e1d5c67ac034ab559849505c54"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.25.1

