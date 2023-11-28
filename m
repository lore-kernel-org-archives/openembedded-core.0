Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA375C07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 07:55:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27918.1701158110256132935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 23:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YcX+v7Ns;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9696e6ba9e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AS5ujia024661
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=wwBbiU3AK1cAJbjKkdTu9MNMFRVNR1Jdh33c2oRf5yU=; b=
	YcX+v7Ns1SUFYjEc2+m/02Abyh5lUNlZVBst9brrsl+xJnBhOTgElXVBHY7qKQEa
	XJlLH8UUQJ3Q6XKGnB821KCNUCz/tYMF8FxkWbTfsZLK8yLVQaqKceLf8w2DTMGT
	Z1XmpUPkSL5clpvf7Xagz1jPAffeJYDw8DLnLQsGhI5dyxsX2hmQ0m9VkluE91nc
	wsv0DEWTq8TWQjXDfwHr2r2Sh0+SZ7mPOxGMKI5OEgt0MSBec8nOQ0AKHqIYE1+v
	QosH9Ur5B055PkHUMcjyDj0AojXqDl12ENn42TWX9O8Q8WDQhbK8cQZLQs+GOJsO
	VwvD+lBJjzD95LuvGA4GDg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk7w6jdg4-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:55:09 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 23:55:15 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 23:55:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] gettext: Upgrade 0.22 -> 0.22.3
Date: Mon, 27 Nov 2023 23:55:07 -0800
Message-ID: <72126435c542078536e0322d6c9f0e09cda7e5a3.1701157879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701157879.git.liezhi.yang@windriver.com>
References: <cover.1701157879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6SgoTX_Nflw6NEaw1PxPOY2dVV1CzDYl
X-Proofpoint-ORIG-GUID: 6SgoTX_Nflw6NEaw1PxPOY2dVV1CzDYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=669
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311280060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191339

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-minimal-native_0.22.bb => gettext-minimal-native_0.22.3.bb} | 0
 meta/recipes-core/gettext/gettext-sources.inc                   | 2 +-
 .../recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.3.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.22.bb => gettext-minimal-native_0.22.3.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.3.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.22.3.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.22.3.bb
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index b4fb647916..31dabfc543 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"
+SRC_URI[sha256sum] = "839a260b2314ba66274dae7d245ec19fce190a3aa67869bf31354cb558df42c7"
diff --git a/meta/recipes-core/gettext/gettext_0.22.bb b/meta/recipes-core/gettext/gettext_0.22.3.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.22.bb
rename to meta/recipes-core/gettext/gettext_0.22.3.bb
-- 
2.42.0


