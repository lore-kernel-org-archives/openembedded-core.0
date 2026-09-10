Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921C4C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:14 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=Rq7SFZ2a;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1300; q=dns/txt;
  s=NAESA-Selector1; t=1789047249; x=1820583249;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sR26HYLDBA3oL250ysCJ7tJN/OdRDMjy5lsXGqdAZmY=;
  b=Rq7SFZ2afyZk9SAsKYnzNXnNYJzB9rlMKPODq2merdUlgLshlerSOIWK
   RAEpmKTe3akvw4wo2DCOom8Y5q0jvfCpVgaux57BkyUqrO8V/3LwGKNWC
   oLw2yd+vNRAZcz0QwS5kc3nO2JhCzR6fMKW/nEnfYxAWUeQLYpMYhmxNW
   5yU9Tr8I3kKsYwNCuzd5WaL08+NWCrjsEaBFFOTXRBT6ZF0zF0AreUT1N
   2EPb8tfnBJFuF8NFMC+VxebJtB7hiTItb3qcwfjGjSaYwYRIc28B9lhri
   IUO57fh+b9QxsKuzOMVjphN3CTPaTHtQlcYCUN6ZcfjLmS+1I+ofuAFwF
   g==;
X-CSE-ConnectionGUID: +6SZ3usYQ1Sj8+WpVWsSpA==
X-CSE-MsgGUID: HBh1bLLLScCMrDmuXNceKw==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105803"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:08 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 03/10] ffmpeg: set CVE_STATUS for CVE-2026-64832
Date: Thu, 10 Sep 2026 19:01:37 +0530
Message-ID: <20260910133357.452394-3-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245572

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Analysis:
- CVE-2026-64832 affects NVIDIA NVDEC hardware acceleration.[1]
- The ffmpeg recipe does not enable or build NVIDIA NVDEC hardware acceleration by default.
- Hence CVE is not applicable.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-64832

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index af05ab4af9..68f09c2bc4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -187,3 +187,4 @@ CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2026-8461] = "cpe-stable-backport: this CVE are fixed since v8.0.3"
 CVE_STATUS[CVE-2026-40962] = "cpe-stable-backport: this CVE are fixed since v8.0.2"
 CVE_STATUS[CVE-2026-64831] = "not-applicable-config: Vulkan HEVC hardware acceleration is not enabled or built by this recipe."
+CVE_STATUS[CVE-2026-64832] = "not-applicable-config: NVIDIA NVDEC hardware acceleration is not enabled or built by this recipe."
-- 
2.43.0


