Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DB0C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.130848.1712646637120893672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Caw2/6hu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646637; x=1744182637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mVEWUpYjZjgXezwie9ZjSchTO3cBhNBKpx6eSG7i8zM=;
  b=Caw2/6hudzpCOc/sMTO4nOIInpRPCJVAdU31GcLX3JOZ53YcZLz+GxvQ
   4OCwHxun0gwhA7nW6jtYW1MtDVX+7dtXYcZFkRn+HAU3T0ZXQl8Df412h
   9mEPGH7JhqRE2oAQuCN1zspHHdGVzAMVDF/MD71GqfKvLEYomRTlxBYgP
   Om9IF0g4TSeJEa/1nch3+Ci43FaoiVPaf5FxM5u7y2aISeY2Dbj1Ro50V
   ASFnrHzVIFRLro6GPSzyWDkUMU526qA5vfCAQF0kOj11rOgU4p+I88XBR
   W3ZxMkggVsX9vwJdJWJ7zySvORWLv8Ty1+fVQVKyi+YAkF5bT7OOmyBd4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="155056906"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="155056906"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DF0FE9A31
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8F1ED5A35
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 32AA14018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D5C311A0002;
	Tue,  9 Apr 2024 15:10:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/33] bash-completion: upgrade 2.12.0 -> 2.13.0
Date: Tue,  9 Apr 2024 15:09:49 +0800
Message-Id: <1712646620-16608-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--7.342700-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrmZiw53dqSN/ozDhGeQC9ErQx
	rchK41NOH9zi3kT/Il6GPpUJoGJ/QCupJvqHf1A8BHd1Ld5zzDCXBPRemiwRNZQOYBrXJCKAY6X
	TwbtPUgQXGMtxth8sEw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbaH62
	gsspfBET+Ok6f9gUlFyvkBV2KfhrX7L2q5dH9XYN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtw1tMVU7ONTxvEjBsvktXsXTsW8f7DgxG0LYH49/SBy6p0lXuJJ3xLw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198022

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
### Features
------------
-Complete protocols for --proto-default
-Add completion for netconf subcommand
-Complete commands for netns exec
-Complete help for unknown subcommands
-Complete ip link property
-Complete link types for address show
-Complete neigh show and flush
-Complete stats subcommand
-Create function to get link types
-add fallback 3rd party completion loader
-also suggest *.rss files

### Bug Fixes
--------------
-fix regression of unwanted trailing colons
-Complete addrlabel add/del properties
-Complete ip delete with type correctly
-Complete more variations of subcommands
-Complete netns attach subcommand
-Complete only relevant addrlabel subcmds
-Keep completing after -netns name
-Quote all instantiation of ip as "$1"
-Quote network namespace names
-include api-and-naming.md in dist

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{bash-completion_2.12.0.bb => bash-completion_2.13.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.12.0.bb => bash-completion_2.13.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.12.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.13.0.bb
index 66f65f565c..f75d61e219 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "3eb05b1783c339ef59ed576afb0f678fa4ef49a6de8a696397df3148f8345af9"
+SRC_URI[sha256sum] = "c5f99a39e40f0d154c03ff15438e87ece1f5ac666336a4459899e2ff4bedf3d1"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
-- 
2.34.1


