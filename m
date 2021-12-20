Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C58C43217
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:03:58 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.6289.1640012636698989371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s2Kn22T8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012634; i=@fujitsu.com;
	bh=qmeRF1M66i1Bk+C9NQGrazrb87Cp1Dmnz9Mri4n6rBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s2Kn22T8VprBjjMo5sgO3ryyRHmROoBjaqgBTHkefzVFQren3U8mlrd7UTqe1PpR3
	 u0Vw2UrwEV0ABV+ra+MRi9mln7O4AOJhT/0jigFd2deAag9l/Toy5QbfFfr6MHMF52
	 CyMNJ/F/H+surA4DOq+CectRW5klun1XDHAfFO6A9fuoXvjMozRQXEoMUf6+c+W5dJ
	 3I8USLC+SB65Fd6qF/oBq9taAIjJIxpi/LuzUr72KnMPXUVm6i8z9ZfN6lv5gVxO6t
	 rPPOTds9CDmJOV/Gwog+IpSsGRlzBF7w3DR2Cc8n0Z2gKHB4Ur5O0eN9MQi57LkYvv
	 Kd/M6Pi/VUvGw==
Received: from [100.115.68.153] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 E9/D1-07141-A5B90C16; Mon, 20 Dec 2021 15:03:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSTdy9oF
  Eg9NTTCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozu3jaWgpmcFSv2hzcwHufoYuTkEBJ4zCjR
  tLK2i5ELyD7PJLH2VhMbROIEo8SO4zwgNpuAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+N3DD
  mILC/hKTFw0ixnEZhFQlVi79ynYGF4BR4m9d48wgtgSAgoSUx6+B6vhFHCSaDi2mBlilaPExw
  +TWCHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYx2iUVZaZnlOQmZuboGhoY6BoamuqamegamZjqJVbpJuqlluomp+aVFCUCpfUSy4v1UouL
  9Yorc5NzUvTyUks2MQLDOKXY4esOxuN9P/UOMUpyMCmJ8vL7HkgU4kvKT6nMSCzOiC8qzUktP
  sQow8GhJMH7cwZQTrAoNT21Ii0zBxhTMGkJDh4lEd4mkDRvcUFibnFmOkTqFKOilDhv3CyghA
  BIIqM0D64NFseXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzpoNM4cnMK4Gb/gpoMRPQYqX
  w/SCLSxIRUlINTHN5WGscy0/KvuVv1n65o3rPtHdFpxI6G1bv7DGvcTfWnbbopHTE+3WferTu
  zOQ6ptDu/frxz1ePzp/hmrp1Yur8HbK9K57uOcPmr2H5tiU00ZPv5YW9x2OSJs5f1K8q9kTg7
  tOWvbPj0y4LGE2Z2RdjFcFtndTS7G1Roqk2UWVn+qrYHq9+nzlXg6U35WnffBS+gi8nS1Swrl
  dZV8/Pu/63dVvKp8wfWQn8Ok4VSov+P3ks6JU9JfzM1oU7/j8TbQibvMi8NP0GQ/5EMfdjZ2+
  znZhdFVKXwbw6aJLQx8vvX3ju+JN0bt0kr7zcWUmmMUx6seuMFLTbDbkuFdxdKcZe2VG5UpGl
  IP/K/72lSizFGYmGWsxFxYkAJP95kV4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-545.messagelabs.com!1640012633!28221!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27691 invoked from network); 20 Dec 2021 15:03:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:03:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 08941100463
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:03:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EB38B10045A
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:03:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:03:51 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.8.2 -> 4.9.0
Date: Mon, 20 Dec 2021 23:03:38 +0800
Message-ID: <1640012619-3685-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640012619-3685-1-git-send-email-wangmy@fujitsu.com>
References: <1640012619-3685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:03:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159872

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_4.8.2.bb => python3-importlib-metadata_4.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.8.2.bb => python3-importlib-metadata_4.9.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.8.2.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.9.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.8.2.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.9.0.bb
index 2e5aedd8db..0f397766e9 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.8.2.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.9.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "75bdec14c397f528724c1bfd9709d660b33a4d2e77387a3358f20b848bb5e5fb"
+SRC_URI[sha256sum] = "ee50794eccb0ec340adbc838344ebb9a6ff2bcba78f752d31fc716497e2149d6"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1


