Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5459.1795179857909617117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Yo8pDUsO;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2254; q=dns/txt;
  s=iport01; t=1795179858; x=1796389458;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VTPGOhOqRbo3i66aEReUI7poZfNdnmbvuVMVW9fVSzw=;
  b=Yo8pDUsOWPihfLxrgqj5bdh+4s+3XDdGimaAiJwItHi5146nIdokBWT5
   V0b8hca8YfYHnxVENqLjw/7B7XZyiuV2vRmv9ucASVKQlluZViq4UUDwe
   UP1kOIQbfGyxKJp5DIYuozVPbP06ZDGLCusrnF6XvlY053zsS25rM39P3
   ++GT6iTQ/aLz4juWXpuYOa5nuPa6SnaBM7tcFCeXPk8mAmpg4Q6lrNb5W
   ENXVuz8dWMzGGVd782ETRpIgxufMS+e0wZb3ALF7dx0rLJesx3WHi+s9R
   0fw1GFJTAOxHDchbmlX8CNsDRO9TX1t1Am71EjWtBdzN7JOxFEf089ZIL
   Q==;
X-CSE-ConnectionGUID: hq6D9BCiSMKY/5ueMlX3nQ==
X-CSE-MsgGUID: +0Ze/jMnQQiyYrOSN/VE8A==
X-IPAS-Result: =?us-ascii?q?A0BZAwAxRABr/8xK/pBaglmDTGFCSZQqgiGeLBSBag8BA?=
 =?us-ascii?q?QEPMSAEAQGTKAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXJBLARgBXSY2RIMCAYJ0AgG5M4IsgQGDKQHdExWBOIVCiCR1AYR9Jxsbg?=
 =?us-ascii?q?XKECXaBBYMlZoV5BIINFYEMjmuJd0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnH?=
 =?us-ascii?q?x4bDgIfEAYNGA1IESw3FRkEPm4Hk2yDGWMsgUNsDycDpWShEQoog3mMJJU6G?=
 =?us-ascii?q?jOqcpkIo0GBGoRqgWg8gVlwFYMiCUoZD445J9IfIzUCOwEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:NnxPVKjxYL+0y/aT/pwBl3lMX161NBEKZh0ujC45NGQN5FlHY01je
 htvUW6FPv+DMTenLowga46y9R4P78SEm9RjTVQ+pXs9RCljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjb8UkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUY47hbUEtl9
 Mc9CwFKMw2OouaGm7SCH7wEasQLdKEHPasWt2slyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXZj/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKIK4DWHJkOwi50o
 EqFp1b0RRM/MuWmyCu06FWXoKjxsHPSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjNCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:HaYgnatI5fnGLh6GDIA3tv5Q7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:WqEXAG6DAXdpFFDEUtss9FdKNpEPWXzm6VThZBKlBENteOaTcArF
X-Talos-MUID: 9a23:ggxRwwRCcU+3btdFRXSv3ANvc8VN5Z2XCVE8i7I9nY66GHxZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,223,1787011200"; 
   d="scan'208";a="59441434"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 13:04:15 +0000
Received: from sjc-ads-8099.cisco.com (sjc-ads-8099.cisco.com [171.68.208.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 7894F18000239
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:15 +0000 (GMT)
Received: by sjc-ads-8099.cisco.com (Postfix, from userid 1887503)
	id 1CB30CC1611; Fri, 20 Nov 2026 05:04:14 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][scarthgap][PATCH 0/4] curl: fix CVE-2026-8927, CVE-2026-8932, CVE-2026-6429 and CVE-2026-7168
Date: Fri, 20 Nov 2026 05:04:10 -0800
Message-Id: <20261120130414.822854-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-8099.cisco.com [171.68.208.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.208.137, sjc-ads-8099.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250780
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This series was developed against the latest OE-Core contrib
stable/scarthgap-review branch.

This series backports fixes for CVE-2026-8927, CVE-2026-8932,
CVE-2026-6429 and CVE-2026-7168 to Scarthgap curl 8.7.1.

The fixes clear Digest state when an environment proxy changes, include
mTLS credentials in connection and session reuse checks, clear redirect
credentials and Digest state across origins, compare IPv6 zone IDs, and
reset proxy authentication when CURLOPT_PROXY changes.

Changes in v3:
- Omit the adapted test additions and minimize differences from upstream.
- Renumber the four curl patches as 1/4 through 4/4.
- Refresh recipe hunks against stable/scarthgap-review.
- Add cross-origin Digest cleanup from upstream 6daf4bc7.
- Compare IPv6 zone IDs in the origin helper using upstream edfc80c7.
- Fold only the required helper prerequisite into
  CVE-2026-6429_p1.patch.
- Document target API/header adaptations and omitted test files.

Upstream tests are omitted from the submitted backports. The embedded
patches document omissions and adaptations in Backport Changes and
preserve the original upstream commit messages and public provenance.

Signed-off-by: Devansh Patel <devanshp@cisco.com>

Devansh Patel (4):
  curl: Fix CVE-2026-8927
  curl: Fix CVE-2026-8932
  curl: Fix CVE-2026-6429
  curl: Fix CVE-2026-7168

 .../curl/curl/CVE-2026-6429_p1.patch          | 205 ++++++++++++++++++
 .../curl/curl/CVE-2026-6429_p2.patch          |  52 +++++
 .../curl/curl/CVE-2026-6429_p3.patch          |  29 +++
 .../curl/curl/CVE-2026-7168.patch             |  83 +++++++
 .../curl/curl/CVE-2026-8927.patch             |  87 ++++++++
 .../curl/curl/CVE-2026-8932.patch             | 170 +++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   6 +
 7 files changed, 632 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429_p3.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932.patch

