Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6576.1793789809362704647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 02:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RvEMNWhH;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1453; q=dns/txt;
  s=iport01; t=1793789809; x=1794999409;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jgkE0o6DLpbEykeD7pp1AnBOtQ+m2PkKtZLWMyMuorg=;
  b=RvEMNWhHxc28M6g6kKOOCtkPH1arSA/Iwnslgk1Knl+E8GKngBw01XdJ
   JdOWpNtIwj2ebwRW2BpZZrUjPwNCs1vJT2YQzqgMHz0w407Obm56796eR
   9j2CXMFBEZ5sj8PaeDlMvlrRBlqwUpU5nm/COUM6gdkI0Umj+wkaBVwc2
   De1IGyPc7JPxrxt7gMYazG1tAE9/TQ1AmwfUVaJN1l3zBkh/67c5C8RXn
   b8Tu/uAwatGXjzC3MWXukXzrKrE9NAH7h9sDYyZT6SMV4VlKPZUR4hj+m
   EDA8oYgoQ7zV2q5AaQNlZYwDSVcXVQ5Q5ELGiiOUYPbfivdFTPb7zl2Sh
   Q==;
X-CSE-ConnectionGUID: jpzE/M9ZQTa8mPMXGXwkmQ==
X-CSE-MsgGUID: gGtfC7RMQ5eB7K/CefrmSA==
X-IPAS-Result: =?us-ascii?q?A0AnAAA+Dutq/43/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBg0tgQ0mMcoZoAYJwkU+MVYF+DwEBAQ8uDxQEAQGFBY4eAiY0CQ4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZAVAQQxARgBLTBYB?=
 =?us-ascii?q?ESDAgGCdAMRuweCLIEBgykBOQGBGts/FYE4AYU/iCN2hH0nGxuBcoR+gmEFg?=
 =?us-ascii?q?UVlhXkEgiJ6EoJdjBiIREiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZgsaBWEIAg0MdDkQMB4kLwUcJkAbChQYDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeSLYMRgQQLKgGBbCcZEZNgkgWBNZ9cCiiDeIwkjT6HfBozhASmbZkIg?=
 =?us-ascii?q?lmLMZYBA02EaYFoPIFZcBWDIglKGQ+XN8lIJjICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:uScuO6m8zkkcKOcGwKNpTCTo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLXmzXPfqIMDahLd5waIqxoB9X657cyoBmTAtv/3w1QVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FY8A6MswJDB8z
 MAReDU1SyCst/21xYvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIJoDXGJ0LxxfwS
 mTu8EvlDDpFDvmmlDevrVHrreLBhybAcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:gjrFFatJnKXZtPg8lAnAQit97skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AxEJj0GvHFJ6Hl3Zyzq1HDLlh6Isnam/wi1KBEXa?=
 =?us-ascii?q?EADZscJilZm+P+6Zdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ASAVf9Q54u0+QZyN++AWS/+EVxoxnzLigIx83tKx?=
 =?us-ascii?q?btuPbFmtbNjmHiQ+eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208";a="544550619"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 10:56:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 60380180004AE;
	Wed,  4 Nov 2026 10:56:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 0A1CDCC1611; Wed,  4 Nov 2026 02:56:48 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 0/3] curl: Security fixes
Date: Wed,  4 Nov 2026 02:56:42 -0800
Message-Id: <20261104105645.2523473-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 10:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249359
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Update curl 8.7.1 on Scarthgap with the CVE-2026-18924 HTTP/2
server push fix. Record conditional status for CVE-2026-19931 and
Linux platform status for CVE-2026-80231.

This series is based on Jaipaul Cheernam's CVE-2026-80230 curl
patch in the Scarthgap pull request [3]. Apply that patch first.

The CVE-2026-18924 patch replaces the earlier Scarthgap submission [1]
rejected for compilation failure, as documented in the review of
that failure [2]. The backport used Curl_share_easy_link(), which is
absent from curl 8.7.1. The replacement uses curl_easy_setopt()
with CURLOPT_SHARE to retain the share setter's reference counting
and cleanup handling.

For CVE-2026-19931, record not-applicable-config unless both krb5
and negotiate-auth are enabled in PACKAGECONFIG; otherwise retain
unpatched status.

[1] https://lists.openembedded.org/g/openembedded-core/message/245542
[2] https://lists.openembedded.org/g/openembedded-core/message/246572
[3] https://lists.openembedded.org/g/openembedded-core/message/249301

Darsh Kelaiya (3):
  curl: set CVE_STATUS for CVE-2026-19931
  curl: fix CVE-2026-18924
  curl: set CVE_STATUS for CVE-2026-80231

 .../curl/curl/CVE-2026-18924.patch            | 56 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  3 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

-- 
2.35.6
