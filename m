Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17711CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:13:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28636.1759738426048055475
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 01:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=e+QclTWu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=237466cedc=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5967ae9n3998132
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Oct 2025 01:13:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rpAhN9TTfpRpR5QrjSpQ
	pB1Ey8/Ma+lW9ZuDgV39H4M=; b=e+QclTWuwgzUJrflj0JGYreUpGk3rWkwKlUp
	sph9htsIsOfKabxbOBazH5BEaHjJMbhyBWMnb5VJ35eBoZvBcYehkUJQezIIpqnO
	7ZQ9R547hSTD7E7ELlgw8GIoqELurrF6hI5GUrxUHShjzuoL0MYmK/vJDQ24lklO
	JtSeqXZu4hmzBvbTnqREsQqfqhclcOzagPMLnIO6gCLdT0RIF14NgAJJXJgrcjbJ
	k6ciweE8jbXXRGonSwiDrzU33v3tsRU1wD01KXtNopEbVaFlsew5SdxrS8kuTKWK
	4iT5Q2UD6+d9e8JO99ow6P7DPdGZifVNUgSYOPZFUjduRyr0EQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49k33f176q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 01:13:44 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 6 Oct 2025 01:13:44 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 6 Oct 2025 01:13:43 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] openssl: upgrade 3.0.17 -> 3.0.18
Date: Mon, 6 Oct 2025 13:43:41 +0530
Message-ID: <20251006081341.3653614-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDA2NSBTYWx0ZWRfXzwS5VkfUKsh4
 72+wVw7l10mFiu6LQrRmjreT13ggmajpq206Td/uoWmOKvW1pIkT9RIWHLJVr1Des8NCY2/Wnde
 4fMGK1HU7gdU/0DFXP8bs5tyJEI4Y5d4zHUd2n4AFwv3wfOeKnpjCrYSar7p0+EPfYVjoR0z1I7
 DXPjZxODHeEOsTFONNFJeqOF9DZRwlCu0zq3hPtNkySuvX9hJqdlAidBvcYeEAPKYgs7C5zd+6j
 esn47gDPb5E3rX1lUQuWOkm8Y7i3T9zUudUq7gzfOzmk+tYwH86YMkpGzIHAda1O8YZjMlmi/YV
 NlfGUEca9uhn0quWHJQc2OkNBzb1J9MUINVRMBFij3Near1nJHXryoGvIhCJkd2o1CfUCV/SM2o
 6vIDxjwDivjOjf6zp6cj+Sj3nO96yQ==
X-Proofpoint-ORIG-GUID: mzPguoV2TIFUww-a1jptz2CxwJLhRVWw
X-Authority-Analysis: v=2.4 cv=XeCEDY55 c=1 sm=1 tr=0 ts=68e37a39 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=EJD4NxTW8fyj12yvPZwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mzPguoV2TIFUww-a1jptz2CxwJLhRVWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510060065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 08:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224467

From: Archana Polampalli <archana.polampalli@windriver.com>

This release incorporates the following bug fixes and mitigations:
Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap. (CVE-2025-9230)
Fix Out-of-bounds read in HTTP client no_proxy handling. (CVE-2025-9232)

Changelog:
https://github.com/openssl/openssl/blob/openssl-3.0.18/NEWS.md#openssl-30

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssl/{openssl_3.0.17.bb => openssl_3.0.18.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.17.bb => openssl_3.0.18.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb b/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.17.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.18.bb
index a50bd2edbf..a8dd338327 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "dfdd77e4ea1b57ff3a6dbde6b0bdc3f31db5ac99e7fdd4eaf9e1fbb6ec2db8ce"
+SRC_URI[sha256sum] = "d80c34f5cf902dccf1f1b5df5ebb86d0392e37049e5d73df1b3abae72e4ffe8b"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.40.0


