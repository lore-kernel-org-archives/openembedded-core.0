Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09CEEA3F2A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:50:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16514.1770717030534292072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kRQppI7F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65019b8557=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A40W8C1581524
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:50:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=XLMCGHrvVSl3+d4E5eutN3YJfRxM3l6iaUzIZYX7rpg=; b=kRQppI7FwLLF
	fDM1OBlS1vbe+pWMJoN1b4UxxJ0sdIJ89x+YefWZpDrOM1BwzjuYwx/4SDhfp9ec
	FqweOTkLK6P97RNApMuO3Y2OQcNMIQ2/3lFolPfiehCtseHEJXPlam/nTLjLr4rs
	ratcICCAHIBJbUJMnttV5p1wyiuDn1geYAjxoa3a7QnRrhWn8P6N/A1SfeB6Uazl
	jB8FJddvDQch+ZuFFDu5LFg7DWQTHNhjZsL3wUwgTV2tRyWEOydmSTDYyft6nIwl
	T+K7oaoS9XLkqjlZt/E2SSq/UOs56XP7dlU/+gJBjZ2bLGdSrQRoVFEIBTK5w1/R
	Ht6T35UnxA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4tvus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:50:30 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 01:50:29 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 01:50:28 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] gnupg: 2.5.14 -> 2.5.17
Date: Tue, 10 Feb 2026 17:50:25 +0800
Message-ID: <20260210095025.633860-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210095025.633860-1-hongxu.jia@windriver.com>
References: <20260210095025.633860-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698aff66 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=vjHXXooTav1PxvjC-AgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DiRiqr8Acq-cax2TAabxd36gtTfA9LnD
X-Proofpoint-GUID: DiRiqr8Acq-cax2TAabxd36gtTfA9LnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MiBTYWx0ZWRfXyWYz3JgjelOC
 hfR2f9gENDX44YEIGj4SsAklVJb3AY2ojWkOWAFRQ4os8xqEmJ/U0ga3A7WUPUH2B4vW7nzSiE/
 q5GTYTETbg2qHSSDlhP2U43x5D6LJahTocm2Ia7mJA2O9MeHjYuQRyA9hpm1W47PaoCvgDq2Vdx
 ptfa/4V2y7f5DRBFQ0QnemlLKL+COo4YvSu+e3G+TPvvP7JvMU6EzEg0oJoUaQsGe7VrHWskCbV
 afgUc+8Neoc3+5j/P2IRWkOLiR7ifCtdEmIKQdVg8cxpsNiHuVJBQ78YKbL6PrRlCZ0O3Gjxy0A
 2xWpGOfGtsnig+244Og4DhgMVQjZRxljaYl0pADiq353bnGy40NY7/qIVehkApl6axJOhIsCGMl
 IP4ZSZfv5o78fRMRiAhQ71iHlFGfTHTT6XaZA7a8/FfOTOUG+xYfgkxqFfK9uH1mdoCM+f2slfe
 QoUlIzFmXw6tKYVpK2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230874

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.5.14.bb => gnupg_2.5.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.14.bb => gnupg_2.5.17.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.14.bb b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.14.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.17.bb
index e484b03424..fd6588769c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.14.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "25a622e625a1cc9078b5e3f7adf2bd02b86759170e2fbb8542bca8e907214610"
+SRC_URI[sha256sum] = "2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.34.1


