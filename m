Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988A8C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:13:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1288.1748589193449720007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U5sj36016799
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:12 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5396873-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 30 May 2025 00:12:52 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 30 May 2025 00:12:51 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 01/15] libsoup-2.4: update patch 0001-CVE-2025-32911.patch
Date: Fri, 30 May 2025 15:12:55 +0800
Message-ID: <20250530071309.1603334-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530071309.1603334-1-changqing.li@windriver.com>
References: <20250530071309.1603334-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA1OSBTYWx0ZWRfXwwmWlDqQHiqA wj5b4V3shhm3adfqFmFrIrzFbFPSLShw1DPab/GkGUBm7ziqfAfhFRovbnnjryxWuwBBjVQSOfV Hbrw7YX8vdXsjG0g4JHgRNh+saI2yY+fjQa/u4P5z5y5RonbDX3nElPVV9vGPHta6q3uRKEuLrE
 OSUKCDROrQ9Eq0XAMyxWbsstsyUWpEPwIXpfuFIvMztntZC6VyabH38yNDBEgCp3EdOcIAy3zK/ cbI6EPbk3IlKWwYUHgH+CSFjTGt0OxLku3VPbGYyPydUNEZDO3bv47OG4o/h1SIUHQUzowN7Ylk MOboNWfTARHIZalIxhn5pm5gY+v/juX/P9bFab2qZ2kWl9GiZTQnCjhKcO+czwPJ8HHAHktFcAL
 WsSZ9YFQ+IXO+/6ZiKQEDZd6fB8MMY7dtqobYKan1Yrg+VuedIR0LQQti6HhKRR46Jj4WrF/
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=68395a88 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=dh6BuYzfZ955n3HdoDEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ixdGR9SqkBjrhkp3Wcyhlm2XHn2OORxJ
X-Proofpoint-GUID: ixdGR9SqkBjrhkp3Wcyhlm2XHn2OORxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=833
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217470

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-32913 also fixed in this patch

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/435

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/0001-CVE-2025-32911.patch               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
index 9ef0643837..d75594bb4f 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
@@ -3,7 +3,7 @@ From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 30 Apr 2025 14:59:55 +0800
 Subject: [PATCH] CVE-2025-32911
 
-CVE: CVE-2025-32911
+CVE: CVE-2025-32911 CVE-2025-32913
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-- 
2.34.1


