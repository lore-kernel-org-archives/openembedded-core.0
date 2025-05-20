Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD12C54E71
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 20:18:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1070.1747772312172391739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 13:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7235aa3e61=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KIocgk026873
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:18:31 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfx09g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:18:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 20 May 2025 13:18:12 -0700
Received: from pop-os.wrs.com (172.25.44.3) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Tue, 20 May 2025 13:18:12 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] valgrind: Upgrade from 3.25.0 to 3.25.1
Date: Tue, 20 May 2025 16:18:28 -0400
Message-ID: <20250520201828.2983705-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ObSYDgTY c=1 sm=1 tr=0 ts=682ce397 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=3fyaaF4VAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=svb0_1_ECYGRBypINAwA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MyBTYWx0ZWRfX6Fg+NdH1jIbY osT0nevTtatt38j7CpUYU9Z1fcrSOTs6vrkeWpCsrz5Rw5IJk+hj7t2zejn6AYGGyZmQahswjKo 60mxZembdZLSYWNEqmBaoN7wC33R9tS1GfU/tvPGgoTzqjHrgE4aiwxDq3CHUWWreSkcjh7NEyd
 Z+WIuw4dUFk0w4kwAXULVBiJEpiLXauv8MqllJGZOWc2auz7FC8dnNp1q1vn6qNmJOGUmXK/14L BCeP3vZGGPe1PJKY5yUXR2gcICoMHXT53414Iq6Hf2ewuvDA1qrHoWuOb5zj4HNawbjBPmLL2k6 H5WnOdnAguSptdJ0KTD33DDoIMUxdD3BTzpda4y7306GWXimFhoczSjOIk8yHjXHCs8/UrPKv7f
 dWgaGVrkfF0Wh/evUoJ0X88IrS+/tvDz34BNioUCRAVrDMLKHWDzgjlCwtmMZim7NffBhWGI
X-Proofpoint-GUID: vFd_SRy0bH32aXbbZWaKFnak0lZwragE
X-Proofpoint-ORIG-GUID: vFd_SRy0bH32aXbbZWaKFnak0lZwragE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=886 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505200163
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216942

From: Randy MacLeod <Randy.MacLeod@windriver.com>

The following bugs have been fixed or resolved in this point release:

503098  Incorrect NAN-boxing for float registers in RISC-V
503641  close_range syscalls started failing with 3.25.0
503914  mount syscall param filesystemtype may be NULL
504177  FILE DESCRIPTORS banner shows when closing some inherited fds
504265  FreeBSD: missing syscall wrappers for fchroot and setcred
504466  Double close causes SEGV

To see details of a given bug, visit
  https://bugs.kde.org/show_bug.cgi?id=XXXXXX
where XXXXXX is the bug number as listed above.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../valgrind/{valgrind_3.25.0.bb => valgrind_3.25.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/valgrind/{valgrind_3.25.0.bb => valgrind_3.25.1.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
index 6650dcedbf..8e27212a0f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
            file://0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch \
            "
-SRC_URI[sha256sum] = "295f60291d6b64c0d90c1ce645634bdc5361d39b0c50ecf9de6385ee77586ecc"
+SRC_URI[sha256sum] = "61deb8d0727b45c268efdc1b3b6c9e679cd97cbf5ee4b28d1dead7c8b7a271af"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
-- 
2.34.1


