Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6947CC10DC3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 06:44:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.93772.1701758651765923773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 22:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JqRfecym;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0703deebc2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B55iVZN002246
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Dec 2023 22:44:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=24HoofeV3SqFw6gCIc7bU9vJcfFN/+CJZJZKSw0nNOI=; b=
	JqRfecymYD51YpFjSDIrcCE7EMKIIBx9oC3tJJQ9ZiMP5S1A4Z5zoHT/zF6PZyV5
	LO30QklNGSg61dLYquUtR/qQN3jkoUs+dnY2BrdPwpElmnCwV8eX0jWMQQ6cwWth
	pSb0h2qUgBr6N58Qaqr6Jykyhb1mrUKZnHTeWiIXNa3Q/Ws4ZTxJ9LZ2QL4BEgYK
	CAJn7UV3iWv9LwaGA0AUvsnuo5w5J0iLiWkVDAxd7aZoC6kHnzOomRWW9qC9qPfz
	kvhJwJ7h4zpIAkVTTjJhzsagrd/ufCNtc7WW5Mj5NYtgZXYUJVcbToxq8jb2P7G3
	6b0h2JaOlXdHzHuSQ/fo3g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur4ym26hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 22:44:11 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 22:44:14 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 22:44:14 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] gettext: Upgrade 0.22.3 -> 0.22.4
Date: Mon, 4 Dec 2023 22:44:09 -0800
Message-ID: <e132753bd1e09d0e6eb276b2ad9302a7d7a184df.1701758555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701758555.git.liezhi.yang@windriver.com>
References: <cover.1701758555.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6T24fo_ueBPAfQGssy2e2bOAlSOmH-aj
X-Proofpoint-ORIG-GUID: 6T24fo_ueBPAfQGssy2e2bOAlSOmH-aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=844
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312050053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191798

From: Robert Yang <liezhi.yang@windriver.com>

From NEWS:
Version 0.22.4 - November 2023
* Bug fixes:
  - AM_GNU_GETTEXT now recognizes a statically built libintl on macOS and AIX.
  - Build fixes on AIX.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...inimal-native_0.22.3.bb => gettext-minimal-native_0.22.4.bb} | 0
 meta/recipes-core/gettext/gettext-sources.inc                   | 2 +-
 .../gettext/{gettext_0.22.3.bb => gettext_0.22.4.bb}            | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.22.3.bb => gettext-minimal-native_0.22.4.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.22.3.bb => gettext_0.22.4.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.22.3.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.22.3.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 31dabfc5436..8b4e2401010 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "839a260b2314ba66274dae7d245ec19fce190a3aa67869bf31354cb558df42c7"
+SRC_URI[sha256sum] = "c1e0bb2a4427a9024390c662cd532d664c4b36b8ff444ed5e54b115fdb7a1aea"
diff --git a/meta/recipes-core/gettext/gettext_0.22.3.bb b/meta/recipes-core/gettext/gettext_0.22.4.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.22.3.bb
rename to meta/recipes-core/gettext/gettext_0.22.4.bb
-- 
2.42.0


