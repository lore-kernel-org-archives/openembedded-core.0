Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1DAC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 12:18:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5200.1745583489979258019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 05:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210385b2d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PBTIRP031100
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:18:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd3q7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:18:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 25 Apr 2025 05:18:09 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 25 Apr 2025 05:18:07 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  2/3] perlcross: 1.6.1 -> 1.6.2
Date: Fri, 25 Apr 2025 12:18:02 +0000
Message-ID: <20250425121803.767765-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250425121803.767765-1-archana.polampalli@windriver.com>
References: <20250425121803.767765-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=680b7d81 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=YiLq546vFVBZOcSZ4AIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: RaN2RUyawApGdvEup7cKwjWanNDlyJd0
X-Proofpoint-GUID: RaN2RUyawApGdvEup7cKwjWanNDlyJd0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4OCBTYWx0ZWRfX//0vvLJ8DSWV 04RfUr8Tm25ldvN72BzF2/sUcAG14h5fMsCNUS7RjvtJC9kGYWftgBs760Ahxk7g9hvHxEajQSV N67bEc9sOuPRaY4LrQf3viDXAuHJaIBW8rvgro1s+mxpKwnzvvgMhSBw0brrMrGbS1MdKxPatql
 YgFGUIZ7kd9o8iderY4nB4y0TlyJcLuZV18JpXpVgoB1Xnx0K57FH9wZmhgYVv9uHYlZAxQAMjV qKVTXNb4ptJLrUjkaF2hmU7RMBU44jWFy2D66aLmoBON5KSoc88uM/s6WR0CxYDJZlZLa0M813O 30Wf90kRIFcED1q0dpLw6nJQkS5Fq6ifX5FTcdB5QzhfcT8AWnbJURxH4gUZkvRVfBf5cSmZQdp
 fJ6xG8alAk0MTD83Yof4WJnOi0LDT9MFpAwFQYXo+Sz/WlJsKqtQwWGQUMA18+ht8Qfog9HZ
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 12:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215469

From: Archana Polampalli <archana.polampalli@windriver.com>

https://github.com/arsv/perl-cross/releases/tag/1.6.2

Provide support for Perl 5.38.4

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../perl-cross/{perlcross_1.6.bb => perlcross_1.6.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.bb => perlcross_1.6.2.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
index 295dd0cfc1..e4bd90c572 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69"
+SRC_URI[perl-cross.sha256sum] = "131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.40.0


