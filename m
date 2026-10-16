Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38893CCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:32 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15610.1792131564069746027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=g45qABAS;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5857; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r5MiT2W8gR+HssfE7wQOC+qe7VfKngfzEY+Mtau2jQQ=;
  b=g45qABAS1TG6iUpd9u7DCbUrojkfnA2YrSI9F843ah0/QYc05PIv90WJ
   DRxuAMyZqspCalPUbcyv/8CsQfaxqShiJ5TdFtEdyarQMeiIVepalubQ1
   xtCOuuZ/aef/FkED0+ELifxNXnwrVfIPcKIC31mAgZ33bzwtHFQMXEFyH
   Su/SevoKNji4RJ45g7MPuQQ6oYamc0U3X0y61Rt7fzqHfbhawGGGvNTB7
   IwooiiMICwMerISZcwd97uBcTmHptil6urrCtDTzItP6ankOUhpKU/L3f
   WyPm0WcKCgUWGM2KmedAZ895zNHU4I9wgbTEKPmahtdX4Wva/XgHICJjF
   Q==;
X-CSE-ConnectionGUID: dUZ/gZSQQUG1YQoVR/fWpQ==
X-CSE-MsgGUID: r71itnD1Q4yCxokq7KONog==
X-IPAS-Result: =?us-ascii?q?A0BXAwDpwNFq/5T/Ja1aglmDTGBDSZQpoECBfg8BAQEPN?=
 =?us-ascii?q?xoEAQGTHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?JBLARgBG4Eeg0YBgnQDvQeCLIEBgykBgVTZSoF0FYE4jWN2hHwnG4FJRIR+h?=
 =?us-ascii?q?AqGfgSCDYEPEoZokDlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiC?=
 =?us-ascii?q?BIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJlg?=
 =?us-ascii?q?Q8HglAPpWahD4QojCKVOhozqm+ZCKQMTYRpgWg8gVkzGggbFYMiCUoZD+B+J?=
 =?us-ascii?q?zICOwEBBwIHDgMLgWiQAAImB4FPAQE?=
IronPort-Data: A9a23:+ZNVE6KZp78dVcIRFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENSgjMOz
 2YWXG3QO/2CZGDyc9wga4mwpBsGvZaEz4dgHQod+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1iMXNxMr8jw99KLjh/z
 PsmEncDUQi60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MESojx5nYj/7DLovgf2hinTXeDxDo1XTrq0yi4TW5FEqjue3aoWPJLRmQ+1PwR+Zu
 mTqpl2lEzoKM9+Glhmi1HWj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOb9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:UuNySqBzIWs1uKnlHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: 9a23:kzkw7G0LxyBh9VaTl5Pum7xfFv0XNXLv907pHmDhOF9udofSR2CIwfYx
X-Talos-MUID: 9a23:YDhpNQYQQEwwEuBTrWC1hS1kGJ5Rv7WFGEcOiMolnO+DOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536722726"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 2040318000148
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id C1D3BCC12A6; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 00/27] python3-git: Security fixes
Date: Thu, 15 Oct 2026 23:18:55 -0700
Message-Id: <20261016061922.843414-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247968

Backport GitPython security fixes to the Scarthgap python3-git 3.1.42
recipe. The 27-patch series covers 28 CVE IDs and hardens Git option
validation, config parsing and serialization, submodule paths, repository
discovery, and actor parsing.

The CVE-2026-76222 and CVE-2026-87819 fixes retain their ordered upstream
follow-up changes. Patch 0020 carries the shared upstream hardening for
CVE-2026-78678 and CVE-2026-78679.

Yogita Urade (27):
  python3-git: fix CVE-2026-67326
  python3-git: Fix CVE-2026-67323
  python3-git: fix CVE-2026-67325
  python3-git: fix CVE-2026-67324
  python3-git: fix CVE-2026-67322
  python3-git: fix CVE-2026-69097
  python3-git: fix CVE-2026-73625
  python3-git: fix CVE-2026-73623
  python3-git: fix CVE-2026-73624
  python3-git: fix CVE-2026-73622
  python3-git: fix CVE-2026-73621
  python3-git: fix CVE-2026-73620
  python3-git: fix CVE-2026-73619
  python3-git: fix CVE-2026-76221
  python3-git: fix CVE-2026-76220
  python3-git: fix CVE-2026-76219
  python3-git: fix CVE-2026-76218
  python3-git: fix CVE-2026-76217
  python3-git: fix CVE-2026-76222
  python3-git: fix CVE-2026-78678 CVE-2026-78679
  python3-git: fix CVE-2026-78677
  python3-git: fix CVE-2026-78676
  python3-git: fix CVE-2026-78675
  python3-git: fix CVE-2026-87817
  python3-git: fix CVE-2026-87818
  python3-git: fix CVE-2026-87819
  python3-git: fix CVE-2026-100689

 .../python/python3-git/CVE-2026-100689.patch  |  60 +++
 .../python/python3-git/CVE-2026-67322.patch   | 174 +++++++
 .../python/python3-git/CVE-2026-67323.patch   | 346 ++++++++++++++
 .../python/python3-git/CVE-2026-67324.patch   | 102 +++++
 .../python3-git/CVE-2026-67325_p1.patch       |  50 ++
 .../python3-git/CVE-2026-67325_p2.patch       |  53 +++
 .../python/python3-git/CVE-2026-67326.patch   | 108 +++++
 .../python/python3-git/CVE-2026-69097.patch   |  61 +++
 .../python/python3-git/CVE-2026-73619.patch   |  59 +++
 .../python/python3-git/CVE-2026-73620.patch   | 130 ++++++
 .../python/python3-git/CVE-2026-73621.patch   |  76 ++++
 .../python/python3-git/CVE-2026-73622.patch   |  61 +++
 .../python/python3-git/CVE-2026-73623.patch   |  54 +++
 .../python/python3-git/CVE-2026-73624.patch   | 135 ++++++
 .../python/python3-git/CVE-2026-73625.patch   |  68 +++
 .../python/python3-git/CVE-2026-76217.patch   | 173 +++++++
 .../python/python3-git/CVE-2026-76218.patch   |  91 ++++
 .../python/python3-git/CVE-2026-76219.patch   | 166 +++++++
 .../python/python3-git/CVE-2026-76220.patch   |  66 +++
 .../python/python3-git/CVE-2026-76221.patch   |  61 +++
 .../CVE-2026-76222-regression.patch           |  35 ++
 .../python3-git/CVE-2026-76222_p1.patch       | 123 +++++
 .../python3-git/CVE-2026-76222_p2.patch       |  49 ++
 .../python/python3-git/CVE-2026-78675.patch   |  49 ++
 .../python/python3-git/CVE-2026-78676.patch   |  55 +++
 .../python/python3-git/CVE-2026-78677.patch   |  87 ++++
 .../CVE-2026-78678_CVE-2026-78679.patch       | 208 +++++++++
 .../python/python3-git/CVE-2026-87817.patch   | 430 ++++++++++++++++++
 .../python/python3-git/CVE-2026-87818.patch   |  56 +++
 .../python3-git/CVE-2026-87819_p1.patch       |  78 ++++
 .../python3-git/CVE-2026-87819_p2.patch       |  58 +++
 .../python/python3-git_3.1.42.bb              |  33 +-
 32 files changed, 3354 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73619.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch

-- 
2.44.4


