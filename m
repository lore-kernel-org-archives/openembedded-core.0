Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EFFC43217
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 13:08:18 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.7852.1646140097388225015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 05:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K3M90Hrv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646140095; i=@fujitsu.com;
	bh=+1vKGGKIYyA5rHztrW3NC8ypaOcZ5rVBa0h0zLR9WEg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=K3M90HrvlSivnyEy9jy94SUEAOz02t6sX0Tv9z81k3XTw3NbhagRTn9whcmgyKnEr
	 /YoJSNIBEDrUQ7LJH3y6AnLWVYw8dj5lvIII0BEF73g6nnKiwj1OcGU8rHRzXnp/n8
	 blcM3KzZWNPj+KsqqyAHos4dwPBt8f/Rvc3KQtcz3B5+uj39jlFC/CtfRkzdlYtAy4
	 h8CZGnVW/U1b2erQ1jt8unxMNID9wnxWNv3TbWtxZ/9ukXJCH65WB9iYccBJcPuLDr
	 2DQwgKqM8CdlFXnoBQ5L4R8iojOUdB3aXe8rVORaOi4GzvFd4/N9aPAHFtg2KzW4Rt
	 3i3UVccJWVOWg==
Received: from [100.115.66.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 D8/3C-30582-FBA1E126; Tue, 01 Mar 2022 13:08:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqLtfSi7
  JoKFPwuLOz3fsDowe5zauYAxgjGLNzEvKr0hgzZh5ZCdbwU/Oiq2XWRsYv3F0MXJxCAk8ZpS4
  cvEWG4Rznkli7olv7BDOcUaJ7xOXM3cxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAjcTy2+vYQEpYgOK/G+xAwrwCThJn11wCmyIhoCAx5eF7MJtTwFli2pwXbCC2EFDNpa
  3TmCDqBSVOznzCAjFeQuLgixdQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjHaJRVlpmeU5CZm5ugaGhjoGhqa6ppZ6hqamuklVukm6qWW6ian5pUUJQKl9RLLi/VSi4v1
  iitzk3NS9PJSSzYxAgM5pdh1zg7GC30/9Q4xSnIwKYnyqt2UTRLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwXtRTC5JSLAoNT21Ii0zBxhVMGkJDh4lEd5UcaA0b3FBYm5xZjpE6hSjopQ473SQhA
  BIIqM0D64NFsmXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzWkoATeHJzCuBm/4KaDET0OK
  /wVIgi0sSEVJSDUzFTFW/ei7POTwla7OQc87BHyy/PXoPy013VVYI6b7m1JuS/2R/BPuK6b/T
  jKIC9bs4/uZ46rkWeTAcrXq1+iiPzos1vaJHn/rdbWU3Ctv9ItLr7USeP/8WnbDlsOc5Hm2h+
  lTlSLf8pXXdv9at/xmcPpPD2S5jWVdyk735Eq43sZvUS0R/M2R4HfUp+974PMTF4zf7ZaWMi0
  q6HGutrTUl/j04fV/RSXnmTKYVFbeOZqxYVrLPbUO7mXPEnxOzJf9LtWhPfV557cxHR5Wzf+M
  ufpv+0PRBjZj/dN+TEx4+fL3I7nzc17ij09IshJsmZxumvS2MaOp9fEDtdEVdVo18eKNn19Qv
  fM/leWK99yqxFGckGmoxFxUnAgAqNM73XwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-532.messagelabs.com!1646140095!19125!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2635 invoked from network); 1 Mar 2022 13:08:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 13:08:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E0629100186
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 13:08:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D3E65100183
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 13:08:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 13:08:09 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sysstat: upgrade 12.4.4 -> 12.4.5
Date: Tue, 1 Mar 2022 21:07:54 +0800
Message-ID: <1646140075-39370-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646140075-39370-1-git-send-email-wangmy@fujitsu.com>
References: <1646140075-39370-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 13:08:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162553

Changelog:
=========
* sar/sadf: Make sure that datafiles with unknown activities can
  be read by sar and sadf.
* sar/sadf: Don't reallocate buffers for activities not present
  in file.
* sar: Make sure that all buffers are copied in copy_structures()
  function.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysstat/{sysstat_12.4.4.bb => sysstat_12.4.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.4.4.bb => sysstat_12.4.5.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.4.bb b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.4.4.bb
rename to meta/recipes-extended/sysstat/sysstat_12.4.5.bb
index d635650a1f..fe3db4d8a5 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "9512e7479e04f92e251c5c6b4bd94b8f643d212bd0e986a8ea4d147a6e943d24"
+SRC_URI[sha256sum] = "ef445acea301bbb996e410842f6290a8d049e884d4868cfef7e85dc04b7eee5b"
-- 
2.25.1


