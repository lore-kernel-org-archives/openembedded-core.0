Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33540C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 10:21:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10377.1751019664897617636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 03:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8273367fe9=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R6gemO004971
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 10:21:04 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqapk3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 10:21:03 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 27 Jun 2025 03:20:59 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 27 Jun 2025 03:20:57 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/1] python3-setuptools: fix CVE-2025-47273
Date: Fri, 27 Jun 2025 15:50:54 +0530
Message-ID: <20250627102054.537434-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xNx_Bfp5OietdvXh__ql3cWfL5PW9UCC
X-Proofpoint-GUID: xNx_Bfp5OietdvXh__ql3cWfL5PW9UCC
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685e708f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=HbzeB9StAAAA:8 a=t7CeM3EgAAAA:8 a=0DMlDUsRAAAA:8
 a=W7JJyf1x9iwszDloGM0A:9 a=s5zKW874KtQA:10 a=i9oqPCtDvve8OcjLCTCP:22 a=FdTzh2GWekK77mhwV6Dw:22 a=168rQcPrDVj8xHztDHWJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4NSBTYWx0ZWRfX03yDswjZIPlQ +nExyWGY2OVxGNWO8LadOc+NyR8CrRdlrS3aT91g4gbPGyExEri/oc1GR5pLt+BjPf7p6H4PQf8 Hye+PqRYAVvM94ff89cTVrrw+G2jOUVLLBNFnNDjVV2g86n85MiSEOP3ACjBQVb4JKf7dRrSOfp
 clQ70vQWb6bip4Qt7/TjUvL8hZk5KhD0oPhnlbXirMjF+aHJZMPdj2h1LuWtPnE3ERLtk+QCL2D Yd08PoI1HCQdF7cwAbGxSqP0z7smL1nTh69ZdGpCXpyBZp6IUzgouxZa7Mh/7fy2qm278vG1DHN WwUHSkSNVo9IUYGV8ulXgAt8d14CoLG8m/l7Vn9fcckKq98qi4Qw3Hk3F5K3PydIeYSuKbuoLAJ
 wYXYYJSs3u8UA83rhHzIsdS++aCkZYXFwfaSE7TbCyydOZvh/VF3C4uLL1p7dHQnAMu4wiGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506270085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 10:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219393

setuptools is a package that allows users to download, build, install,
upgrade, and uninstall Python packages. A path traversal vulnerability
in `PackageIndex` is present in setuptools prior to version 78.1.1. An
attacker would be allowed to write files to arbitrary locations on the
filesystem with the permissions of the process running the Python code,
which could escalate to remote code execution depending on the context.
Version 78.1.1 fixes the issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-47273

Upstream-patch:
https://github.com/pypa/setuptools/commit/d8390feaa99091d1ba9626bec0e4ba7072fc507a
https://github.com/pypa/setuptools/commit/250a6d17978f9f6ac3ac887091f2d32886fbbb0b

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../CVE-2025-47273-pre1.patch                 | 55 +++++++++++++++++
 .../python3-setuptools/CVE-2025-47273.patch   | 60 +++++++++++++++++++
 .../python/python3-setuptools_76.0.0.bb       |  5 +-
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
new file mode 100644
index 0000000000..d75f05fc68
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
@@ -0,0 +1,55 @@
+From d8390feaa99091d1ba9626bec0e4ba7072fc507a Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Sat, 19 Apr 2025 12:49:55 -0400
+Subject: [PATCH] Extract _resolve_download_filename with test.
+
+CVE: CVE-2025-47273 #Dependency Patch
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/d8390feaa99091d1ba9626bec0e4ba7072fc507a]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ setuptools/package_index.py | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index 1a6abeb..b317735 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -807,9 +807,16 @@ class PackageIndex(Environment):
+             else:
+                 raise DistutilsError(f"Download error for {url}: {v}") from v
+
+-    def _download_url(self, url, tmpdir):
+-        # Determine download filename
+-        #
++    @staticmethod
++    def _resolve_download_filename(url, tmpdir):
++        """
++        >>> du = PackageIndex._resolve_download_filename
++        >>> root = getfixture('tmp_path')
++        >>> url = 'https://files.pythonhosted.org/packages/a9/5a/0db.../setuptools-78.1.0.tar.gz'
++        >>> import pathlib
++        >>> str(pathlib.Path(du(url, root)).relative_to(root))
++        'setuptools-78.1.0.tar.gz'
++        """
+         name, _fragment = egg_info_for_url(url)
+         if name:
+             while '..' in name:
+@@ -820,8 +827,13 @@ class PackageIndex(Environment):
+         if name.endswith('.egg.zip'):
+             name = name[:-4]  # strip the extra .zip before download
+
+-        filename = os.path.join(tmpdir, name)
++        return os.path.join(tmpdir, name)
+
++    def _download_url(self, url, tmpdir):
++        """
++        Determine the download filename.
++        """
++        filename = self._resolve_download_filename(url, tmpdir)
+         return self._download_vcs(url, filename) or self._download_other(url, filename)
+
+     @staticmethod
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch
new file mode 100644
index 0000000000..3c44a2a321
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch
@@ -0,0 +1,60 @@
+From 250a6d17978f9f6ac3ac887091f2d32886fbbb0b Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Sat, 19 Apr 2025 13:03:47 -0400
+Subject: [PATCH] Add a check to ensure the name resolves relative to the
+ tmpdir.
+
+Closes #4946
+
+CVE: CVE-2025-47273
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/250a6d17978f9f6ac3ac887091f2d32886fbbb0b]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ setuptools/package_index.py | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index b317735..a8f868e 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -810,12 +810,20 @@ class PackageIndex(Environment):
+     @staticmethod
+     def _resolve_download_filename(url, tmpdir):
+         """
++        >>> import pathlib
+         >>> du = PackageIndex._resolve_download_filename
+         >>> root = getfixture('tmp_path')
+         >>> url = 'https://files.pythonhosted.org/packages/a9/5a/0db.../setuptools-78.1.0.tar.gz'
+-        >>> import pathlib
+         >>> str(pathlib.Path(du(url, root)).relative_to(root))
+         'setuptools-78.1.0.tar.gz'
++
++        Ensures the target is always in tmpdir.
++
++        >>> url = 'https://anyhost/%2fhome%2fuser%2f.ssh%2fauthorized_keys'
++        >>> du(url, root)
++        Traceback (most recent call last):
++        ...
++        ValueError: Invalid filename...
+         """
+         name, _fragment = egg_info_for_url(url)
+         if name:
+@@ -827,7 +835,13 @@ class PackageIndex(Environment):
+         if name.endswith('.egg.zip'):
+             name = name[:-4]  # strip the extra .zip before download
+
+-        return os.path.join(tmpdir, name)
++        filename = os.path.join(tmpdir, name)
++
++        # ensure path resolves within the tmpdir
++        if not filename.startswith(str(tmpdir)):
++            raise ValueError(f"Invalid filename {filename}")
++
++        return filename
+
+     def _download_url(self, url, tmpdir):
+         """
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
index 71c8eb1a1f..91d8fdd73b 100644
--- a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
@@ -11,7 +11,10 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI += " \
-            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
+            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
+            file://CVE-2025-47273-pre1.patch \
+            file://CVE-2025-47273.patch \
+"
 
 SRC_URI[sha256sum] = "43b4ee60e10b0d0ee98ad11918e114c70701bc6051662a9a675a0496c1a158f4"
 
-- 
2.40.0


