Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D122DC433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:04:50 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.23424.1636988689260633327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 07:04:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=enr6dSEF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636988687; i=@fujitsu.com;
	bh=5yBAUrydue/T1j3vNGO7NbYHBB336/Os4A9rltZ/QNQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=enr6dSEFaXz1ojp33MHEy33tfi6bxl9frFKHvwPtqgCQ74ugMDHQfUpyB18FLww9f
	 6nhnKZkqkiQdhhYJXlpAIHSBFi3JTtKd8rUYmSjL2QpbC5oB1Ixp7qPDJpSWHaT+cx
	 SbmBL3ObOsNI9gJqGm0XXU6CEkGyvUJ+Ztaaynj4QrIBVv8Nx7FUsq0aBKVxxtqwP4
	 LnxJXsy/n2DY89dwoDpPgoMmvi0gI0LPUSZ2crBqFBUVnDgIPSUWCs351SctWnPteh
	 HXj238NQrdLkeSbcmFBJMiAwegljPhrr62dGmt6KyCbhkspfN1xEWYcLBs11YUMmQe
	 oapV+pXP1GKnQ==
Received: from [100.113.7.62] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 13/6C-14220-E0772916;
 Mon, 15 Nov 2021 15:04:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqMtXPin
  RYO0URYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNJ9xSWgll8FXO27GRrYPzD08XIxSEk8JhR
  YlPrJHYI5zyTxOfOX2wQzglGicfffzB1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgLfE7qMLWUBsFgFViS2zZjKBlPMKOEm0LmIECUsIKEhMefieGcTmFHCW2HblOpgtBF
  RycPlMsFZeAUGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4
  LSfsCRqZVjJZJRZnpGSW5iZk5uoYGBrqGhsa65rpGpkZ6iVW6SXqppbrJqXklRYlAWb3E8mK9
  4src5JwUvbzUkk2MwABOKWT/s4Px+usPeocYJTmYlER5/+hPShTiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwbu7FCgnWJSanlqRlpkDjCaYtAQHj5IIr0ExUJq3uCAxtzgzHSJ1ilFRSpx3GkifAE
  giozQPrg0WwZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMGgIznycwrgZv+CmgxE9Bi+3v
  9IItLEhFSUg1MhkKyl12+p7Nz3jnataN+xcPd/DtYkxYf+76/queR1E+26YkvpxrZBat/KfVz
  V2m0bHr4f9PLhCkM/s/3P+74uJH1vPKl3X+nnry55XV4/KU45eVpa0s4Td9OWLpQ0N0ySbP3x
  JHnUonVkvqnlEQOSQvwfCqx2LW+SfH+gjVbnpb5zZI5tXXFoQdbVxTP2PSuymaZEdeXOkMelf
  C2lf+41bw9o1WmH3m0/W2hRN7C2IorrkcfZvyfmcfhll9bJJ3K61D8q7LPIVMlmjuA/RtTQX1
  5tLqhslGLR3+9TFvmrKTgM8IL0tT4j5km6Qe9uqJWLyy5IO/li4X50a+C5N9YcgqUuSfOafKb
  O2eLpIkSS3FGoqEWc1FxIgCjLdClWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-248.messagelabs.com!1636988686!910980!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27693 invoked from network); 15 Nov 2021 15:04:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 15:04:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EE548100239
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:04:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E2708100229
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:04:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 15:04:27 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-more-itertools: upgrade 8.10.0 -> 8.11.0
Date: Mon, 15 Nov 2021 23:04:14 +0800
Message-ID: <1636988654-78792-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636988654-78792-1-git-send-email-wangmy@fujitsu.com>
References: <1636988654-78792-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 15:04:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158300

8.11.0:
New functions
The :func:`before_and_after`, :func:`sliding_window`, and :func:`triplewise` recipes from the Python 3.10 docs were added
:func:`duplicates_everseen` and :func:`duplicates_justseen` (thanks to OrBin and DavidPratt512)
:func:`minmax` (thanks to Ricocotam, MSeifert04, and ruancomelli)
:func:`strictly_n` (thanks to hwalinga and NotWearingPants)
:func:`unique_in_window`
Changes to existing functions
:func:`groupby_transform` had its type stub improved (thanks to mjk4 and ruancomelli)
:func:`is_sorted` now accepts a strict parameter (thanks to Dutcho and ruancomelli)
:func:`zip_broadcast` was updated to fix a bug (thanks to kalekundert)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ore-itertools_8.10.0.bb => python3-more-itertools_8.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.10.0.bb => python3-more-itertools_8.11.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.10.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.11.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-more-itertools_8.10.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.11.0.bb
index 93d3ad60f8..a18bb4d667 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.10.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "1debcabeb1df793814859d64a81ad7cb10504c24349368ccf214c664c474f41f"
+SRC_URI[sha256sum] = "0a2fd25d343c08d7e7212071820e7e7ea2f41d8fb45d6bc8a00cd6ce3b7aab88"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


