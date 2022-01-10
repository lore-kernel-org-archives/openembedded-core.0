Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7C8C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:05:42 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.31773.1641823541762563309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gjvEOcbC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641823534; i=@fujitsu.com;
	bh=0E9o/hwq9+CsYXMuXlgmWbOOipcDQl2yiy7GX2QZ3kM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gjvEOcbCw54HIAlYucyLQBjZ5kcedemlmTpvoQ6sFR2UltwvLsaNwOP3OpT7qJH81
	 krhrq6hDHPxVA7nQGIsLHPVF4TbxdTI+ttori8/kLQIB2Z4UTNp432S5bDfn7+IGE6
	 5n9uS2CLTT5phbN2GG9lPVRWYYgbvMZOPgo6stR8fu+AesvPgKkUp9m/xn8+OEvQQW
	 /byGWWbUkuZSEyblnmhHHmRHeiL3+eeXNkBF+5QcY8KcRpTYGCz3x8ErfFpvywVK3q
	 ZPNHjlq8HJd1WwVBSAkO1ZBvFeNG/uS1gnqX+sucy/tDfARVJv2sixF7LXXtwOH8yr
	 IJ7DEmoSgzlKQ==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 7A/B3-13695-D2D3CD16;
 Mon, 10 Jan 2022 14:05:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSVfX9k6
  iwcMJyhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0ZL+3LGgsPcFQ0f5jI2MC7n6mLk4hASeMwo
  8XnpXVYI5zyTxMbbz9ghnBOMEpOvNQA5nBxsAmoS02/dAKri4BAR0JO4+k8UJMwsoCLx4ncPW
  ImwgI3E7SdPGEFKWARUJaY+dQIJ8wo4SayY0M8GYksIKEhMefieGSIuKHFy5hMWiDESEgdfvG
  CGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRKqkoMz2jJDcxM0fX0MB
  A19DQVNdE18jYUi+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAkU4pZ3u9g
  bOr7qXeIUZKDSUmU94nxnUQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwJlkA5waLU9NSKtMwcY
  HzApCU4eJREeDVA0rzFBYm5xZnpEKlTjIpS4ry7rYESAiCJjNI8uDZYTF5ilJUS5mVkYGAQ4i
  lILcrNLEGVf8UozsGoJMxbADKeJzOvBG76K6DFTECLkzlugywuSURISTUwlf26xNFanPi8Paw
  710XMdcUET9U9gYoFW9LZ1/8v+VxycSdHjKvW1n63uSnbKy+xWorsOZl8Z8aivzUOOT2Loior
  DFd+0vDsPKkY+mNZ/z+/AwrNM/p2lN/Zc7Yp7VLdqWUxd997SZzKlH6YeW2zlZ/5GvYVDTXFS
  6zEv/KbPI/i+G1xrUnOePkqlrr0aMHrF6V4/jy5xznjusOjSNbq2FO5UWYcM1sOX1WcNvHMrv
  t6Z4xPfpwn/uS5Uv3c7Eusj2pvOMjOrZHKNN+gO233vTvz5R5PfS8okndA/8PKRjXl/FP29YI
  8CSE1fbVRQY8YQy7NevVk0vRkdV6ptdKLZixO36DPuT87W7LzmAyTEktxRqKhFnNRcSIA9TTF
  W0QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1641823533!34090!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23375 invoked from network); 10 Jan 2022 14:05:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:05:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0C206100457
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:05:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F3F60100446
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:05:32 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:05:12 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iso-codes: upgrade 4.8.0 -> 4.9.0
Date: Mon, 10 Jan 2022 22:05:03 +0800
Message-ID: <1641823505-62784-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:05:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160360

Changelog:
=========
Added
----------
ISO 639-3: New translation for Friulian
ISO 639-5: New translations for Esperanto, Hindi, Russian
ISO 4217: New translation for Esperanto

Changed
---------
Translation updates for ISO 3166-1
Translation updates for ISO 3166-2
Translation updates for ISO 639-2
Translation updates for ISO 639-3
Translation updates for ISO 639-5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.8.0.bb => iso-codes_4.9.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.8.0.bb => iso-codes_4.9.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.8.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.8.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
index 2f3f589e7c..92932c30a1 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.8.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "5d0a5515f26b3858e27939c8f9a732d8bd4271ab"
+SRCREV = "35ae2024024eb8e6603d3034dbbc406594f3874c"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.25.1


