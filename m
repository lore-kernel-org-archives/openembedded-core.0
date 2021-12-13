Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9238CC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:16:44 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.10782.1639401403223792170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=X5oulUCl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639401401; i=@fujitsu.com;
	bh=Nsslq6TrfnuiHsLnn6ec/G6Ra/imoWrpgVacE4KkSYs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=X5oulUClhnxmYAl+f0HmWqfefyi19/odHbt+4dEzNoFACBT66hHYZYxWy33IfvgIW
	 gMthx0UEf5sxEvkLnJfsRjR1uxLBIaYRMC1Kgyofa2Heu8NGT44HzIdR8hpdVru2ee
	 W3SkOuAjsb4d2HsDcVjUSRnSfziN3/FB5+7qGE52yCK+6SXL5s08Tgs2arw/ilVpUj
	 Rnv/2I8wwyhQTS0uANr4AtzTo96Msh+uGA1szWog2DyFV3KctcOvDuRm8sODjlc5Je
	 Mr6fhhH29m56cldBuXnUII+5BuGB2QS+7EI35hs1dp4ZVLj9D6hxz+t2ayCzkcSxyo
	 1eFm3mI2KX4LQ==
Received: from [100.115.71.165] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 AA/62-07141-9B747B16; Mon, 13 Dec 2021 13:16:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8ORqLvDfXu
  iwdPdJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ajb1vYC14IVFy6fIalgfEpXxcjF4eQwGNG
  iYUn3jNDOOeZJNZc7GHpYuQEck4wSryc6QtiswmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgKvEpv0zmUFsFgFViSl3D7OB2LwCThIfP6wBq5EQUJCY8vA9M0RcUOLkzCcsEHMkJA
  6+eMEMUaMoMftyMwuEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjXVJRZnpGSW5iZo6
  uoYGBrqGhqa6Zia6RialeYpVuol5qqW5yal5JUSJQWi+xvFgvtbhYr7gyNzknRS8vtWQTIzA0
  U4odvu5gPN73U+8QoyQHk5IobzDr9kQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEry/zYFygkWp6
  akVaZk5wDiBSUtw8CiJ8HY7AqV5iwsSc4sz0yFSpxgVpcR537gCJQRAEhmleXBtsNi8xCgrJc
  zLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNxlkPE9mXgnc9FdAi5mAFjNWbgZZXJKIkJJqYGo6e/e
  Jg05it//c6h+blr+fPzPIelvvfc5Gzju2Dq2uU0x2nY7Ks/W98rf3xaaoGbXm7E2fJ89Xl8yx
  dpzjc0qBY6Ln/G//O9Ke91yRahTfe2mZ9drJH27ttgrZb+fDJOF+dXeW9cNsAYP++heX7qfud
  53QwHj+C5/0Bh/+hW8+sXF+nZL+QiXZdUVQ1sY1G2tuKbTN2r7k8POO2wvSGj/2/XYTdpU5K/
  uQz+JKy+zO/h9zopj2Tp33dOFNzocOXycwZc42N5uwdxlXwPsaXcNb75v2tonUvytnYFrNtuq
  rlMGNTzrMMY0LvI8ySaywmPbcgT1Itfrk25lerX2R9xm0EsJsnMWj6k07UqdPvqXEUpyRaKjF
  XFScCAAgifBISAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-545.messagelabs.com!1639401400!27902!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17130 invoked from network); 13 Dec 2021 13:16:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:16:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 42D2110024B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:16:40 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3708310023B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:16:40 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:16:21 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cython: upgrade 0.29.24 -> 0.29.25
Date: Mon, 13 Dec 2021 21:16:11 +0800
Message-ID: <1639401371-27716-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159627

Changelog:
================
Bugs fixed
----------
* Several incompatibilities with CPython 3.11 were resolved.
  (Github issues #4411, #4414, #4415, #4416, #4420, #4428, #4473, #4479, #4480)

* Some C compiler warnings were resolved.
  (Github issue #4439)

* C++ "std::move()" should only be used automatically in MSVC versions that support it.
  (Github issue #4191)

 * The "Py_hash_t" type failed to accept arbitrary "index" values.
   (Github issue #2752)

* Avoid copying unaligned 16-bit values since some platforms require them to be aligned.
  Use memcpy() instead to let the C compiler decide how to do it.
  (Github issue #4343)

* Cython crashed on invalid truthiness tests on C++ types without "operator bool".
  (Github issue #4348)

* The declaration of "PyUnicode_CompareWithASCIIString()" in "cpython.unicode" was incorrect.
  (Github issue #4344)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.24.bb => python3-cython_0.29.25.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.24.bb => python3-cython_0.29.25.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 5a8ec2a0ff..93d6fdf13b 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "cdf04d07c3600860e8c2ebaad4e8f52ac3feb212453c1764a49ac08c827e8443"
+SRC_URI[sha256sum] = "a87cbe3756e7c464acf3e9420d8741e62d3b2eace0846cb39f664ad378aab284"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.24.bb b/meta/recipes-devtools/python/python3-cython_0.29.25.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.24.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.25.bb
-- 
2.25.1


