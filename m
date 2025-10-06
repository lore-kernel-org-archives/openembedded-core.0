Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB06CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:13:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28768.1759738412979957779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 01:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qoM6nzZZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=237466cedc=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5966AfN5004104
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Oct 2025 08:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+0n9B9LsYDljc4xXHm4R
	ieh/RZmDbmhYlfpDE46ykCM=; b=qoM6nzZZhvu7OBgVhZZlCbdmZK2+3RMEP/6b
	ZksM0A57pLV4ZWHGHypbs1d+azM0HXrha2C9cqA64F9ZN4qKrBySu2E0ezC1YQyZ
	L3JJkLtM/jivQkuxJ8mDDUVTtMeLGRdgpjHG1osvcHKpwRN8tlCqv+nDRZ1+vOb/
	gyAKdTBbi2UH5Z0AQ6Bz8pMvZNicWY49wlS3Adgs1TKZmDEOWEkL46qcGPrktU37
	qwaFTv/kyzBZbNnidMQEwbSPLkJz/y29NrpNpAVb4JE/oVIs3t4uYmMUa+w2gBz0
	xa0dTYAcqtSzgb1tk/f/cBkHVkrKyyJ3WY4zUtoh4ZJkHQXd3w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jtj39g85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 08:13:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 6 Oct 2025 01:13:30 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 6 Oct 2025 01:13:29 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 1/1] openssl: upgrade 3.4.2 -> 3.4.3
Date: Mon, 6 Oct 2025 13:43:27 +0530
Message-ID: <20251006081327.3653441-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kK77ptErzdnF5LyhdeC42GKF4mDW73pz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDA2NCBTYWx0ZWRfX+ZpARnkHjCGr
 Z6wuRQPqpWUgQtoViC1/3+r3tze9Fyv91WKsWJQVBoVHs1IQ6wdook4QviZdQ3fqFNRydVeqJ8R
 r6RIW/WDlFx3yIMozbnGamP8I4fd5Jc4f//j7cifadsQgYozx47CcPA//Mdfk1lf/fc32t0g2ec
 /e5ROo8WjGCqujeSiNb5GxvnD5RUAw3V2ImzESPsWt5dKBI667ZGxzoHb7ZEe5oALrFMnGExh9D
 8gdZTPit0evZKm/TtRHpvzbUO3enkF8qf5oWMO0cWQqdDlnl+r1Hl/Qo7mgLzP0oAnRzeTH0ClX
 kq06gX+akfMscTDifkuNlZYL+kiVa7WMKYl1hSd18yajkFJQja6CMeeU9Tr/zUCBS4//KTpR70Z
 0XpLHWKu/6+VjWP+iEDnF0t5OrdMeQ==
X-Proofpoint-ORIG-GUID: kK77ptErzdnF5LyhdeC42GKF4mDW73pz
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=68e37a2b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=kXvqnoZgbdokovhLLssA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510060064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 08:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224466

From: Archana Polampalli <archana.polampalli@windriver.com>

OpenSSL 3.4.3 is a security patch release. The most severe CVE fixed in this release is Moderate.
This release incorporates the following bug fixes and mitigations:
Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap. (CVE-2025-9230)
Fix Timing side-channel in SM2 algorithm on 64 bit ARM. (CVE-2025-9231)
Fix Out-of-bounds read in HTTP client no_proxy handling. (CVE-2025-9232)

Changelog:
https://github.com/openssl/openssl/blob/openssl-3.4.3/NEWS.md#openssl-34

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssl/{openssl_3.4.2.bb => openssl_3.4.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.4.2.bb => openssl_3.4.3.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.2.bb b/meta/recipes-connectivity/openssl/openssl_3.4.3.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.4.2.bb
rename to meta/recipes-connectivity/openssl/openssl_3.4.3.bb
index 2998e37e75..8e33d63f92 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.3.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "17b02459fc28be415470cccaae7434f3496cac1306b86b52c83886580e82834c"
+SRC_URI[sha256sum] = "fa727ed1399a64e754030a033435003991aee36bda9a5b080995cb2ac5cf7f37"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.40.0


