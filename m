Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332BEC3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:48:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1621.1748591276267002294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U58EJo013455
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:47:55 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u53969jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:47:55 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 30 May 2025 00:47:34 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 30 May 2025 00:47:33 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] libsoup: upgrade 3.6.4 -> 3.6.5
Date: Fri, 30 May 2025 15:47:52 +0800
Message-ID: <20250530074752.1962027-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA2NCBTYWx0ZWRfX7cpGCNZMOtSj Qbvr7dnqJFHuBgoLgoC30jV3pbJX4r9uW5Qb9R1xwM3uCYB0VH/Q7oXYZynYnEzWhSSUSc8qLsP Sy0keaIWPszT8AF5+wMzFx5TA14EQ7x2VnJ/gUzrHsO8+TFKcIdQPBjsoKdRyKLO42FhE1RQT7+
 e+OyLXwb+MHw4dqRLHNJVaV2zXWBCeDufhi0ZFu9Yh4u/7Fr+kecvz90AsCJJLlaPFAAflB0cip PVCSmVrUh5KGjC6Yiw1TTukCLLqv4o9DclU42DAVPdGomgZP+VigXl1ilPRC0h0RRuekB52IgT6 Idf3FZhkOfC7XkWt7eZBPdSA/wETP6N45Pp08eap8oa8MVQ1EEcbpJAEo2IJUeQGMoKrj1wjBus
 2pOm5X9oiikA+HfjzX9toquT+NQZNk6Ddno3E+gDCpJuoHbaELZShSMuNaTqc61nawo8PTLr
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=683962ab cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=niIHSNZGq8Y7LJgQK1wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VfLJR05f6ad8DhxAa0LklZVadrxh4ZHH
X-Proofpoint-GUID: VfLJR05f6ad8DhxAa0LklZVadrxh4ZHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=638
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217487

From: Changqing Li <changqing.li@windriver.com>

Changes in libsoup from 3.6.4 to 3.6.5:

* session: Strip authentication credentials on cross-origin redirects [Patrick Griffis]
* build: Use pkg-config instead of krb5-config for the gssapi dependency [Patrick Griffis]
* http1: When using chunked encoding report an error in case of unexpected stream end [Andrzej Surdej]
* http2: When a message has no content still respect its Content-Type [Patrick Griffis]
* http2: Revert manual window size management temporarily, as it could stall [Patrick Griffis]
* sniffer: Fix potential overflows [Patrick Griffis]
* hsts: Fix minor leak [Patrick Griffis]
* headers: Fix a few parsing edge cases that could be an out of bound read [Patrick Griffis]
* connection: Avoid ever calling disconnect twice [Patrick Griffis]
* auth-digest: Fix handling when a nonce isn't present [Patrick Griffis]
* cookies: Limit max size of max-age, path, and domain attributes to 1024 bytes [Patrick Griffis]
* cookies: Limit max size of name and value to 4096 bytes [Patrick Griffis]
* docs: Remove references to old libsoup domain [Simon McVittie]

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/commit/766e17528251c9b696a6076300ac61adc95536ac

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/{libsoup_3.6.4.bb => libsoup_3.6.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.6.4.bb => libsoup_3.6.5.bb} (96%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.4.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
similarity index 96%
rename from meta/recipes-support/libsoup/libsoup_3.6.4.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.5.bb
index 4d50e1353e..fbe9a79b0f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9b54c76f5276b05bebcaf2b6c2a141a188fc7bb1d0624eda259dac13a6665c8a"
+SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.34.1


