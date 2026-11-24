Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15269.1795517770998302844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WzieZKcr;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1528; q=dns/txt;
  s=iport01; t=1795517772; x=1796727372;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PYoRCsPy1XvlqjW+oNaDQ5CCr8IdLVyFh9umuZjXoZg=;
  b=WzieZKcrw6QX8H4FxlT45t5jXnKhHMnmUL9pl9WkOjTr9Vk3KiaIXeiV
   GtWE0hJROXo7xi+z48qngAevGVLa7N5H9Z3eDfAMiTko5UpTOjA9zG5Bc
   SMBxE1AHurjmcuP2SVDN0RmaDeifKXcYzkAIOhV6YaGuGjfEnLSKurFkW
   +Roar/5vkdsIuAPO9wdkTA9RIWmCtYJDxuHh9RNyvGWcFH4HSkAx7kHi2
   ymkkd/pR2OhMrDV/1PozhUUy732psSii4cSLMrDMABLeBqzzk+LzyoHZq
   TTge9R8mPb0FoXlWlRifckkW2Qgwr+c4j5hjTDL+duek0Oy2oHyvsb0nN
   Q==;
X-CSE-ConnectionGUID: +qP9ql2zT5iJaqRMNm304g==
X-CSE-MsgGUID: 7wEJX0adT2SkD2E2quQtrw==
X-IPAS-Result: =?us-ascii?q?A0AABAD1agVr/9FK/pBaHQEBPAEFBQECAQkBgWUCglV1Y?=
 =?us-ascii?q?UJJA5QngiEDnimBfg8BAQEPFAInFAQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZATAgEDMgEYAT0gMSsrGYMCAYJ0A?=
 =?us-ascii?q?gERulyCLIEBgykBPwJDUNszAQsUAYE4AYVBiCR1AYR9JxsbgXKBFYNqgQWEC?=
 =?us-ascii?q?4V5BIIiehKOa4oaSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFg?=
 =?us-ascii?q?RyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhC?=
 =?us-ascii?q?xsYDUgRLDcVGQQ+bgeUFIMagQ4sBByBZScFpXChEQoog3mMJJU6GjOqcguYf?=
 =?us-ascii?q?Y4KllGEaoFoPIFZcBWDIglKGQ+OOYNrzlsjNQ4vAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:Ni1+QKmwypeint5C0BsBffvo5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMCDqPO6vYa2b3fd93b9y3pkMPsZXdyIc2HVY+q3g1EltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfnb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fc4BwrduBTtcy
 aEZCjkUVDWlgrnunL3uH4GAhux7RCXqFIoSoDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUUeUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGISPKoTXGZ4E9qqej
 j3Z0kbJWhgWCIakyhbf3yi1m9bThzyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:4K+JJKC0fPfQrKzlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3AogSFUGnb8MiYMpM2XlDmjQLYOBXXOT7E9CbJJxW?=
 =?us-ascii?q?qNTtoarSMc3q2/fg8z8U7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AlZ+K5gy7IBa9UZcdi4sz/YGn2/uaqPuxJWI9yZw?=
 =?us-ascii?q?Kh5O/NgAqFm2EkQ2rWJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62805439"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:10 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id E0AAB180001BE
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:09 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 25738CBF22F; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 07/10] openssh: Ignore CVE-2026-106589
Date: Tue, 24 Nov 2026 02:55:30 -0800
Message-Id: <20261124105533.348654-8-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124105533.348654-1-asparmar@cisco.com>
References: <20261124105533.348654-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251012
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

Analysis:
- This issue concerns platforms lacking file descriptor passing and
  unprivileged PTY allocation, notably QNX 6 and SCO OpenServer 5.
- The configured Linux recipe supports descriptor passing and
  unprivileged PTY allocation, so the affected platform configuration
  is not selected.

Reference:
[1] https://ubuntu.com/security/CVE-2026-106589

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_10.5p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 5667c7746f..ab6b320c75 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -49,6 +49,7 @@ CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS
 CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-106588] = "not-applicable-platform: Requires the macOS 27 or later SDK and Darwin sandbox; this recipe targets Linux."
+CVE_STATUS[CVE-2026-106589] = "not-applicable-platform: Requires platforms without file descriptor passing and unprivileged PTY allocation, such as QNX 6 or SCO OpenServer 5; the configured Linux recipe supports both."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.35.6

