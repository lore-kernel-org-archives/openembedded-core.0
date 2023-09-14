Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7251BEDE99A
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 09:04:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7474.1694682245711633533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 02:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CjspejNS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7621668a22=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E8ewBS026553
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 02:04:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Ae2u6
	v2R5RVS5sIAJfWVfw301ttf3LMx3IiBh954N2E=; b=CjspejNSjVc55BZOVn/CJ
	LmFohNUXPdVtzubfuoyJQMl35RR3d07uEvwpYFXBKdgRewzK9c+aRfhgtoi0Dbbe
	OS2GIX6JABtdBNoqtulveoIWUTqQ5bWwdSXKDtG5lj6ZK61KahgnmsWsmxoj8T/o
	RJ06hNmtI3ADr9rbAbxwhbNrj0somqluq8iN+/fE0ewvYIMAy4rh67Lz4yLZYeYH
	WS2Fy4NK1kO+QVytd4ndY1henDBzPbDA5YcPTcz1J/9YYpnrEP1Mamr5W5FUNbXS
	WPWUFSx5CwBGpjedtbi3b9youi5jR3WjHz/qQ3tulaBQh+1W+LQu/EV315C/7UYt
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y829jur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 02:04:05 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 02:04:02 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] vim: update obsolete comment
Date: Thu, 14 Sep 2023 09:03:50 +0000
Message-ID: <20230914090350.1460158-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 0SFlS1iMrvf7SIBHXYb8MI9y2KvL6c42
X-Proofpoint-ORIG-GUID: 0SFlS1iMrvf7SIBHXYb8MI9y2KvL6c42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_07,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=821 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309140077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 09:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187625

From: Etienne Cordonnier <ecordonnier@snap.com>

vim 8.3 has been out for a long time, so this comment is obsolete.
However we still need UPSTREAM_VERSION_UNKNOWN, since we ignore
the last digit of the upstream version number.

Test result:
$ devtool check-upgrade-status vim
  ...
  INFO: vim                       9.0.1592        UNKNOWN         Tom Rini <trini@konsulko.com> c0370529c027abc5b1698d53fcfb8c02a0c515da

(From OE-Core rev: 65f5de85c3f488136d1ec2b1f7fe8d8426d6c5b3)

(From OE-Core rev: 868a19357841470eb55fb7f1c4ab1af09dea99ed)

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 33ae0d8079..83ab9ea5de 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,11 +22,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
 PV .= ".1592"
 SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
 
-# Remove when 8.3 is out
-UPSTREAM_VERSION_UNKNOWN = "1"
-
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
+# Ignore that the upstream version .z in x.y.z is always newer
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


