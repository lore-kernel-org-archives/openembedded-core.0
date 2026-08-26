Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA0DC61DD9
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:12 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7507.1787730849730597084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bSD+LFy+;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1079; q=dns/txt;
  s=iport01; t=1787730850; x=1788940450;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6xMeZOqPkx+/Mi/YJK6eFyx0J2vL8BPNo1x+97xcUgU=;
  b=bSD+LFy+8sE7eiUbiVQ4nzOeEFpMAmD5Co4eT2udvMkiU2r5uxaNhbCD
   wVn9oTZ6/YnVyiclw5Ru5YNFt01VW207yqrD91WcghjoWKlCqHpMIMsUP
   8VnezdR3wNMKz5n9gNbT27/9PiMj14djW616+3kXRpeP/5mcvSrLIcFU1
   39AIngMXVSIYzgsgjhgJtS+VE5FonGmYOczFx80rb7M/k2f+wkzmxk8lN
   27Egu5Yxpq2Y6LtyU/f6wZw4xsqzrYx85XTKbthqO2DuSkF2yJgOwzgYR
   bCWH+O439OKwuRD/wf+/aofn7woBlufFUEWBB8uIwn1L1AidowsCPhMCe
   w==;
X-CSE-ConnectionGUID: FFAocVBkSUSTcMmfzaVWmw==
X-CSE-MsgGUID: OUQMMbQISxSiFbCd2YUSIg==
X-IPAS-Result: =?us-ascii?q?A0BCAgDnmo5q/40QJK1RCYJZgld0XkNJk1kBggRsnh6Bf?=
 =?us-ascii?q?g8BAQEPMSAEAQGFBY1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBRjBcRIMCAYJ0A755giyBAYR92zABCxQBBYEzhT+IIoVyJ?=
 =?us-ascii?q?xsbgXKEfoQXeYV4BIIigQyTYkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCBwKCWoIFAgFJQw4HRz4LG?=
 =?us-ascii?q?A1IESw3FBkEPm4Hjmsfgkk9UYIZEQWmH6EPCiiDdowilToaM6psLphapFqEa?=
 =?us-ascii?q?YFoPIFZcBWDIglKGQ+OLhXQGScyPwcCBw8Ck3EBAQ?=
IronPort-Data: A9a23:tmVgm6D6f9Vv6xVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApD0q1T0Gy
 jMeWDqHPamNMWX9L4pxPIzkoUNSuMXXzIQyOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA//hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE7dtHC0oIF44jx91LCkRL+
 +4RFg8IcUXW7w626OrTpuhEj8AnKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWMHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFYsiuazbYWOEjCMbeJop2O9r
 FvnxHTCAz8QH9DF+Ae+033504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvaS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6eD9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:umvuja8WI+gQW+s6GARuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:qIM7z2wZ2+N18ufdt8xIBgU6NOkieUP3z0ztGHOzLGNnWrSrdlqPrfY=
X-Talos-MUID: 9a23:Zz5VWQq+SWoncLmKOQYezxZfDeJN6Z2PM1A2kLsMkMXeBBFLGjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="825266573"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 6A10418001AC7;
	Wed, 26 Aug 2026 07:53:48 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 094EACC124A; Wed, 26 Aug 2026 00:53:48 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] patch: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:48 -0700
Message-Id: <20260826075348.63928-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244323

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping also matches the unrelated Tanium Patch
product. gnu:patch is the active NVD dictionary CPE and configuration
identity, and is also used by CNA affected data for the packaged GNU source.

This retains all 15 GNU patch records, including the two current-version
CVEs already fixed by recipe patches, while removing three Tanium false
positives.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/patch/patch_2.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/patch/patch_2.8.bb b/meta/recipes-devtools/patch/patch_2.8.bb
index 6317ac775d..33142ac574 100644
--- a/meta/recipes-devtools/patch/patch_2.8.bb
+++ b/meta/recipes-devtools/patch/patch_2.8.bb
@@ -1,6 +1,8 @@
 require patch.inc
 LICENSE = "GPL-3.0-only"
 
+CVE_PRODUCT = "gnu:patch"
+
 SRC_URI[sha256sum] = "308a4983ff324521b9b21310bfc2398ca861798f02307c79eb99bb0e0d2bf980"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-- 
2.35.6

