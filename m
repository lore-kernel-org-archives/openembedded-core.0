Return-Path: <shrchakr@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5058C531CC
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 21:52:34 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7378.1784843548021823133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 14:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gLeAe4B7;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: shrchakr@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2607; q=dns/txt;
  s=iport01; t=1784843548; x=1786053148;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y8l3OxFWOcI96HYxdSldcgxDCpyQbk7IOChXnxi55RA=;
  b=gLeAe4B7BOQygPrF7XO3wfIp8JQlt/EA55aTrZ4m6tW9kQaHnYUjznVh
   Qpa028Rwcf3Hgn80AWBgHnzq5m4e6np3lqzjs6xS6vhJdJxKQHEVoUNl/
   m9mkmnIYLG7A8cySEyxltiXufCfZNoq728srQTBY0FaJcoXH6x906N8OU
   f/yAY3j06NBW/g9zbCpFc4mfg8uMJA1OW3REAjjelaVy+qU5oCgZjgq95
   mct3NVPd448hojl5Z/ZHXlMZ011PR4rALDfNExyY7vRDmdOEIWH6UAP7K
   sD5nX9NyFQmCoPfKHgBVZGgoP6ANqTqc+6uVmSrxyC1lPJprJTJlIlzPX
   A==;
X-CSE-ConnectionGUID: njKlm3QqTH6aS4fg7RsJ8Q==
X-CSE-MsgGUID: /NpQHBCOTKaCTs8aTz3VzA==
X-IPAS-Result: =?us-ascii?q?A0BYAgAejGJq/5D/Ja1aHgE8DA4LgVmCV4FTQkmiQYxJh?=
 =?us-ascii?q?V6Bfg8BAQEPUQQBAYUFjWECJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIZdNgEzE4EMRIMCgnUCAcIdgiyBAYR92UiBZgELFAGBOI1fh?=
 =?us-ascii?q?XEnG4FJRIQIhgaFeASCDYEhiQyJIkiBHgNZLAFVEw0KCwcFgWYDNRIqFTI8M?=
 =?us-ascii?q?h2BIz4XgQwbBwWBHYEseYRXIx8DOX+BL3VKdy1pARIXgSaDSQKBNwMLGA1IE?=
 =?us-ascii?q?Sw3FBkEPm4HjWsjgkCBDoIvAjalZ6EEC4QnoVsaM6prAYccAZFrpFqEaYFoP?=
 =?us-ascii?q?IFZcBWDIlMZD91EJDU9AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:xqdAEq5NmhyAJrMGHMMvygxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mVNDWqDb/qNZGPzfIskb4u18B9X6J7Vn4A3TVQ/+Ho3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OsPvbwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eO487/uMsOHhy1
 aIRE2wDYU+5nMDm+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAnXnleD1Rq0i9rqss6G+Vxwt0uFToGIeMJoPXGZ8JwC50o
 EqB2XzAIjsxE+C8wBG56SKluv2UozHSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:bTRgKaGzB0oU9U6apLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:+Amsm2A/fDCEdqv6Ey9l10oRQfk8Tl2DxUyMLUDnM31LGITAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AZ3io1w+ABjl6ik4jyR7rZUGQf4BO+52OImsqrbY?=
 =?us-ascii?q?PkPWfZSVMKWyjnh3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,181,1779148800"; 
   d="scan'208";a="514754246"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 21:52:27 +0000
Received: from sjc-ads-12106.cisco.com (sjc-ads-12106.cisco.com [171.70.97.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id E77B418000205;
	Thu, 23 Jul 2026 21:52:26 +0000 (GMT)
Received: by sjc-ads-12106.cisco.com (Postfix, from userid 634470)
	id 909DDCC8D39; Thu, 23 Jul 2026 14:52:26 -0700 (PDT)
From: Shramana Chakraborty <shrchakr@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Shramana Chakraborty <shrchakr@cisco.com>
Subject: [PATCH] FIXMESTAGINGDIRHOST is not getting restored properly for all recipes
Date: Thu, 23 Jul 2026 14:52:10 -0700
Message-Id: <20260723215210.29263-1-shrchakr@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12106.cisco.com [171.70.97.106];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.106, sjc-ads-12106.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 21:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241874

Expectation is sstate_hardcode_path_unpack will perform the exact reverse
operation of sstate_hardcode_path.
But FIXMESTAGINGDIRHOST is not getting restored properly when the artifacts
are fetched from shared state for recipes which requires both host and
target to be restored. This was introduced by 0875107.

Fix the unpack logic. There are effectively two cases, native and
cross-canadian require only host and everything else require both host
and target.

Signed-off-by: Shramana Chakraborty <shrchakr@cisco.com>
---
 meta/classes-global/sstate.bbclass | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 34a59fda00..9d62855bc0 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -420,10 +420,8 @@ python sstate_hardcode_path_unpack () {
 
         if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross-canadian', d):
             sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRHOST:%s:g'" % (staging_host)
-        elif bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d):
-            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (staging_target, staging_host)
         else:
-            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g'" % (staging_target)
+            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (staging_target, staging_host)
 
         extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES') or ''
         for fixmevar in extra_staging_fixmes.split():
@@ -581,7 +579,7 @@ python sstate_hardcode_path () {
     # staging packages.
     #
     # Note: the logic in this function needs to match the reverse logic
-    # in sstate_installpkg(ss, d)
+    # in sstate_hardcode_path_unpack(d)
 
     staging_target = d.getVar('RECIPE_SYSROOT')
     staging_host = d.getVar('RECIPE_SYSROOT_NATIVE')
@@ -590,9 +588,6 @@ python sstate_hardcode_path () {
     sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % staging_host
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross-canadian', d):
         sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
-    elif bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d):
-        sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging_host)
-        sstate_sed_cmd += " -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % staging_target
     else:
         sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging_host)
         sstate_sed_cmd += " -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % staging_target

