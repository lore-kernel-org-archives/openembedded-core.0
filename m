Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B5ACAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:56:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10949.1758193006527100986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 03:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qz8umbew;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13560942fc=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I502Pw3465298
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 03:56:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=WgfrlNPhQ++ztIbgKyO8
	G+PeCIg+j5DUtpTe129lvDw=; b=qz8umbewnfEryNdPh9G4p5yjJ/6KFa/b+0ZI
	yaugu/rWh55eDPTvVqj2mb4RbT7AaVADVd5TX5065ek07Ghvh9KIRTg6PZUF+TZN
	7nwm8fnxUEoGVIeR5Dcdg25d5r1BZp08yTYJ27KxOEhWpRVr6gGMirDcA0vKQksz
	9SE4W/+dqO7ktxoqwuYlCtRrB7hItHtDMC357vn/f8rLpvrARuAFrYx0EL1xKSvP
	URsnjjsbYC/gR9TynQp2E/7L84bW2+jbfBfwv/i0ZS5+CyhOYjCgv23eKgRnhlES
	U5g0EopwF0c62BNPgCqiL9bCC83ViUYgZbrxpoIBqNFTVF6YyQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr1y0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 03:56:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 03:56:45 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 03:56:44 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 1/1] ffmpeg: upgrade 7.1.1 -> 7.1.2
Date: Thu, 18 Sep 2025 16:26:28 +0530
Message-ID: <20250918105628.2873197-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: w3y2FtDVTEgwgnrSwXAsGjA3adbOzZg7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDEwMSBTYWx0ZWRfX8aWA7wVfrrWc
 hEKoZTDGina0Nv8kkfQEfkeu8j/aKVi35eKCdgjd+I+SmDv/adsJyExhNC66/Ot1NjzatO6Gf9B
 ZJekWQ7ILUefESNUKMyMmGOaiH00vAU9Ycf1RPc7o4mwoQRgSku5eCoJ7Xrmkl6eC8+Z2g65SAX
 NelnYWLeYBLFijFQItJamYLVn5IoCTGUCERR4lKmT54pW13qPhDA5brS6KFUTIaUpnYySIFLrJv
 wjph55wU4i2Kd/WclN7IwVGpM0TctxwJibKx+ljaCZ+kfJIN7k0zrgVQK5T/vCnUhKB/A55xOSK
 m2QiNIxciYFyAnIaZPRlQufMfTaEdlzbWAUwSjC/i4Zv9YcmIyqYCvjQxgzfmw=
X-Authority-Analysis: v=2.4 cv=WvsrMcfv c=1 sm=1 tr=0 ts=68cbe56e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=PYnjg3YJAAAA:8
 a=t7CeM3EgAAAA:8 a=sVqlYstdVrQjSWnYztUA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: w3y2FtDVTEgwgnrSwXAsGjA3adbOzZg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 10:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223634

From: Archana Polampalli <archana.polampalli@windriver.com>

Fixes CVE-2025-7700

Changelog:
https://github.com/FFmpeg/FFmpeg/blob/n7.1.2/Changelog

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/{ffmpeg_7.1.1.bb => ffmpeg_7.1.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_7.1.1.bb => ffmpeg_7.1.2.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.2.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.2.bb
index d5252bfbdd..1c49bb1fc3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-22921.patch \
           "
 
-SRC_URI[sha256sum] = "733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1"
+SRC_URI[sha256sum] = "089bc60fb59d6aecc5d994ff530fd0dcb3ee39aa55867849a2bbc4e555f9c304"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.40.0


