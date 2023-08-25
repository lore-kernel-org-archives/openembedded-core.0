Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F71C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 07:52:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8796.1692949943361312198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 00:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=axhlxJXb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=760197fd70=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37P6s8bU003318
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=SesmS
	KGwjjfIRQCybdEiN5ve73TJsE9QmdVpDtmVVcE=; b=axhlxJXbH/C90LE6RG8J0
	vweplNs4oQ/o2Tt+lJJr87H7/pB+sEm5LlKLM1SlGI0dBaq/khHMM7Tfvppb2Z9o
	F6beXpCZF66fH56Dwtuzr3Yg+h41Vu3kxQxZHo+YUo4r/u6SpnQeQa77mEqq6e8o
	7LDTEuJPs6sIXaW3kS7drnE1JRN267b5GM8uBLA6xw3VA7IG0L8LK2DF4IdJ+THD
	JfjG14ERCGhUHq8aKjdx8dGUDwzlTybFciQW8ppM3IunefSCpCyPNntoKdu4+8w+
	DtjbJ7uTsqHPwE74FUyAQXPmfu0cJi5nH9SQHbk+wwvQAJDA0qX3l2+zDypv/5OZ
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mjxkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:52:22 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 00:52:19 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] ffmpeg: add CVE_CHECK_IGNORE for CVE-2023-39018
Date: Fri, 25 Aug 2023 07:51:59 +0000
Message-ID: <20230825075159.2000589-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 95rzDrhzUhgP6K6xvSr19vegPNX2py1c
X-Proofpoint-GUID: 95rzDrhzUhgP6K6xvSr19vegPNX2py1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_05,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308250068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186697

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
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index cccd9f65ab..aa5a8681cf 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -30,6 +30,12 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
 
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


