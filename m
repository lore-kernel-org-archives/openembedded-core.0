Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0829BC54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 06:56:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17708.1709794598343946888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 22:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P8UMkly1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3796ab1ae3=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4275D8q0011949
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Mar 2024 22:56:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=dJrrY
	NgwJbPPhzZffWFrT5BENtpDCa4T4avKiUpFgNo=; b=P8UMkly1eINEZ8dspcPqL
	tNvKTs9DDW/fYVinYl387jcJSS9KUCsY6ngUvK0dJEMfxsZ5j0H21xWHNMxYOkV3
	ERBVNMVm6pbmXGS4Cry5Yj9md+aFXsS25mZnBEfjUp7OXDAZltGaJ7Uo2AavTNXc
	Q3WFxF20bjC3ho8JSSG5b2JW9WAFonwh4oDWu8pyyQ9d6BFx5Ok1UvgialnvVyxd
	xpvOyTj3kKnq8Z4msf7eRSfn0wt3o1htC881UKljPKAM4OrsIhMthDUFyml1D/8N
	6QEo929nMoEWaVpD0j/YLswRzlCDRR6vKFxHNTztRgaM3CncJJefrvcgDw/lGhCh
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093vnwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 22:56:37 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 22:56:37 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 22:56:36 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V6] systemd: fix dead link /var/log/README
Date: Thu, 7 Mar 2024 14:56:35 +0800
Message-ID: <20240307065635.1261288-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1L0zbgvuJHHN7zh61kcqz_L-rO-AwpWt
X-Proofpoint-ORIG-GUID: 1L0zbgvuJHHN7zh61kcqz_L-rO-AwpWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_03,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=846 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 06:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196773

From: Changqing Li <changqing.li@windriver.com>

There are 2 issues here:
First, in package systemd, there is a file /usr/lib/tmpfile.d/legacy.conf,
which will create a symlink to /usr/share/doc/systemd/README.logs during
boot time. But for oe, /usr/share/doc/systemd/README.logs is packaged in
systemd-doc, which will make /var/log/README is dead link.

Second, the symlink /var/log/README in legacy.conf use relative path:
"L /var/log/README - - - - ../../usr/share/doc/systemd/README.logs"
But for oe, when VOLATILE_LOG_DIR is true, /var/log is a link to
/var/volatile/log, so /var/log/README need link to
../../../usr/share/doc/systemd/README.logs, while VOLATILE_LOG_DIR is
false, /var/log is a dir, so /var/log/README need link to
../../usr/share/doc/systemd/README.logs. So current symlink in
legacy.conf will also make it a dead link when VOLATILE_LOG_DIR is true.

Turn off CREATE_LOG_DIRS to avoid these issues.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index a907d60e84..9fd7eccb38 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -247,6 +247,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dsystem-uid-max=999 \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
+                  -Dcreate-log-dirs=false \
                   "
 
 # Hardcode target binary paths to avoid using paths from sysroot or worse
-- 
2.25.1


