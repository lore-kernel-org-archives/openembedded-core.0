Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB75CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 01:58:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19338.1780279134376878837
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 18:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VcxXQ1VD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061255d6c9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6511gd5U2290195
	for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 18:58:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=e8V3yfyMqVcOtq76oKDR
	lUqWUyak5EdGBdvK6uLVTWU=; b=VcxXQ1VDEus1NB2ww1/LaSiKbNjn/VI1TuQS
	oWkNGL0VBH5qQ6cPze7JXjh/V2OPPLrrHF0ZX1YtzMo9RNlFc18A7L3O+2MsrrIw
	edXrAz6fzH+5Yy/h6Ff5z5MuiZxikxWysEMDMhUvJ80za3S74icO3SAlw5dhID1b
	INl+1K8YeBXkNOnMjC74jI7+H31eCwzRai/W9pflPP1671I72idbsNUfsygFBymZ
	hrNECTHCcWFFjdFQLKKI8iZwQz4Mv6LM5H2eCCd9X+FAz0jbfdMCw2O24zXM1zra
	Unkcm016i6TVwzsMAfhx1dw9fe9Cqi2zkTK/G/N/emxasA0iKQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efyde9wpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 18:58:53 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 31 May 2026 18:58:46 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 31 May 2026 18:58:46 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] valgrind: Upgrade 3.27.0 -> 3.27.1
Date: Mon, 1 Jun 2026 09:58:45 +0800
Message-ID: <20260601015845.1591418-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAxNyBTYWx0ZWRfX/AVgZISE+9/i
 Wq2yTV9wH7nSGCFMlNfWhx/ODFEnvcvDm+OqnGQG43PyKByS+Jwd23fwVbQ2no2J8YKBBGma4kR
 mje1bQqppcllE48TNGrcvyGjdKYc3oXijarGEZaWoP/II8hgGBuOFgdX15eF92a74z2DIIzQP9R
 1Hd18DLRleReiraT2Oc5dUS3fE76AKqZD4ZAddua0RLTVTFJK+NdHRijMIRvwi44kiD/SIvuD3J
 uHvXCjAAiPQnT+f7aqQIqKIhhzpVR3G3StqnnCfbi7mN5yyNWnQbvUYNqopADS1f8exU2Y2lTCY
 Baagj7DuZCIfAQ0dKYlU/IHmyrmsO6oNorIf3xBFoEAc8vI9PxukSYkj71WJZXLKFbtdDuBzME8
 YUxAzAb1p27heQVe9x+M1124WzvHT3J3EekfqC/9lpOcdEln7WWyw59yXPw0Z/BB7jFXaiaWraC
 755usAuVKNr56/YDtHA==
X-Proofpoint-GUID: Q6-aRdYpFedUor0hgJXW3xPPB5e01TkZ
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1ce75d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=3fyaaF4VAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8
 a=XpOTF-5gtVyn3Wt7KRgA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Q6-aRdYpFedUor0hgJXW3xPPB5e01TkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 01:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237806

From: Mingli Yu <mingli.yu@windriver.com>

This release contains only bug fixes and thhe following bugs have
been fixed or resolved in this release.

519574  valgrind 3.27 "--fair-sched=yes" does not work
519613  Valgrind incorrectly unpacks the result of sys_port (port_getn)
        on error, leading to a ~60s wallclock time delay on every call
n-i-bz  Update vg-lifespan (copyright) years
n-i-bz  Use SSizeT for VG_(readlink) result in VG_(realpath)

To see details of a given bug, visit
  https://bugs.kde.org/show_bug.cgi?id=XXXXXX
where XXXXXX is the bug number as listed above.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../valgrind/{valgrind_3.27.0.bb => valgrind_3.27.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/valgrind/{valgrind_3.27.0.bb => valgrind_3.27.1.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.27.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.27.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
index 4886dd0d3b9..1b08f2fc5f3 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.27.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
            file://0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch \
            "
-SRC_URI[sha256sum] = "5b5937de8257ee8f51698ea71b9711adce98061aa07daa4a685efc3af9215bef"
+SRC_URI[sha256sum] = "5d589152eb8071c02feab8ce6ab719e431a1fbc3e2b1700f5432632a8b9264dc"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
-- 
2.34.1


