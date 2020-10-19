Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.7256.1603146118279712543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 15:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=GlQzkhlD;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: kamensky@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=650; q=dns/txt; s=iport;
  t=1603146118; x=1604355718;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rBpG1iY9LKibDlY8VPwXH2SsaIDKCUCIeRQr4IUfU5U=;
  b=GlQzkhlD6yp5qkPrXdF0CbJ9mDvlgda8ri9DDDhmFPNPV0VQWpg6bFvx
   vziTNA7Ar1L+LkVEIfIyvFvoUDTzK5MrMFiyB2jTLrezholH2/Kyn5nfc
   ATEIM/lnid5ydDVGKIquvIkzUjaD8ZLskz1COz+Jg19EI1np2Fec26X2u
   g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DtDwC0EI5f/4oNJK1gHAEBATwBAQQ?=
 =?us-ascii?q?EAQECAQEHAQGBZAKCKIFFATKwKoF9CwEBAQ0BAS8EAQGESoIPAiU2Bw4CAwE?=
 =?us-ascii?q?BCwEBBQEBAQIBBgRthW2GKwFGgWyDC4J9rxCCKIVXhRaBOAGINoR/G4IAhF+?=
 =?us-ascii?q?EBIEGhSkEkxCJYJsKgnSDFpdMDyKDBJ5Ms14CBAYFAhWBWwQvgVdNIxWDJU8?=
 =?us-ascii?q?ZDZ0GIQNoAgYKAQEDCYwCgkYBAQ?=
X-IronPort-AV: E=Sophos;i="5.77,395,1596499200"; 
   d="scan'208";a="836898292"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 19 Oct 2020 22:21:56 +0000
Received: from kamensky-p53s.cisco.com ([10.24.43.127])
	(authenticated bits=0)
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 09JMLmwc027939
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 19 Oct 2020 22:21:56 GMT
From: "Victor Kamensky" <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] Revert "qemumips: use 34Kf-64tlb CPU emulation"
Date: Mon, 19 Oct 2020 15:21:44 -0700
Message-Id: <20201019222146.29078-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.43.127, [10.24.43.127]
X-Outbound-Node: alln-core-5.cisco.com
Content-Transfer-Encoding: 8bit

This reverts commit 6a9568401cbf8bed89d1f63dae61a07a83a20b50.

Will be replaced with upstreamed solution instead, that just
bumped number of TLBs to 64 in original 34Kf CPU model.
---
 meta/conf/machine/qemumips.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index b8c80f02ef..1373e4cba0 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -15,4 +15,4 @@ SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 QB_SYSTEM_NAME = "qemu-system-mips"
 
-QB_CPU = "-cpu 34Kf-64tlb"
+QB_CPU = "-cpu 34Kf"
-- 
2.14.5

