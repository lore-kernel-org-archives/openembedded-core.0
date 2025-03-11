Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1305BC28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 04:59:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1781.1741669154149176007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 21:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5165e225bd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B3aobh027976
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 21:59:13 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458p9qjk8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 21:59:13 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Mar 2025 21:59:12 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 10 Mar 2025 21:59:12 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] gnupg: 2.5.4 -> 2.5.5
Date: Tue, 11 Mar 2025 12:59:10 +0800
Message-ID: <20250311045911.3023271-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QNySRhLL c=1 sm=1 tr=0 ts=67cfc321 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=8OD46P_-QuXI8S_B3vEA:9 a=r0dl5i_q2XGqDZkti5dn:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: U5blqqcerGvZ1QDasrfReeca-QyilpnN
X-Proofpoint-ORIG-GUID: U5blqqcerGvZ1QDasrfReeca-QyilpnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503110031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212540

Noteworthy changes in version 2.5.5 (2025-03-07)
------------------------------------------------

  * gpg: Fix a verification DoS due to a malicious subkey in the
    keyring.  [T7527]

  * dirmngr: Fix possible hangs due to blocking connection requests.
    [T6606, T7434]

  * w32: On socket nonce mismatch close the socket.  [T7434]

  * w32: Print more detailed diagnostics for IPC errors.

  * GPGME is not any more distributed with the Windows installer.
    Please install gpg4win to get gpgme version.

  See-also: gnupg-announce/2025q1/000491.html
  Release-info: https://dev.gnupg.org/T7530

https://dev.gnupg.org/source/gnupg/browse/master/NEWS

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.5.4.bb => gnupg_2.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.4.bb => gnupg_2.5.5.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.4.bb b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.5.bb
index e6a7e3fb407..a9ab486f6bf 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "f8cb2ac6c9f17f81e3541c62158764910fad5c3a0765e00b398c41a32bc4e0ea"
+SRC_URI[sha256sum] = "7afa71d72ff9aaff75a6810b87b486bc492fd752e4f77b07c41759ce4ef36b31"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.34.1


