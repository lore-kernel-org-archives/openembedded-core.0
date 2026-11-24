Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12435.1795501289132702413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Qx2MtjOP;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=563; q=dns/txt;
  s=iport01; t=1795501289; x=1796710889;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=18GRcPbW1BD8o7Ufm7P/gp1DC/zp38xzJxG7u0ooCsk=;
  b=Qx2MtjOPwbjzuDALfJeojSQehFtYE30RDoFBXtM0DcxlafGky5YuCzFj
   aznK8XIHeAFEECOnpZ7vbeIcTDvlze/hYEUVXN9SVdj0tBhHEfR5x7o6b
   Wc+VIsAQxmBOeioESb+XChOZJnPtJDIuVT0HqcfUu845A6ypbfbcIEUEh
   3bhBgXoZSlDpUSh2Q216FMwLgoCyNmFVHDif1wCclt4rNHKc9gywj0aih
   FsX7HxEbFw0ROVclTeuiX61QYH181Jv2Jb1kgAw7V96yy2KIYnbJqS4Lv
   BZYvuNUTnMsFokSmrGffLgLA7rQAum8c7alrvd2b8mxm99j01Ym1kIGZE
   A==;
X-CSE-ConnectionGUID: Z90NxKOSRb+1WvY/wQrUzw==
X-CSE-MsgGUID: qV4Fm7xtSMqae1kdglnEIg==
X-IPAS-Result: =?us-ascii?q?A0BXAwCcKgVr/85K/pBaglmDTGBDSQSUJqBNgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NkEsBgVJEgwIBgnQDEbpzgiyBAYR+2UuBdBWBOI1mdoR9JxuBSUSEf4UQh?=
 =?us-ascii?q?XkEgxwSmQVIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEeg?=
 =?us-ascii?q?RKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5QUgxqBDyuCLKV1oRGEK4wklToaM4NxpwGZCI4KllGEaoFoP?=
 =?us-ascii?q?IFZMxoIGxWDIgkKQBkPlzfJSCYyAgE6AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:20I7V6ntAEV6IgYfUFLcAbno5gzLJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLUGvQbv6NMWGhKI8jaoXgoBgO6sPcm4dkSgtorS9jE1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfnb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fb9JosBnIkZ1z
 /ZbcQ8TX1ecvviL0q3uH4GAhux7RCXqFIoSoDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUURUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCzaoWLI4bXHa25mG6Bm
 D7o+jvpHio/LdWSkDmJ/Xaqq87AyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1vfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:8tV7Sahr1eclUfWleNzyWDQQJ3BQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: 9a23:A5DFuWACdGzGLSv6Exs2rGgEOeceSHeelUjOEginMHxUWqLAHA==
X-Talos-MUID: 9a23:tJZ0vQT3WlK2fWAzRXT1um1MMZh4/5+LEUkAyJYKtM2CGA1/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62761250"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:21:25 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 48B6518000231
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:21:25 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id EE502CC1611; Mon, 23 Nov 2026 22:21:23 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 0/1] glibc: Security fix
Date: Mon, 23 Nov 2026 22:21:22 -0800
Message-Id: <20261124062123.4168678-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250948
Content-Type: text/plain; charset="utf-8"

Backport the upstream glibc fix for CVE-2026-121758 to the glibc
2.43 recipe on wrynose.

The fix is based on the OE-core submission- 
"glibc: stable 2.43 branch updates to 124e9adcd4"
https://lore.kernel.org/openembedded-core/20261119035345.3136238-1-hthakar@cisco.com/

Yogita Urade (1):
  glibc: Fix CVE-2026-121758

 .../glibc/glibc/CVE-2026-121758.patch         | 281 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.43.bb         |   1 +
 2 files changed, 282 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-121758.patch

-- 
2.53.0

