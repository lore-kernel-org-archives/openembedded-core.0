Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E98C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:59:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46.1692889147266758972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 07:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TML5L0mQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7600f699af=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37OAVN0v015414
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 07:59:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=AK4GX
	QUhl+4rEshpnK0gCmP4GFYNh/P/E9gyz4XcuOQ=; b=TML5L0mQwQdIPUyzBtAal
	VrapneH+lsRoAQ6l0Yd8iOI01yhB5/IAXjNesBA0pd1Mpp/T7FhBSyUWUiSHtSfz
	3oFmIW9t2ALWZ4cJ5lyEUkYaiJAlqpVmib6quK/jdi7TmBsTcBAhPEFFxwqU/Nb8
	ER3Dsbtc6fx8fxJNMSP32cAZUyanuDVgXwI2Q3KKillw9JLyykdHbjJ+OKsq2B8V
	Q8AloY4ekRYKyHxlLPc83arwlh7PfBgCJmbBZgevHBWv+oEpyQ8v3Fw4k67xfnVR
	vISI9HQInBE8glbsXN6RJxz9/8vuN2l/pcQYVjJU3dmDUNEEHm64gjNmabnTcLpq
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e20qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 07:59:06 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 07:59:04 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] ffmpeg: add CVE_CHECK_IGNORE for CVE-2023-39018
Date: Thu, 24 Aug 2023 14:58:42 +0000
Message-ID: <20230824145842.4174108-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: iZgAg5-fr2meDl9HBakqQxuDHs5QccCT
X-Proofpoint-ORIG-GUID: iZgAg5-fr2meDl9HBakqQxuDHs5QccCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_11,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308240124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 14:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186669

From: Narpat Mali <narpat.mali@windriver.com>

CVE-2023-39018 belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
and not ffmpeg itself. As per CVE description, it is mentioned as FFmpeg 0.7.0 which
is the version for ffmpeg-cli-wrapper and ffmpeg don't have 0.7.0 version at all.

Debian & Bugzilla trackers have already marked as NOT-FOR-US/RESOLVED-INVALID.
As it won't be affecting the ffmpeg package so, we can ignore the CVE-2023-39018
in ffmpeg recipe.

References:
https://github.com/bramp/ffmpeg-cli-wrapper
https://github.com/FFmpeg/FFmpeg
https://security-tracker.debian.org/tracker/CVE-2023-39018
https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018

Upstream master patch:
https://git.openembedded.org/openembedded-core/commit/?id=c21ed498b423c13463a4ae0bb475883cc7901847

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 7bd85f312a..8097b78ede 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -33,6 +33,12 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
+# CVE-2023-39018 issue belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
+# and not ffmepg itself.
+# https://security-tracker.debian.org/tracker/CVE-2023-39018
+# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018
+CVE_CHECK_IGNORE += "CVE-2023-39018"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.40.0


