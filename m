Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A70C43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:21:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2792.1783576374195755875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XTPTmahX;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild11.wrs.com, ip: 205.220.166.238, mailfrom: prvs=1650dddb60=psahoo1@oak-lpgbuild11.wrs.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6694gwf71591028;
	Wed, 8 Jul 2026 22:31:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fqtGmvdCshaLDCVJW8ID2qrA/ghi6/rBW2cHGedv80E=; b=
	XTPTmahXMFMoi2FI5JvZJdXupvB1VAvPSG3a/Ms8d05tZ5NymMNCR+qVtX/i4g6v
	BJHFMRGo0GA4kdNgReC8SOnhfYS8vJRZEJfyXj28bYrvcp6CXxL+dXUqJpYWesrw
	Ln9R19B/Dg93MKTocjqCGyvRKtLzTioTFB0ck4nTYhOcjjD+SswGKrYTr89DSTD/
	es6vHX66fNrZmyfTEsz6CQHxRzpnlL7aSLkfnsY7nkiTShbKZxrXa1LweQdiUMSk
	Xw+nEWBcBaE/BfybLYWxQqRDaujzu+vNYJgMS3/lN1bsxctFf7e+tTAVwActjdKs
	tS1eL50RSblJ+rzHl5Pr1Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1gy88tr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Jul 2026 22:31:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Jul 2026 22:31:09 -0700
Received: from oak-lpgbuild11.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Jul 2026 22:31:09 -0700
Received: by oak-lpgbuild11.wrs.com (Postfix, from userid 1762445297)
	id 31F0F40405AE; Thu,  9 Jul 2026 05:31:09 +0000 (UTC)
From: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <Yi.Zhao@windriver.com>,
        <Shiva.Komati@windriver.com>, <Qi.Chen@windriver.com>,
        <Libo.Chen.CN@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
        <Shailesh.Masih@windriver.com>, <Tomas.Holmberg@windriver.com>,
        <Haixiao.Yan.CN@windriver.com>, <yoann.congal@smile.fr>,
        "Pritam Srichandan
 Sahoo" <PritamSrichandan.Sahoo@windriver.com>
Subject: [wrynose][PATCH v2 2/2] gnutls: link mini-dtls-fragments test to gnulib
Date: Thu, 9 Jul 2026 05:31:06 +0000
Message-ID: <20260709053106.1630373-3-PritamSrichandan.Sahoo@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260709053106.1630373-1-PritamSrichandan.Sahoo@windriver.com>
References: <20260709053106.1630373-1-PritamSrichandan.Sahoo@windriver.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: IsYwWs4wLvkuxlaTh5NSflBAharkWfM0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA0OSBTYWx0ZWRfX/axXuTZeBev5
 7A49KxyLOnP2mFgdKI1HEFQUeKSB8pEMeGVxDxQrRSN3iyul9PVmL0CdRuDQ+uuaAs2svpzvuZp
 WVjJ6Bg/1Tj5GQlnyfxJYANl16n22kQbgZ6RsKZKt5ewJQHBtVTX
X-Proofpoint-GUID: IsYwWs4wLvkuxlaTh5NSflBAharkWfM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA0OSBTYWx0ZWRfX0KnigFHUw4/s
 07WTvnTrwOip0uqYuCeztwfr2kvD2qJh1e7t6Pu+OmmPw2zh4HgsgUyeJrHnwjUzMQxGt4oR4X5
 0mnHC9ncr5kLaZHMJKJjj7TJ3GC/R4JihDD4Og7kKNFA/zDfo0QfkXGwEsCoPwrelKCLyWvoWLY
 pINZwFIPXkm7F02bc0Xov1Gw8VfRoalY5N6t2OUV4mL9JWOMeXFQOsh/q+oHR343HasGgNYWa3W
 26fUhKMlkNhjw7nkLJR8WZy9npMmRYQ9zpeh1U2PeO9Elx7zKyBC8RxnQNHgdO3GSzqHTIkRUNs
 NbkRt4qX2f+WI6qTMfg3lPpWkL3sEhQE/2yvVslzgPbtVklp7bGy8fhzI/AgofJa7SAWG0QgEiP
 Ppwgy6y8pcBMynWZFe1y5eF5vypDO4NFd/gf11fDIjOvAB4nWYHOn6wB0M9ZWj+wpz0SzvhUAKP
 HNDYpcyPcov5QBMrwkw==
X-Authority-Analysis: v=2.4 cv=P7IKQCAu c=1 sm=1 tr=0 ts=6a4f321e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=a_U1oVfrAAAA:8 a=qJ1ljJNXJOa3eF2JIPkA:9
 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090049
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240874

The mini-dtls-fragments test introduced by the CVE-2026-33846 fix
uses functions from gnulib (gl/libgnu.la) but does not link against
it. This causes a build failure with musl libc where these symbols
are not available from the system C library.

Add mini_dtls_fragments_LDADD to tests/Makefile.am to fix the link
error.

Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8c955f4910c01]

Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
---
 ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
new file mode 100644
index 0000000000..7f999c4b22
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
@@ -0,0 +1,25 @@
+From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 30 Apr 2026 13:08:01 +0200
+Subject: [PATCH] tests/mini-dtls-framents: link to gnulib
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8c955f4910c01]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f8797964d..1b27df751 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+ mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
+ 	-I$(top_srcdir)/gl	\
+ 	-I$(top_builddir)/gl
++mini_dtls_fragments_LDADD = $(LDADD) ../gl/libgnu.la
+ 
+ if ENABLE_PKCS11
+ if !WINDOWS
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 3ae7a2eb78..3e945b67f3 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            file://c99.patch \
            file://CVE-2026-33846.patch \
+           file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
-- 
2.53.0


