Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258B6C7115A
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 15:00:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13633.1692370822778776690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 08:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ImmehWKY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7594b91f67=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37IDhcss006741
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 15:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=OLCXD
	niWkcEH8Dd/gq10kckKmP5hVT5fXW64j+kz3UY=; b=ImmehWKYG4w822juxHF04
	axdVzpHtTj+CQeiqMiw9o5bZsyhnBAMX3H32aCnJin5zHp2nmxC4Pjxl+Ro/YpAz
	oLx9j73Yd7F4D6ttHqplhK6rQHR4MZVSWD7ZB+qM9lHtQVVBGtj0k1hrYWYjyB2I
	0UCHJnlj/Bxp263pvBjcKWOEbEdjrpoZJDofmeJzYPPt/cb82XVbvxr1gg/ZHzjd
	shTIiPkjyTbB4Uy1PkAQgBEbgIAl79CLAT0+FvU+ySsLRtaEXnUOKfI74mEVnQM4
	TRFBlFTOL+Im3iV0bD5dNTTQEfEH/L+KjnxHrT6IonIprNGuNe1dzmhF1lNKOnMM
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125x19m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 15:00:21 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 08:00:19 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] ffmpeg: add CVE_STATUS for CVE-2023-39018
Date: Fri, 18 Aug 2023 14:59:59 +0000
Message-ID: <20230818145959.2231415-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: whbz9bF0UDSm_KsWkTuF3by83TvjONcQ
X-Proofpoint-ORIG-GUID: whbz9bF0UDSm_KsWkTuF3by83TvjONcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_18,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308180136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 15:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186376

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

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index 07c641dc96..eb8dcad8a2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -28,6 +28,13 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89c44e47e289137082"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2023-39018
+# https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
+# https://security-tracker.debian.org/tracker/CVE-2023-39018
+# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018
+CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wrapper \
+(Java wrapper around the FFmpeg CLI) and not ffmepg itself."
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.40.0


