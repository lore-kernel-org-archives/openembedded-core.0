Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBABDC433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:01:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.61649.1638198087466044080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=amczsekN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198085; i=@fujitsu.com;
	bh=K67FvjrME7vZXyCPQlnvNmjgWx94OjfHxBkfAxkQs+o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=amczsekNAvfARsfoGB/29d9hAXunhYHzJh7heCEQW2+/U44YDYM0+vA5sO7f/1jLy
	 YQwBq4puYiAf4YUYOVty8BstWb2pv11eTp/tNhbwhJdRbDi3e0Mz84SZdtfFt6pPpr
	 GEBOaG+xI3lNnc23UaO3fBYKvNxD6dmyh0ZJwJlyvDdOJXc3dWxAHyS6NgZYIFUYw5
	 DzA32Kd8sUrSUs5pK3TuZYGROKC72//+lrYoIgrWcE6zZpVGu9KVUtQHd2XyF2HCpM
	 ACqpW+3L9GIcZHDK18tQqu7QvTsTDOyZb3Vtc0ZknLjnbokWIsQXeEgm9oZqM+CnNf
	 qku2EnpyJCmCg==
Received: from [100.115.32.166] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id CF/27-16121-54BE4A16;
 Mon, 29 Nov 2021 15:01:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqOv6ekm
  iwYG3EhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b2WU4Fv3grvv9dz9bAeJKni5GLQ0jgMaPE
  xZn/WSCc80wSl5oOADmcQM4JRomzd8JAbDYBNYnpt26wdjFycIgI6Elc/ScKEmYWUJF48buHH
  SQsLGAlcf+YHkiYRUBVov1mIzOIzSvgLPFv5TuwiRICChJTHr6HigtKnJz5hAVijITEwRcvmC
  FqFCVmX26Gqq+QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0TqpKDM9oyQ3MTNH19DAQNf
  Q0FTX2ETXyMBUL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMjMCBTipXO7mDs
  /fpD7xCjJAeTkihv1pIliUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkePtfAeUEi1LTUyvSMnOA0
  QGTluDgURLhLX4BlOYtLkjMLc5Mh0idYlSUEucVBekTAElklObBtcEi8hKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYV4VkCk8mXklcNNfAS1mAlr8dulikMUliQgpqQamoNzVM89+aDJeptK
  VFG+yYsoaww+ZW0Kub5Xv3C9ycDabegjXpa/OdZufB+1svzV5Lot+67zr93nFrqQXiN1+rtJy
  k0G3h+MR70ondpXZO/fW/4j+WVwwa4llc8jupnpluQM/QrZeX+t7R3Hj/88q6+adePl11u21V
  tlb/kzscuf4nlkslS138ubWZQ+e2NVvUrv0qanR1702ODm8wzbkmfQv+9c7V6+PmNXY12rIf/
  mIjrEz24+WMlueyjPiLp9Uv2nO8ta637z6qOCZU/s5baaXzJ/SvNE9ZcP01k5pe7cr4ndjnja
  vErwd4Xgry6RI/WboUendpRGercnGkZKzLBlPinMHSYROnym09kmwEktxRqKhFnNRcSIAHMuG
  s0MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1638198085!294992!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5950 invoked from network); 29 Nov 2021 15:01:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:01:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EFB69100252
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:01:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E46C7100236
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:01:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:01:03 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] meson: upgrade 0.60.1 -> 0.60.2
Date: Mon, 29 Nov 2021 23:00:52 +0800
Message-ID: <1638198055-118993-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:01:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158945

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/meson/meson.inc                           | 2 +-
 .../recipes-devtools/meson/{meson_0.60.1.bb => meson_0.60.2.bb} | 0
 .../{nativesdk-meson_0.60.1.bb => nativesdk-meson_0.60.2.bb}    | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.60.1.bb => meson_0.60.2.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.60.1.bb => nativesdk-meson_0.60.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index f383ad9f74..7fbb246b87 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13"
+SRC_URI[sha256sum] = "64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/meson/meson_0.60.1.bb b/meta/recipes-devtools/meson/meson_0.60.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.60.1.bb
rename to meta/recipes-devtools/meson/meson_0.60.2.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
-- 
2.25.1


