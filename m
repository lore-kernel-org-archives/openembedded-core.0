Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA03CCA473
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:11:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.2016.1655280684878182897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JYynGSBV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655280683; i=@fujitsu.com;
	bh=gFIut3C8Y41sjfsAQm9qx9LnNCB/C+QS/6MIinj1w0E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JYynGSBVYSVEodZ4dzXR6bnO5fMq5bZvUnOPCWfV4Jhe/W4N6sxNPX3My/EZzJQrx
	 w39TwUi9rpTElsCNtx972zRC2xdqv58XUQT8tHhw9FvgH1ioav6LZfRpyr0zomNOJX
	 LE6FcanbyOfNRfXN+y39SpqJopSe9rsntsGQfDU2R/xWKl+LkcXlE2jBumsHYMk8GO
	 c0qvdJ91RGOO8kBivB584FZuSVB69e5jT9R66SBl46DKNhnZYa8jtH8sCOF5jiO7aj
	 LHtkWIGsbe0Y5SCC5UwABIee4A1ImWwBDo/cbue2koTWmaz818AEjfV/hO+CT9NnKc
	 kOPfeZaxXyC9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8OxWVdryso
  kg1P/ZS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxln3czFczgrmhuPsnYwPiQs4uRi0NI4AGj
  xKzbt9ggnNNMEpeufoJy9jBKHHp/kaWLkZODTUBNYvqtG6xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHCQsL2Em8fS4FEmYRUJWYtraVESTMK+Ao8XSJIkhYQkBBYsrD98wgNq+AoMTJmU9YIKZISB
  x88YIZokZRYvblZhYIu0JixoxtbBC2msTVc5uYJzDyz0LSPgtJ+wJGplWM1klFmekZJbmJmTm
  6hgYGuoaGprrGFrqGJgZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBIZlS
  rNazg/HEqp96hxglOZiURHmVJ69MEuJLyk+pzEgszogvKs1JLT7EKMPBoSTB6zoJKCdYlJqeW
  pGWmQOMD5i0BAePkghvPUgrb3FBYm5xZjpE6hSjLsfMr20HmIVY8vLzUqXEeWM6gYoEQIoySv
  PgRsBi9RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5OkFU8mXklcJteAR3BBHRE474VIEe
  UJCKkpBqY5tnYZWr2/71mkT1JYlLytReXJ7BXXvZ6d41ptd7jA/Eegu5T3aWW181e1T7nGf+d
  2QWxm/d22Mx4s6DpMb/V88r3HLmyYmHPhacyVAm8TxdX+HREzk+jW+c801lZJU72k6+3sh580
  VWv6DRLM8Gf68SKZZyyjfqrrqts2cP6aNbp7VPYkmP5Qgpa2nbu+SN603vrssb326L3Tqk2DZ
  pTKRn/kOHrnTzhQs3U6tPXnBev8l175nt73Ixp6Tl83Uocd2e6zPn8sCxvy5bUvW2zTFdMrDj
  8yflTok5s70/xSe+OvA4v15ux1DSKI+Us21FHPv4LVU/vnArJ6lNcsrSi8roS0yuGTn9Zsdt+
  uxQ5lFiKMxINtZiLihMBdef8D1ADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1655280682!40356!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11136 invoked from network); 15 Jun 2022 08:11:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:11:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 08E7A153
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:11:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EA3D975
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:11:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:11:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 5.18 -> 5.18.1
Date: Wed, 15 Jun 2022 16:10:35 +0800
Message-ID: <1655280638-6528-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166913

Changelog:
==========
   * fixes:
      * convert: fix self reference of toplevel directory
      * build: make kernel lib headers compatible with C++
   * zoned mode: verify minimum zone size 4MiB
   * libbtrfs: cleanups, merge headers and remove declarations of unexported
     symbols
   * other: documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_5.18.bb => btrfs-tools_5.18.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.18.bb => btrfs-tools_5.18.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
index f5120d3980..816fc17ae1 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "f9e303584272b81b05b926a0cc9010f43af12a03"
+SRCREV = "47b5cf867fc37411ef51eb5c09893a95f7f6c3b7"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


