Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15271.1795517772042343884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R7qJVc7Y;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1246; q=dns/txt;
  s=iport01; t=1795517772; x=1796727372;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tDo7DJ76zI8yDbVvgRXb9cKlWO+BuSPL43nD0hU6h+Q=;
  b=R7qJVc7Y4WaGgE3DfJ5/oFlNYoIrbzxGVMpSCWKyxau6cPF7YDljRsRV
   tANKPYeIBuItTX648zx3q7Wjb4m0wO+7T/vWMJPudoGF3KQt6flBYvSlj
   p5IFS3NfM/IZMoEEmX3V3QnU+Hawgt9nbleDOaiT0goxQRPwRfd0wpDAH
   Z8jJwA1CtuD4vTH8A4qRWXbf9zLZlOc7HiObUH3q+sL4/tZRcdECMFnD/
   v2Wu8HQPl6sdebkbhywU6WLKBvnZbLxk5KaT/NAS8yCMPBMUKDlVdUt4n
   QbFToIav3x3jIlZGFyYzaASF4qUNKVGVusBluJxygmgK+WAvR17MjKDLP
   g==;
X-CSE-ConnectionGUID: +GZZ1YIPRDGSPNor1pg0Ig==
X-CSE-MsgGUID: 5vGXDculR4CXv16iRp1A/A==
X-IPAS-Result: =?us-ascii?q?A0BHAgD3awVr/9NK/pBaHgE8DAILgWWCV3VhQkkDlCeCJ?=
 =?us-ascii?q?J4pgX4PAQEBDz0UBAEBhQUCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBMCAQMyARgBPSAxKysZgwIBgnQCARG6WoIsgQGDK?=
 =?us-ascii?q?QE/AkNQ2zMBCxQBgTiFQogkdQGEfScbG4FygRWDaoEFhAuFeQSCInoSjmuKG?=
 =?us-ascii?q?kiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErK?=
 =?us-ascii?q?F4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnC?=
 =?us-ascii?q?xoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWIQsbGA1IESw3FRkEP?=
 =?us-ascii?q?m4HlBSDGoEOLAQcgWUnpXWhEQoog3mMJJU6GjOqcguYfY4KllGEaoFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+OOYNrzlsjNQ4vAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:/1Pl7KmUntPBMoGGCK2jUfro5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMCmyAa/iNYmPzfY9yPY7j9kIP7JTWztQwGgZupCxgFltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsf7b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fc43yNQuMEB2z
 9A3EwgraQran+3u4b3uH4GAhux7RCXqFIoSoDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQWUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGISPJYDRGJ4N9qqej
 j/Y0FTVCQweDoC0+STcrHOWnrbm2gquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPAXi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:0Ow7Xqm1zWh7hg/oJFmSld4cPZ3pDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:lL2f024mlrr/4bW3Ldsst2EmKJkUU0Xn4FjrG2m/Ez9xR+W0RgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AXowwGQ67JRvCVP5vd0w3OQngxow1/YueJEsQla9?=
 =?us-ascii?q?akPmabHJxAS/EpXOeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62743530"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:10 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id DFB4718000B73
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:09 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 216C5CBF22E; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 06/10] openssh: Ignore CVE-2026-106588
Date: Tue, 24 Nov 2026 02:55:29 -0800
Message-Id: <20261124105533.348654-7-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124105533.348654-1-asparmar@cisco.com>
References: <20261124105533.348654-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251014
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

Analysis:
- This issue requires OpenSSH built with the macOS 27 or later SDK.
- Blacksail targets Linux and cannot select the Darwin sandbox.

Reference:
[1] https://ubuntu.com/security/CVE-2026-106588

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_10.5p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 377b6b17e0..5667c7746f 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -48,6 +48,7 @@ CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Ex
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
+CVE_STATUS[CVE-2026-106588] = "not-applicable-platform: Requires the macOS 27 or later SDK and Darwin sandbox; this recipe targets Linux."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.35.6

