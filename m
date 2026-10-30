Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5130.1793336580512642684
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 22:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TdmLMUNj;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4231; q=dns/txt;
  s=iport01; t=1793336580; x=1794546180;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6NYeGrhAyS16h1xCU6QqXAhRdUbSCuoQX1Us+J7egBo=;
  b=TdmLMUNjryj5ZOaOP3jOdPl82ciONdmWlhgYKh3ihqT0Ct4n/UsJ+PLv
   hzWVXKV3emr08Saf6+tJYqe5exFf8nzQogWOR2YeYNjGYEusWfB8bYfHV
   79TJ4owDYTPHvctM6CLRzidyozZqMBxyIb5Fg2ZabFJcNGXP+RuVUn1K5
   BLbZq/grycB6+6CK4z70V1X31JU/4Vq1u8R5oie7Cep/u42QTEPtejETr
   xWv87gVgWZsCaOw4A0ZFpHRxZvq6ApMumFYy9/D8LTFbzi+kZDT+BsSgV
   ylahykpS5DvhRDJ7gT6ok8GUaWrT1TJRcL42SE5IR8R2JX2JzhccQSsEA
   w==;
X-CSE-ConnectionGUID: n4noqgDjQ9ybMBmRnt4afw==
X-CSE-MsgGUID: gglQr92uR8acWdCuTn4ckA==
X-IPAS-Result: =?us-ascii?q?A0BhAwDXJORq/5T/Ja1aglmDTGBDSZNaAYJwniCBfg8BA?=
 =?us-ascii?q?QEPLg8UBAEBhQWOHgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QFQEEJgsBGAEbEjBYBDsJGoJoAYJ0AxG0JRs3gXkzgQGDKQE5A?=
 =?us-ascii?q?YEa2z8VgTiFQIgjdQGEfScbG4FygRWDaYJhBYFOhlQEgg0VehKCXYIyiXmHc?=
 =?us-ascii?q?EiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BGYEHXYErK?=
 =?us-ascii?q?WABIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGi4LgRo1PAkmQRUMZ?=
 =?us-ascii?q?AsaBWIIAg0MdjkQMSAmMgQDHiMYDUgRLDcVGQQ+bgeRcoJuIFoKKgErImMTU?=
 =?us-ascii?q?xIvDwIGAZMnDDCPWoIhoQ8KKIN3jCONPod8GjOqcJkIjgqVNIEchGmBaDyBW?=
 =?us-ascii?q?XAVgyIJShkPiCKPFclHJzICOwIHAgcOAwuRai2BTwEB?=
IronPort-Data: A9a23:Bkdm0qKD7sMS7CYMFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENShmRUm
 GocCjqDOPbfMTagL9t/PIy3oEgHu56BzNUwSgcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2Qlaj98B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1oUEcxJII0+N8mEGtr3
 /kiLixRZx6c0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MESojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeS3aYuOKo3WLSlTtkmXo
 lvcrj7kOEETP+OT4ie59C6nhcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:N7KOQa7vL0NQIV3MkwPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: 9a23:1eQbeGw+23cpmcHu4y18BgUSRsYia3Lxzk6BMkWdI2NTTqHJQFGPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AWriLUA5zatxRt3wrQoBIw6Ypxoxn7KCXEhFXjK9?=
 =?us-ascii?q?WssK7OQdtBzHBhzeeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,185,1787011200"; 
   d="scan'208";a="542193894"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Oct 2026 05:02:46 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id EB9E118000174;
	Fri, 30 Oct 2026 05:02:45 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 943F3CC1611; Thu, 29 Oct 2026 22:02:45 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 0/1] rsync: upgrade 3.2.7 -> 3.5.1
Date: Thu, 29 Oct 2026 22:02:42 -0700
Message-Id: <20261030050243.1395053-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 05:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248985
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Upgrade rsync on Scarthgap directly from 3.2.7 to 3.5.1 in one commit.
This consolidates six OE-Core master upgrades; their commit references
and original contributor credits are retained in the patch.

The TSC approved an exception to the stable branch policy for rsync on
Scarthgap and Wrynose [1]. The maintainers concluded that upgrading is
preferable to carrying the large security backport series or leaving
the CVEs unpatched. They recommended 3.5.1 to align with master and
Blacksail and include the regression fixes following 3.5.0. This patch
implements that approved upgrade using published release tarballs.

Versions 3.4.1 and 3.4.2 include the fixes carried by Scarthgap's
existing CVE patches. Remove all fourteen redundant source patches,
including CVE-2025-10158.patch and CVE-2026-41035.patch.
Version 3.4.4 includes the security fixes from 3.4.3 and subsequent
regression fixes. Version 3.5.0 fixes 33 further security issues with
differing affected-version ranges. Version 3.5.1 addresses reported
3.5.0 regressions, including path handling and access to
standard-stream file descriptors [2]. The three retained source patches
are refreshed for the new releases.

The backport retains Scarthgap's WORKDIR-based installation and existing
build configuration. Internationalized domain name support is exposed
through the optional idn PACKAGECONFIG and is disabled by default.

Compatibility considerations: 3.5.1 changes the wire protocol number
to 33 and adds logical-block statistics when both peers use protocol
33. Rsync documents negotiation of the newest protocol shared by both
peers [3]. Mixed-version transfer behavior still needs runtime
validation.

[1] https://lists.openembedded.org/g/openembedded-core/message/248203
[2] https://download.samba.org/pub/rsync/NEWS
[3] https://download.samba.org/pub/rsync/rsync.1

Darsh Kelaiya (1):
  rsync: upgrade 3.2.7 -> 3.5.1

 ...-prototypes-to-function-declarations.patch | 126 ++----------
 .../rsync/files/CVE-2024-12084-0001.patch     | 156 --------------
 .../rsync/files/CVE-2024-12084-0002.patch     |  43 ----
 .../rsync/files/CVE-2024-12085.patch          |  32 ---
 .../rsync/files/CVE-2024-12086-0001.patch     |  42 ----
 .../rsync/files/CVE-2024-12086-0002.patch     | 108 ----------
 .../rsync/files/CVE-2024-12086-0003.patch     | 108 ----------
 .../rsync/files/CVE-2024-12086-0004.patch     |  41 ----
 .../rsync/files/CVE-2024-12087-0001.patch     |  49 -----
 .../rsync/files/CVE-2024-12087-0002.patch     |  31 ---
 .../rsync/files/CVE-2024-12087-0003.patch     |  40 ----
 .../rsync/files/CVE-2024-12088.patch          | 141 -------------
 .../rsync/files/CVE-2024-12747.patch          | 192 ------------------
 .../rsync/files/CVE-2025-10158.patch          |  36 ----
 .../rsync/files/CVE-2026-41035.patch          |  39 ----
 .../rsync/files/determism.patch               |  20 +-
 .../rsync/files/makefile-no-rebuild.patch     |  11 +-
 .../rsync/{rsync_3.2.7.bb => rsync_3.5.1.bb}  |  17 +-
 18 files changed, 37 insertions(+), 1195 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
 rename meta/recipes-devtools/rsync/{rsync_3.2.7.bb => rsync_3.5.1.bb} (79%)

-- 
2.35.6
