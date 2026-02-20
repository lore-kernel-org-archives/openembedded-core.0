Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAC5C54FD3
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32606.1771565685734441813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gMQ3EVep;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1603; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BkjQpOCeBHysTCbZM3/bQBgoskMIHXrMaZYxjAN1i/0=;
  b=gMQ3EVep+LH29j71lGukunAVW4cx1iiDuPkkv+0l75xmHMk0skZpxALR
   b/cZ/gw8Itaav/VVuKMKTI1xbiiaaWcU3Xb83HIe9fsw7I2WEDfQ17TFI
   3rernTor30tpJavvA2Jb/RpLhJxFGQ0SHwjodqBZekZPMoDKsn4rS7ZcU
   hXZBNbLRxOAxne0PuSUeags5QxPQ+194KpjeSTt5FfTt/MF/pEdmNs1/o
   Dx0i1hbIJX6yISx1uTXcdzEiFwAHjlccqnSl96nPQA8DLWl6Um8JQ+mPt
   8EjaZ9mHW0y4pMOY0BaW5GE5U4kwtQjdKU7C++rHSSP71CvBCG6ie05hO
   w==;
X-CSE-ConnectionGUID: wXHYrR7OSNC4qWEuAbj8+g==
X-CSE-MsgGUID: B5Jsm+tuSwazWJr2fJKFvQ==
X-IPAS-Result: =?us-ascii?q?A0BHBABB8Zdp/47/Ja1aHgErCwYMgXKCSA9xX0JJA5ZIA?=
 =?us-ascii?q?54agX8PAQEBDzcaBAEBhQcCjR8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhlsCAQMyAUYQICYLKysZgwIBgnMCAadWgiyBA?=
 =?us-ascii?q?eAiAQsUAYE4hTyIGVoRCYR6JxsbgXKEfYQKIWWFdwSDMIIAkU9IgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWCQoURD4kFeG6BIIEbAwsYDUgRL?=
 =?us-ascii?q?DcUGwQ+bgeOLz+BcQ41AYENKyMyMUAIplOhDgoog3SMHpU6GjOEBKZnLphYg?=
 =?us-ascii?q?liiAYRogWg8RoETcBWDIglJGQ+OLRYcgh27fSI1EykCBwsBAQMJkWqBfQEB?=
IronPort-Data: A9a23:gYGSWa3a0mzyXq6oUPbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzIEn
 zBMWmmHOvqPNjD8etF+bIiwp0hVvsLRmtcxHQpk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX7g2QuajpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGE3EWDJcipcFMJ0oS7
 MM1NRkHbEDAiLfjqF67YrEEasULNsLnOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiaC/FMEg9/5JYWnOq0nnDjWzZZs1mS46Ew5gA/ySQvj+G9YYWKIYbiqcN9tBu6v
 WeF43nCHRgIC/6FkzSn0Vyyv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:LTBvY69y9IrYpVdCCk5uk+DfI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNDU1ZmIK9PoTJ2KDYrAd/OU=
X-Talos-CUID: 9a23:oTxxFmE8JhxmicclqmJ4xG4lAPp6VUb75yvJHGKlIGxrGP6aHAo=
X-Talos-MUID: 9a23:+dtBGAQEOJgQE4V0RXTG2RN5MYR0/p+xAVIys49cteunGzJJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671897732"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 207E718000225;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 732FFCC8CF7; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 07/34] cve-check-update-nvd2-native: Incremement DL_DIR database location
Date: Thu, 19 Feb 2026 21:34:16 -0800
Message-Id: <20260220053443.3006180-7-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231460

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing a lot of sqlite database corruption issues in our automated
testing. It is unclear why this is happening. There were process
imrpovements implemented in master and it is unclear if older releases
are somehow making those changes ineffective or if the problem is
elsewhere.

By changing the location in DL_DIR, we split the two sets of accesses
to be separate and can isolate whether the master changes really did
improve things or not. If successful, we may consider backporting those
changes to the stable releases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bcc624012d676192a722a7694614f3c49c6bc4d2)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 945bd1d927..32a14a932b 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -34,7 +34,7 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?= "10368000"
 # Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
-CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
+CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
 CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
 

