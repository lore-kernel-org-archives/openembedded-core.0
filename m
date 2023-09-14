Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D749EDE99B
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 09:04:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7408.1694682269695089095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 02:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U92zos0T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7621668a22=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E6f7fL007693
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 02:04:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=sp7rE
	3zHNZvA7tGTFLNFB75Z8J0MEKPdX1lgsns4n2U=; b=U92zos0T6PBMNH6EFrn8I
	CQS/5rZd4Vdg8nUh90854t8g5QLRZH8OH3/iCtcIp9CyTZZiOfwcS9Mh7MhNoQmN
	gu9xRtbm2ncH8YjNjfngfOueG/eJT5+gsFbqlUxV9CaQG5tpS+VrhwYA8+mEdV9b
	GMEcKTudb9gLVYPAHbqQ0u3Msvt6mza2l0PhnuheWU/cHefyzk0bzHvWs36yzbmN
	BiGe80gaNtgW+zU9ESilvIynzl9rem5nDZKckTXN7U8S9VjLgBYZaqSunhjz3tmR
	YYpIMko9NKSrXWfgssVvsGBZDXMzLtJ5wU17nJojbdWUPS4PncMxjvxCPzijg3ag
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y829jvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 02:04:29 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 02:04:27 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH V2 1/1] vim: upgrade 9.0.1592 -> 9.0.1664
Date: Thu, 14 Sep 2023 09:04:15 +0000
Message-ID: <20230914090415.1460689-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: cUUkks9Ow4x3RKfMqbqxh7cjqjxqxdTu
X-Proofpoint-ORIG-GUID: cUUkks9Ow4x3RKfMqbqxh7cjqjxqxdTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_07,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=593 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309140077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187626

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-3896
8154e642a (tag: v9.0.1664) patch 9.0.1664: divide by zero when scrolling with 'smoothscroll' set

(From OE-Core rev: 4a1ab744142c9229f03a359b45e5e89a1fbae0d3)

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 83ab9ea5de..8a399cd802 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1592"
-SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
+PV .= ".1664"
+SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.40.0


