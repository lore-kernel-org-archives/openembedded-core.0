Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB93ACEBF97
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 06:37:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3724.1763361432158158028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 22:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JaBVFYYQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH3xCAs1234247
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=mimkGvAqn8/GwMp4mOss+jiNEPNJi0hilpzuIbMIoBE=; b=JaBVFYYQ1P7J
	0IsgXIUmqUsZg4YPf7daqy9EUY+5c0uxmiT9ibf8TSk380/YLA2WggCRIFFFesSu
	L1RqHMk+5dXPd4bmKiT//2ujJX71X1iK1jPYiAqjFHqKwixZ7KLfNtZPuSUMnuc1
	Fmh22gZHkYEv7e0bP1izTZBLmht671UWJTVHLQcsohtc0R0lDq7bfhd5sFOFFn9x
	qC+k6GJIF8H55plAyaz17im9XEoTdpei48grHk0FAzs839oT3EE1VWbbfmyh2RZ/
	A+5YHNqWhdmTuK3YIxQ8djJTIPgfuoiXbFPMZvyhBE0rSaUsovBS39tdBhlFVMn8
	RXAoGE4qbw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2sewm-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:11 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 22:37:10 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 22:37:10 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] git: 2.51.0 -> 2.51.2
Date: Sun, 16 Nov 2025 22:37:09 -0800
Message-ID: <08e4f6c72879da26e3925fe0d5e42514c97b9a02.1763361341.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1763361341.git.liezhi.yang@windriver.com>
References: <cover.1763361341.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1NCBTYWx0ZWRfXyRUti/7P2VUz
 qJaqXO5M4rHjlDeu2bkpxFIkoWGU/a/S7HHbChC0yLGOoN3Zo5FuNbG9f6obme6c4tr4f2niNHB
 dR4r9KiZQlYlYSAPsYCKTzE9UItcycLlBn4WPTtnxYH+bsfy5uhjtpMx9hnfaCvmNIV6rRhaBRZ
 +qacCVW9BNXUFA75hoWWJN9Dm8xBWuV5fq4PzX7dwpXJDyOIKT4uMwlbZEMnmpR1SrRjf0dQzZc
 nA3Nf4JV4NjRnL3n3QsAuHLS3WkPGMk742tgXjyhoLEwo6QOaeZif+yuuODHKsAJI6Mb+1Kl89b
 1AM1QYhVeTzP5KtRhwb1x3s1J3FQhe1HAhOOMARhRsfKJF/4fldFctu8IjyRCdAq+qFLLPEhQQP
 AcoHDTXb3BidoILzTB400B99QVNg3g==
X-Proofpoint-ORIG-GUID: oxZ3GE3HVUNANLD6PjBj7Yv42zYzf9Ld
X-Proofpoint-GUID: oxZ3GE3HVUNANLD6PjBj7Yv42zYzf9Ld
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691ac297 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8
 a=qOQEsxbX1Xo4Xe_MVu0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 06:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226486

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...config.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 4 ++--
 meta/recipes-devtools/git/git/fixsort.patch                   | 2 +-
 meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb}    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 61bf0e12dc..f55282fcca 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 325c30dac4eafdd463c8ffcfe1215858d642ab91 Mon Sep 17 00:00:00 2001
+From e8aebf375140b67fb48baea10af2ac0088fe6768 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,7 +17,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index b12d4e1..b5b8d82 100644
+index 1691c6a..00d0f93 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 7066e1808d..8c60bd5c21 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From 65fa5c0f849fe4a1e3cb8e6af0086ef0748c28de Mon Sep 17 00:00:00 2001
+From 7b509d1e3f9acbbe0c35ef62f54cfa2ed8f9a740 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
diff --git a/meta/recipes-devtools/git/git_2.51.0.bb b/meta/recipes-devtools/git/git_2.51.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.51.0.bb
rename to meta/recipes-devtools/git/git_2.51.2.bb
index aeb8c54aa0..14d5a3d60e 100644
--- a/meta/recipes-devtools/git/git_2.51.0.bb
+++ b/meta/recipes-devtools/git/git_2.51.2.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "3d531799d2cf2cac8e294ec6e3229e07bfca60dc6c783fe69e7712738bef7283"
+SRC_URI[tarball.sha256sum] = "9b44c2b337ec838e10aad42439d390963904449710d30c9e7e4ba449f45da98f"
-- 
2.49.0


