Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BEEC47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:25:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.5181.1670207125279433157
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nd5QDQB+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207123; i=@fujitsu.com;
	bh=c2tw+F7mB4Vd2+rtIT3/0pBJMKvYkSUthMypd9A8H2k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nd5QDQB+dRfmTK4XH80ebz6AiYqG454twVgFxlwFm1RObLUptbYiZeVtIc4vvTK7a
	 NPB53C5oEMniwrcvbyC0Wlp/BSSnNllSQaktUDFWJvtGYIJwfBIn0ZZftSa88bDtLO
	 QAgRWzB7DVGiMw3vxFCkdD3q88i+zklbBB+Tt0GAomDYNBHP5ai3iPlMk01oOTLxhD
	 VgoSlj6QxFHOg/Yp+Aiu8qF6e8CWHev9XAR8FFauaLNUbU1lzKkN6G559fRehlXDj0
	 HrXgcNaanjNYRfOrQ2FMJn8cJ+uG8JUJ60Sly4S/tUq62IWTSptuQAMVgZNu+DGGRN
	 fhy4SMMFkkNAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8OxWXdiWG+
  ywdoNVhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a0VTeYCiZZVzzva2drYFxg2sXIxSEkcJ9R
  4mDTFhYI5xKTxL91bWwQzm5GiQnv/rN2MXJysAlISdy4/x8owcEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAUuL8fJASTg4WoHjfsTNMIDavgKPE1TsfweISAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1iNCtOLSpLLdI11Usqykz
  PKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzGlOIEpx2MU5b9
  0TvEKMnBpCTKq/SoO1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/KoN5kIcGi1PTUirTMHGBkw
  KQlOHiURHiFvIHSvMUFibnFmekQqVOMxhzzZv/bz8wx82vbAWYhlrz8vFQpcd7uEKBSAZDSjN
  I8uEGwiL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjXzRdoCk9mXgncvldApzABnbKRvwv
  klJJEhJRUA9OeCaJ2m+UiV26JyJObrfdGxL240jE861rbzCPtq7ffW857w8N/xtPXW7LdD764
  7mX4fsoGOzbOdSrxvgbbZgh463ofcZvPysedFr70RJTuuoY2TWOdBS1y3p+569/1T+rSnmzt8
  ytb6IA32+c9zhJqRpcbk9tMZpw+1XM18nHVZOdf7+WzTsstap544GLg1NCzx5Ykv73tYcvauq
  Q483tGa6M9/wRv1jfn/15KFPLrfpViHTuffwPHaRHdhyF9l+M21Z4SWKA750Ho6WsbzljLLHo
  9+2t64/vNZ4xFGhdFui8yPPvRS6NnV5Uyz6yqB5t9HeU+bw12vLxZap5dRJq8wNafIa8s9FX5
  z7G8C1RiKc5INNRiLipOBAC02uMNUwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-728.messagelabs.com!1670207121!128663!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11897 invoked from network); 5 Dec 2022 02:25:21 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:25:21 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 673CE7B
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5A22D73
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:25:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.8 -> 9.18.9
Date: Mon, 5 Dec 2022 10:24:50 +0800
Message-ID: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174256

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  Fix a crash that could happen when you change
  a dnssec-policy zone with NSEC3 to start using
  inline-signing. [GL #3591]

  Don't trust a placeholder KEYDATA from the managed-keys
  zone by adding it into secroots. [GL #2895]

  Fixed a race condition that could cause a crash
  in dns_zone_synckeyzone(). [GL #3617]

  Don't enforce the jemalloc use on NetBSD. [GL #3634]

  Fix an inheritance bug when setting the port on
  remote servers in configuration. [GL #3627]

  Fix a resolver prefetch bug when the record's TTL value
  is equal to the configured prefetch eligibility value,
  but the record was erroneously not treated as eligible
  for prefetching. [GL #3603]

  Always call dns_adb_endudpfetch() after calling
  dns_adb_beginudpfetch() for UDP queries in resolver.c,
  in order to adjust back the quota. [GL #3598]

  Fix a startup issue on Solaris systems with many
  (reportedly > 510) CPUs. Thanks to Stacey Marshall from
  Oracle for deep investigation of the problem. [GL #3563]

  rpz-ip rules could be ineffective in some scenarios
  with CD=1 queries. [GL #3247]

  The RecursClients statistics counter could overflow
  in certain resolution scenarios. [GL #3584]

  Less ceremonial UNEXPECTED_ERROR() and FATAL_ERROR()
  reporting macros. [GL !6914]

  Fix a couple of bugs in cfg_print_duration(), which
  could result in generating incomplete duration values
  when printing the configuration using named-checkconf.
  [GL !6880]

  Refactor the isc_httpd implementation used in the
  statistics channel. [GL !6879]


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.8 => bind-9.18.9}/bind9                     | 0
 .../bind/{bind-9.18.8 => bind-9.18.9}/conf.patch                | 0
 .../bind/{bind-9.18.8 => bind-9.18.9}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.8 => bind-9.18.9}/named.service             | 0
 .../bind/{bind_9.18.8.bb => bind_9.18.9.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.8.bb => bind_9.18.9.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.9/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/bind9 b/meta/recipes-connectivity/bind/bind-9.18.9/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.9/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.9/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.9/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.9/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.9/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.9/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/named.service b/meta/recipes-connectivity/bind/bind-9.18.9/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.9/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.8.bb b/meta/recipes-connectivity/bind/bind_9.18.9.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.8.bb
rename to meta/recipes-connectivity/bind/bind_9.18.9.bb
index 4925c092c7..160986eb53 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.8.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.9.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0e3c3ab9378db84ba0f37073d67ba125ae4f2ff8daf366c9db287e3f1b2c35f0"
+SRC_URI[sha256sum] = "6a9665998d568604460df0918fc8ccfad7d29388d4d842560c056cc211cbb243"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


