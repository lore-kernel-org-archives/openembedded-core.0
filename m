Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4376.1793777792133403964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=G19GTGo3;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3519; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qq5Ke+A8c4V4NFTL8OW3F7VcwFtDToZxkn6/kuurcDE=;
  b=G19GTGo3S68i3RcLPM/xi/3Li2BtKKCIyotd/bd/Pk9xzEDkV/IT+f67
   /LbnTDhz4VGB8vrABPO2YLPZdzrP3TSkcdZ6XgDCWEqxD4A3wfKpBsmT+
   5gr3v0at9nqdEwuXk/9peGSFcRlCBZiRepW0yHhk5CXfZJDxTJm+ciJxX
   RgP7Tmh/DOJfg9r5WnM3RiUjSWgK8WFyAYPTfylQ94WmtxJXygf0/eQg7
   yKOFBVkeAGbXJCkXH7W5rFVEPGVupCcvCsuJZETt3JDNBlCTitCEI4wqy
   eQhgfOzlUdd5Y4F8QtHz89OMLBFEHOYCPcYy66poUFr0atgzEqRkQT2TI
   Q==;
X-CSE-ConnectionGUID: nTXI9WcHQh6a2X6AbWK4ag==
X-CSE-MsgGUID: GZtZKGV/Rx2Qwd74Po3a9g==
X-IPAS-Result: =?us-ascii?q?A0BfAwDZ3+pq/4r/Ja1aglmDTGBDSZNaAYJwniMUgWoPA?=
 =?us-ascii?q?QEBDy4PFAQBAYUFjh4CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBUBBDEBGAEtMFgERIMCAYJ0AxG6UoIsgQGDKQE5AYEa2z8Vg?=
 =?us-ascii?q?TiFQIgjdoR9JxsbgXKBFYNpgmEFgUSGXwSCInoSgl2MGIhESIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCU?=
 =?us-ascii?q?YIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxmCxoFYQgCDQx0O?=
 =?us-ascii?q?RAwHiQvBRwmQBsKFBgNSBEsNxUZBD5uB5Itgh9ygQ8HIwGBGlInGRGTHQeSQ?=
 =?us-ascii?q?YE1n1wKKIN4jCSNPod8GjOqcZkIjgqVN01NhGmBaDyBWXAVgyIJShkPlzfJS?=
 =?us-ascii?q?CYyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:qL3+m6tOZqiDtZMflOCx8IZnJufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTzUbP+IamWme4oka42wpEwH6MTRnd5nSFFrqXtgRXsQgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb80s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/NpHIDBx/
 twhKG4ENCDdruiJ4+6yRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxHYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHWHpQJwRjC9
 woq+UzWMA0oF/OhjgCVqEuzirCTpSSgUdMdQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:3DmvT6BK9YH8IcflHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3ApHA+xGhQ4Xj6ekosZqCPVKQ+9zJudEHt7SbvKG+?=
 =?us-ascii?q?BCThgEo3LYFWv2/9tnJ87?=
X-Talos-MUID: 9a23:jqRl8gb8tvW1NuBTmA3wthJNCoBS8/6XF0xSza0B4MDVOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543947629"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 1A8DB180001DC;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B735DCC1611; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 00/12] curl: Security fixes
Date: Tue,  3 Nov 2026 23:36:15 -0800
Message-Id: <20261104073627.302002-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249332
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport eleven security fixes to curl 8.19.0 on Wrynose and add
a configuration-dependent status for CVE-2026-19931.

This series applies on top of my submitted five-patch curl v2
series, "curl: backport security fixes" [1]. Apply all five patches
from that series first.

The source fixes address proxy authentication, AWS SigV4 reset,
HSTS imports, control-response processing, cookie-jar loading,
GnuTLS sends, IMAP APPEND, TFTP direction checks, hashed known_hosts
matching and HTTP/2 push-handle share ownership.

The CVE-2026-92386 backport includes the upstream correction for
serialized cookie-jar record limits. The CVE-2026-87865 backport
includes the follow-up that avoids repeated known_hosts scans.

The CVE-2026-18924 fix replaces the earlier Wrynose submission [2]
that failed compilation in the pull review [3]. It uses the available
curl_easy_setopt() share setter with a CURLSH * cast instead of
Curl_share_easy_link().

For CVE-2026-19931, record not-applicable-config if either krb5 or
negotiate-auth is absent from PACKAGECONFIG. Builds enabling both
options retain unpatched status pending a source backport.

[1] https://lists.openembedded.org/g/openembedded-core/message/248493
[2] https://lists.openembedded.org/g/openembedded-core/message/245495
[3] https://lists.openembedded.org/g/openembedded-core/message/246648

Darsh Kelaiya (12):
  curl: fix CVE-2026-86414
  curl: fix CVE-2026-86409
  curl: fix CVE-2026-87862
  curl: fix CVE-2026-92387
  curl: fix CVE-2026-86412
  curl: fix CVE-2026-92386
  curl: fix CVE-2026-107928
  curl: fix CVE-2026-87864
  curl: fix CVE-2026-92389
  curl: fix CVE-2026-87865
  curl: set CVE_STATUS for CVE-2026-19931
  curl: fix CVE-2026-18924

 .../curl/curl/CVE-2026-107928.patch           |  40 ++++
 .../curl/curl/CVE-2026-18924.patch            |  57 +++++
 .../curl/curl/CVE-2026-86409.patch            |  88 +++++++
 .../curl/curl/CVE-2026-86412.patch            |  34 +++
 .../curl/curl/CVE-2026-86414.patch            | 155 ++++++++++++
 .../curl/curl/CVE-2026-87862.patch            | 147 ++++++++++++
 .../curl/curl/CVE-2026-87864.patch            |  55 +++++
 .../curl/curl/CVE-2026-87865_p1.patch         | 225 ++++++++++++++++++
 .../curl/curl/CVE-2026-87865_p2.patch         |  89 +++++++
 .../curl/curl/CVE-2026-92386_p1.patch         |  33 +++
 .../curl/curl/CVE-2026-92386_p2.patch         | 146 ++++++++++++
 .../curl/curl/CVE-2026-92387.patch            |  43 ++++
 .../curl/curl/CVE-2026-92389.patch            |  56 +++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  16 ++
 14 files changed, 1184 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-107928.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86412.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86414.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87862.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92387.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

-- 
2.35.6
