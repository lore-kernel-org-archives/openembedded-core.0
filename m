Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B1DCD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 10:37:35 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7689.1778755049811174523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 03:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=i6UZ+w8c;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1404; q=dns/txt;
  s=iport01; t=1778755049; x=1779964649;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x6t6dcA/TdWxtCxguI4UCMr2hDI8tFw3ldiV1brXLYg=;
  b=i6UZ+w8cQ/J+qYApSe5GlWTyr15/wZhfTl9URE441P1Y3AAZXLjzVIS6
   jzqsaXRkNsL6HS4e6dpmFdXPLu7cyT0Rzrquy9TvDoraLE53IcZ1KftTB
   w3CcdG0VLgjtEt/V4YGCu+Aed3UReb0bIVCkem2+cRJl5yQet+86or2jS
   twnX4W/awbtu/w3DF4Du/Dg3m6y8S2tyKyNRMPcv+FjxGgyzYoLkN7X11
   9ONBNbOhae2OhHKiI4Q+nro2l6zJo1bWUWy/2gOC3EEd+9VlmxIF9AHXc
   s0wm6xDMrzaUWEWIjMYN9sE8Sej5GkioeoAX8BIMb1NmfFQPbQKNW9osF
   Q==;
X-CSE-ConnectionGUID: PjohBSQGT+6ZFO7eCwzbVw==
X-CSE-MsgGUID: JZdIDlJgTkCctcixRi7CqQ==
X-IPAS-Result: =?us-ascii?q?A0DBAgDEpAVq/47/Ja1aglmCV3JfQkmTWgFPoD6Bfw8BA?=
 =?us-ascii?q?QEPMSAEAQGSOgImNQgOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZchxMBGAFdXESDAgGCcwIBsGWCLIEBgygBgVTbKAELFAGBOIU/iB2FbycbG?=
 =?us-ascii?q?4FyhH2FEIV3BIIigQ6Be4x3SIEeA1ksAVUTDQoLBwWBZgM1EioVMjwyHYEjP?=
 =?us-ascii?q?heBCxsHBYFLgVxyaoEBhF94Iy8DToErSQMLGA1IESw3FBsEPm4HikIcD4IwM?=
 =?us-ascii?q?V18NYEDphihDgoog3SMHpU6GjOqa5kGpFmEaIFpATqBWXAVgyIJShkPjl/MF?=
 =?us-ascii?q?CQ1AjsCBwIHDQMLk2UBAQ?=
IronPort-Data: A9a23:BoMwMaBigTDdQBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDwmhjIEm
 GUdXGyAbvyCYzTyfo1xYIuy90lTvsOAz99kOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAL8h2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE+/dpDGsNBKIkubhFL0YR+
 NcHOjozcUXW7w626OrTpuhEnM8vKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY1BPjDS0Un1lM/E48ygeKihnDXeDxDo1XTrq0yi4TW5FMqj+mwYYaEILRmQ+13rEq5i
 mbk8Fj6KRoGP92P8zva2WuV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:PS3KN6om3phpFoa1dzdtwlwaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:MnH3Qm7pDiGQfQrewdsszEwTGuoeS1LhjyniDWjnBE12WrerVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3ALalfHg6xDtzPv5kD9D9LXTDjxoxK0aiPJEQvnqk?=
 =?us-ascii?q?FkMKYPi1gATbCpy2OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,234,1770595200"; 
   d="scan'208";a="737959492"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 May 2026 10:37:28 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id CCC1018000354
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 10:37:28 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id E68EDCC1282; Thu, 14 May 2026 03:37:24 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] perl: link to the system zlib instead of a vendored copy
Date: Thu, 14 May 2026 03:33:18 -0700
Message-Id: <20260514103317.3959488-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 10:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237021

From: Ross Burton <ross.burton@arm.com>

The perl module Compress-Raw-Zlib defaults to using a vendored copy of
the zlib sources which has a number of CVEs.  A newer version of perl
updates this to zlib 1.3.2 to resolve them, but we should be linking to
our zlib recipe instead of the vendored code.

This mitigates CVE-2026-4176 so mark it as not appropriate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf515229043685d4f00c965eb3e0236c37b6b403)
Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-devtools/perl/perl_5.38.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
index e59022e2bd..5ab49ed3d7 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -49,6 +49,11 @@ export ENC2XS_NO_COMMENTS = "1"
 
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
+# Link Compress-Raw-Zlib to the system zlib instead of a vendored copy
+EXTRA_OEMAKE += "BUILD_ZLIB=False ZLIB_INCLUDE=${STAGING_INCDIR} ZLIB_LIB=${STAGING_LIBDIR}"
+
+CVE_STATUS[CVE-2026-4176] = "not-applicable-config: we do not use the vendorered zlib"
+
 do_configure:prepend() {
     rm -rf ${B}
     cp -rfp ${S} ${B}
-- 
2.35.6


