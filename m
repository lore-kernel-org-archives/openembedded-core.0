Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4054DC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 12:18:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5246.1745583492023693286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 05:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210385b2d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P4Qnnv021103
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:18:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd3q7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:18:11 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 25 Apr 2025 05:18:11 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 25 Apr 2025 05:18:09 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  3/3] perl: upgrade 5.38.2 -> 5.38.4
Date: Fri, 25 Apr 2025 12:18:03 +0000
Message-ID: <20250425121803.767765-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250425121803.767765-1-archana.polampalli@windriver.com>
References: <20250425121803.767765-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=680b7d83 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=_IEhM8lNAAAA:8 a=t7CeM3EgAAAA:8 a=W--2V7L1KeMcrOQ6b88A:9 a=WN5SZLvFwbRUu1hQBHWk:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bvT_GXE-5roDg0KypirBdkk4AMKe9mQc
X-Proofpoint-GUID: bvT_GXE-5roDg0KypirBdkk4AMKe9mQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4OCBTYWx0ZWRfXxQpkHklmvO7L unHgBBa1gjpBw8dWU/YshZ68lCgjOnjZ/WFmNFi+KKa843cGCG5DhmSoici9AsneaPyRwFwKrw7 V7hi0VZ3XXX846P59tyX+LBTSDBfgAiObWtATbDiiLbGRTc7er7MsKF0xT3SVYlCtJ6XB/aZRf9
 UFUvar4Ai8MGudWRs22Oq5HQfnaizQRca81mGIFUTmzAm1lMioBrg1vZTgBlFbXJwKLnQkHCyZj W35QdyitNPhNHpQrVF7rT68m23nIVmfzScZvccNQACzobxtRNIwjAcNTLTDMSfXmGLEUjynS4M0 0ymNcDnvdX8pqe3c4+/LOt6KL2KwXT5ISNGxy5CAayHrccwXQGjSJGyw9e0BYsSNWlo0rMuT/nA
 a0mgtcYDujMoxaZx+Uzw34qchyqyRdhEV0fab4Rq0QPFDahv8yaaMV1sRtszP42O4hm4VdKp
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=834 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 12:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215470

From: Archana Polampalli <archana.polampalli@windriver.com>

update include fix for CVE-2024-56406

https://perldoc.perl.org/5.38.4/perl5384delta

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/perl/{perl_5.38.2.bb => perl_5.38.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.38.2.bb => perl_5.38.4.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.38.2.bb
rename to meta/recipes-devtools/perl/perl_5.38.4.bb
index b6c9cda7ae..e59022e2bd 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "a0a31534451eb7b83c7d6594a497543a54d488bc90ca00f5e34762577f40655e"
+SRC_URI[perl.sha256sum] = "fb888accf8b50b5180e91166e5153608be294c57c19878e95f7659c1f1f12758"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.40.0


