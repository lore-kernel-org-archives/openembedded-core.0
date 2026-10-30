Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4789.1793334058763044632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 21:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=M2ETfDLF;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2270; q=dns/txt;
  s=iport01; t=1793334058; x=1794543658;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2ZpNvVayf/H37g2Whdj/uC4x3UxUH5kolElIxc732ng=;
  b=M2ETfDLFTtV24l9zfWZABnGx04dr00S6i1Nzj/0J3b5msnhDgFvOp37P
   TzEZAH6Dv+5SuvPo88oGdwd9XN2CcX06on+JkpTTJv1FJrl6KzHnX3Iq2
   KLsebOjFeSgSXDP267DT5kIl6UGMgU030RJr2+DKCC/rrMJiik7Fo03YE
   enBwxUdrY4boA0vQapZ/aE/MJ18fL1d+xsStsfHPbDnZ0Z9tQS3VewZsb
   RqjLj/DG0eabekjEHKRmx9p2ksBeNQhFAd3nOVrLXGhJMm3pHbzAxzzuu
   Df7hkE9dLPFLewyY+2dlDtM3O2XqU6N6KTFVBwUVhmAqujPEdUgaAy0zp
   A==;
X-CSE-ConnectionGUID: /WKJkea8QZq54vaWKopyxw==
X-CSE-MsgGUID: +fBOS62US26ulR2lZbQujg==
X-IPAS-Result: =?us-ascii?q?A0BhAwAxGuRq/4r/Ja1aglmDTGBDSZNaAYJwniAUgWoPA?=
 =?us-ascii?q?QEBDy4PFAQBAYUFjh4CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBUBBCYLARgBGxIwWAQ7CRqCaAGCdAMRtCkbN4F5M4EBgykBO?=
 =?us-ascii?q?QGBGts/FYE4hUCII3UBhH0nGxuBcoEVg2mCYQWBQwtchXgEgg0VehKCXYIyi?=
 =?us-ascii?q?XmHcEiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BGYEHX?=
 =?us-ascii?q?YErKWABIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGi4LgRo1PAkmQ?=
 =?us-ascii?q?RUMZAsaBWIIAg0MdjkQMSAmMgQDHiMYDUgRLDcVGQQ+bgeRcoJuIFoKKgErI?=
 =?us-ascii?q?mMTU0EPAgYBkycMMI9agiGhDwoog3eMI40+h3waM6pwmQiOCpU0gRyEaYFoP?=
 =?us-ascii?q?IFZcBWDIglKGQ+XN8lHJzICOwIHAgcOAwuRai2BTwEB?=
IronPort-Data: A9a23:r4SdIKtCfJ3J/aVYiULs8dCCDefnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWCEaP6LNzHxLY0iPoSx/UMHvZfTz9MySFRl/ig3FCtBgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvrZ+Usy1BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwvdlUI2JD/
 KwhGilQMg6KuMGx2KOrVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxHYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHRHpQKxhbJ/
 goq+Uy6DDs9D4LF9AHfrG+ovLXLrynCRYAdQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:rKtNlaFX7umBWigkpLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3AGJxAoWrTVfQR0vn/sNt9/O7mUYcaUV/ewX6AGn2?=
 =?us-ascii?q?hVDp3QYK2TkeB6Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:ihwNHwSagPtqLAt9RXSvihtFD5ky3p/0Vl0Jq88CicO9KC5/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,185,1787011200"; 
   d="scan'208";a="533970890"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Oct 2026 04:20:57 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 97D24180001D5;
	Fri, 30 Oct 2026 04:20:57 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 40040CC1611; Thu, 29 Oct 2026 21:20:57 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 0/1] rsync: upgrade 3.4.1 -> 3.5.1
Date: Thu, 29 Oct 2026 21:20:53 -0700
Message-Id: <20261030042054.1345082-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 04:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248982
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Upgrade rsync on Wrynose directly from 3.4.1 to 3.5.1 in one commit.
This consolidates four OE-Core master upgrades; their commit references
and original contributor credits are retained in the patch.

The TSC approved an exception to the stable branch policy for rsync on
Scarthgap and Wrynose [1]. The maintainers concluded that upgrading is
preferable to carrying the large security backport series or leaving
the CVEs unpatched. They recommended 3.5.1 to align with master and
Blacksail and include the regression fixes following 3.5.0. This patch
implements that approved upgrade using published release tarballs.

Version 3.4.2 includes the fix carried by CVE-2025-10158.patch, so the
backport is removed. Version 3.4.4 includes the six security fixes from
3.4.3 and subsequent regression fixes. Version 3.5.0 fixes 33 further
security issues with differing affected-version ranges. Version 3.5.1
addresses reported 3.5.0 regressions, including path handling and
access to standard-stream file descriptors [2]. The recipe patches are
refreshed for the new sources.

Compatibility considerations: 3.5.1 changes the wire protocol number
to 33 and adds logical-block statistics when both peers use protocol
33. Rsync documents negotiation of the newest protocol shared by both
peers [3]; mixed-version transfer behavior still needs local runtime
validation. Internationalized domain name support is behind the new
optional idn PACKAGECONFIG, which remains disabled by default.

[1] https://lists.openembedded.org/g/openembedded-core/message/248203
[2] https://download.samba.org/pub/rsync/NEWS
[3] https://download.samba.org/pub/rsync/rsync.1

Darsh Kelaiya (1):
  rsync: upgrade 3.4.1 -> 3.5.1

 ...-prototypes-to-function-declarations.patch | 78 ++++---------------
 .../rsync/files/CVE-2025-10158.patch          | 36 ---------
 .../rsync/files/determism.patch               |  6 +-
 .../rsync/files/makefile-no-rebuild.patch     |  6 +-
 .../rsync/{rsync_3.4.1.bb => rsync_3.5.1.bb}  |  4 +-
 5 files changed, 23 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb => rsync_3.5.1.bb} (95%)

-- 
2.35.6
