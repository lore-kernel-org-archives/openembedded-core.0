Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE442C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:47:34 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36738.1782737246694412318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=A9NXIh2+;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1637; q=dns/txt;
  s=iport01; t=1782737246; x=1783946846;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UtEyQnuxwGx3IOz50J6BAarJEw2IYOE5VtT4eqzt77k=;
  b=A9NXIh2+EtFlE/ihlqFuhKZZPRvQs2OceLFtlutR5q8h/Li//t6w0tR1
   o4HMK2H7yBCLePQZ58EVtuDB2+JAB8S/BLGSZ7OOEGiKhEDnQXaFC7aS7
   HLIwzTu9K9sjvI/IhpsRTVURGJ4JW2Axlp1u0uRaVve073k2N7ShdXrZ8
   4fINJ9jmX73YVJF1lHMGcub2pqZlcw5XQEEIksmYM3H5mVKYpNw4XSWlN
   OyoD51upSK7gy2XBHRoo69VkvUzYkJidali2rf69to+b1kuov4hafmc6w
   E9r+YQBLcLVZKDmQClFJx50Ba32u9osM7V5Iqkl6eAYE+seGBYW9Z4zL4
   g==;
X-CSE-ConnectionGUID: 6hrk29f2RFmyKbB7ZKH+fQ==
X-CSE-MsgGUID: fNkUNTDIQ72vMNmq0ppxIw==
X-IPAS-Result: =?us-ascii?q?A0D3AgDCaEJq/4//Ja1aHgEBCxIMggULgld0X0JJA5ZIn?=
 =?us-ascii?q?h6Bfg8BAQEPPRQEAQGBcQGDFI1NAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8Nhl02ARgBLTBcRIMCAYJzAgERtn2CLIEBgygBMQWBH?=
 =?us-ascii?q?tssAQsUAQWBM4U/iB90hHwnGxuBcoR+gQWEC4V4BIIigQyBeIF7hVeHP0iBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgWmBBIR9Ix8DOX+BM?=
 =?us-ascii?q?HVYZhUwNYECAREeCoFSJwMLGA1IESw3FBsEPm4HjF4XD4I9PUUMLCCCDByTC?=
 =?us-ascii?q?VeReqEPCiiDdYwhlToaM4QEpmiZCIJZizGWUIRogW8GL4FZcBWDIglKGQ+OO?=
 =?us-ascii?q?Ih+wnckNQIMLwEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:3qWcN6/mhb7PH1c9CZQ3DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GsaCD+EPvmCZWLxeN8gbt+1/RwP7ZaDytA1SwE+/nxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4muyyHjEAX9gWAsbDhEs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2loPZcboLd5W1tg8
 O07IhpSXDOjxOyPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Yn1lQ/UPrSmM+hin75fDRCpXqepLE85C7YywkZPL3FbYKPI4TVFZwN9qqej
 mzg/FnfPj07DYPF1x+j92v0nvffvDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjZCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:Rmxq264ufpbXDMrVuAPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AnSc4hmmkrmDX1RbISAi83Stv3OvXOSPd1nSKckH?=
 =?us-ascii?q?iM0hsWZ6fYwCi24MnnfM7zg=3D=3D?=
X-Talos-MUID: 9a23:9miGkAQO7O6ElwSkRXTiojJfEvtEwp3xUl4ot5Af49GcJQ1vbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="502107810"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 12:47:25 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id BEC581800039E;
	Mon, 29 Jun 2026 12:47:25 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 7758CCC12A6; Mon, 29 Jun 2026 05:47:25 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH] apt: mark CVE-2011-3374 as not-applicable-config
Date: Mon, 29 Jun 2026 05:47:12 -0700
Message-ID: <20260629124712.1159-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239773

From: Anil Dongare <adongare@cisco.com>

Details: https://security-tracker.debian.org/tracker/CVE-2011-3374

CVE-2011-3374 describes a design flaw in the legacy apt-key trust model.

This does not apply to the current apt recipe in OE-Core because it uses
Debian vendor configuration. Debian security tracker notes this issue is not
exploitable in Debian since no keyring URI is defined for the apt-key
net-update path.

Mark this CVE as not-applicable-config for the recipe. This is a
configuration-based status, not a fixed-version status.

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-devtools/apt/apt_3.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 08b6bac2e4..03da3fbcf1 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -34,6 +34,10 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+# Not applicable: this OE-Core apt recipe uses Debian vendor configuration,
+# which does not define a keyring URI for the apt-key net-update path.
+CVE_STATUS[CVE-2011-3374] = "not-applicable-config: OE-Core apt uses Debian vendor configuration, which defines no keyring URI for the apt-key net-update path"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
-- 
2.44.4


