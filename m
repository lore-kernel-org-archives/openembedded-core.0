Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED52C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 08:03:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2310.1753776207597042424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 01:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03055d9187=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56T5WGX23813757
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:03:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484ta1tbcj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:03:27 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 29 Jul 2025 01:03:26 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 29 Jul 2025 01:03:26 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] bitbake.conf: Add xz to HOSTTOOLS
Date: Tue, 29 Jul 2025 01:03:30 -0700
Message-ID: <b35dc1cc758d4ea4a58f26403bc0ab0cc88637a3.1753776105.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1753776105.git.liezhi.yang@windriver.com>
References: <cover.1753776105.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RMYjU7GdMxcnhENRr2zWaPWQT-R9AfUT
X-Proofpoint-GUID: RMYjU7GdMxcnhENRr2zWaPWQT-R9AfUT
X-Authority-Analysis: v=2.4 cv=OYOYDgTY c=1 sm=1 tr=0 ts=6888804f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=AtZbScLTkzVNbjz_FB4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA2MiBTYWx0ZWRfX/JTrMPvHas+d
 MBn5XFmgY3ENfIklNnwiSn+ls6skC+gcEQmA1vg5NT13WUQVyzx9XMBRrWmaW7zFuaRYC5auGA8
 ij/Jn6NdswdWDQvncdsYFdJt0DHIZrwLJYI9wpF1uBlNTtSHd239rp8nR0pyGLLA4Y5nWd7Uyrh
 rmvljWgC/VlAau7dKF/m7qEbJR0EEZ5V8k0OjQq1SxdBUDnRNdqQ2sDOh2oXjaojjY1ZKcLhQ6C
 5jZza2e2HgzcwJwxrGu8KMDUj7MvYcs8svvYYSeY7DksOI5Jz/xID/WwvR5B9FAVtHxuhA0J8Pl
 Iu/LatM4BakbEanYUmbUhZZrJ94tkJzXr42JzWRpEXTRhajqtJ8IQmbMw6Ct7Xq3OaMj5Lq+bHo
 njyNSAZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507260059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 08:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221034

From: Robert Yang <liezhi.yang@windriver.com>

The uninative tarball requires xz to decompress:
WARNING: Disabling uninative as unable to install uninative tarball:
WARNING: tar (child): xz: Cannot exec: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b02459c18f..fb26e72669 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -524,15 +524,12 @@ HOSTTOOLS += " \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
     sleep sort split stat strings strip tail tar tee test touch tr true truncate uname \
-    uniq unzstd wc wget which xargs zstd \
+    uniq unzstd wc wget which xargs zstd xz \
 "
 
 # Tools needed to run testimage runtime image testing
 HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
 
-# Used by archiver.bbclass when compression is xz
-HOSTTOOLS += "${@'xz' if (('archiver.bbclass' in (d.getVar('BBINCLUDED') or '')) and (d.getVarFlag('ARCHIVER_MODE', 'compression') == 'xz')) else ''}"
-
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 
-- 
2.49.0


