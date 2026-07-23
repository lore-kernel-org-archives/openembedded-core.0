Return-Path: <shrchakr@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55CBC531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 22:25:14 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7857.1784845511311281653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 15:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hCTIkV47;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: shrchakr@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2607; q=dns/txt;
  s=iport01; t=1784845511; x=1786055111;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y8l3OxFWOcI96HYxdSldcgxDCpyQbk7IOChXnxi55RA=;
  b=hCTIkV47HMGgWumreASKCqvyxNwTcFUBh+ENT1gfZlJgd7z+rntis7qc
   YN8k3ckG6dSfIAtBerPXd/8+61+0nIko2P8cqekrVNNur+o18x2a/JNyX
   tlBKXbk4tRZa3Sd/MpwM8uLjnWw//W5FVucNSzbPgxbNbUp78hwWE6QxD
   XK2Wt3YV/Poh0NKAz/LE6Q/UC950yFs67FMgMuiRgbsCKoni2LXSKRx9R
   a3EcPH2eWSAG4l3aBGqRW+LvaVNdQPqVPFcEFXSUax0Zz6SS5kaD+E8TW
   B2vTktOSmVY158u0OfRyyS5NkBMzXVLsDgXUGVnkcEN5s/pYWyZ8WrCtY
   Q==;
X-CSE-ConnectionGUID: vJsni5TdRkCcuApYYCGzVg==
X-CSE-MsgGUID: oQHirI2LRta85N9U97m9Ww==
X-IPAS-Result: =?us-ascii?q?A0BYAgCok2Jq/4r/Ja1aHgE8DA4LgVmCV4FTQkmiQYxJh?=
 =?us-ascii?q?V6Bfg8BAQEPUQQBAYUFjWECJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIZdNgEzE4EMRIMCgnUCAcJSgiyBAYR92UeBZgELFAGBOI1fh?=
 =?us-ascii?q?XEnG4FJRIQIdoUQhXgEgg2BIYkMiSJIgR4DWSwBVRMNCgsHBYFmAzUSKhUyP?=
 =?us-ascii?q?DIdgSM+F4EMGwcFgR2BLHmEVyMfAzl/gS91SnctaQESF4Emg0kCgTcDCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB41rI4JAgQ6CLwI2pWehBAuEJ6FbGjOqawGHHAGRa6RahGmBa?=
 =?us-ascii?q?DyBWXAVgyJTGQ+OX84zJDU9AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:qyXU5agBIqvu4W9vgCMKYhNVX161MREKZh0ujC45NGQN5FlHY01je
 htvXmqOPK2PY2CgcownOovjo08D7ZSBzIcwGQA/pH8wHyhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPjY8UkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUG2P1xADxy+
 cYbAzsQRwiytsmZ0oy0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQd/5JEWxI9EglHkcydTqFuWv4I84nPYy0p6172F3N/9J4TUH5wNxhzJz
 o7A12PAIhAAFYa78yaMoi+K19KewiaqZ51HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:pAse36js9QyvL7570Mb2NptuOnBQXuwji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: 9a23:LgnA6WHoKJfUNY0nqmJ51lUSG50Zfkfe53zNCleJOE1GWoOaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AjaM7RA7ohqsfNjlVxiIBR81Sxoxv2oSvEmFXta8?=
 =?us-ascii?q?aspnZE31NamiY3QuoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,181,1779148800"; 
   d="scan'208";a="506210029"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 22:25:10 +0000
Received: from sjc-ads-12106.cisco.com (sjc-ads-12106.cisco.com [171.70.97.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 38E08180001C5;
	Thu, 23 Jul 2026 22:25:10 +0000 (GMT)
Received: by sjc-ads-12106.cisco.com (Postfix, from userid 634470)
	id D5921CC8D39; Thu, 23 Jul 2026 15:25:09 -0700 (PDT)
From: Shramana Chakraborty <shrchakr@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Shramana Chakraborty <shrchakr@cisco.com>
Subject: [PATCH] sstate: FIXMESTAGINGDIRHOST is not getting restored properly for all recipes
Date: Thu, 23 Jul 2026 15:25:04 -0700
Message-Id: <20260723222504.9991-1-shrchakr@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12106.cisco.com [171.70.97.106];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.106, sjc-ads-12106.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 22:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241876

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

