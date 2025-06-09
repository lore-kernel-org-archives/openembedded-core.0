Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5BAC61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 14:35:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.60824.1749479719923696621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 07:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8255fda859=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559AGvit026173
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jun 2025 14:35:19 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2hwn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 14:35:18 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 9 Jun 2025 07:35:17 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 9 Jun 2025 07:35:15 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/1] python3: upgrade 3.13.2 -> 3.13.4
Date: Mon, 9 Jun 2025 20:05:04 +0530
Message-ID: <20250609143504.1155764-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNyBTYWx0ZWRfX5Z6o4V9VaE1Q TWxXwS4XICZTBAU154d36OSckloxrhGFwOV3PPKLWkfFix96N//rlsVmuUShHB11/+9PZ6dW8ci VBMO2M+8JGSwdhJ6CNWxCeG/kEZUIpaHMqc4tnA8JRCw3qCYHo1tmNf9gCwrbuQC080tPAxpmTm
 FWBVzwOTMk15SBfPtddk8COhiG/FNJLqhzHb12x2hkM7zWOzcsObxfjsv/grAN6CdHw8RZ9iQ7q ccOfRkprLJb4StSvUVXpQ/pveU1nWT1OjN18HERFJIUDMFg5UdA39l4WpqzLno9i0wio6HSKKIp PZF1yqEZTmc89+Kjbb4+4/iygiOU59F/VWwZbaJ06fV6B52giK/KDvknI36qy1e9oC5LbEOYOWV
 Y5RvE8YUGoiEQuR3wyLYkJDq6GS5eV+XbNyanqeLNylGM+1TSWlMWIOIHqdZ3N4urjhcngFZ
X-Proofpoint-GUID: tP6mtWAul_9Z9WrL0jhwjgmLOjupM_zL
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=6846f126 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=8AHkEIZyAAAA:8 a=t7CeM3EgAAAA:8 a=HUfRvMtMjSzp5hYZYN4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=EesaM_nQlCMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: tP6mtWAul_9Z9WrL0jhwjgmLOjupM_zL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506090107
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 559AGvit026173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 14:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218292

Security content in this release:
- gh-135034: Fixes multiple issues that allowed tarfile extraction filter=
s
  (filter=3D"data" and filter=3D"tar") to be bypassed using crafted symli=
nks and
  hard links. Addresses CVE-2024-12718, CVE-2025-4138, CVE-2025-4330, and
  CVE-2025-4517.
- gh-133767: Fix use-after-free in the =E2=80=9Cunicode-escape=E2=80=9D d=
ecoder with a non-
  =E2=80=9Cstrict=E2=80=9D error handler.
- gh-128840: Short-circuit the processing of long IPv6 addresses early in
  ipaddress to prevent excessive memory consumption and a minor denial-of=
-service.

Includes additional standard library improvements and bug fixes.

References:
https://docs.python.org/3/whatsnew/changelog.html#python-3-13-4-final
https://www.python.org/downloads/release/python-3134/

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../python/{python3_3.13.2.bb =3D> python3_3.13.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.13.2.bb =3D> python3_3.13=
.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipe=
s-devtools/python/python3_3.13.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.2.bb
rename to meta/recipes-devtools/python/python3_3.13.4.bb
index 7c36fd92ed..b60e84f124 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.4.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
            "
=20
-SRC_URI[sha256sum] =3D "d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836c=
f4f0b63fa159eb56"
+SRC_URI[sha256sum] =3D "27b15a797562a2971dce3ffe31bb216042ce0b995b39d768=
cf15f784cc757365"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
--=20
2.40.0


