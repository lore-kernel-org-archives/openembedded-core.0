Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EBECE7A95
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 13:29:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.61330.1695648546796480059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 06:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=FCT1oW6B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=763203033c=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38PBo26x025639
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 13:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=tCtraZDTkBGvcZWs1G
	EkFFYYSRbsrzRIO+o1TkSQv+8=; b=FCT1oW6BG+IcvEh+1zxLZ/TmdAlPDOI/am
	vmGF1uHsMfcQMMRIJC/M5QeAXeYvyLrk6sCT23oDW7sITa/wQOEgP/IQqFUvtvNs
	ymsFVkj0YafruZ+S6dH3R405iOAg7BroJV+GHco2Yp19GwGRj+HcdnfyQJRHtEl1
	ssEMsO4SBWxb6V8VkeV37gsvFdH8eagMyIJRdYSPs1dgNM84n+o75laN3rTtGGIA
	JcZ+JtRK+1+NtveCuz+qD+WlZs0OwmdW6ceXcNcXl41oEo4hbkA0wvjv6d3hmeZ0
	bzuu8RF0sblURoQ61GTngnbH5/dbk37r9GKiP51/2+q6iqDVGk0Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x1rmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 13:29:05 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 06:29:02 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] python3-git: upgrade 3.1.32 -> 3.1.37
Date: Mon, 25 Sep 2023 13:28:44 +0000
Message-ID: <20230925132844.3262400-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: U4aS11Ox1ArGbyVOytICo2-Q2UEKSavB
X-Proofpoint-GUID: U4aS11Ox1ArGbyVOytICo2-Q2UEKSavB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_10,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309250101
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 38PBo26x025639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 13:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188188

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.1.32 & 3.1.37 contains the CVE-2023-40590 and
CVE-2023-41040 fixes and other bugfixes.

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- WIP Quick doc by @LeoDaCoda in #1608
- Partial clean up wrt mypy and black by @bodograumann in #1617
- Disable merge_includes in config writers by @bodograumann in #1618
- feat: full typing for "progress" parameter in Repo class by @madebylydi=
a in #1634
- Fix CVE-2023-40590 by @EliahKagan in #1636
- #1566 Creating a lock now uses python built-in "open()" method to work =
arou=E2=80=A6 by @HageMaster3108 in #1619
- util: close lockfile after opening successfully by @skshetry in #1639
- Bump actions/checkout from 3 to 4 by @dependabot in #1643
- Fix 'Tree' object has no attribute '_name' when submodule path is norma=
l path by @CosmosAtlas in #1645
- Fix CVE-2023-41040 by @facutuesca in #1644
- Only make config more permissive in tests that need it by @EliahKagan i=
n #1648
- Added test for PR #1645 submodule path by @CosmosAtlas in #1647
- Fix Windows environment variable upcasing bug by @EliahKagan in #1650
- Improve Python version and OS compatibility, fixing deprecations by @El=
iahKagan in #1654
- Better document env_case test/fixture and cwd by @EliahKagan in #1657
- Remove spurious executable permissions by @EliahKagan in #1658
- Fix up checks in Makefile and make them portable by @EliahKagan in #166=
1
- Fix URLs that were redirecting to another license by @EliahKagan in #16=
62
- Assorted small fixes/improvements to root dir docs by @EliahKagan in #1=
663
- Use venv instead of virtualenv in test_installation by @EliahKagan in #=
1664
- Omit py_modules in setup by @EliahKagan in #1665
- Don't track code coverage temporary files by @EliahKagan in #1666
- Configure tox by @EliahKagan in #1667
- Format tests with black and auto-exclude untracked paths by @EliahKagan=
 in #1668
- Upgrade and broaden flake8, fixing style problems and bugs by @EliahKag=
an in #1673
- Fix rollback bug in SymbolicReference.set_reference by @EliahKagan in #=
1675
- Remove @NoEffect annotations by @EliahKagan in #1677
- Add more checks for the validity of refnames by @facutuesca in #1672

Note that the changes to the license file are just removal of excess whit=
espace
(the extra blank line at the end, and spaces appearing at the end of line=
s).

References:
https://github.com/gitpython-developers/GitPython/releases
https://github.com/gitpython-developers/GitPython/blob/main/doc/source/ch=
anges.rst
https://github.com/gitpython-developers/GitPython/commit/e1af18377fd69f9c=
1007f8abf6ccb95b3c5a6558

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python/{python3-git_3.1.32.bb =3D> python3-git_3.1.37.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.32.bb =3D> python3-=
git_3.1.37.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.32.bb b/meta/re=
cipes-devtools/python/python3-git_3.1.37.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-git_3.1.32.bb
rename to meta/recipes-devtools/python/python3-git_3.1.37.bb
index f217577eb8..56a335a79e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.32.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.37.bb
@@ -6,13 +6,13 @@ access with big-files support."
 HOMEPAGE =3D "http://github.com/gitpython-developers/GitPython"
 SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8b8d26c37c1d5a04f9b0186edbebc=
183"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5279a7ab369ba336989dcf2a107e5=
c8e"
=20
 PYPI_PACKAGE =3D "GitPython"
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI[sha256sum] =3D "8d9b8cb1e80b9735e8717c9362079d3ce4c6e5ddeebedd03=
61b228c3a67a62f6"
+SRC_URI[sha256sum] =3D "f9b9ddc0761c125d5780eab2d64be4873fc6817c2899cbcb=
34b02344bdc7bc54"
=20
 DEPENDS +=3D " ${PYTHON_PN}-gitdb"
=20
--=20
2.40.0


