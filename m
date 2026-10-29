Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8274.1793268689241169472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cUKkbaVR;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1050; q=dns/txt;
  s=iport01; t=1793268689; x=1794478289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3QeRMtgd0nQp3NztwwJXpQJqKPhUTwdhT5L2rRpbh+I=;
  b=cUKkbaVRoqwUa5d8ejDhqvXqNICoTvvLCalpoBx7WlyzYdBbLWx+d+lR
   zQouXBqQ4yLD9poiOkZlpTtZNz7bdCDkW486e13SGEB3vvrbL/Swdyh3N
   9FyxhvIx8FiqrAwE/jBV03rVaBY7eZ2WHL83rAvUgS7xi2KJNaL5Rt4pZ
   a1XlqcSXkjitlTLn5hRl5z1HcFekwewnTW9Eyoo2s7468QLCyQBGFSdha
   jf3rXWhwdtPvtG26SuJVwChRKCwjnQD1FkXAzwLT+xBuSB+RV3QUwwMmk
   v/BW8YeIsRWdjohAJ6Wh81LEnfVqT4qtrpaE8m6m0zlYNh4KccxSQn+Vf
   w==;
X-CSE-ConnectionGUID: 8QpDDfexQ66zXvVsNRK+6A==
X-CSE-MsgGUID: ghEeF7bRSK6xLECUV/S05Q==
X-IPAS-Result: =?us-ascii?q?A0BFAgD+GuNq/4//Ja1aglmCV3VhQkmWTp4cgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjhwCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBMCAQMyARgBLRAgMSsrGYMCAYJ0AgERBrRKgiyBAYMpAT8CQ1DbM?=
 =?us-ascii?q?wELFAEFgTOFQIgjdoR9JxsbgXKEfoEFgVwBAYIthXgEgiKBDI8Ih1VIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRmBB12BKylgASGBC?=
 =?us-ascii?q?IF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExouC4EaNTwJJkEVDGQLGgViC?=
 =?us-ascii?q?AINDHY5EDEgJjIEAx0YDUgRLDcVGQQ+bgeRXYMOgQ4sgj2jRIIhoQ8KKIN2j?=
 =?us-ascii?q?CKVOhozqm+ZCI4KllCEaYFoPIEoHwsHcBVIAYJZCUoZD445g2uBf8xbJDUCA?=
 =?us-ascii?q?ToBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:hQagDaO7U9d1dq/vrR3zlsFynXyQoLVcMsEvi/4bfWQNrUpx32EBx
 jNMCDuCb63cazame99yadvioEIPsJPWzNRiQXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gW8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66VXFG0aM4AIw7gpE1FQy
 +c+EhNOMDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzN3wsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEtiem9a4WNIbRmQ+1anmuVi
 D3MxV/aXAE+Gfei932+qi+V07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:Vxm9hqHSOyACitUHpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:4iWRgGMrjPqbge5DCBB/2GIaF9AcLCPP/GnuOGmCKiU3YejA
X-Talos-MUID: 9a23:bJa+/AsnNwrKqINZw82nizFPOek36Z6VKx4dtbgthvfDDnQtAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="541983703"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 10:11:28 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 2554B18000268;
	Thu, 29 Oct 2026 10:11:28 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id BDC95CC124D; Thu, 29 Oct 2026 03:11:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v4 3/5] apr-util: Mark CVE-2026-34191 not applicable
Date: Thu, 29 Oct 2026 03:11:25 -0700
Message-Id: <20261029101127.2240608-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261029101127.2240608-1-hthakar@cisco.com>
References: <20261029101127.2240608-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248924
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

CVE-2026-34191 affects only the apr_dbd_oracle provider [1].
The apr-util recipe does not enable --with-oracle, so configure keeps
apu_have_oracle=0 [2]. Hence mark the CVE not applicable to this build.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-34191
[2] https://github.com/apache/apr-util/blob/1.6.3/build/dbd.m4

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-support/apr/apr-util_1.6.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 00a9589ae8..1b7beda904 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -101,3 +101,5 @@ do_install_ptest() {
 
 # Add CVE_PRODUCT to match the NVD CPE product name
 CVE_PRODUCT = "apache:apr-util apache:portable_runtime_utility"
+
+CVE_STATUS[CVE-2026-34191] = "not-applicable-config: apr_dbd_oracle is not built because --with-oracle is not enabled"
-- 
2.35.6

