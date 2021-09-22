Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.6737.1632316445171259747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 06:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=u+0w+jeB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632316443; i=@fujitsu.com;
	bh=vQThA9HuMGloI5h6nqsvsavBFfi2SbE5VXzRnDoae8k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=u+0w+jeBkhXLMipA3Kat4KhXsUgTKKP+OGNFJiDW1T3THTNhYQZ1zzg2mYfcv5tct
	 UrDJDYTddw4Y3bysW5/vOil+xshAOdaCh6wgNSThkrpT8tOS7CiS3C6RqnfO5H4LaW
	 yiTD14/3ipd5jW+nsMG5toMUCztbfjTAM0Qpl9xEqyApARHNucKT8YojmD2cJ5k7iF
	 FmFTdXdDWDzUHkOaFbr+7srgV0OUdBFn5eHijbnwSvlSoT36faTsn5yGhZbNuuonMO
	 T8GVCikjUeOaNLNCjGfOkzi4AJPG21EHbFCJjQdIys9NIZ0FT72NHcD4MLkMitKTbo
	 zMz4sKw6rf3nA==
Received: from [100.113.6.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 70/12-23198-A1C2B416; Wed, 22 Sep 2021 13:14:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxRVdKxzv
  R4Ow7Tos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPiRd6CyfoVfxdYNjDe0O5i5OIQEpjFJHHn
  8X3GLkZOIOcEo8SvVUYgNpuAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+N3DDmILC1hLfJh9n
  hnEZhFQlVi0fTMTiM0r4CSxedoTsJESAgoSUx6+B6vhFHCW+DF7EzPEKieJB2+2MUPUC0qcnP
  mEBWK+hMTBFy+YIXoVJWZfbmaBsCskZs1qY5rAyD8LScssJC0LGJlWMVomFWWmZ5TkJmbm6Bo
  aGOgaGhrrmuoaGRjqJVbpJumlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxAkMxpZD15A7G
  SW8+6B1ilORgUhLlFbrilSjEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtdD2ztRSLAoNT21Ii0zB
  xgXMGkJDh4lEd4YLaA0b3FBYm5xZjpE6hSjopQ4bwRInwBIIqM0D64NFouXGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnzSoFM4cnMK4Gb/gpoMRPQYv6VHiCLSxIRUlINTOFRwpdt52n8WSS
  hE/xcZhLviq7vvxdvDd1XONPFfNq5hRNLawOLU9ouH5qbsPnwtRN7dBcxH+I0uL55e1bJXs7X
  DkeLq147Z2yY2Xe0KUNW1mCfXfoiJ41LefLlV2tuuArdv3eoWnjuhd7pM7hz95lP2HArtUHge
  9354osyuW5hThsro9Lnyq84YHHkguaxb2/WS2j6HvW7zmp9vctoupqKgrt7V5/I8oaw18pl1Y
  vdH5dqF8SELSwX47mmtDOB+YBPic66SO53RRy51zlV2OTXsy8OXTP74LsF51rW2PH9qBDdM2d
  PgcCvX5IKd/aaTnp4X76uYBrjhZlTZNPsEzl0nMVW7A5O88+UT2LKUGIpzkg01GIuKk4EACA4
  LhNAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-248.messagelabs.com!1632316441!156913!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9569 invoked from network); 22 Sep 2021 13:14:02 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Sep 2021 13:14:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18MDDsuA001761
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 14:14:01 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 22 Sep 2021 14:13:56 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.16.20 -> 9.16.21
Date: Wed, 22 Sep 2021 21:13:33 +0800
Message-ID: <1632316416-58153-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632316416-58153-1-git-send-email-wangmy@fujitsu.com>
References: <1632316416-58153-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.20 => bind-9.16.21}/bind9                   | 0
 .../bind/{bind-9.16.20 => bind-9.16.21}/conf.patch              | 0
 .../bind/{bind-9.16.20 => bind-9.16.21}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.20 => bind-9.16.21}/named.service           | 0
 .../bind/{bind_9.16.20.bb => bind_9.16.21.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.20 => bind-9.16.21}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.20 => bind-9.16.21}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.20 => bind-9.16.21}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.20 => bind-9.16.21}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.20 => bind-9.16.21}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.20 => bind-9.16.21}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.20 => bind-9.16.21}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.20 => bind-9.16.21}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.20 => bind-9.16.21}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.20.bb => bind_9.16.21.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.20/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.20/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.20/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.21/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.20/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.21/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.20/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.21/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.20/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.21/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.20/bind9 b/meta/recipes-connectivity/bind/bind-9.16.21/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.20/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.21/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.20/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.21/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.20/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.21/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.20/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.21/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.20/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.21/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.20/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.21/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.20/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.21/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.20/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.21/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.20/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.21/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.20/named.service b/meta/recipes-connectivity/bind/bind-9.16.21/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.20/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.21/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.20.bb b/meta/recipes-connectivity/bind/bind_9.16.21.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.20.bb
rename to meta/recipes-connectivity/bind/bind_9.16.21.bb
index ddf323fb9c..390c84248d 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.21.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "4d0d93c0d0b63080609e84625f24ff8777f8d164e78a75b1c19c334ce42d5b58"
+SRC_URI[sha256sum] = "65da5fd4fb80b7d0d7452876f81fd6d67cdcee54a5e3c1d65610334665dfa815"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.25.1

