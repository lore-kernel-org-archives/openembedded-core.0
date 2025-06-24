Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56414C7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:07:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2881.1750748844304898293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 00:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=827078c8af=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5vnIf029254;
	Tue, 24 Jun 2025 07:07:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2jsu3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Jun 2025 07:07:23 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 24 Jun 2025 00:07:20 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 24 Jun 2025 00:07:20 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
Subject: [walnascar][PATCH 1/1] package_rpm.bbclass: Remove empty build directory
Date: Tue, 24 Jun 2025 00:07:21 -0700
Message-ID: <38102892296d97f48b091d9b77d45fe2858d47b5.1750748767.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750748767.git.liezhi.yang@windriver.com>
References: <cover.1750748767.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA2MCBTYWx0ZWRfX4tHJ60VpHeAt Fv6Ba5wOvp6jBNnpzse5HsKK8PnPTc8yV6J6MljgmtJChJiLsl5RMl2sp5id3ERfpH5oIusE8pB qcHDwAaVrtnu/99SeFHLWblfjbzg/AgL5lVeR+smA9lWAWvFAdQZn4lFZnFP8ZYBv55gzGQLXM0
 slH3QxdBAX1Y8fX6WZrsSr3Qzk2RPUhzvfPYHzKkWQzMuiJyzSE7XjWqF/yjziXk8MZxNfxc4dv dplvH3dkhT6I2Lx4vb4FUPf5NG7esZ6KNt1tcUIPON/K5ruhqnAZ0vGmuy1ZP0t9Ts2SK0tvDZg Floe9k0BIfPoohHaVccGwZZyE2WzHD3aaenWBVuicz0BlWc4ixSYTfk68SqESNG/77PDMaRP+fb
 NmbEjObx4HNZWECravHyWmrVz+fOibQuPkIfskfPdNYJwBbamXZy3y7lcL83edswQKk4UkQg
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685a4eab cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=C9XKhJ8ux4jNbZ6unCMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dB7LU86klZ7L0zUtefQaAo987EFrWFNW
X-Proofpoint-GUID: dB7LU86klZ7L0zUtefQaAo987EFrWFNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=638 mlxscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 07:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219231

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ bitbake acl
$ ls tmp/work/core2-64-poky-linux/acl/2.3.2/build/acl-2.3.2-build/

This empty directory is created by rpmbuild, just remove it like others above.

Note, master branch doesn't have this problem after upgrade to rpm 4.20.1, but
it's not easy to find which patch(es) fixed the problem, and the issues haven't
been fixed completely, there is still an empty SRPMS directory, so just remove
the build directory as others above.

If we don't fix this, there might be warnings when a recipe uses:

install -m 0644 ${B}/* ${DEPLOYDIR}/boot.bin-extracted/

install: omitting directory '${B}/xilinx-bootbin-1.0-build'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f383ed140e..c6541d141b 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -728,6 +728,7 @@ python do_package_rpm () {
 
     # rpm 4 creates various empty directories in _topdir, let's clean them up
     cleanupcmd = "rm -rf %s/BUILDROOT %s/SOURCES %s/SPECS %s/SRPMS" % (workdir, workdir, workdir, workdir)
+    cleanupcmd += " %s/%s-build" % (d.getVar('B'), d.getVar('P'))
 
     # Build the rpm package!
     d.setVar('BUILDSPEC', cmd + "\n" + cleanupcmd + "\n")
-- 
2.49.0


