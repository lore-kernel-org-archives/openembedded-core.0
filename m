Return-Path: <Haitao.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9C0C54E60
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 03:07:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34698.1710731233854529996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 20:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EqBourqi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3807ca6fbb=haitao.liu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I2wnep013007
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 03:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=zRWOX
	Qkd2LHY5IGtKDYlM0rbX5LnnRGhJSDN/LOSvNc=; b=EqBourqi/NlGl2UMozwRc
	8Lf2qIlKTqnZLB88dlQZZeUxPnkxCGydmUo7fNtKzB7ukeFREiluUKcK57LZIHTQ
	tkyq0KR4WW1o1b2h3+hbjL66XsgafmgustLnDHjIe3urvHsjjHhS119xL4zokuSg
	pAJq9MrJyAJEys/m4s/KKCbcGoLRUL4idzisJa4pSsglXmgSlrHjONUe4t/W5bkE
	AxeN+4YXoNgMtVKfiIzXiQvmB84SjxkSVe81WwVM70Ut9+2KfyE9ut3bVNbQXA8P
	AAtPYo7rD+hsiopnSaoncWCG1oV5x962OMnIMgTUcMcQEvnaqxIUf3jWquhR4eDI
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww2d6h9q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 03:07:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sun, 17 Mar 2024 20:07:11 -0700
Received: from pek-lpd-susbld.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Sun, 17 Mar 2024 20:07:11 -0700
From: Haitao Liu <haitao.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH] glibc: Fix subscript typos for get_nscd_addresses
Date: Mon, 18 Mar 2024 11:07:10 +0800
Message-ID: <20240318030710.2084076-1-haitao.liu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PiNi6njH11YIED5JcKoTlMR7_UpkF25a
X-Proofpoint-ORIG-GUID: PiNi6njH11YIED5JcKoTlMR7_UpkF25a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 03:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197290

Fix the following error:

root@intel-x86-64:~# wget -6 http://localhost
--2024-01-12 07:18:42--  http://localhost/
Resolving localhost... failed: No IPv4/IPv6 addresses for host.
wget: unable to resolve host address 'localhost'

Reference:
https://sourceware.org/bugzilla/show_bug.cgi?id=29605

Upstream-patch:
https://sourceware.org/git/?p=glibc.git;a=commit;h=c9226c03da0276593a0918eaa9a14835183343e8

Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
---
 ...dresses-Fix-subscript-typos-BZ-29605.patch | 40 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch

diff --git a/meta/recipes-core/glibc/glibc/0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch b/meta/recipes-core/glibc/glibc/0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch
new file mode 100644
index 0000000000..629298c23e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch
@@ -0,0 +1,40 @@
+From 707a878b655395f41b954bbed78008d1d9252f1a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Sonnenberger?= <joerg@bec.de>
+Date: Mon, 26 Sep 2022 13:59:16 -0400
+Subject: [PATCH] get_nscd_addresses: Fix subscript typos [BZ #29605]
+
+Fix the subscript on air->family, which was accidentally set to COUNT
+when it should have remained as I.
+
+Resolves: BZ #29605
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=c9226c03da0276593a0918eaa9a14835183343e8]
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
+---
+ sysdeps/posix/getaddrinfo.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
+index f4c08d6e3b..fa333ad6ec 100644
+--- a/sysdeps/posix/getaddrinfo.c
++++ b/sysdeps/posix/getaddrinfo.c
+@@ -549,11 +549,11 @@ get_nscd_addresses (const char *name, const struct addrinfo *req,
+ 	  at[count].addr[2] = htonl (0xffff);
+ 	}
+       else if (req->ai_family == AF_UNSPEC
+-	       || air->family[count] == req->ai_family)
++	       || air->family[i] == req->ai_family)
+ 	{
+-	  at[count].family = air->family[count];
++	  at[count].family = air->family[i];
+ 	  memcpy (at[count].addr, addrs, size);
+-	  if (air->family[count] == AF_INET6)
++	  if (air->family[i] == AF_INET6)
+ 	    res->got_ipv6 = true;
+ 	}
+       at[count].next = at + count + 1;
+-- 
+2.35.5
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 3ec6610d01..751427517f 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -60,6 +60,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
+           file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.1


