Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43995E7719B
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:47:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22893.1736351241269277126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:47:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310345b2cc=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5088Foe1011901;
	Wed, 8 Jan 2025 07:47:20 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fphrqjb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Jan 2025 07:47:19 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 8 Jan 2025 07:47:18 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 8 Jan 2025 07:47:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <colinmca242@gmail.com>,
        <JPEWhacker@gmail.com>
Subject: [PATCH 3/3] SPDX 3.0: add CVEs from cve-ckeck results
Date: Wed, 8 Jan 2025 07:47:18 -0800
Message-ID: <20250108154718.3031653-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108154718.3031653-1-hongxu.jia@windriver.com>
References: <20250108154718.3031653-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: HPJMUqg1Yh7DPZl9-vVH4dIGBr9USr-J
X-Authority-Analysis: v=2.4 cv=Oa1iDgTY c=1 sm=1 tr=0 ts=677e9e08 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=24AZYWMyAAAA:8 a=sMBj6sIwAAAA:8 a=8r2qhXULAAAA:8 a=t7CeM3EgAAAA:8 a=hp1-KM5lZeSNv_x1iPoA:9
 a=bG88sKzkDEFeXWNnvthB:22 a=8gvLZcY7Nlvl4CGD_6nf:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HPJMUqg1Yh7DPZl9-vVH4dIGBr9USr-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501080131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209575

Originally, SPDX 3.0 added CVEs from CVE patch and CVE_STATUS
in recipe, this commit adds CVEs cve-ckeck results that is
generated from NVD CVE database

Enable it by inheriting cve_check and setting 'SPDX_INCLUDE_VEX = "all"'
otherwise still added CVEs from CVE patch and CVE_STATUS as usual

$ echo 'INHERIT += "cve-check"' >> conf/local.conf
$ echo 'SPDX_INCLUDE_VEX = "all"' >> conf/local.conf
$ bitbake glibc
WARNING: glibc-2.40+git-r0 do_cve_check: Found unpatched CVE (CVE-2010-4756)

$ bitbake core-image-minimal
$ vim tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.spdx.json
...
    {
      "type": "security_VexAffectedVulnAssessmentRelationship",
      "spdxId": "http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vex-affected/1ae2a2b94bac9bf0894b46b0c3194416",
      "creationInfo": "_:CreationInfo161",
      "from": "http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulnerability/CVE-2010-4756",
      "relationshipType": "affects",
      "to": [
        "http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/package/libc6"
      ],
      "security_vexVersion": "1.0.0"
    },
...
    {
      "type": "security_Vulnerability",
      "spdxId": "http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulnerability/CVE-2010-4756",
      "creationInfo": "_:CreationInfo263",
      "externalIdentifier": [
        {
          "type": "ExternalIdentifier",
          "externalIdentifierType": "cve",
          "identifier": "CVE-2010-4756",
          "identifierLocator": [
            "https://cveawg.mitre.org/api/cve/CVE-2010-4756",
            "https://www.cve.org/CVERecord?id=CVE-2010-4756"
          ]
        }
      ]
    },
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/create-spdx-3.0.bbclass |  7 +++++--
 meta/classes/spdx-common.bbclass     | 11 +++++++++++
 meta/lib/oe/spdx30_tasks.py          | 29 ++++++++++++++++++++++++++--
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 25f3aa5f43..e3d6f95e3d 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -42,8 +42,9 @@ SPDX_INCLUDE_VEX[doc] = "Controls what VEX information is in the output. Set to
     'none' to disable all VEX data. Set to 'current' to only include VEX data \
     for vulnerabilities not already fixed in the upstream source code \
     (recommended). Set  to 'all' to get all known historical vulnerabilities, \
-    including those already fixed upstream (warning: This can be large and \
-    slow)."
+    including those already fixed upstream, if cve_check is inherited, set to 'all' \
+    to get all known historical vulnerabilities from cve check result \
+    (warning: This can be large and slow)."
 
 SPDX_INCLUDE_TIMESTAMPS ?= "0"
 SPDX_INCLUDE_TIMESTAMPS[doc] = "Include time stamps in SPDX output. This is \
@@ -141,6 +142,7 @@ do_create_spdx[vardeps] += "\
     SPDX_PROFILES \
     SPDX_NAMESPACE_PREFIX \
     SPDX_UUID_NAMESPACE \
+    SPDX_INCLUDE_VEX \
     "
 
 addtask do_create_spdx after \
@@ -164,6 +166,7 @@ do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
 do_create_spdx[depends] += " \
     ${PATCHDEPENDENCY} \
     ${@create_spdx_source_deps(d)} \
+    ${@create_spdx_cve_check_deps(d)} \
 "
 
 python do_create_package_spdx() {
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 81ad4d3b7a..8918448c35 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -39,6 +39,17 @@ SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
+def create_spdx_cve_check_deps(d):
+    if (
+        d.getVar("SPDX_INCLUDE_VEX") == "all"
+        and bb.data.inherits_class('cve-check', d)
+        and d.getVar("CVE_CHECK_FORMAT_JSON") == "1"
+    ):
+        pn = d.getVar('PN')
+        return pn + ":do_cve_check"
+
+    return ""
+
 def create_spdx_source_deps(d):
     import oe.spdx_common
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9baa40887b..e8658e2c32 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -437,8 +437,33 @@ def set_purposes(d, element, *var_names, force_purposes=[]):
         getattr(oe.spdx30.software_SoftwarePurpose, p) for p in purposes[1:]
     ]
 
-def get_cves(d):
+def get_cves(d, include_vex):
     cve_status = {}
+
+    # Get CVEs from cve-check
+    if (
+        include_vex == "all"
+        and bb.data.inherits_class('cve-check', d)
+        and d.getVar("CVE_CHECK_FORMAT_JSON") == "1"
+    ):
+        pkgfilepath = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+        if os.path.exists(pkgfilepath):
+            with open(pkgfilepath) as j:
+                data = json.load(j)
+                json_data = {"version":"1", "package": []}
+                oe.cve_check.cve_check_merge_jsons(json_data, data)
+                for issue in json_data["package"][0].get("issue", []):
+                    cve = issue["id"]
+                    cve_status[cve] = {
+                        "mapping": issue["status"],
+                        "detail": issue["detail"],
+                        "description": issue.get("description", None)
+                    }
+
+                if cve_status:
+                    return cve_status
+
+    # Get CVEs from recipe
     patched_cves = oe.cve_check.get_patched_cves(d)
     for cve, patched_cve in patched_cves.items():
         cve_status[cve] = {
@@ -498,7 +523,7 @@ def create_spdx(d):
     # Add CVEs
     cve_by_status = {}
     if include_vex != "none":
-        cve_data = get_cves(d)
+        cve_data = get_cves(d, include_vex)
         for cve, decoded_status in cve_data.items():
 
             # If this CVE is fixed upstream, skip it unless all CVEs are
-- 
2.34.1


