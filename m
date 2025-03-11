Return-Path: <quic_bpothuno@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009FFC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 12:59:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.8227.1741697969331753506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 05:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=AFH/Umau;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: bpothuno@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B80Wlx010923
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 12:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7MIxS0r8vtdDGBadrifG8A1GKnysDTrmAp0
	sUbYqk6Q=; b=AFH/Umaui1EyiBemOCAE6lKrUNGIdjncxkTnNB/ztruLIedlVyw
	gnqx4MKh0S18gR+1QvRCuHDNNLoLxx3pN01hDKoRWpyBG6yJ6PcuCmBao5LfoA0E
	DROScGpwriVok3GcIaObY7WP1/MpKQA03Qv3GoEPRJm3eA1gSXGeII6A2kDRlSHV
	AsXIYcu40H2OYk6fHU3fS6UK39+CslLJl9rSsqkzwbf+W/2rw6xdCsFnHU94Ghie
	jOoh3C21vsm0SgX3Pke6zQu8DCejntW3Z4c3uOSoQXziNgMIc7Bvu3Our51ILwEa
	+69une+e1w1WD+c0ko5yucibOJaEazAA73Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyugmun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 12:59:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BCxPYq012218
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 12:59:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 458yn37c44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 12:59:25 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52BCxOdN012213
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 12:59:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.93])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52BCxOls012211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:59:24 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 460767)
	id DF4F956E; Tue, 11 Mar 2025 18:29:23 +0530 (+0530)
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Subject: [PATCH v4] dhcpcd: upgrade 10.1.0 -> 10.2.2
Date: Tue, 11 Mar 2025 18:29:19 +0530
Message-Id: <20250311125919.2325099-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67d033b0 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=Pm3Ii0ycAAAA:8 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8 a=29iXaaDHAAAA:8
 a=cRRSNJyts1ZrZyEANQIA:9 a=-FEs8UIgK8oA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Lb0xad9IhAkqXp0dotAK:22 a=TjNXssC_j7lpFel5tvFf:22 a=IKEkoQGeIXdUWEBz-oOH:22
X-Proofpoint-ORIG-GUID: icK0yTj3dbMcqShlr63Ux5H3665D0unr
X-Proofpoint-GUID: icK0yTj3dbMcqShlr63Ux5H3665D0unr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=940
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 12:59:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212566

This change includes:
a. upgrades dhcpcd version to latest 10.2.2.
b. Update LIC_FILES_CHKSUM for dhcpcd
License-Update: Updated MD5 checksum for LICENSE as Copyright year updated to
2025 in source/LICENSE files.
c. remove following change, as it is specific to 10.1.0 version:
https://git.openembedded.org/openembedded-core/commit/?id=2bb20f49ada56f1c7707565e475051174feba945

Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
 v2: added commit text.
 v3: rebased on TIP.
 v4: addressed patchtest warnings.

 .../dhcpcd/dhcpcd_10.1.0.bb                   |  5 ++--
 ...llow-the-__NR_rt_sigprocmask-syscall.patch | 30 -------------------
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
index 99b72852bf34..0b4345e7fa4a 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d296c4bec306f351e676705aaf237c8c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4dda5beb433a809f2e0aeffbf9da3d91"
 
 SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
@@ -15,10 +15,9 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
-           file://0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch \
            "
 
-SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
+SRCREV = "f6983c18dbf7989f43a2838beeaf62a54c53ff1d"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
deleted file mode 100644
index 7058330165f3..000000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e9e40400003db2e4f12dba85acabbaf2212a520f Mon Sep 17 00:00:00 2001
-From: Scott Shambarger <devel@shambarger.net>
-Date: Sat, 7 Dec 2024 16:37:28 +0000
-Subject: [PATCH] linux: Allow the __NR_rt_sigprocmask syscall
-
-Fixes recent glibc changes to getrandom() used by arc4random().
-Fixes #421.
-
-Upstream-Status: Backport
-See details in https://github.com/NetworkConfiguration/dhcpcd/issues/421
-
-Signed-off-by: Scott Shambarger <devel@shambarger.net>
----
- src/privsep-linux.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 8357904c9c9a..e3485a2efdfc 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -409,6 +409,9 @@ static struct sock_filter ps_seccomp_filter[] = {
- #ifdef __NR_recvmsg
- 	SECCOMP_ALLOW(__NR_recvmsg),
- #endif
-+#ifdef __NR_rt_sigprocmask
-+	SECCOMP_ALLOW(__NR_rt_sigprocmask),
-+#endif
- #ifdef __NR_rt_sigreturn
- 	SECCOMP_ALLOW(__NR_rt_sigreturn),
- #endif

