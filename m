Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ECCC61CE2
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 11:02:04 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14166.1787569318457246854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 04:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aUJakROB;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1037; q=dns/txt;
  s=iport01; t=1787569318; x=1788778918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gNBnmRl7rM7wjky2PvjhrQmvxJPfc39wR8gXy+QpdEQ=;
  b=aUJakROBjvORE3QHbSV16XMgJhgQTrRGfuuB6Jk3HZT1yiHx7qPnUk14
   MI4IM/2knhxYtuXcPfjzPH243mH2qBd1AjyAhOqBihvfM8xwutIP9U6LT
   zEVdPpQswqg+v/UP53k9CwFJwbQgqJCucmKSpRpduJ0kLRo4L10RVieYj
   ruZocAbNWy8uvdVoklJox1p5W6aK4H+rc+xHdDlam95BNs0I9tZApyZEW
   8HNDt5+KKhNMNH9FTDze6gvrdYe37iHuEUU3OugvnezDL+LuYysQrKS3D
   PDEBuRz0osEUHDjYklucRtpf7U50jJSjown2ILRs4fBLGNX5CNVvsIsXn
   A==;
X-CSE-ConnectionGUID: jHw3izlGSTaY3QBs0ELNsQ==
X-CSE-MsgGUID: 9p1g4JhARFezPxbAvyzZRg==
X-IPAS-Result: =?us-ascii?q?A0D2AgAuJIxq/5AQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUFjW4CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGMFxEgwIBgnQDwkyCLIEBhH3bMAELFAEFgTOFP4gihXInG?=
 =?us-ascii?q?xuBcoR+hBd5hXgEgiKBDJNaSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4ENGwYFgR2BKIQQIxk2fIEJXoErKWQBEheBCYIHAoJaggUCAUlDDgdHIgsYD?=
 =?us-ascii?q?UgRLDcUGQQ+bgeOXh+CRz1RgR8ZYRY6pWWhDwoog3aMIpU6GjOqbC6YWqRah?=
 =?us-ascii?q?GmBbwcugVlwFYMiCUoZD95cJzI/BwIHDwKTcQEB?=
IronPort-Data: A9a23:out6gK1EanqQgW6ul/bD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2EEz
 mAcDD/VbPrZYzSmKtojb4jg8x9Q6pHcmNRhGgFq3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDmEpZowK/slMPWh/r
 sUyM2ggSjaYvrfjqF67YrEEasULJc3vOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEiojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOGzYIOMJIbWLSlTtheA/
 22a3WTQOD8XJuSPwxOb42CevOCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:ZgN9ra/uaM+ZaDR/joVuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:NcMFym1tQf1OJGVaK28zubxfGOA6KXzPyFjrH0aJUl9DU+W4bXmLwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3APgsLEw60KjUg9Ha7ASMfDybuxow5+/2hVGINuK8?=
 =?us-ascii?q?ottu8JSZZJSaPvg64F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="816811624"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 11:01:57 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 8EDAC1800035A;
	Mon, 24 Aug 2026 11:01:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 32F00CC12A6; Mon, 24 Aug 2026 04:01:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] vim-tiny: add CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 04:01:57 -0700
Message-Id: <20260824110157.25910-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244088

From: Devansh Patel <devanshp@cisco.com>

The inherited "vim-tiny" identity has no vulnerability records even
though this recipe builds the official Vim source with the tiny feature
set, so source-aligned CVEs are missed.

Use "vim_development_group:vim" for the historical NVD configuration
identity and "vim:vim" for the current NVD dictionary CPE, configuration,
and CNA affected-data identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-support/vim/vim-tiny_9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-support/vim/vim-tiny_9.2.bb
index 1d66491433..a9759afdd5 100644
--- a/meta/recipes-support/vim/vim-tiny_9.2.bb
+++ b/meta/recipes-support/vim/vim-tiny_9.2.bb
@@ -2,6 +2,8 @@ require vim.inc
 
 SUMMARY += " (with tiny features)"
 
+CVE_PRODUCT = "vim_development_group:vim vim:vim"
+
 SRC_URI += "file://0001-Skip-sourcing-defaults.vim-when-Vim-is-invoked-as-vi.patch"
 
 PACKAGECONFIG += "tiny"
-- 
2.35.6

