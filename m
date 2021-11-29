Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E63FC4332F
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 09:58:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.58613.1638179914980513034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 01:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iAA6Hfsz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638179912; i=@fujitsu.com;
	bh=zRLuYnjrpCioeCVlXdMdbvggbQ86+tShskIk7StlUkk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iAA6HfszLzySH3ef12WR0N/CE9Y3UjOG7yb9/f8ojE8qsyzElewLK2WwgfQyQzjAd
	 Hr/drgGVFkiVtAjKKx3uUMOGLU7voRKzB1wsVhCpxAQR4A0ioxTxXVdjC/OESODfVQ
	 c+MKzDqqQfFbjYJxmzqoR9L6i5uk8MJ8cEdtioxtzTKZ0Z6pppicOMtxdmoZyp2Z0D
	 l7K0Wcvw2CS9Dm+39D8O+cAG8uyqs1lzxHM9DiVzcf/0BlF6fN42Ozw43ajoCB4h1q
	 riFOYqu2gXKQgkNeprgEeUs0ghDr6mSRVpg3bbmGiZdkQEV51plyoWcK9DnOVfB6/8
	 Mahc73k7I8e1w==
Received: from [100.115.3.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 98/4D-12056-844A4A16;
 Mon, 29 Nov 2021 09:58:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqOu+ZEm
  iQVubicWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFs4U7GgisCFb+brjE1MH7m62Lk4hASeMwo
  seTkBVYI5zyTxOfVT4AcTiDnBKPE6vsJIDabgJrE9Fs3gOIcHCICehJX/4mChJkFVCRe/O5hB
  7GFBZwlWn92MYOUsAioSixZDdbJCxRuebufCcSWEFCQmPLwPTNEXFDi5MwnLBBjJCQOvnjBDF
  GjKDH7cjMLhF0hMWtWG1SvmsTVc5uYJzDyz0LSPgtJ+wJGplWMFklFmekZJbmJmTm6hgYGuoa
  GprqGukZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBwZhSzMi0g3FZ30+9
  Q4ySHExKorzre5YkCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgLVgIlBMsSk1PrUjLzAFGBkxag
  oNHSYT3Nkiat7ggMbc4Mx0idYpRUUqc12UxUEIAJJFRmgfXBovGS4yyUsK8jAwMDEI8BalFuZ
  klqPKvGMU5GJWEefWmAE3hycwrgZv+CmgxE9Dit0sXgywuSURISTUwnQlSEnGVi5VrNfVTWCj
  2xbaXK+TxzV9deqtP+399oHxtXvQcfucp5XcuHlGfdfZ34wzBb/kaPyf9Zff9OfPb5oyFLX8U
  v9i91TgVtNKp4lzNvGCPLoc+m0bhncvSm76KTf5wk+FwnsJhDln1Y/lbGbzebi+ROWOypS/ld
  Vjq0l+GQo9tnK+5vxQ12TZJPubguTsX1J1jZmuGaZ1YoXRKwyZD/3eIuAC342KfB+lJav+n+L
  6aYOl/73Lnpe/h+oFms1Y7Cl3n2LNcqUnC+frM/7qLjttrrvnT58EvvDJR6MyVDK6gg/OiXB+
  zy16VeZUadCD990ZtY16D0218KypjZNbfThU12tg9LV6B+cgJJZbijERDLeai4kQAoJmnIUED
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-587.messagelabs.com!1638179911!13798!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12581 invoked from network); 29 Nov 2021 09:58:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 09:58:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5DFAF100252
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 09:58:31 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5292F100228
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 09:58:31 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 09:58:09 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-docutils: upgrade 0.18 -> 0.18.1
Date: Mon, 29 Nov 2021 17:57:58 +0800
Message-ID: <1638179879-118331-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 09:58:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158935

Changelog:
docutils/nodes.py
  Node.traverse() returns a list again to restore backwards compatibility. Fixes bug #431.
  New method Node.findall(): like Node.traverse() but returns an iterator. Obsoletes Node.traverse().

docutils/utils/__init__.py:
  Fix behaviour of get_stylesheet_list(): do not look up stylesheets given as "stylesheet" setting. Cf. bug #434.

docutils/writers/_html_base.py:
  Fix handling of footnote_backlinks==False (report Alan G Isaac).

docutils/writers/html5_polyglot/math.css:
  Fix typo (bug #432).

docutils/writers/odf_odt/__init__.py:
  Fix spurious output with Windows (bug #350).

test/test_error_reporting.py:
  Fix a false positive (bug #434).

License-Update:
 year updated to 2021
 update url of elyxer
 add url of BSD 3-Clause License
 change "2-Clause BSD license" to "BSD 2-Clause License"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-docutils_0.18.bb => python3-docutils_0.18.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.18.bb => python3-docutils_0.18.1.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.18.bb b/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-docutils_0.18.bb
rename to meta/recipes-devtools/python/python3-docutils_0.18.1.bb
index 979eea27fb..e0fbb2c12d 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.18.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Docutils is a modular system for processing documentation into useful
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=01aec8e28f975e3f369e06b5eb2af9b9"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fecee07ad8df9116e1f739e2ed2ea513"
 
-SRC_URI[sha256sum] = "c1d5dab2b11d16397406a282e53953fe495a46d69ae329f55aa98a5c4e3c5fbb"
+SRC_URI[sha256sum] = "679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06"
 
 inherit pypi setuptools3
 
-- 
2.25.1


