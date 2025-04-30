Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61907C3ABAF
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 08:29:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12166.1746001763282837922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 01:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7215f97ccc=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U4RnbO024093
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 01:29:22 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ugrh2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 01:29:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 30 Apr 2025 01:29:21 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 30 Apr 2025 01:29:20 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [Walnascar][PATCH] gobject-introspection: Fix wrong PN used in MULTILIB_SCRIPTS
Date: Wed, 30 Apr 2025 16:29:19 +0800
Message-ID: <20250430082919.1769085-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5H5NWWeSmc6LA2ibfb6roUkHdIJiIE2h
X-Proofpoint-ORIG-GUID: 5H5NWWeSmc6LA2ibfb6roUkHdIJiIE2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1OCBTYWx0ZWRfX12PbDGZuODMC XWtiCg8UA0zAK+y9Pt7h4761ACGpRbbmfAPJoP1FmgBUYV2CVAm8rMRDoxzq/HFQCeiePK/AbwO b/cqkN7GwLI8QPL76G3PsE91ZRJpiXSPnm7NCbDGqKbSDgqBw/ngXust67SLcD76IHZwiHaouON
 czlc3B9AdAN1FylZ0iFy/jxHfjZ+t/znFuIkjBBD/hhqv01T3YBRmxywojgWjkfg+QNpesmhX+I kRTfiKTmMINEJTygtnI7LtrcgUrFkQWGZyuUU24jgO1cEZbNy3kAE/kNd9Lao+HtwLzdV8GPE0A cmvFyhKv/hxs/GLmiOisTDcfKoovWbgrK76NS/soscVNoAYXVGLsLmAREHpXuU+zO9ISFBzlHMu
 4UjwpJAxYbRdvyQUnQP3zi15n/jmsruO93e+Wymp//nZm+SCw2OPT7Ba0MsI4SZUZZwgGWic
X-Authority-Analysis: v=2.4 cv=Od+YDgTY c=1 sm=1 tr=0 ts=6811df62 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=DNRfr-7QLIe9mFChXXMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=747 mlxscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 08:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215728

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


