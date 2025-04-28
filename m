Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E47C36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 07:12:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42373.1745824288354426777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 00:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62139e711a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S0ob1k023075
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:11:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1am07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:11:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 28 Apr 2025 00:11:26 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 28 Apr 2025 00:11:25 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] initscripts: add function log_success_msg/log_failure_msg/log_warning_msg
Date: Mon, 28 Apr 2025 15:11:24 +0800
Message-ID: <20250428071124.3945997-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680f2a1f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=IHY4GhH-AAAA:8 a=t7CeM3EgAAAA:8 a=lfWvFnmza6eDiIdRuE4A:9
 a=5V7z7r4ZuTEA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=D2-2_G0xO5IXdrd33UjC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xmXWjKJBXSYEi4EDI4bpT2LOcUbCPhYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA1OSBTYWx0ZWRfX3VmRbAnnisPn BIV5A35PbQEbDCg9FHJoUa1JYaA0IVGtIqc/Is/7pS8msUEHCnTbkzVHj6yvWB5oipT0WcM8Asr 8ZglmraoABZV0zzVT8ta0x3IHLCGAruPom79t/4Tel1IqNjucAlDGp4MSxAvjAYxy54q6kjCsB0
 LwoMvGo6DxaC0RDI0hkW3euzOV6uwJuXsvoprKB+Or6qT4zCa9QpOE+aWtUBm047wiQYOKGhfSX KToyiaJKTLCqtGlS/Cr7TWtTxTlmAqYFaCaGKMoaH4ByQg5ThI8DGg+jh4umh9Aa9w33CFpo4AY bx0+teLnlE8c6t2y4epWjoqdMG/r+hPF+O7qHSISzf0sUuqOKdJjw0VoNISalbdHtsSI8Q6L2eL
 jlkft1ldyL91WOVR3VDQA2aJ4amlzP614ZnimRx1jrACz6u9swW78HMnUJslqO+9NnKCFGlm
X-Proofpoint-GUID: xmXWjKJBXSYEi4EDI4bpT2LOcUbCPhYE
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215579

From: Changqing Li <changqing.li@windriver.com>

* add function log_success_msg/log_failure_msg/log_warning_msg, some
packages still use these functions, like mariadb, refer [1], without
these function, with sysV init manager, mariadb will report error:

root@qemux86-64:~# /etc/init.d/mysqld status
/etc/init.d/mysqld: line 383: log_success_msg: command not found

* remove RCONFLICTS with lsbinitscripts, LSB support already remove in
  [2]

[1] https://github.com/MariaDB/server/blob/main/support-files/mysql.server.sh#L104
[2] https://git.openembedded.org/openembedded-core/commit/?id=fb064356af615d67d85b65942103bf943d84d290
[3] https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../initscripts/initscripts-1.0/functions     | 21 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 -
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index 35aebd4a55..7fc19c808b 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -92,3 +92,24 @@ passed() {
     echo -n -e "${BRACKET}[${SUCCESS} PASS ${BRACKET}]${NORMAL}"
     return $rc
 }
+
+log_success_msg()
+{
+    echo -n $@
+    success
+    echo
+}
+
+log_failure_msg()
+{
+    echo -n $@
+    failure
+    echo
+}
+
+log_warning_msg()
+{
+    echo -n $@
+    warning
+    echo
+}
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 98693fa66e..0bc078c5eb 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -54,7 +54,6 @@ RDEPENDS:${PN} = "initd-functions \
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS:${PN} = "${PN}-functions"
 RPROVIDES:${PN}-functions = "initd-functions"
-RCONFLICTS:${PN}-functions = "lsbinitscripts"
 FILES:${PN}-functions = "${sysconfdir}/init.d/functions*"
 FILES:${PN}-sushell = "${base_sbindir}/sushell"
 
-- 
2.34.1


