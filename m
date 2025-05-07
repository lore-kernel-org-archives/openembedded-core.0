Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF65AC369DC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 04:58:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.938.1746593916137816147
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 21:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72228a98f6=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5474U2rG003437
	for <openembedded-core@lists.openembedded.org>; Wed, 7 May 2025 04:58:35 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46d8c143wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 04:58:35 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 6 May 2025 21:58:32 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][styhead][PATCH 3/3] libxml2: upgrade 2.13.6 -> 2.13.8
Date: Wed, 7 May 2025 04:58:05 +0000
Message-ID: <20250507045805.1210982-3-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250507045805.1210982-1-divya.chellam@windriver.com>
References: <20250507045805.1210982-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=NIjV+16g c=1 sm=1 tr=0 ts=681ae87b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=GHR8O2WEAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=qaMvXGgnssOI9KKGi3EA:9
 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5-LW1aTxx2ruP5i_EyM8fHNaRlj9O3S4
X-Proofpoint-ORIG-GUID: 5-LW1aTxx2ruP5i_EyM8fHNaRlj9O3S4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA0MyBTYWx0ZWRfX9LrKJ7/P2y9h RyBdEhfPlFHSBAGZvnCupyswafGMG8g1dDG10k19dm7FgQxk/fJqKwv/4SgJm7Oj9kQN+am9e8U J7MDekK9ZfbNrJ7ArtSKlCav/fU1M1D9qOEHFXt/LLIWFmw3AhbwI4T+p8m7jxuMDPhBqW/fPrO
 22OlSv/SkojJ4p/NOqTVrbadajeSeA2fehcrWwyGGnR+pt8zHavpWnDuzueWFE9gHtq7fzBgCfS zgx9Bn6Xp3ye8pHILeHEhY7Y1ArC6zM0d1zDnNfZjkYsKVv3Jyc/oACnKUH/oD60ZpvMi3ryyuk ADZ2+PGQ76OIDMNf2MtRhuY+gz5JOgZ3skbwB87rw8j+9MFmmmdNHBQ5Ro+TQLEVO6ur1f8NJNu
 rXix3SAeoE65PeCUGsSWDONmBB3Acw8mg675Y4qEOo84QtfrYGacXMPbH+7FDbDh+cenlFum
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505070043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 04:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216089

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-32414 and CVE-2025-32415.

Changelog:
===========
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.7
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.8

Regressions

* tree: Fix xmlTextMerge with NULL args
* io: Fix compressed flag for uncompressed stdin
* parser: Fix parsing of DTD content

Security

* [CVE-2025-32415] schemas: Fix heap buffer overflow inxmlSchemaIDCFillNodeTables
* [CVE-2025-32414] python: Read at most len/4 characters. (Maks Verver)

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libxml/{libxml2_2.13.6.bb => libxml2_2.13.8.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.6.bb => libxml2_2.13.8.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.13.6.bb b/meta/recipes-core/libxml/libxml2_2.13.8.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.13.6.bb
rename to meta/recipes-core/libxml/libxml2_2.13.8.bb
index 3b3ca87e96..e82e0e8ec3 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.8.bb
@@ -19,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "f453480307524968f7a04ec65e64f2a83a825973bcd260a2e7691be82ae70c96"
+SRC_URI[archive.sha256sum] = "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.40.0


