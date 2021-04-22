Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web08.9273.1619078065140493028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ze+PQ+ev;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619078062; i=@fujitsu.com;
	bh=YLdvlaSUCa/5u9ZkepLpN3WPS/I4yoeBkI80AGAEziI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ze+PQ+ev6wSTkxZA+rryHOSKxn+wpG+znowxUiI4/xs4+ECwivAfe67OiEMzijKCy
	 UePqqcehb5JAEWFjNHHOMmdsrrfUuiBp9Kycbz+uJHdX2x/pH3cPW9alKPQxqnuD/5
	 9w4EAGxa1HwF6G1pYNBo5dLZ9JhB3u8MUXmW2HACueUYXDS9HStgVeT8YNrHXarps+
	 2jRhc7cl0Vi1Pq4Z97Q4e8em4F1J9YM3JAZ/I1Zu7frcofSDNtRMUyK1Xiz7gUMeR6
	 nme61GdTmRbsN0md5b9FqUtqLMkzU7w91vcCWNxhxcv7gKTRddyr/bDiN07PKqpmdx
	 7/Ht3ptrF6bvw==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id DB/E1-41911-EAB21806; Thu, 22 Apr 2021 07:54:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVXeddmO
  Cwdlr7BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ap/X+YC15zV8yZvoO1gfE9VxcjF4eQwCwm
  ia73N9khnOOMEquvbgJyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHrASYQEriedTO
  lhAbBYBVYkzG3cxgti8Ao4SvyacB4tLCChITHn4nhkiLihxcuYTFog5EhIHX7xghqhRlJh9uR
  mqvlKic/0CxgmMvLOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuoa6hiZFeYpVuol5
  qqW5yal5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMMBSChn7djBOfPNB7xCjJAeTkijvQr7GBCG+
  pPyUyozE4oz4otKc1OJDjDIcHEoSvC+0gHKCRanpqRVpmTnAYIdJS3DwKInw2oOkeYsLEnOLM
  9MhUqcYFaXEeVeDJARAEhmleXBtsAi7xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY97Im0B
  SezLwSuOmvgBYzAS3WnlILsrgkESEl1cCk+Ohw6QNnQ63+zbVfjhTVKz7N+X2Ww37SObfjR2c
  VtM5K1Aq2Pply0zGh8uusVqM7N+dJXzvfd0J80UVDjT0M95n5Fv1o9zqu3xS/6UbaN1H+fEn2
  mdvlCyovRexRqhLTj/s1a/nxNXtnJ/qo36ty0z/F7tWkX8f+WKP7nnJv2Pv/GR9+Xlbf7H01/
  LMe8/MjlmJt9wJcmv49NZmQttHt4s3ifJ879ZWflvNLLm2S7+xd5HnEdf6S6WKqEnfP7zTbc2
  sjU9Pp1verG7kj41xcAsRWbz/tX6kRut1m8dekGdMNzz6sK/Y91fvivv9LZxOGm4tXZLg4r/n
  804Xnze3pj07eC1tRy3bm8b2LUbPalViKMxINtZiLihMBHDbiFSsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-228.messagelabs.com!1619078061!1220549!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6563 invoked from network); 22 Apr 2021 07:54:22 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:54:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7sIwG005992
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:54:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:54:16 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] boost: upgrade 1.75.0 -> 1.76.0
Date: Thu, 22 Apr 2021 15:54:02 +0800
Message-ID: <1619078047-5587-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../boost/{boost-1.75.0.inc => boost-1.76.0.inc}                | 2 +-
 meta/recipes-support/boost/{boost_1.75.0.bb => boost_1.76.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-1.75.0.inc => boost-1.76.0.inc} (90%)
 rename meta/recipes-support/boost/{boost_1.75.0.bb => boost_1.76.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.75.0.inc b/meta/recipes-support/boost/boost-1.76.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.75.0.inc
rename to meta/recipes-support/boost/boost-1.76.0.inc
index e5a8488c58..3ae5a25b29 100644
--- a/meta/recipes-support/boost/boost-1.75.0.inc
+++ b/meta/recipes-support/boost/boost-1.76.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb"
+SRC_URI[sha256sum] = "f0397ba6e982c4450f27bf32a2a83292aba035b827a5623a14636ea583318c41"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost_1.75.0.bb b/meta/recipes-support/boost/boost_1.76.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.75.0.bb
rename to meta/recipes-support/boost/boost_1.76.0.bb
-- 
2.25.1

