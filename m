Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36068.1795583472947834417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NuIEQty5;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1481; q=dns/txt;
  s=iport01; t=1795583473; x=1796793073;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GUyRgj4FgadszLPM4oUYZa17kRtI214/jlEXDH4TkAI=;
  b=NuIEQty5WZvnB0ztwsvvwKbdME5WXMsm8boBBfA/2KkqQSfUrqalj0YI
   GwrGhH54hdqxwIpzoFsteNJxGJv+7KZMvCQ+Cmd/Uz+F2k70X8xy6ySD0
   I5v+tnVTB5lXV37h6V9pZktloUP2jQ8pRdMNAukCNSjQCGJjYxgZq0OFe
   srKSpJg6uiMXEkj3vIpSNSeJ/VKYcbvaXdY+iWox/Ak7OOifVeBud6wIN
   dUHN82aBfqDdDgBQhTtnijCcMEeObHLm+abGIeWsXDRIBRhkGhE7TaP+C
   tOCbtcysV1d/tr0kQA/X3Qdt4nuSu5/uW8Yyint7D13ocAmeh+REmBhaH
   w==;
X-CSE-ConnectionGUID: i++Y6de+Rz+XBB8nm6ZTfw==
X-CSE-MsgGUID: RVps7jzMR0qBow0PHtAqMg==
X-IPAS-Result: =?us-ascii?q?A0BAAgAhbQZr/8xK/pBaglmCV3VgQ0mTWgFPgTWZNoVig?=
 =?us-ascii?q?X4PAQEBDzEgBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyQSwF2XESDAgGCdAO6FIIsgQGEftszAQsUAYE4hUKIJYV0Jxsbg?=
 =?us-ascii?q?XKEf4EZg3eFeQSCIoEMjmeKHUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjO?=
 =?us-ascii?q?xeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZD?=
 =?us-ascii?q?gIpBhYhCzQYDUgRLDcVGQQ+bgeUE4MbATxRgikIphyhEQoog3mMJJU6GjOEB?=
 =?us-ascii?q?KZuLphaglmiAoRqgWg8gVlwFYMiCUoZD44vFdI7JjI9AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:9WGLyag163NJyUbmnKqiV1b1X161NBEKZh0ujC45NGQN5FlHY01je
 htvX2qObveMYTDwe413aYvn8ENSsZbUmtQ2SlFq+S1mQixjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvje8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUZuaVGX21Dt
 sYKawAnRECFgryE/LykH7wEasQLdKEHPasWt2slyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXZj/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKLIofRG54FxS50o
 Er8wXziXRMIEebH0BCC7SqUpvPmhAb0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjNCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:xw7olK/tym8k24+OX11uk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: 9a23:Vc6VMW+VPeSDyLcP2sOVv09XWfF7fnCe9mWTE2WSWWBsFo+pR0DFrQ==
X-Talos-MUID: 9a23:ti7dTApekvdZVtptlwgezwtcLNw34baLMhgUu5IZ4/GkKQVpHjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60336383"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:11:09 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id B6E7F180006E9
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:11:08 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 6604BCC2EF3; Tue, 24 Nov 2026 21:11:07 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] connman: remove connection_manager from CVE_PRODUCTS
Date: Tue, 24 Nov 2026 21:11:07 -0800
Message-Id: <20261125051107.2498928-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251131
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

The only CVE with this product/cpr is CVE-2013-10036 which is for
different connection manager and is showing up as false positive in CVE
reports with current sbom-cve-check tooling.

Backport note: Upstream removes this mapping from connman_2.0.bb.
In scarthgap, connman_1.42.bb requires connman.inc, where the mapping
is defined, so remove it there instead. NVD also associates
CVE-2021-33833 with connection_manager, but only for ConnMan 1.30
through 1.39; scarthgap's 1.42 is outside that range. The default
CVE_PRODUCT value still scans connman.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b2046bf757622ae46e66691119cebc504113993)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-connectivity/connman/connman.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 7487ca0d0c..5aa4cb3926 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -15,8 +15,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-CVE_PRODUCT = "connman connection_manager"
-
 DEPENDS  = "dbus glib-2.0 ppp"
 
 EXTRA_OECONF += "\
-- 
2.35.6

