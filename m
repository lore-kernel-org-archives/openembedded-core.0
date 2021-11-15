Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF4BC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:39:48 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.23901.1636990787051206584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 07:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KpqpYnyo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636990785; i=@fujitsu.com;
	bh=VQzfNPzLY50MJvUDUhb7+3ZXAfWHYn09ZotN2HDrQrU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KpqpYnyoC/C5gxN5F3HRnoyzlHPyj5d4WSbyYM9Tf1P7CAAASJ6IQ/SJX/WkRTcp6
	 16steOoW63CY3tUIMszQuejLZSiC+GtAWN0bkXleYCIJsITaRV4LU8YOIXODdQYQd6
	 3WThh8GaL30jvIcflePz84hMEGt+7sOT6Q2Tncmfdb2VymwG0UK4TkhcbRacLMnJef
	 aC+ppaY2urLb54T0/fBmUXkx6LGGlt4qWla2C85+g7Zi/Fk1OU/XTm2vLlBbcTbXVP
	 ZGIeZW8GzqBLapznmfvIB97WODs6feHYr2alEYAXyLFwEHzjFbV3JsJ9kxT/bv4BKZ
	 B4IoNWiU8DHDw==
Received: from [100.112.192.186] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id A7/D9-21017-04F72916;
 Mon, 15 Nov 2021 15:39:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSdehflK
  iwa2dChZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aWvteMBY84K1Y/ucnYwHiZo4uRi0NI4DGj
  xNz3m1kgnPNMEk/75rBBOCcYJXourwXKcHKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAvcSH+VdYQEpYBFQlZlyuAAnzCjhJzFy/kBHElhBQkJjy8D0ziM0p4Cwxd+lOJhBbCK
  jm4ulpLBD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLU11DU0N9RKrdBP1Ukt1y1OLS3SB3PJiveLK
  3OScFL281JJNjMDwTSk4PH0HY/+bD3qHGCU5mJREef/oT0oU4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMG7uxQoJ1iUmp5akZaZA4wlmLQEB4+SCO+GKqA0b3FBYm5xZjpE6hSjopQ477FaoIQASC
  KjNA+uDRa/lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ826uAZrCk5lXAjf9FdBiJqDF9vf
  6QRaXJCKkpBqYmPi/tZWcCCgtnsW+cd+iok25U2/I8tz7xHpfzX7D/6oTLF8XrH/HvqGThbfb
  rkVMwOaHasae9z/XXFC80x93cOd3F90z9rOmnC+u6vYwePW3SXTxzZCvEadCnjvMur5NTOapz
  sq4qZ3uu6NZqgWtdnP94Z0/51reIqdug2fLHrnt40pd/uXNpqt+K5Ye3/L8TnSOrGZFzETfS/
  sfrPjtE/NMxPBL9osOzn+yTLe3PV7kz/q/g2/ttcfOlc9tVyyPsd7p/eP3x/yejc4feKtmBJR
  +WZd/ZOabt3Oqr9xlL7H6oV/x5NoDnS9XtF69+m728mOCwsSJAR3FNe8mSO6V+Pyi+uyk2NsT
  DrDcW+wXPK1biaU4I9FQi7moOBEAHHjzwloDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-265.messagelabs.com!1636990784!503500!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 507 invoked from network); 15 Nov 2021 15:39:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 15:39:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1AB72100467
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:39:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0E02A100456
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:39:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 15:39:26 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] systemd-boot: upgrade 249.5 -> 249.6
Date: Mon, 15 Nov 2021 23:39:11 +0800
Message-ID: <1636990751-78972-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636990751-78972-1-git-send-email-wangmy@fujitsu.com>
References: <1636990751-78972-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 15:39:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158302

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../systemd/{systemd-boot_249.5.bb => systemd-boot_249.6.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_249.5.bb => systemd-boot_249.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.5.bb b/meta/recipes-core/systemd/systemd-boot_249.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_249.5.bb
rename to meta/recipes-core/systemd/systemd-boot_249.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 4e4cdd2e2f..f3ce32efc2 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "00b0393e65252bf631670604f58b844780b08c50"
+SRCREV = "deda69dad784f9c4367533555ff4d7bf6308c0ff"
 SRCBRANCH = "v249-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
-- 
2.25.1


