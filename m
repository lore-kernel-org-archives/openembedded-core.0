Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5913.1793787378171132386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 02:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fTwTh4sE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5768e3f886=abinivesh.ga@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48MCvW1736654;
	Wed, 4 Nov 2026 01:53:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=OpXbA1yXW
	om0WjH7iyO8dUEH+xi2nrDSozwhWueAhnI=; b=fTwTh4sEOMeFHqR5qk8pS3Bq/
	TwiVDz4wXpQWUXwu4jgUVNWIupqHZGaCydJRktuNx+zXkH52E5fv9fkxTQSxs7SF
	Ri67h44/tESKcDEGmhsVGRexf16elN0IkwV4s/CXUjYG9p1knzAUVXYDRvyUnrT5
	nXqxuqzHJ2x/497lZk+P6O/3ib7dUyp3hNlmtobWZP55fHPcTRvQ+6XKpqUtdtZF
	ohy6pIGJsYC/EDTE6/hs/GK80njHUE/iU/XmCyyXmyW6jDtyBw+UXuWw+DHzr/Pe
	ogoUlM+YrMWk9Qrj65O96tYd3kAjZXMUa4eE6405pWsVnQkQ1YFGmeC9z7ajA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hnfue5qc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 01:53:30 -0800 (PST)
Received: from ala-p2exch01.corp.ad.wrs.com (10.11.226.101) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Wed, 4 Nov 2026 01:53:30 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-p2exch01.corp.ad.wrs.com (10.11.226.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 4 Nov 2026 01:53:30 -0800
Received: from oak-lpgbuild12.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 4 Nov 2026 01:53:29 -0800
From: Abinivesh G A <Abinivesh.GA@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yoann.congal@smile.fr>, Abinivesh G A <Abinivesh.GA@windriver.com>
Subject: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
Date: Wed, 4 Nov 2026 09:53:28 +0000
Message-ID: <20261104095328.2295613-1-Abinivesh.GA@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: FNA2BgaCe8fUVbOFtPIv5TiWqrwvKiV3
X-Proofpoint-GUID: FNA2BgaCe8fUVbOFtPIv5TiWqrwvKiV3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzOSBTYWx0ZWRfXzZXYD1jV8SFS
 TR+3EL+wfYaRFAfLsIMxdqZPfyoOhSuqIdmHn5kYZH7TjNYls4zbIpm6CW4bCkJwm2tNmBzmgDV
 6KEiCwZywNnyPfrXfD66NHblBsdKTagBCOjG1yEk1SsHmA120bFU6w+GZ6bfA51bHnSKU6TmACY
 +YjPwKrffWJsYV2PEw0epGau0Jd5gkGs3RVv1Ei52nBAnwbS/+6goaAfVSabO6HZYcuM1Gf3D/Z
 TbEH0wVvkdtgW//CzG9+rG0+kr5+EHqlYE2yLuE4YU9poHGyzHGLDp2epECHUxNjJm65X7WrkMp
 i0cTv6WkDDpuYWdVu5nIsK+/yCeUykmDnhr4ukJys+GagsEiGqgnK2HVtVoF7DC5cOOMIanE0bF
 4Kn4Wu3lvFP02Hh9K3oC/h6q36YmMYtTpl2If+rvr6oCC1zU8BdNtGBGDZ87/xpRmy3ohBBTNSw
 mkNCOCvpQylJ4w48DNQ==
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6aeb009a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=5fZKPoO2FM44ekDmq-gA:9 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzOSBTYWx0ZWRfX9M21vNGRra95
 j4Q/wJfU0Su206n/L5oxd/W79ptNwB1TqXCJlheY8NwhprsTqbNW2+pDi4a2fqNCMKpDUtWSp+i
 O/oJgSwjD0JwqGLChU8vJoCT2lOYPZb06R7LBVtCk4nzBBAaesTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040039
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249362
Content-Type: text/plain; charset="utf-8"

FFmpeg before commit 1c10bcc contains a heap buffer overflow in the RIST
protocol reader (libavformat/librist.c). librist_read() ignored its size
argument and copied the full payload length into the caller-provided
buffer, overflowing it when the payload exceeds the destination size.

Backport the upstream fix that clamps the copy to the caller buffer size.

Upstream fix:
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3db142ce390602

CVE: CVE-2026-75143

Signed-off-by: Abinivesh G A <Abinivesh.GA@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-75143.patch        | 32 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch
new file mode 100644
index 0000000000..418fcf029a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch
@@ -0,0 +1,32 @@
+From 1c10bcc2e17255dacb717a25ab3db142ce390602 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Tue, 4 Aug 2026 12:11:55 +0000
+Subject: [PATCH] avformat/librist: honor the caller buffer size in
+ librist_read
+
+librist_read() ignored its size argument and copied the full payload_len,
+overflowing a smaller destination (e.g. via the async: wrapper). Clamp the
+copy to the caller-provided buffer size.
+
+Fixes: out of array access
+
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3db142ce390602]
+CVE: CVE-2026-75143
+Signed-off-by: Abinivesh G A <Abinivesh.GA@windriver.com>
+---
+ libavformat/librist.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/librist.c b/libavformat/librist.c
+index 9669d5b5df5a5..3c4b5e3e5b96f 100644
+--- a/libavformat/librist.c
++++ b/libavformat/librist.c
+@@ -226,7 +226,7 @@ static int librist_read(URLContext *h, uint8_t *buf, int size)
+         }
+     }
+ 
+-    size = data_block->payload_len;
++    size = FFMIN(data_block->payload_len, size);
+     memcpy(buf, data_block->payload, size);
+ out_free:
+     rist_receiver_data_block_free2(&data_block);
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 849835c849..cae84d044e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -32,6 +32,7 @@ SRC_URI = " \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22921.patch \
+    file://CVE-2026-75143.patch \
 "
 
 SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
-- 
2.54.0

