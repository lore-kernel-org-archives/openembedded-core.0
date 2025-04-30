Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332ABC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 07:25:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11555.1745997926395380567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 00:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7215f97ccc=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U6o3uh026097
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 07:25:25 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ug0f7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 07:25:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 30 Apr 2025 00:25:24 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 30 Apr 2025 00:25:23 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [PATCH] gobject-introspection: Fix wrong PN used in MULTILIB_SCRIPTS
Date: Wed, 30 Apr 2025 15:25:22 +0800
Message-ID: <20250430072522.1918111-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Xf6JzJ55 c=1 sm=1 tr=0 ts=6811d065 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=DNRfr-7QLIe9mFChXXMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: p4aJCl9YFneBCHJakP-BGZhfZUSutMd3
X-Proofpoint-ORIG-GUID: p4aJCl9YFneBCHJakP-BGZhfZUSutMd3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1MCBTYWx0ZWRfXz7Qz17vH0aIu Eqr5sZpuG8yzN4plg4nFxBEXF9Eu4AZfE+HD3VZJtAWv6mTzuTjPCz/r+O4yAsFot2IcXzDcDDi Nlnd3RUGIQz0xxGSwFZ6xv1bHAKk/OLN78DuStqv49sbJp6kVZNOliYT76R8PuhuB3gQVqew4YW
 7ESVCM9jig6QhG3tu3lOgRGYjwtdS9AwfJwAO8mC+ouWF889v3Xe+a8CyYt9akMPCygX8gz4TeN XU50pPg1nq1xR396zf3Afe19bG+V5goiDJd/C6mn4pIS5UY+0H3MNZJHUSU3gNCMPjg4qUuqqt+ JsmzP0p3eIBm0+/rvOaWnhbcn8MlAjnUt1cEGVEPtREkEmukaP1Kl2+SUnCJLdHERqMrkijk9bb
 aLzUfDyxZlKJtcuHlhlqdxOrEtvHx3i1wrfhYRJGvxb3smONXXUAAHbug60xrMaN0a9fAhrR
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0
 mlxlogscore=759 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 07:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215725

From: Jiaying Song <jiaying.song.cn@windriver.com>

The current MULTILIB_SCRIPTS entry incorrectly assigns
g-ir-annotation-tool and g-ir-scanner to the ${PN} package. However,
these scripts are actually installed in the gobject-introspection-tools
package. This leads to incorrect symlinks being created when multilib is
enabled. Therefore, this patch correctly moves them to the ${PN}-tools
package.

Error log:

root@intel-x86-64:~# ls -l /usr/bin/g-ir-scanner
lrwxrwxrwx 1 root root 27 Mar  9  2018 /usr/bin/g-ir-scanner -> /usr/bin/g-ir-scanner-lib64
root@intel-x86-64:~# ls -l /usr/bin/g-ir-scanner-lib64
ls: cannot access '/usr/bin/g-ir-scanner-lib64': No such file or directory

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../gobject-introspection/gobject-introspection_1.84.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
index ac5f4e9370..f6797cd2e5 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
@@ -24,7 +24,7 @@ inherit meson pkgconfig gtk-doc python3targetconfig qemu gobject-introspection-d
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
+MULTILIB_SCRIPTS = "${PN}-tools:${bindir}/g-ir-annotation-tool ${PN}-tools:${bindir}/g-ir-scanner"
 
 # setuptools are required to provide distutils to build the tools
 DEPENDS += " libffi zlib python3 python3-setuptools flex-native bison-native"
-- 
2.34.1


