Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA86C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:08:10 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12251.1783688882630807015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HVsijG8y;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3332; q=dns/txt;
  s=iport01; t=1783688882; x=1784898482;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PV6bMG0gyIdCmMHeYAqWIU1KxRh5tjQZXhRt7lQspc0=;
  b=HVsijG8yjPaEUNI8Mrqvf9PWZIQE+4Qf9eLGt1i2SqaEaKSjmjfTnHS2
   07VxbSaMs/CshVGWxZTm0CVWlS4/5eerk4PFaVq7TwyIoEuq5Zj8gIY5i
   dFZRrglHeLH5BwP7ln+eOUflQG6i/63ZW1+MjNTwYE+rDiUGRgXpQkdw/
   vlS6Sg7OgjMEd2KecVhq81vlC2CkEYkGiUuKbK0sPn1D42RDIaYOdLWmy
   HCAg+6Kobn/URhn6icZfHK6WIVXAwTCtkeFI5g1ifrkFBlRJRpTCxAvWU
   AiV6tlib1vucBT4l16Lf0GefLHXvLof/O79O9+NhkjQw954Pq2T9Hew9W
   g==;
X-CSE-ConnectionGUID: qPBsX83qS06iui/Tozc4eA==
X-CSE-MsgGUID: OLJRzE7NTO+1QHret1ZrrQ==
X-IPAS-Result: =?us-ascii?q?A0AVBADL7VBq/4r/Ja1aglmDS19CSZQpoD+Bfg8BAQEPM?=
 =?us-ascii?q?SAEAQGSVAImNQgOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4Zch?=
 =?us-ascii?q?xMBGAFdXESDAgGCcwIBuiuCLIEBgygBgVTbOhWBOIU/iB90hHwnGxuBcoVpG?=
 =?us-ascii?q?gGDLoZUBIIiehKRakiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEdgVmBAoR5Ix8DOX+BMHVKeS1zEh4KgVKCFlQDCxgNSBEsFCMUGwQ+bgeNP?=
 =?us-ascii?q?hcPgj6BDzCCPxqTBpI+oQ8KKIN1jCGVOhozqmxFhAiUO6QKUIRpgWoBOYFZc?=
 =?us-ascii?q?BWDIglKGQ+OONJFJDUCOwEBBwIHDgMLgWiQAoF8AQE?=
IronPort-Data: A9a23:2WAAkqntOPhqTphmcaqM0qHo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXmCCbPvcMTTzcop2btng8hgAvZeEyt9qSQY/qC83F1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLs/Lb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZQg0P1HUTpXz
 qRGKS0MKSyElenqzZvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKIIoLaG5gFwh/wS
 mTu2EDbOAM3a/qj7nncy1K2i/OWrznhYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:8djyo6AOMbchC+XlHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssRMb+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AgXmwhWtxd835fLd/EvVTGh1M6Is8SlfG/CeLOnT?=
 =?us-ascii?q?gV2d0SfqpTk2bpK5Nxp8=3D?=
X-Talos-MUID: 9a23:UTeDyAi4rvTe/MbHWNV918MpE+NK2baDV2YxttZfgumeODApCS2HtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="506865841"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:08:01 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id A00431800029E
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:08:01 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 43824CC2EC3; Fri, 10 Jul 2026 06:08:01 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][wrynose][PATCH 00/10] Pull Request (Cover letter only)
Date: Fri, 10 Jul 2026 06:07:50 -0700
Message-ID: <20260710130750.2816610-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240640

From: Deepak Rathore <deeratho@cisco.com>

- wrynose contains Expat 2.7.5, that the listed CVEs affect
versions before 2.8.2, and that this series backports the
relevant upstream fixes rather than upgrading the stable-branch
recipe.
- For CVE-2026-56403, upstream pull request 1232 contains both the
storeAtts fix and the related xcsdup overflow hardening. This makes
the reason for carrying both source patches explicit, even though the
published advisory description names storeAtts specifically.

- Verified the full image build successfully after applying all the patches.

- Ran Ptest on the full image and verified that all tests passed successfully.

Deepak Rathore (10):
  expat: fix CVE-2026-56403
  expat: fix CVE-2026-56408
  expat: fix CVE-2026-56404
  expat: fix CVE-2026-56405
  expat: fix CVE-2026-56410
  expat: fix CVE-2026-56406
  expat: fix CVE-2026-56409
  expat: fix CVE-2026-56411
  expat: fix CVE-2026-56407
  expat: fix CVE-2026-56132

 .../expat/expat/CVE-2026-56132_p1.patch       | 89 +++++++++++++++++++
 .../expat/expat/CVE-2026-56132_p2.patch       | 62 +++++++++++++
 .../expat/expat/CVE-2026-56132_p3.patch       | 76 ++++++++++++++++
 .../expat/expat/CVE-2026-56132_p4.patch       | 63 +++++++++++++
 .../expat/expat/CVE-2026-56132_p5.patch       | 58 ++++++++++++
 .../expat/expat/CVE-2026-56403_p1.patch       | 83 +++++++++++++++++
 .../expat/expat/CVE-2026-56403_p2.patch       | 52 +++++++++++
 .../expat/expat/CVE-2026-56404.patch          | 46 ++++++++++
 .../expat/expat/CVE-2026-56405.patch          | 32 +++++++
 .../expat/CVE-2026-56406-dependent.patch      | 57 ++++++++++++
 .../expat/expat/CVE-2026-56406.patch          | 36 ++++++++
 .../expat/expat/CVE-2026-56407.patch          | 43 +++++++++
 .../expat/expat/CVE-2026-56408.patch          | 36 ++++++++
 .../expat/expat/CVE-2026-56409.patch          | 52 +++++++++++
 .../expat/expat/CVE-2026-56410_p1.patch       | 48 ++++++++++
 .../expat/expat/CVE-2026-56410_p2.patch       | 40 +++++++++
 .../expat/expat/CVE-2026-56411.patch          | 46 ++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        | 17 ++++
 18 files changed, 936 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch

-- 
2.35.6


