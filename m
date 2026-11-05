Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27192.1793852531033638715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SbKVXX56;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2613; q=dns/txt;
  s=iport01; t=1793852531; x=1795062131;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jbLZlDmTz2mG8L7NqtqbyL7pgiRcYoekLHI2tnPl7DA=;
  b=SbKVXX56JnYosL8e61WhV+QuFJHCR/kIsVoKjjk59adCaHsPTN6W3tku
   Wl7tNE/P216ICmRRtbz7iBKhNykLmBzHJ2Q/V7/8BWfMuzC4tML/MROmQ
   aC6E1mj938d9xtId2el5QT99IUcngnqcHNKcvLt4UeZbLNf8Nuf+BTm8Q
   Y/FVoXNrTKqkC1dyADEBooBjd9m7ADxB1NpF8FsHS3+lpzt5TzsiSXDAM
   N1v1yJYySRCXiUz7sLrNYgN2WF0LHVKLqO0xTtX3TFrLSO5xRs1AK7Vw3
   ppVn5XPpVchePt0oBESUjWQD4qcIIzeNSiZLRbUYW3unqBYLdJJFxo/y5
   w==;
X-CSE-ConnectionGUID: fkFHsyjuSfma6zJXK3WAwg==
X-CSE-MsgGUID: NmKzIVeOT6WlYdn3OovtVw==
X-IPAS-Result: =?us-ascii?q?A0D6AgBoA+xq/4//Ja1aglmCV3VgQ0mUKqBFgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD+OZAImNgcOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QEgEtCwEYAVkDAQJaIyGDAgGCdAMRvGWBeTOBAYMpAYFU2zMBCxQBg?=
 =?us-ascii?q?TiFQIgjXRgBhH0nGxuBcoR+gmECA4IqhXkEgiJ6EoFaHox6AoFShnBIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyheIYEIg?=
 =?us-ascii?q?XYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIA?=
 =?us-ascii?q?g0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MRexMBK5YnkXuhEQoog?=
 =?us-ascii?q?3iMJJU6GjOqcZkIjgoWljuEaYFuATWBWXAVgyIJShkPkiSFE8k7JjICOwEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:tZHfN6KgxGZdtiVPFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS1TcPn
 WAfUGrQO6vYMWP9eI1wPtm18hgO6J/VnINnQQUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmYoajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1gD28WJpwa5915BGgQ5
 94oC2syRw+M0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME+ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsjOS3aoaOJITiqcN9uEO7t
 EP48kPFXC4eBdCZkh2C7G6Smbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:/aPcNq+OdgqRJtDVXL5uk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3AlUhiumrCy6kVN1Jb/SUbC1DmUc4mXF3G3XXNGEG?=
 =?us-ascii?q?9ADh7ao22EmC556wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AFjacfg+ivaZozmOW5invZrKQf+FtwLaPNk0qrcs?=
 =?us-ascii?q?5v/iIM3dXPCmBsiviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544224360"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:22:10 +0000
Received: from sjc-ads-7857.cisco.com (sjc-ads-7857.cisco.com [10.30.222.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id EB8321800024F
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 04:22:09 +0000 (GMT)
Received: by sjc-ads-7857.cisco.com (Postfix, from userid 1887505)
	id 96BCDCC161E; Wed,  4 Nov 2026 20:22:09 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH ] openssh: Upgrade 10.5p1 -> 10.6p1
Date: Wed,  4 Nov 2026 20:22:09 -0800
Message-Id: <20261105042209.1168511-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7857.cisco.com [10.30.222.144];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.222.144, sjc-ads-7857.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 04:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249418
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Release Notes: https://www.openssh.org/txt/release-10.6

CompareLog: https://github.com/openssh/openssh-portable/compare/V_10_5_P1...V_10_6_P1

- Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71d89d5a2ac8c02a0e6890f5dc86f40e31648609)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 .../openssh/{openssh_10.5p1.bb => openssh_10.6p1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.5p1.bb => openssh_10.6p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..902ac7411a 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From bea215955125b39c802d2a255cd08dff4fa6298e Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.6p1.bb
index 052686f289..6043f140b3 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
+SRC_URI[sha256sum] = "a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.35.6

