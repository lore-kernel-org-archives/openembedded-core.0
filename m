Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2ADFCE075
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:54:30 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69125.1772110466273531085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kj/Ji/u0;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=758; q=dns/txt;
  s=iport01; t=1772110466; x=1773320066;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PBrMbK/hgbY6LuEudKwgp/OdKl4ReoZMa+tG+0/NNcM=;
  b=kj/Ji/u0IGtEWPlzjjSopYM7DCZHojdJgq7iB8oFRiyhzxotAp2U4ERL
   u0bEj0D4VfbtW0pEUs//xdHws7IPKMfczfEqz2mKyMQ1NA0EU1Xq21N+i
   YRE4z/oBlYXPe77u+ztBnHsejQ8qepM4eq4CC8s19ECthOkjZVpPM012f
   gdjVJaQD48hzx4z5rPtToVplWG6Jf2Ff2Y43HDpy5Bo7iqeYFO81YzP60
   hFQwQCvx0EleBD5rocHPzuwZ+6Ki8MTaP0vfqvwBcHu+9jXFgsxT2U8vU
   8Q94ebZy/CSB77NyNs0eLDT2SkZp5AmJsm/yA+H0CAsCHh5PsCNwKy5TD
   g==;
X-CSE-ConnectionGUID: wb7hStxBTk+Ky9/rIHP3+w==
X-CSE-MsgGUID: /etLXu0JSLiaWA/mFO0EFA==
X-IPAS-Result: =?us-ascii?q?A0CyCAAzQqBp/47/Ja1aglmCSA+BUEJJk1oBoQ2Bfw8BA?=
 =?us-ascii?q?QEPUQQBAYUHjSECJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBRjBcRIMCgnQCAaZrgiyBAYR82yYBCxQBgTiFPIgZdIR6J?=
 =?us-ascii?q?xsbgXKEfYQKgQaFdwSCIoEOgX+KWIY3SIEeA1ksAVUTDQoLBwWBZgM1EioVM?=
 =?us-ascii?q?jwyHYEjPheBChsHBYYID4h0eG6BGoIEAwsYDUgRLDcUGwQ+bgeNaT+CNIEOg?=
 =?us-ascii?q?W+UZZF4oQ4KKIN0oVgaM6prLphYpFmEaIFoPIFZcBWDIlIZD45fykYiNTwCB?=
 =?us-ascii?q?wsBAQMJkWqBfQEB?=
IronPort-Data: A9a23:olHRzq+KaKFiVjd9ujITDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zEfD26Gaa2NMGb0fY91adi39BwEuMLRm4VlQAA6rH9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mryyHjEAX9gWAsaDhKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kpN9IYwfpnK11Nt
 t8JeXcXTzC73KGplefTpulE3qzPLeHxN48Z/3UlxjbDALN+HNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0cn1lQ/UPrSmM+oi2XneiFwo1OOrq1x6G/WpOB0+Oaya4aOI4XUFK25mG7fq
 37iz3mhICo+NdWg4H2A3FX0q8HmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSjFnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:IDiuE6sOZXHKXvVw6Z/wToVy7skDfdV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldK0Ec
 xbAs9D4BqaNykfsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3AOZp1jGqk5tw4g+tSYGlmyMfmUd8vLX3m0Gf6H0z?=
 =?us-ascii?q?7Knc4D6e0aWfLu7wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AwBOSewzki/2aLqaxVhoCFdM58PuaqOOjFGQ9jM0?=
 =?us-ascii?q?kgO2FPBNZfDKzq2yabKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,312,1763424000"; 
   d="scan'208";a="673431169"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Feb 2026 12:54:17 +0000
Received: from sjc-ads-4197.cisco.com (sjc-ads-4197.cisco.com [171.70.54.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id D207B18000370;
	Thu, 26 Feb 2026 12:54:16 +0000 (GMT)
Received: by sjc-ads-4197.cisco.com (Postfix, from userid 1847788)
	id 794A0CC1282; Thu, 26 Feb 2026 04:54:16 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [OE-core] [PATCH v1] util-linux: Add vendor to CVE_PRODUCT to exclude false positives
Date: Thu, 26 Feb 2026 04:54:13 -0800
Message-Id: <20260226125415.53196-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.54.218, sjc-ads-4197.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232019

From: Het Patel <hetpat@cisco.com>

- Added the vendor to CVE_PRODUCT to prevent false positives.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index deb9bfd064..81fefa5afa 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -24,4 +24,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
 
-CVE_PRODUCT = "util-linux"
+CVE_PRODUCT = "kernel:util-linux"

