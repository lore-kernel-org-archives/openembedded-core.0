Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27969.1793856710647850466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QGoBsf7v;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2102; q=dns/txt;
  s=iport01; t=1793856710; x=1795066310;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oII0xk++PvvtSIRaDQNcTy0LKsbPcm1N9HXgkJiS86s=;
  b=QGoBsf7vdwll9+HzDP0BIG2dTCggRzCZk2aMZDDpwesJO7Wd0PVOWYNk
   60s1CHZL98EyBcy2PAvPGnU8Z6sgi1uaFFYjyxWTO4KaJf6dOFVkl34r8
   9KtvHAFBsOjVHK1HYIISZIt6F2qxfm+h9KT2reDS3xG54szYhwdDchGwX
   4osjU6XYq1cbNoT+tAdWs3KMJISEuA3t/mFDjUAyl2XZtrrstAmLPhnlf
   iSZ7l4DDkreon+PEmcla5I84vJo/4d5sQIKxpOuMHRd4ptOMvavPHovEO
   sVewHIWQXAFhNu5SBTUmYpz1RAEmdnm6SkojG1Z03xxvQgMrXfjuw9tKp
   w==;
X-CSE-ConnectionGUID: qqGTwMQvThi3/plg+4HeEw==
X-CSE-MsgGUID: TbHBmIisThSgAvBRmBITNQ==
X-IPAS-Result: =?us-ascii?q?A0DHAgCDE+xq/5P/Ja1aglmCV3VhQkmUKoIkniGBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOHQImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEwIBAzIBGAE9IDErKxmDAgGCdAIBEbw/giyBAYMpAT8CQ1DbM?=
 =?us-ascii?q?wELFAGBOIVAiCN1AYR9JxsbgXKBFYNpgQWBXAEBAhiCE4V5BIIigQyBeIx6i?=
 =?us-ascii?q?ERIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BK?=
 =?us-ascii?q?yheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZ?=
 =?us-ascii?q?AsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MRWjQsBII5p?=
 =?us-ascii?q?WWhEQoog3iMJJU6GjOqcQuYfY4KlWlohGmBaQE6gUcLB3AVgyIJShkPjjmDa?=
 =?us-ascii?q?4F/gxTJSCM1AgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:9cCDnqqUTxBgVQLlWzmqQkjfMMleBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmOM/eNamb8ft4kPY618k8HvpTSzNZjGwdvrisxHiMTo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v9uLl1R0
 MUGFDAMNVebg+31nJK2Z/Y506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHWHpgFwxrH9
 goq+UzFCDEwMf2e0gaFyX2FmMX1mAnaZKQrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cZLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:NbQAOKpV0nlwoqzFeO7hK6gaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AWtfri2tmOUdMqnM9mHAjg4L16Is8a1Lh01LpPXO?=
 =?us-ascii?q?4CD0uULmaCgOw9Y57xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A9Re0igyySh2aeH81YkGP6ilF+wmaqJikKGoIsJQ?=
 =?us-ascii?q?dh8m/OgVuEQ2YphWLZLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543585478"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:31:49 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id B5277180008BF
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 05:31:49 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 0A4FBCC1250; Wed,  4 Nov 2026 21:31:49 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH  6/8] openssh: Ignore CVE-2026-106555
Date: Wed,  4 Nov 2026 21:31:46 -0800
Message-Id: <20261105053148.2704106-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105053148.2704106-1-hthakar@cisco.com>
References: <20261105053148.2704106-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249439
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

The vulnerable GSSAPI implementation is compiled only when OpenSSH
is built with Kerberos support. The default PACKAGECONFIG excludes
kerberos and passes --without-kerberos5.

Set not-applicable-config only for builds without kerberos. Keep
kerberos-enabled configurations marked unpatched. The upstream fix
and advisory are referenced in [1] and [2].

[1] https://github.com/openssh/openssh-portable/commit/670510d1e190b0f4e47066f24498c04ada1da0f0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106555

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 4078c2665c..dd49cdf977 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -69,6 +69,7 @@ CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distr
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
+CVE_STATUS[CVE-2026-106555] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is not built without PACKAGECONFIG kerberos', d)}"
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
-- 
2.35.6

