Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4219C48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 17:48:33 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web11.78248.1709488109659247825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 09:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=HQsqt8hv;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=860; q=dns/txt; s=iport;
  t=1709488109; x=1710697709;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v7OOz0i+i7jV+ZCBIej060szoHfjKKGkpgDONcz7erI=;
  b=HQsqt8hvFU06AzPCUTroThoX04Hg+XX0Zwi2KEF66xIK+F6EKMF8EwDs
   UBa7OvwMarp8lsOaCwNRK1fe2Y4kD9Piyev+evcmJOEWsCo5J+AvNDql7
   7XeW2uQPbftwwE0Z0PvGGTxXTc081TPJUsekuaQMV5fsIPJq5IUPw5Txt
   s=;
X-CSE-ConnectionGUID: 9ZCUmMHYQ3mUolfj9wWRGQ==
X-CSE-MsgGUID: bi/JzgYBQ46iSHqlyKU+GA==
X-IronPort-AV: E=Sophos;i="6.06,201,1705363200"; 
   d="scan'208";a="216353401"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by alln-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:48:29 +0000
Received: from sjc-ads-6228.cisco.com (sjc-ads-6228.cisco.com [10.28.89.212])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 423HmSWD024703
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 17:48:28 GMT
Received: by sjc-ads-6228.cisco.com (Postfix, from userid 1820939)
	id 69B9CCC1251; Sun,  3 Mar 2024 09:48:28 -0800 (PST)
From: dnagodra@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Dhairya Nagodra <dnagodra@cisco.com>
Subject: [kirkstone] [PATCH] dbus: Add missing CVE_PRODUCT
Date: Sun,  3 Mar 2024 09:48:24 -0800
Message-Id: <20240303174824.2525166-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.89.212, sjc-ads-6228.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 17:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196573

From: Dhairya Nagodra <dnagodra@cisco.com>

- The current recipe only contains one (out of three) valid product
  names for dbus package in NVD.
- This could result in reporting of lesser number CVEs than actual.
- Added missing names to get a proper list.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/recipes-core/dbus/dbus_1.14.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus/dbus_1.14.8.bb
index 4da307ecb3..f03e5c2d2e 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -184,4 +184,4 @@ do_install:class-nativesdk() {
 }
 BBCLASSEXTEND = "native nativesdk"
 
-CVE_PRODUCT += "d-bus_project:d-bus"
+CVE_PRODUCT += "d-bus_project:d-bus freedesktop:dbus freedesktop:libdbus"
-- 
2.35.6


