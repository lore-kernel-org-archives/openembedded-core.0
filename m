Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC02C46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 05:44:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45564.1703137459286602835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 21:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B8ZXVJPp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=071976e036=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BL5U3Ci010119
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 05:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Sbuls
	pfO9hOSSHw7/dg2S+SAPR7LVGvIiNH7WmUiNa0=; b=B8ZXVJPpO/kFoBFc6HGb6
	jCjPu3g/1GS5+Bct2rV75xq6DD5AbU5o1R7sKw5siZ+ROKIUag5tAvSkgHsrf9ZV
	gr+wTPMb9VhwC9kqKifjf7IG6pqVxuQJ6mprNszHF2RiUgnV9GCPImegXuoO0h83
	okUG6Lx+5K7lSvG9TQykwNh8DX21Yyt7NFi9iUxpRjO1YsqzdeBcenD6d8ayy09V
	HvkGlvMWRtOgNDEJctVvvnutC3FZat9jRl36YF6X9AzCd3ijjAiX8mUEwz3g3c9C
	MQJgA18/X453FcIggk7toOqUHZaHR2hVTncRoQ0dt0DUTQSKl5nM7ph/tcOZIOSo
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v113xdwd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 05:44:18 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 21:44:23 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 21:44:23 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] man-pages: remove conflict pages
Date: Thu, 21 Dec 2023 13:44:15 +0800
Message-ID: <20231221054415.1516863-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: W6dEa50ny-bRFLplHZ8ug8Ix11Kuwwmv
X-Proofpoint-GUID: W6dEa50ny-bRFLplHZ8ug8Ix11Kuwwmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=755 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312210040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 05:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192826

From: Changqing Li <changqing.li@windriver.com>

Remove the pages which libxcrypt and shadow already have to avoid
following conflicts during install man-pages and libxcrypt/shadow at the
same time.

Error: Transaction test error:
  file /usr/share/man/man3/crypt.3 from install of
  libcrypt-doc-4.4.33-r0.x86_64 conflicts with file from package
  man-pages-6.04-r0.x86_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/man-pages/man-pages_6.05.01.bb | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.05.01.bb b/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
index 2726eded8b..f0eb1a6132 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
@@ -30,17 +30,12 @@ do_compile[noexec] = "1"
 
 do_install() {
         oe_runmake install prefix=${prefix} DESTDIR=${D}
+        rm -rf ${D}${mandir}/man3/crypt.3
+        rm -rf ${D}${mandir}/man3/crypt_r.3
+        rm -rf ${D}${mandir}/man3/getspnam.3
+        rm -rf ${D}${mandir}/man5/passwd.5
 }
 
 # Only deliveres man-pages so FILES:${PN} gets everything
 FILES:${PN}-doc = ""
 FILES:${PN} = "${mandir}/*"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN} = "crypt.3 crypt_r.3 getspnam.3 passwd.5"
-ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
-ALTERNATIVE_LINK_NAME[crypt_r.3] = "${mandir}/man3/crypt_r.3"
-ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
-ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
-- 
2.25.1


