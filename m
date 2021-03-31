Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web09.8151.1617203191125652688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 08:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 5B/82-24644-5FF84606; Wed, 31 Mar 2021 15:06:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeJIrShJLcpLzFFi42Kxs+EI0f3Sn5J
  gMHebvsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvHpxU2mgv3sFU2Nc5kaGD+wdTFycQgJbGWS
  eHfzDjOEs4dR4uCKJ0AZTg42AQOJ/WcvsHcxcnCICOhJXP0nCmIKC5hJ7HqlC1LBIqAiseLgU
  1YQm1fAW+LAimYWEFtCQEFiysP3zBBxQYmTM5+AxZkFJCQOvnjBDDJGQkBRYvZ0eYjyKomzs7
  8wTWDkmYWkYxaSjgWMTKsYzZOKMtMzSnITM3N0DQ0MdA0NjXQNLU10zcz0Eqt0E/VSS3XLU4t
  LdA31EsuL9Yorc5NzUvTyUks2MQIDKKXgkNMOxvevP+gdYpTkYFIS5S3uTUkQ4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMErBAxJIcGi1PTUirTMHGAww6QlOHiURHg9WoHSvMUFibnFmekQqVOMi
  lLivLEgfQIgiYzSPLg2WARdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqARUATKFJzOvBG76K6
  DFTECLrzxKBFlckoiQkmpgqpPc56bea/3zX8/xd8q7J2x6bNia51zWY9qhu0WH821+1zMDlol
  zZytXpNswFofJ/VnZdbdlrnNjecM/Y6XgA5+ZDSP5tmpKc4X+2ZX6cfesnrmvUosaJ8WeKopM
  bvQ81cj8dqdCraR+Pp/W3LRONcUVIuu3uJ3+XVNwZPelfUkB8Tck/U5yuzha5P3/mLzKiuWth
  6zzjbP7tn4/O1Fxu6jlghUZf58dk6g1/LPAvHtN5ZRqM945f992X/TzqP544OM9xbMTn1+vrO
  qS5Dj5ItLPXG/HN67YpcYzQ2PmqtT8SP09W0f6nbXu0ot3T1ZvOlsRzJtxIUBA7/7bDyoBz56
  u14yYHKOxwVhsA2ejEktxRqKhFnNRcSIAS3mgGhsDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-265.messagelabs.com!1617203188!415286!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1065 invoked from network); 31 Mar 2021 15:06:28 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-21.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 15:06:28 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VF6PdT020314
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 16:06:28 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 16:06:23 +0100
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] netbase: upgrade 6.2 -> 6.3
Date: Thu, 1 Apr 2021 07:38:03 +0800
Message-ID: <1617233883-40962-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-core/netbase/{netbase_6.2.bb => netbase_6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/netbase/{netbase_6.2.bb => netbase_6.3.bb} (89%)

diff --git a/meta/recipes-core/netbase/netbase_6.2.bb b/meta/recipes-core/netbase/netbase_6.3.bb
similarity index 89%
rename from meta/recipes-core/netbase/netbase_6.2.bb
rename to meta/recipes-core/netbase/netbase_6.3.bb
index a54d2e7764..0a7a9d71ed 100644
--- a/meta/recipes-core/netbase/netbase_6.2.bb
+++ b/meta/recipes-core/netbase/netbase_6.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
 inherit allarch
 
-SRC_URI[sha256sum] = "309a24146a06347d654b261e9e07a82fab844b173674a42e223803dd8258541e"
+SRC_URI[sha256sum] = "7c42a6a1cafa0c64103c71cab6431fc8613179b2449a1a00e55e3584e860d81c"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 
-- 
2.25.1

