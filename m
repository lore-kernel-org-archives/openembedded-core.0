Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93653C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 02:47:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.65460.1669949234250646817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 18:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Riq7s4PM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669949232; i=@fujitsu.com;
	bh=e9UZx7/3n+QkfbrNB7GhI0BAwrMsYaOB+g4Y+RfA+dk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Riq7s4PM2lZ9aO5qTnVLul3D5lgik6DFjnYpW5n2bCgkq+GI9YzSmY7veXFXMbe/t
	 6dnlv9oHc8RKacQveoZAnB8qH1HDaSp0aCus4VBPqNvIICJcOmawSNlzRYK5HmsKp8
	 afBR+uNmtmTUxyVnAZ+rNKd0pILdkbOwNOTh69S2rIyRuIugMp7gqBSQi6bnx81AgJ
	 EWQ38x7aZXcNFhRtP7MIOCl7Hr/daWIaCY2XJMu1qdiHFCvI2TvmfgqFrcyye+LrG5
	 I0jWl2T6PwNJxOAZMwbguB71bu0KcOaaOlGjsROxV29laOiWxfB+hORL1wElb/nVbo
	 zPSXQkHuZYSpw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORqKuf3pl
  sMP+FicWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtHSNJO9YAZPxcRL31kaGC9ydTFycQgJPGaU
  2HXkICuEc41J4l/DL2YIZzejxPzmD+xdjJwcbAJSEjfu/2frYuTgEBHQk7j6TxQkzCygIvHid
  w9YibCAncSeC/NZQWwWoPjOF1/A4rwCThIPTm5lArElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdIzJrVBtWrJnH13CbmCYz8s5C0z0LSvoCRaRWjaXFqUVlqka6ZXlJRZnp
  GSW5iZo5eYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgKKYUK93bwTht2R+9
  Q4ySHExKoryyvzqShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwKid3JgsJFqWmp1akZeYA4wImL
  cHBoyTCWxEClOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDivWSpQkQBIUUZpHtwIWIxeYp
  SVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMqwcyhSczrwRu0yugI5iAjogUawM5oiQRISXVwGT
  qsOy6bYna+/bC2tT501+euCH0afO8noiezUWXbZmO/qx+vSnDpkz7T3TB1N2feCublkZnzVUT
  LmupcpXyiz+wKEjodmVsebTxh9eGZ9qvyZ35viz6+DTuU1MW79CdXXjgmOvupYfVPXs2nHKcK
  vB64s/TS9708Qm1ik1rvf+J7VzihdXFy1m73M53rVKez3D1o9iC5rUJ3mVP5jHuCvy35VbR5L
  BkR5GVvb0SxcVKK/NuTl9wd+HKSVaXVvza8Wd+VDJvV4Nk4u1S6zZmtuYJJccepS66JasSn+v
  su+WeRuse1xIeF80ZyXKaci8jjRew5tZE2Ul9XyoevjVX40LHNnNXy7bKch+9gs+ThJVYijMS
  DbWYi4oTAV5A015MAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-548.messagelabs.com!1669949231!141178!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30722 invoked from network); 2 Dec 2022 02:47:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Dec 2022 02:47:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8EC95100191
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Dec 2022 02:47:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 82DE210018D
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Dec 2022 02:47:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 2 Dec 2022 02:47:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.0.1 -> 6.0.2
Date: Fri, 2 Dec 2022 10:46:47 +0800
Message-ID: <1669949207-13254-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 02:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174218

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* fixes:
   * resize cancel did not work in some cases
   * fix fileattr stream command format and add workaround when it cannot be applied
   * properly handle degraded raid56 reads
   * fi defrag: fix verbosity, don't print file names by default
   * receive: fix silent data loss after fall back from encoded write
* fi mkswapfile: new command to create a formatted swapfile in one go

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.0.1.bb => btrfs-tools_6.0.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.0.1.bb => btrfs-tools_6.0.2.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb
index 7144087a11..872fba6b6d 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "441d01556873385d55fd4940f50ee7ae1fcfb13d"
+SRCREV = "ff964ba6aef98bd1bafe8ff9b0088501b30bdd27"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


