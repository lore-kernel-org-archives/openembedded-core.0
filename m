Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367ABC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:27:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.8689.1644308825091979178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Dt8EgLWF;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308823; i=@fujitsu.com;
	bh=QYkfdiICclatmTdfKJraLptnXbzaO5yfXHZqMPgpdVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Dt8EgLWFSzEJeI4kLprY4JZquh2bn+k5dGIvZBmtdqcvnPJpRhT2YkUXnEC4uHSJ5
	 WYHSe6/4mJkErmPefzkXtUGtan5w1LeXlO+LEhXJ5bUcZtN/d4Bj5WBjPGWgx8yHW0
	 jRVOEyMro+g53bTmGrJ/j5HYkQ7DoFdT6qm4fBy98qHolQRGPPYKkpUB61Bnkv+0Fs
	 n+o365b9iDnQW73Z3kkqqbXf1ASZYtWtlAOussMx043Wzo9iSSQ3JF/RUA7c+uCJZN
	 EFaqkFdZmbdgNlml6cAYwnYcn5v/+MZaR9U8er9T5Uinr2ecv/N3UWrAXQOqu0VMwd
	 K3T8cCgGyZ4Mg==
Received: from [100.115.34.36] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 35/3C-14616-75922026;
 Tue, 08 Feb 2022 08:27:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqBuuyZR
  k0NDMbnHn5zt2B0aPcxtXMAYwRrFm5iXlVySwZnTMWsJW0MFVMefdC6YGxq8cXYxcHEICjxkl
  zn3+ygzhnGeSWNt3nwnCOc4o8WFCN5DDycEmoCYx/dYN1i5GDg4RAT2Jq/9EQcLMAioSL373s
  IPYwgKmEk1nHzGD2CxA8V19V5hBynkFHCVmTgkCCUsIKEhMefgerIRTwEnixKFJjCC2EFBJ84
  PTbCA2r4CgxMmZT1ggxktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkbrpKLM9IyS3MTMHF1DAwNdQ0NTXWNjXUNzS73EKt1EvdRS3fLU4hJdI73E8mK91OJi
  veLK3OScFL281JJNjMAgTilW3LyDceLKn3qHGCU5mJREeZNUmZKE+JLyUyozEosz4otKc1KLD
  zHKcHAoSfCeEQfKCRalpqdWpGXmACMKJi3BwaMkwvtNAyjNW1yQmFucmQ6ROsWoKCXOKwySEA
  BJZJTmwbXBovgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWGIKTyZeSVw018BLWYCWvx10b9
  EoMUliQgpqQYm7UMB2kV2cQ1PXtypjgkQv9fxJFn8QN9CyYBZnmf/7Dj29CsjQ+i99Ufmxt/u
  d/q8QmZdjOGse9O3ndDOXBe+LSZti113Zs3t6Y/355srvNQxXsu//rcmN/9DYedj+/LDZsSs1
  tQTXnVdcL3OXaUpSTwTU/7/M1acElRzps8wbN/cSSoevE9WqhRceiJT0j3X1JzZb7ng2zWntn
  6q5nLeGxN99qZqu9ucsBal6a/fFmRF8848G3bmlVbWbZn1zwKjfDzZ/yy/dY3ncZsBc5jokdP
  qfuu+n6ryfaDOKtJybVXVvkif2+deWBjbVH3by29RYerpvPjb8kiLmK8VwS+Vfl1bo9HG9Vq8
  6tDJV6X2SizFGYmGWsxFxYkA/k61vl0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1644308822!1328!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28596 invoked from network); 8 Feb 2022 08:27:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:27:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B64B010019C
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:27:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A80C8100189
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:27:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:26:47 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lzip: upgrade 1.22 -> 1.23
Date: Tue, 8 Feb 2022 16:26:34 +0800
Message-ID: <1644308794-5337-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644308794-5337-1-git-send-email-wangmy@fujitsu.com>
References: <1644308794-5337-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:27:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161481

Changelog:
=========
* Decompression time has been reduced by 5-12% depending on the file.
* main.cc (getnum): Show option name and valid range if error.
* Improve several descriptions in manual, '--help', and man page.
* lzip.texi: Change GNU Texinfo category to 'Compression'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/lzip/{lzip_1.22.bb => lzip_1.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzip_1.22.bb => lzip_1.23.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzip_1.22.bb b/meta/recipes-extended/lzip/lzip_1.23.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzip_1.22.bb
rename to meta/recipes-extended/lzip/lzip_1.23.bb
index 3360269454..2bd249e787 100644
--- a/meta/recipes-extended/lzip/lzip_1.22.bb
+++ b/meta/recipes-extended/lzip/lzip_1.23.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "c3342d42e67139c165b8b128d033b5c96893a13ac5f25933190315214e87a948"
+SRC_URI[sha256sum] = "4792c047ddf15ef29d55ba8e68a1a21e0cb7692d87ecdf7204419864582f280d"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.25.1


