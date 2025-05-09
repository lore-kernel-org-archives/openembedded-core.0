Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4358C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 10:22:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11050.1746786154628187512
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 03:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224ebccee=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497XIOF024027
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 03:22:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3f1hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:22:34 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 03:22:33 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 03:22:32 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][Walnascar][PATCH  2/5] perl: upgrade 5.40.0 -> 5.40.2
Date: Fri, 9 May 2025 10:22:25 +0000
Message-ID: <20250509102228.3422688-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250509102228.3422688-1-archana.polampalli@windriver.com>
References: <20250509102228.3422688-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -Oo12H4bf0_wlzBxXU5mdICmlnamcin-
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681dd76a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=wyjpycHzAAAA:8 a=t7CeM3EgAAAA:8 a=qcqivgu2rmkcyegf-EoA:9 a=ROKTiUA5NBresHysc1Cf:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -Oo12H4bf0_wlzBxXU5mdICmlnamcin-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEwMCBTYWx0ZWRfX67cKd24yk+VI Ft+kYP/WuPR4mWTZn6Z0lowlKBYLB1xKyZfSgdIJjX1o2kAGB8cSbjEr+uI2+Tmx+g4OBcgAub+ APnojfdbtXFx9bSR+6T5qwPIgja0QgfDALWxl9Ic/E8lNlv0sz4zycC8NUm2sulE8Rqwa0wq70+
 hs76ELI1HBturKP++6E0ccPZ+LIgXdLlqjCgzaam1NdAMqzdRyUpgQrrPvBNfxNtSQIyPtfAKfT 2SYIjJLqv/HjlLHoZI7pk+LFEg0TbFKI4haB+QLjpQrJyOe87uhi60K78n/CZ9gS0cmz2eom9xn k5H9FN+26BhD5gUvZRhFl1/5nBItQTU+VCnmE+wKculAXGWqO6rSvbvzdvnB3DyGLA1Dds0ZaoD
 hY1kyEkApStWj+WJ8TFjgw9qEf7FJgKdVZIdgFetBdJhBFD/sIzBzsP4b1guMPVZG9q3lBsC
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=843 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 10:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216193

From: Archana Polampalli <archana.polampalli@windriver.com>

https://metacpan.org/pod/perldelta

This provides a fix for CVE-2024-56406

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.40.0.bb b/meta/recipes-devtools/perl/perl_5.40.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.0.bb
rename to meta/recipes-devtools/perl/perl_5.40.2.bb
index 0d4338f29f..95c230060d 100644
--- a/meta/recipes-devtools/perl/perl_5.40.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "c740348f357396327a9795d3e8323bafd0fe8a5c7835fc1cbaba0cc8dfe7161f"
+SRC_URI[perl.sha256sum] = "10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.40.0


