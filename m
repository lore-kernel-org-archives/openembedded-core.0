Return-Path: <Sandeep.J@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72490C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 04:08:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.143320.1783310915056872789
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 21:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VeBnYpxX;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild12.wrs.com, ip: 205.220.166.238, mailfrom: prvs=1647fe4193=sj10@oak-lpgbuild12.wrs.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666402tc2427341
	for <openembedded-core@lists.openembedded.org>; Sun, 5 Jul 2026 21:08:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=sc1tnDpsG
	MD5qGweRDR/PIlrzl6FAJGciGKxjgSKs7o=; b=VeBnYpxXffyseH/XVxYJBuPEY
	/29VA+pxkDID+6vSbL2atY+v6t1B7gUCy0xhrrWpkICNoABVlmf3Cbo45QtWGrww
	0+dd3U4UxDZbJDGaHyVNMZnTfvu4/7XbhEtiiF/9CPEIqGbTyjIlS0xbjdI20kcu
	KoWnZ7t9BhvUNIQhhmxHWA3t70+1XobPYrl/GAQNcL/7FHLhuUtd5lU8ZAQrcfrF
	n3kCy+YAzVC8tRuBEMiidkwAS8YgjeqbN3gJs2VEOJsBfDveGzU+wUe3sBhVIojV
	E7nfjun3cf5K9Xr4Cc7J0dTa85wMMtpxzsfKVkOq3eeW2o+EM1cnbmR1MRq3Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f71pe1aax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 21:08:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 5 Jul 2026 21:08:33 -0700
Received: from oak-lpgbuild12.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 5 Jul 2026 21:08:33 -0700
Received: by oak-lpgbuild12.wrs.com (Postfix, from userid 1762445396)
	id 9AD7E3900104; Mon,  6 Jul 2026 04:08:33 +0000 (UTC)
From: Sandeep J <Sandeep.J@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, Sandeep J <Sandeep.J@windriver.com>
Subject: [PATCH] pybootchartgui/README: fix broken bootchart.org URL
Date: Mon, 6 Jul 2026 04:08:33 +0000
Message-ID: <20260706040833.1138974-1-Sandeep.J@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OvYKCAHaLSn9Yh7-PkbuJ-AjX4iDbqWe
X-Proofpoint-ORIG-GUID: OvYKCAHaLSn9Yh7-PkbuJ-AjX4iDbqWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAzNyBTYWx0ZWRfX8HRAwaVkhd49
 tTtzPHXKV+d4PN1p4ynFEsUw4X3NKeasde8SuFGcNFxxRxU5IOg9R7jlhxxhh4B7t4k6TXVyCMA
 28HVLa+1wpkg3GuauTajZxaZJo3Y+acZABOGvwajXBSzZdGgmLo2nKW6jjQ/5ilLXW3kh+zbkg2
 JhcZuAqiY4Hg8EhdDdGF4QMyWBItuWL1AqwHI0Gjloo9PjpKvWXNdrGfUnAxqGSmb7Mj7N7NPPk
 2mHJrpnQW6rU7w+MmltQfaH9yYBC8uLwmTevmLfXCfXaHYhrRSAHxNt6SgS7LtyZtwPVVHSHbbV
 midGzGtnkHY9o5yHHFMKbCLtylEWmuly8IkRTduBpfyibk2q+1ycmvsETS9kl6SVoHlSy5lhot4
 C8a3hGeDP8yAMvjxQ83iKoPrRB/l3f6jt+emZhTrgVVGGvHhCRWVkpl+o9bAhxCaDKo6tnALKXS
 bex3SHF3gL/Q8oz9QxA==
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=6a4b2a42 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17 a=GCG_djx9AAAA:8
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=FP58Ms26AAAA:8 a=1XWaLZrsAAAA:8 a=t7CeM3EgAAAA:8
 a=AybMzVRtEybJ-25xkIEA:9 a=GSNA8NUg-b3WfXp_Wzky:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAzNyBTYWx0ZWRfX7dzsgvbzvZUd
 8nH4fIexK2N5Y1m9kcW8nJtSeklzVJjfnUZ9F3dr9k5CRl4N/GyIZdxAgnd1FS7WZaI48P3g37V
 UzSjjij9zQ2521KZ7e+izX++AnrMwXxq3RLELR1kFwE4zhc3l1MB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 04:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240210

The bootchart.org domain is no longer available. Replace with
the current project page at bootchart.sourceforge.net.

The upstream GitHub repo (code.google.com/p/pybootchartgui) uses Python 2
with tabs indentation while oe-core uses Python 3 with spaces. The two
codebases have diverged.

Signed-off-by: Sandeep J <Sandeep.J@windriver.com>
---
 scripts/pybootchartgui/README.pybootchart | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/README.pybootchart b/scripts/pybootchartgui/README.pybootchart
index 8642e64679..9b752cddad 100644
--- a/scripts/pybootchartgui/README.pybootchart
+++ b/scripts/pybootchartgui/README.pybootchart
@@ -4,7 +4,7 @@
 pybootchartgui is a tool (now included as part of bootchart2) for
 visualization and analysis of the GNU/Linux boot process. It renders
 the output of the boot-logger tool bootchart (see
-http://www.bootchart.org/) to either the screen or files of various
+https://bootchart.sourceforge.net/) to either the screen or files of various
 formats. Bootchart collects information about the processes, their
 dependencies, and resource consumption during boot of a GNU/Linux
 system. The pybootchartgui tools visualizes the process tree and

