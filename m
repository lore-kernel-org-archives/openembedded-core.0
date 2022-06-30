Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB269CCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:20:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.20725.1656562798397340083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EBB9OxBV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656562796; i=@fujitsu.com;
	bh=fYslt9by/riUlEKB8aNnct1SfbGagPNzmS+9VDP8ppU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EBB9OxBVw5cgjFU+koYzfSoREiosMsJ9zaSUGl8aopiucNwtMduqbHBUHqYGRtECz
	 O2e1M8ZSVBtgNhOWPCSDS/kuTWCxQI5oeyjDYDBFeaiI0dN1KNpvtBQZq178BBZn2f
	 Xcx/tZE6cZNGyWS8Ec2fG542gvsBUM311Yzzloa+uUIreQbi+APTEXQdiA3YqgvUfx
	 Zdxu2DyoXes9cLJToPV+X8TFT84HgpcfhKNDEofMdJAMgD62f1kkbDtmbny/V389zu
	 +GztFhCFIjl81MU8fB0nQjL49BjuXorXq8yejjhr5lHIbWUBIk7CJfzcmszOD6USuT
	 tHVOKgRmP+Y+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8MxSTdHZW+
  Swdn73BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bUJ29ZCqbxVczbfImxgbGZp4uRi0NI4DGj
  xIWjP9ghnGtMEt+fHGCDcPYwSjTdXcvYxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAhYSLz4/AbNZBFQldqzewgZi8wo4SRxe+hJsjISAgsSUh++ZQWxOAWeJp7dmg9ULAd
  VcnviaEaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExY8Y2NghbTeLquU3MExgFZyFpn4W
  kfQEj0ypG66SizPSMktzEzBxdQwMDXUNDU11jU11DCxO9xCrdRL3UUt3y1OISXSO9xPJivdTi
  Yr3iytzknBS9vNSSTYzAME4pVt6xg7Ft1U+9Q4ySHExKoryG7HuThPiS8lMqMxKLM+KLSnNSi
  w8xynBwKEnwHlcCygkWpaanVqRl5gBjCiYtwcGjJMIbCpLmLS5IzC3OTIdInWK05Jg6+99+Zo
  7lYHLm17YDzEIsefl5qVLivBXKQA0CIA0ZpXlw42Bxf4lRVkqYl5GBgUGIpyC1KDezBFX+FaM
  4B6OSMK82yFqezLwSuK2vgA5iAjpo57Q9IAeVJCKkpBqYWgxaVKTtYrVO/rL7acd38oqUCCvv
  /LWqPg53tu1mXNknaCm9nlPqmxy3CmfUKc+Ly0OdNj/Zw7zzufPR1omTHp1gn6SYys6+tWDm5
  ozF3gs/TGZc+/vmh7VZb53rZA4Hz+kX7Z69Uunzva8nfype6vap2hL53ilk46XgTaeNbtSd0Z
  Vr59qvbmgzLdctyyv/o5SIIU8ch5RT95IF+u0TbjHfSX1bqZP1NDNcpjkqT1r4afhvQZddelb
  nUpacCxdLUMwWlNpzchab+P7S/iX8F56eiY4JEO6am9EtYcjn8HgPS77EXLH0TX7pKtMvl+jM
  fTwz/Wlsy+UUly6nvGMno5cuC5Ir31TzuvbcVzYlluKMREMt5qLiRAB2xK3IdgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1656562796!164794!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31647 invoked from network); 30 Jun 2022 04:19:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:19:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D2C211000CD
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:19:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C55B11000C1
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:19:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:19:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dmidecode: upgrade 3.3 -> 3.4
Date: Thu, 30 Jun 2022 12:19:30 +0800
Message-ID: <1656562773-11393-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
References: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 04:20:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167392

Changelog:
==========
  - Support for SMBIOS 3.4.0. This includes new memory device types, new
    processor upgrades, new slot types and characteristics, decoding of memory
    module extended speed, new system slot types, new processor characteristics
    and new format of Processor ID.
  - Support for SMBIOS 3.5.0. This includes new processor upgrades, BIOS
    characteristics, new slot characteristics, new on-board device types, new
    pointing device interface types, and a new record type (type 45 -
    Firmware Inventory Information).
  - Decode HPE OEM records 194, 199, 203, 236, 237, 238 ans 240.
  - Bug fixes:
    Fix OEM vendor name matching
    Fix ASCII filtering of strings
    Fix crash with option -u
  - Minor improvements:
    Skip details of uninstalled memory modules
    Don't display the raw CPU ID in quiet mode
    Improve the formatting of the manual pages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dmidecode/{dmidecode_3.3.bb => dmidecode_3.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.3.bb => dmidecode_3.4.bb} (90%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
similarity index 90%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
index 23540b2703..bc741046dd 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
@@ -20,5 +20,5 @@ do_install() {
 	oe_runmake DESTDIR="${D}" install
 }
 
-SRC_URI[sha256sum] = "82c737a780614c38a783e8055340d295e332fb12c7f418b5d21a0797d3fb1455"
+SRC_URI[sha256sum] = "43cba851d8467c9979ccdbeab192eb6638c7d3a697eba5ddb779da8837542212"
 
-- 
2.25.1


