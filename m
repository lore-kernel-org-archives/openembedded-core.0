Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8DAC433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:39:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.33858.1653892755629965010
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tLbI5afH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653892754; i=@fujitsu.com;
	bh=w2Jt9EOgAm2HsmiPSpoPCV0s5mfuApehnR5C+dU94Us=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tLbI5afH12ZnIQR17OU/6O8S4bGFsDlOaPdY1uHWtC9LB6HOYzAa98L2rnZnXGu+z
	 gxFwj8/Hu2B+Fgt9/EgBtJQhxFbWD73SWFi1qA1D2MdNz40xVrRQcgSuH4IMA6UPRh
	 LmQRh9XGZFKEN+k9WRoNPBZV79EgfBg8N2hCqbfCTgTcIeOtbpgoPDV9FIaJ3GTLAT
	 2s8Bzwx+vJhvd5Zeah8/7ueLYZj379LrWuUDDgS1ZrROYFqNAu/F2MNnfrmYdE3q36
	 kCMtmrrUshRi2+3qc3wvUb/1ch4TDvXwzhkHyskqRvBa5KLhzSeSGKbCST/NDidUfB
	 ndKUZr7TtaWMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORqDsxbUq
  SwblvshZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a5BVPYC25wVBy72MPWwPiEvYuRi0NI4DGj
  xOuJ/UxdjJxAznkmieNfGCESexglJs59yw6SYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vASoQFbCX+bJvKDGKzCKhKLNu+Hmwmr4CTxNHba1lBbAkBBYkpD9+D1XAKOEss/LKIEWKvk8
  SstpmMEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsCokZM7axQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hpbAClDvcQq3US91FLd8tTiEl0jvcTyYr3U4mK9
  4src5JwUvbzUkk2MwCBOKVbL38H4d+VPvUOMkhxMSqK8Z1UnJwnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4I1PnpIkJFiUmp5akZaZA4womLQEB4+SCO+SBKA0b3FBYm5xZjpE6hSjMcfU2f/2M3
  MsB5FCLHn5ealS4rznE4FKBUBKM0rz4AbBIv0So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWH
  elFSgKTyZeSVw+14BncIEdAo300SQU0oSEVJSDUxK/1MqFbQPzjIK+6EtrfbK+cCun5fSu0uM
  Wxh+6N/X+cqo3bS86/yU+QfKNt/ymjepa/uy6Woaee+PGHktmfw1fXuElorLXEPjjvcX/Y/eX
  arAW2N8P2Xdz3SJQw4GUTfFy7RDPz/h/OQY8t3gwKFPiseF3efs5DrHrX5o+x072YvfzB8FtO
  Tt3V045aXhcyMmm7OCJgqTZZWPFfhyySpMuDY91ENaccKpZNeMXxWWRpvrQyZMyIwomZb4zD0
  vSY91U4tQW6qqDyOjlGRRRm/z25YkscVKL0/YS8pd0NhbKl8fw205uePsoq1zQkxf3GQ8LcC3
  syAh4dI2oZJIlytF3/bXfTzyzZvhk8kOfiWW4oxEQy3mouJEAIhQbP1vAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1653892753!17253!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28504 invoked from network); 30 May 2022 06:39:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:39:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F1C73100196
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:39:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C414A100190
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:39:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:38:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iproute2: upgrade 5.17.0 -> 5.18.0
Date: Mon, 30 May 2022 14:38:41 +0800
Message-ID: <1653892722-23407-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653892722-23407-1-git-send-email-wangmy@fujitsu.com>
References: <1653892722-23407-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:39:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166264

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iproute2/{iproute2_5.17.0.bb => iproute2_5.18.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.17.0.bb => iproute2_5.18.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb
index becbaa9190..3e01c70801 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "6e384f1b42c75e1a9daac57866da37dcff909090ba86eb25a6e764da7893660e"
+SRC_URI[sha256sum] = "5ba3d464d51c8c283550d507ffac3d10f7aec587b7c66b0ccb6950643646389e"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.25.1


