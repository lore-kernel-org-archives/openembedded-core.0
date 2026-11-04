Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2605.1793771621749576704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 21:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MJXktw5k;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3476; q=dns/txt;
  s=iport01; t=1793771621; x=1794981221;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BHqG1zq1otqe68HsO0Sq6hs0/Xbi0FqPNpG89vVKQYk=;
  b=MJXktw5klOKHjoWAr5P60p044epzCaPNe+daI3G2ARLnXB8OIMqO0DXx
   7tc1mcp8zWF29uih1qBuh/Xjad5MjguEi384WwLwqoHwakFNbeof6AZlq
   iVSBIaKLWmBLZbebGW82K1J2Ni24DnXh6Mvo31Y2GG738KXfLzBp8cqn1
   aeppugOqmAPOvxhaUVSeMliRApCh0DF+rQvApLivMTJyg4SdY9eRkIp6J
   vFtou1l4NiGN7bz+Sllo/BFtMzj/h3cTDEj8ebdrzSoCXyWu+Djj8ErNL
   bNtsvkBZlv2lqwK7QeKCuO5Ai/FuKLY82NQks4iu5tZ4VBre+uSo0+9vJ
   g==;
X-CSE-ConnectionGUID: Jb4xTRGET0+/FUkYvPKi0w==
X-CSE-MsgGUID: rLF4G1FVSs+1sSPNKookMg==
X-IPAS-Result: =?us-ascii?q?A0BbAwAOx+pq/43/Ja1aglmDTGBDSZNaAYJwniOBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY4eAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZAVNgEYAS0wXESDAgGCdAMRBro7giyBAYMpAUNBUNs/FYE4hUCII?=
 =?us-ascii?q?3aEfScbG4FyhH6CYQSIJASCInoSgXJ0jA+IREiBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZgsaBWEIAg0MdDkQMB4kLwUcJ?=
 =?us-ascii?q?kAbChQYDUgRLDcVGQQ+bgeSLYMRYS4pAoFNKwwHIRGTACdDj1qCIaERCiiDe?=
 =?us-ascii?q?IwklToaM6lLgSaZCI4KlgRNhGmBaDyBWXAVgyIJShkPlzfJSCYyAgE6AgcCB?=
 =?us-ascii?q?w4DC5NmAQE?=
IronPort-Data: A9a23:oNhbmKh7mqKNfw0nUw+SBDFuX161MREKZh0ujC45NGQN5FlHY01je
 htvXTqEPfnYNmLzKN4iYYi+8k8BvpPVmIJnSVNpqH81QyJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvrY8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU68LpnPVth2
 MBAa3cjUxOymdqVweqkH7wEasQLdKEHPasFsX1miDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg5/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4bbG5sFzxbFz
 o7A137dLE01bfKh8iHGq2mXvsnsmiT4fY1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmIHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:unl8Jayph6vcS7ptXQReKrPwGr1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBHWx6p6yb
 pqdbR4BZnbCFh3itu/3SyDeuxQpOVuNMuT9IHjJ7AHd3AMV51d
X-Talos-CUID: 9a23:a9LRVGzbv0r/JmMuaD47BgU2EJw1Tkfy4UuIYAiWNGVYVoW2SAePrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AEiEe1A2t6SF73VPJ3VS7DCxYgjUj+YCAVG9Uv6s?=
 =?us-ascii?q?9oIrdLhdIHRSaizeSTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="529668985"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 05:53:40 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id B1FA1180005C7;
	Wed,  4 Nov 2026 05:53:40 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 598EBCC1611; Tue,  3 Nov 2026 21:53:40 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 0/3] acl: Security fixes
Date: Tue,  3 Nov 2026 21:53:32 -0800
Message-Id: <20261104055335.2080900-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249327
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream fixes for CVE-2026-54369 and CVE-2026-54370 to
ACL 2.3.2.

CVE-2026-54369 adds descriptor-relative ACL APIs so callers can control
symlink traversal. CVE-2026-54370 uses those APIs to harden getfacl,
setfacl, setfacl --restore and chacl against path replacement races and
unsafe symlink traversal.

Retain ACL 2.3.2 on the stable Wrynose branch and backport the security
fixes with the required _at APIs and helper dependencies. This follows
OE-Core's focus on security and bug fixes for stable branches [1],
avoiding a general recipe upgrade to ACL 2.4.0. Existing pathname API
behavior is preserved.

The new public acl_*_at declarations conflict with private helpers
using the same names in GNU tar 1.35. Patch 1 backports the upstream
tar rename before patches 2 and 3 introduce and consume
the new ACL APIs.

[1] https://docs.yoctoproject.org/6.0/ref-manual/release-process.html#stable-release-process

Darsh Kelaiya (3):
  tar: avoid name conflicts with new libacl APIs
  acl: fix CVE-2026-54369
  acl: fix CVE-2026-54370

 .../tar/tar/Avoid-acl_-prefix-for-functions.patch     | 103 ++
 meta/recipes-extended/tar/tar_1.35.bb                 |   1 +
 .../attr/acl/CVE-2026-54369-dependent_p1.patch        |  69 ++
 .../attr/acl/CVE-2026-54369-dependent_p2.patch        | 200 ++++
 .../attr/acl/CVE-2026-54369-dependent_p3.patch        | 712 +++++++++++++
 meta/recipes-support/attr/acl/CVE-2026-54369_p1.patch | 719 +++++++++++++
 meta/recipes-support/attr/acl/CVE-2026-54369_p2.patch | 957 ++++++++++++++++++
 meta/recipes-support/attr/acl/CVE-2026-54369_p3.patch | 109 ++
 .../attr/acl/CVE-2026-54370-dependent_p1.patch        | 168 +++
 .../attr/acl/CVE-2026-54370-dependent_p2.patch        | 761 ++++++++++++++
 .../attr/acl/CVE-2026-54370-dependent_p3.patch        | 439 ++++++++
 .../attr/acl/CVE-2026-54370-dependent_p4.patch        | 140 +++
 meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch | 299 ++++++
 meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch | 403 ++++++++
 meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch | 603 +++++++++++
 meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch | 213 ++++
 meta/recipes-support/attr/acl_2.3.2.bb                |  14 +
 17 files changed, 5910 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/Avoid-acl_-prefix-for-functions.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p1.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p2.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p3.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p1.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p2.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p3.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p1.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p2.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p3.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p4.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch

-- 
2.35.6
