Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75B61067036
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:10:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22420.1773324606749001836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mhkCJeKR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAkDF0133876;
	Thu, 12 Mar 2026 14:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6w79FKnnn45e0SQyzG+qfchs5YlCx+Z+xEwbTbaJ7Aw=; b=
	mhkCJeKRzN71ZI8/leuVoj5XLFvUB7IBUlzMvgtd1eNm73KdYxn64ZlcfFlbcf8L
	i6L3ikVNxoRjsggCCbRkaolk9Vkb3SNnjkBuuNyyYx8AHtevDIhRdDfRKAiaQsx0
	zkKY7kO6mq39L5MclAwV8n7iX00TzG/qWairDyeZfadr0RT6aD2wrkpvpH58IEbv
	VycYG6X3aBCbmikyncyHKtzIb5Zibbmb4FM/USmJTr1kU2faOSdnx5rFRV6aFwaf
	A8xhoT1eF/92d0cbT5h3jL/ahy3xqUqjbY4aeQMVkEGDljOOw+FjNn1sOpZbG33Z
	0vP4UjSpy7BRl9vHlixPNw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqr9qb-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 14:09:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 12 Mar 2026 07:09:41 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Mar 2026 07:09:41 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>
Subject: [PATCH v8 8/9] libarchive: upgrade 3.8.5 -> 3.8.6
Date: Thu, 12 Mar 2026 07:09:38 -0700
Message-ID: <ad0444969dacacc3a719634d2a772aa43d003be5.1773324129.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1773324129.git.liezhi.yang@windriver.com>
References: <cover.1773324129.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IjITdPwWA9n4UkcpnhwYJpWpI0gQZvRy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfXxLCUubFhWNSh
 ebq+Qxm+/0+jJe1cpBJVO0CkGuDuKophLmeCeIkqDlH3JLOTdoWkx53+osxBQ/LfE/Qx6m7UNgi
 k61Dn7vV00RDOHN2zPPLN6w0uDFFNzgTShGPwSTPmRAeaYCtS6c1f5lhyfaVRTxDgGdGxvKd5/z
 3SB+J0o5DNB7MPZJWQhNBVlJ1dxLvZkYUXIaZGt+c+QAGFH5/Q8esHgnJpU+ABPD9CvdRcvCLQR
 2L7SSdKJxZE8nmVd+s8+13wRIK92c16d3RmrLw8U/Pxy4oQxxFia8tl1SewcIztb3sUAaYQ3vng
 rsCblB/bpU3mFh6V98vF2MynVjTjveJ2zXsrrSMNN4Q3WCt2ij98nIbwHWRJ0jXT7IvFuYwnbuC
 dZZDGhcdhmqw0YBh0X5D2ta+3YAxqQoTYOLYzagknA5eFydvr1uy/SNrOpoTeDRIMgPAwZZt/DC
 vG2FuQA1PeMQuT7NbQw==
X-Proofpoint-GUID: IjITdPwWA9n4UkcpnhwYJpWpI0gQZvRy
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2c928 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=qhOjpNPHAAAA:20 a=3uWsZ661AAAA:8 a=a_U1oVfrAAAA:8
 a=t7CeM3EgAAAA:8 a=Dxn16gCQXvUCwSFbXUEA:9 a=fYNom5PXsM5enKJDCoVv:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232962

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

Libarchive 3.8.6 is a security and bugfix release.

Notable fixes:
* libarchive: fix incompatibility with Nettle 4.x (#2858)
* libarchive: fix NULL pointer dereference in archive_acl_from_text_w() (#2859)
* bsdunzip: fix ISO week year and Gregorian year confusion (#2860)
* 7zip: ix SEGV in check_7zip_header_in_sfx via ELF offset validation (#2864)
* 7zip: fix out-of-bounds access on ELF 64-bit header (#2875)
* RAR5 reader: fix infinite loop in rar5 decompression (#2877)
* RAR5 reader: fix potential memory leak (#2892)
* RAR5: fix SIGSEGV when archive_read_support_format_rar5 is called twice (#2893)
* CAB reader: fix memory leak on repeated calls to archive_read_support_format_cab (#2895)
* mtree reader: Fix file descriptor leak in mtree parser cleanup (CWE-775, #2878)
* various small bugfixes in code and documentation

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb} (97%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
similarity index 97%
rename from meta/recipes-extended/libarchive/libarchive_3.8.5.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.6.bb
index 7b10823002..d579cdb65a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
+SRC_URI[sha256sum] = "213269b05aac957c98f6e944774bb438d0bd168a2ec60b9e4f8d92035925821c"
 
 inherit autotools update-alternatives pkgconfig ptest
 
-- 
2.49.0


