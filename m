Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CCECCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 14:00:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12531.1761660014927210463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 07:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qKJuMx57;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=339608d990=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA3QWv984637
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 14:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=cxJYvfx2ZxCK1vd91Kik
	nT2nptMAIAsNs42BQRkSEiM=; b=qKJuMx57zSAceq78MQEitY/ahZDm+oKOmF9J
	MSaj8H6v/RIZFnFenfHKIXoSwXF5kLwPB95TmAUNSIxzlY8lt2gYUyvFqBCuU76j
	X+2t276dmOjTGaPc7xj1sV3jAKXQsOZLS+InEKsrQeefeMvW+hFgL0ABM8wJjujs
	wD7VgufkbVK97CcrHqI/29EGm/EErV9XTe+gdtJ5kcUQNIIC+6xGencjuq9lIjoa
	cg8SkwpogFh0f3gZA/6ns/qEnnyV+a2XwaE5IjacpRsC3b8zBzx3tV7Z57d9pCcK
	NMMLfBq40NQB4yVai/Yrt8RRKxjXeAiAy1Ask3OGfAOoNJd1aQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0ks03arn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 14:00:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 28 Oct 2025 07:00:12 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 28 Oct 2025 07:00:11 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH  1/1] openssh: Upgrade 10.0p1 -> 10.1p1
Date: Tue, 28 Oct 2025 19:30:09 +0530
Message-ID: <20251028140009.2164260-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sT98drgcV0ePgZEYmpAlxY2Jyemibt8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDExNyBTYWx0ZWRfX7WI7txY6rUHz
 ejhVpmmRs/C9UD5+lDWui2ggOiGzjtDS0TwH2Sj6LJjXNQQjitw51KtMY5GDiXcouW6PdsPjoUv
 YIeMNHtndqCFDc5IJWxX6OIz42B3m8vCOCYYp8WJdA/LPyAqJb9/OEHwM/lH3o3nie9Bb8ZpU5Q
 Jd1Sf6wWtgTzcj7RaJn9EwFCoZRn4SryFOL9wE6MzHfsuvNVdIndEOyKV4x0LmkuG2ttHaGOtYT
 krlke5OlLu/xAGkv3ZLhhmb5kt5g7I4BbmeaJbGIpMSb1avKP6pyDj8KJRHvVUybbFNSJzNK5F9
 Jufaynh5ST+GdxetqBlHl/QVLfqjhxEvLAv0SPEl5+WUe7vMVjab5Vd2hZZGvHYbVxl8idTXECy
 rc9ZSLWdT8cPNrdSW9a2gWFuUZfhUw==
X-Authority-Analysis: v=2.4 cv=CIknnBrD c=1 sm=1 tr=0 ts=6900cc6d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t68Z-ez5AAAA:8 a=3tcz3bTJAAAA:8
 a=t7CeM3EgAAAA:8 a=kTnlsyndWIyZE_n75wQA:9 a=nYJUwS0ZycoIGgkYIbvB:22
 a=4EbjBm0RLgFgoQzmu6QD:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sT98drgcV0ePgZEYmpAlxY2Jyemibt8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 14:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225409

From: Archana Polampalli <archana.polampalli@windriver.com>

Changelog:
https://www.openssh.org/txt/release-10.1

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssh/{openssh_10.0p1.bb => openssh_10.1p1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.0p1.bb => openssh_10.1p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.0p1.bb b/meta/recipes-connectivity/openssh/openssh_10.1p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.0p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.1p1.bb
index 2f446b5540..83b6183858 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.1p1.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c"
+SRC_URI[sha256sum] = "b9fc7a2b82579467a6f2f43e4a81c8e1dfda614ddb4f9b255aafd7020bbf0758"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.40.0


