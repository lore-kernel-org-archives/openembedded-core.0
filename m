Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A35C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 12:22:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9291.1692879762023691925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 05:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IMbOgG9U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7600f699af=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37OBtq4j026751
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 05:22:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=73kYy
	x7sgj7aK0x31hUW0HoH8v9AxG5wJdQ6bM9YaJw=; b=IMbOgG9UU2b64qaRAxlbh
	+3ATd05/InyGK/ZwP4JdqGTOkJvFqIItxXGUpMAseqdOMMfzwsdIXkNuqOOheuWy
	dsbrMvbcD25qcgEnPjcIqr4Pq4sgo1/JXhj1wSHa36nKGfuI4eSeHvp+mMtRboMP
	nnx5tlVpOY84SslKIpzz3sSzlV9VUic2SXU4h08LdmAkxvL15tLXALXE7CHYxc7s
	VW0c2lkEAqKVz7TlvPNHHRmSexIFEd3u2F9qWRKxGav10tXPDEg7YozW31B02z9M
	pUzMjheOaAcK5KdEyjQ81RzF1XIOZW74FLi3FuNKyAHiZKogdvT2ffBsp9wUxVsS
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e1sg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 05:22:41 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 05:22:38 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] python3-git: upgrade 3.1.31 -> 3.1.32
Date: Thu, 24 Aug 2023 12:22:19 +0000
Message-ID: <20230824122219.1873696-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: FPka-7OUq99wv7hZoY7iZY7FERYkH2sN
X-Proofpoint-ORIG-GUID: FPka-7OUq99wv7hZoY7iZY7FERYkH2sN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_09,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308240102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 12:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186657

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.1.31 & 3.1.32 contains the CVE-2023-40267 fix and other bugfixes.

Changelog:
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.32

- Bump cygwin/cygwin-install-action from 3 to 4 by @dependabot in #1572
- Fix up the commit trailers functionality by @itsluketwist in #1576
- Name top-level exceptions as private variables by @Hawk777 in #1590
- fix pypi long description by @eUgEntOptIc44 in #1603
- Don't rely on del by @r-darwish in #1606
- Block insecure non-multi options in clone/clone_from by @Beuc in #1609

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python/{python3-git_3.1.31.bb => python3-git_3.1.32.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.31.bb => python3-git_3.1.32.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.31.bb b/meta/recipes-devtools/python/python3-git_3.1.32.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.31.bb
rename to meta/recipes-devtools/python/python3-git_3.1.32.bb
index 08b9f66bcb..f217577eb8 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.31.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.32.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8ce3bcf69adfdf7c7d503e78fd3b1c492af782d58893b650adb2ac8912ddd573"
+SRC_URI[sha256sum] = "8d9b8cb1e80b9735e8717c9362079d3ce4c6e5ddeebedd0361b228c3a67a62f6"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.40.0


