Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.12220.1631112142965791696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=POxO6kxC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631112140; i=@fujitsu.com;
	bh=bBMZKRsxH1IxcYlplUoBk69zk6UiCtXo8S29ewCHNCA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=POxO6kxCqMBTf2lZmvKAQuKMXFhiBUd0Pv9UIkgz+phXDEyHxCOFjfQ/PTgIDsFJw
	 nxwdlhdFS0fGEYBkXb9QE0JD+dNmcwRoh3s4iPjxIyhkZv5Y0ZDk8pDdBnHsC31BTg
	 xElmk6ArcBkTpwqHWLgR+KJBUjzPKInwU1IkvT516wDT1GWuJiFWW8kFCnRNoEqahV
	 l2ASnMUGtSWCQh17GsVA+ozn3hEegO3sej4Bi20QEPq2UC/aArsdWdwi4SVYU2ttcx
	 mK3eyHSp0pJVDYG4ypI6+2Iq9dRnrRz9VsmopOclGDZ43WgKfUC6WSoOYSD0alKYNY
	 7rzycUPfRts8A==
Received: from [100.113.6.150] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id DA/96-23595-CCBC8316; Wed, 08 Sep 2021 14:42:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRonv6tEW
  iwef9hhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aByefZCpp4K+YtvsXYwHiVu4uRi0NIYCaT
  xJMNr1ggnOOMEtPPTgNyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHnYQW1jAWuLQj
  ResIDYLULxnx24mEJtXwEni8M6VYGMkBBQkpjx8zwxicwo4S6y+uJ4RZKQQUE3PIxaIckGJkz
  OfsECMl5A4+OIFM0SrosTsy81QYyokZs1qY5rAyD8LScssJC0LGJlWMVomFWWmZ5TkJmbm6Bo
  aGOgaGhrrmusamRrpJVbpJumlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxAsMxpZD9zw7G
  668/6B1ilORgUhLl3bXbIlGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/mKaCcYFFqempFWmYOM
  DZg0hIcPEoivE5HgNK8xQWJucWZ6RCpU4yKUuK8a0D6BEASGaV5cG2weLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZjXCmQKT2ZeCdz0V0CLmYAWtz00AVlckoiQkmpg6hY7aHee9Yh/IPv
  B3UGxD3fv8pxteP/T1dgqsxltgi8N735mVLm1+PFWu0OyAuLX5s5PeXXfdnPCwug25rM1e/Li
  nJcrrP+XZC3oMFl2bqdLwJq9XG4fnXoui19wfvzMxV/xvnPplwib+t8KenuV01pzPKN0Vl/7s
  WHNmjQmloddBvYHCsJdF3YnKF65+vx7/P/1+T5LH4ksv/Zg7Xad/2v16guPn3vffmabn/bpjc
  nTNxpPk0uOCqnV3Bokss//YV7R7tn3XnkEHo58ncuxvOxZx2G1ec1f1/dPKKo139R4+LWJ7wP
  vS0y3b9losTmm3xPOnrH5+lvuTecZZLkT55x7G+ofPLW0w+/vIffFaUosxRmJhlrMRcWJAPrc
  pUxCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-248.messagelabs.com!1631112139!46109!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26000 invoked from network); 8 Sep 2021 14:42:19 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Sep 2021 14:42:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 188EgDqi019599
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 15:42:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 8 Sep 2021 15:42:15 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 2.9.0 -> 2.9.1
Date: Wed, 8 Sep 2021 22:41:59 +0800
Message-ID: <1631112120-19285-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631112120-19285-1-git-send-email-wangmy@fujitsu.com>
References: <1631112120-19285-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Final subset API is in place and if no issues are discovered,
it will be the stable subset API of HarfBuzz 3.0.0.
Old API is kept to ease transition, but will be removed in 3.0.0.
Various fuzzer-found bug fixes.
hb_buffer_append() now handles the pre- and post-context which
previously were left unchanged in the destination buffer.
hb-view / hb-shape now accept following new arguments:
--unicodes-before/after: takes a list of hex numbers that represent Unicode
codepoints.
Undeprecated API:
hb_set_invert()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_2.9.0.bb => harfbuzz_2.9.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.9.0.bb => harfbuzz_2.9.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
index bc91a8c03c..694553beef 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3e1c2e1d2c65d56364fd16d1c41a06b2a35795496f78dfff635c2b7414b54c5a"
+SRC_URI[sha256sum] = "0edcc980f526a338452180e701d6aba6323aef457b6686976a7d17ccbddc51cf"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.25.1

