Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED87CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 13:41:00 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28801.1780321255479982119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 06:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=a8IyNjrZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1493; q=dns/txt;
  s=iport01; t=1780321255; x=1781530855;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M61YQrOAxog137ODSUKdJlN1T8ln9SzLnMmqTQjxCzE=;
  b=a8IyNjrZZHOiOb+iGMe5BkjCDmRAyNxzJIMRqrz19kRSrxXEJmch0zpH
   8BWF71bpHeV13/NHV5lCxxK+xPiSrsek9z1LvcuVNUBv2QNz2xr33X3R6
   YnzrvaV3dHt1zIc2qfbjI+mtuxKY7UpZyPnRRs3Yb2zBFK2fdHRaIB5xU
   Wob0LzUQH1XtsL8DuV3Jtj+5jiMg2pwwsl7zM1rASnjUSx20Q1Sr+s+Fl
   uh2EbmKRVOiN0t0zuFRaYuXsFvZrLWXpw+v9sgU0bL4qEOWRxCrXZIEH6
   rP2VRt3llFh1Epz/ekVY6tPpc2KL6w2dVMttpqKmwBgJx9leX8Zijw4Zi
   Q==;
X-CSE-ConnectionGUID: lPrjMDnNRDy75Wh0mwcL7A==
X-CSE-MsgGUID: 4x2h28X6QFK/vrkgjA8OjQ==
X-IPAS-Result: =?us-ascii?q?A0AyAwCMih1q/47/Ja1aglmCV3JfQkkDlkigHA8BAQEPP?=
 =?us-ascii?q?RQEAQGBcQGDFI00AiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8Nhl02ARgBLTBcRIMCAYJzAgERs16CLIEBgygBMQWBHtsoAQsUAQWBM?=
 =?us-ascii?q?4U/iB1zAYR7JxsbgXKEfYEFhAuFdwSCIoEMgXuCZYpUSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFgUqBVWqBAoUYIx8DOYEXgX+BK0gDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB4sfFw+BZk1aKAwsBIIAKByTCVeReqEOCiiDdIwhlToaM4QEp?=
 =?us-ascii?q?meZBoJYizGWT4RogX4mgVlwFYMiCUoZD444iH7FQyQ1AgwvAQEHAgcOAwuBa?=
 =?us-ascii?q?JF9AQE?=
IronPort-Data: A9a23:Yx9dHq49wN3fj2pA5am6zQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mZNWjzUM/jcajejeYwkYY+3pE9QvZDSz4VlGgA5qSk3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxMsvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eObUC+MNbB0d02
 e1HdQ8NNhWcjMbp6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEVUrsUIMpWcOOAj3X4dTJRsl+9rqss6G+Vxwt0uFToGIaFJYHSFJUJwi50o
 Eqa7z75WEEqauWx6n2b6HGjhMafuiHCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:clcev64o/0ULdKYpeQPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:KXpVHGw3IbyctvEJI26DBgUQItonV1Hb6k38MhDlNmYxTaKebQC5rfY=
X-Talos-MUID: 9a23:8EDjKgnKKKWCDdXmazepdno+JJ1oufSeVnkjstIYocqLNwUgHDWk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="487509844"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jun 2026 13:40:54 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 69683180000B4;
	Mon,  1 Jun 2026 13:40:54 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 0B912CAEF48; Mon,  1 Jun 2026 06:40:54 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] apt: CVE-2011-3374
Date: Mon,  1 Jun 2026 06:40:48 -0700
Message-ID: <20260601134048.45729-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 13:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237832

From: Anil Dongare <adongare@cisco.com>

Details: https://security-tracker.debian.org/tracker/CVE-2011-3374

The vulnerability is a design-level flaw in the legacy apt-key utility regarding
the global trust model of GPG keys.

This is marked as not-applicable-config because apt-key net-update is
disabled by default, and Debian vendor configuration does not define the
archive keyring URI required to use that path. Ignore this CVE in this
recipe due to this configuration.

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-devtools/apt/apt_2.6.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 12915660b0..8b48de3498 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -38,6 +38,9 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+# Not applicable: Debian vendor configuration does not enable apt-key net-update.
+CVE_STATUS[CVE-2011-3374] = "not-applicable-config: apt-key net-update is disabled by default and Debian vendor configuration has no archive keyring URI"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
-- 
2.44.4


