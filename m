Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1663.1792707121883573511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=1mn5kajq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.93.195.43, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPvR8jzLqMY8qH/x9fSicsycUiEqO/02GP4kb6rui0CK08x3Ahll11X9EjDP+/9ocsluP35ux28e0wGwnwDWnFszTBiapzjfiRTCM4fwrq+vqgwSkdODSKkUTLeHwBqkl4bbDi3ckPrVHqrVD3g3kr6Hj4zqW8jXK2393eXLH5gW6idw/GMe0u2XU+10DwGbUFRngMHOp65k81KCOurJrT02PqgosZSvckK2pos5wluQidlP8kGGiT6fw0r3B/KUKBRpTVmraMDO14ZnUPE6oeHCAA3WdYYoVSvLujGJsbRX3HeqTEt0Yx1t3yS8JrGzvJJqKdo8pg8YlhkduhNxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ER5cl5eHWD3MSW/cIbl42vWCcRLemiutvqzfuUAEuwE=;
 b=wXSLNbzLWExDmGWjRLZdouNiMZn5ddAaQrQfW4Xczkq9TYTeIcpIHgi0VOCWdl4QTuHWs3j7gFSQmy4u9Je0NqKUOSYieli9z86vBnmxgxuUlXIop3tlFVNOjvg9rKVynLH2XRzzmlO8yf6HSuVii07W+iOhAme9jaA32cyoRebhQblmOQi/dhpgfx2zcAN/wPNoYJwm7UDER6kK1WShIPIZ4o5tDhmKx6yrYS312EdpPaZxw8hqr2rt2mABZgQBgtBSHcT1rvxRpSCQBV03neTJaBIeOqeyc/Xfi2ie+1hir+JMA9Y9py66ZliYc6XdNtEF2z0LXS3DGkMQyy94LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ER5cl5eHWD3MSW/cIbl42vWCcRLemiutvqzfuUAEuwE=;
 b=1mn5kajq3HIbf5zDRfw0Uh62tJVUwMHLSebTnLs9WCyqeHdnpkkGmHwCqUhA2aAbmhqyfyTlcrjvrgq1L0wirPRCGVGEmcM4ksCYuAIAXeIhrfwqem33JxBrukkOHQifLxk19jTMiX4TOqg2wLmNHk8/wYfdyotNRyJdrma54eU=
Received: from PH0PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:5::31)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 22:11:53 +0000
Received: from PH3PEPF00059617.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::10) by PH0PR07CA0026.outlook.office365.com
 (2603:10b6:510:5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 22:11:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059617.mail.protection.outlook.com (10.167.243.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 22:11:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 17:11:52 -0500
Received: from xcolc230100.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 22 Oct 2026 17:11:52 -0500
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vex.bbclass: Add support for SDKs
Date: Thu, 22 Oct 2026 16:11:52 -0600
Message-ID: <20261022221152.1056037-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mark.hatle@amd.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059617:EE_|SJ2PR12MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 7adfd55d-c173-4286-5846-08df30897a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|6133799003|10067099003|18002099003|261021121427099003|3023799007|261022115727099003|11063799006|261009223027099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: WEvk1gVwopeswwK2goz71/GWX3Tbs8UKyA1QpXzm+0vu7w+SBhUuNxaNksFYf1eRirwQWchM3CGh9wpjDG57TOuVo7eIrkNh2R76sp2VQXJ47AXl7vd5WDuLjxdASblazAIY4snmXFT7X4xwMY3xCaX+8l6gTFCXL3Ge48nKZZwnq0goCKo29CPVrz08shg2oKNJlFD2nocz+U+269rLLHKbLravlnmkcKRhzTvuHZGPtbOYegFuuOBE99KY029r5V4UvDa9IhvpZKKCajz0azzoeF8mOclwikq4k187RPofjs8lccjUIm52IQLrwX8bqSqd+fGPR2LMIPCgMM2D3yl6zXfhBkGa+hFOj7V2G2hkwgGGHkiH+oA7gketPw22+v6g497vu1elSZ8HJ9WteniRzbnUvsKenWV88jBBRIMuTwTTRsTYD9hYWKTmWBoNG0iMQBoNVwauRt/iu0k1BW8IonNLVph5L9Xvx2W12Ii3ZRDizfJ+JugNnp2EEqFqqH1AVdKTIsgLHfrSKaZ9lEFG27Qmj/4boeRbSMlVvH0SH8CN/V5raIfpaHM0pC+sJl7jCDTxjLZvqFgmWG22RGAQUIEKKlOzuspNMf3frGXdqGQ+baCcTi1okaJNSqLx+WG+EYPAi8Lf+jim2QtMZONOfGgCNjwfUejSECc7dwOegjcAaRz3jhEPvPL0JudAKgoOBGMCWrVry//JPVRm3Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(261021121427099003)(3023799007)(261022115727099003)(11063799006)(261009223027099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uzIoXWX5X4lUqGQbzugEtrNwf4S8baHNdFIpKiW0U4ghoxIcRXVOEdl+d8Ggliqjw/laeTrYwGqcnM0qFT62JGc4ZO1tAe8TTn7wn2k8HcfXPkTAGkuzdvBTWWRkwDHr1TfJ2r4eW7haUCr0ElNhIrOzTOyztFKxOIpfUmCQEhDYkxtF3RDFEAjwfdzU3VO/VhckOLYUZ5qZ6CXA2FcMQSwn0L9/N1Z5ihLs1saWRRclplKLALYmgXZXOBnD/Ontw6qdv908k6Z4bdyusL/8H3eZU6FDKRXlTTXwZXVWFEOuhcBFLYpbikW7h1mpCnMLVK+azK//tE0l/ZdJBRog0wBcqvd0f3vOXnEa4QQokM7B70k+U50rdkEHeqKjtvDlTdfCASeBasLBFNr9/6YwuyvaQPXPcrKU3sxAp88j1RDGPcYBtVFZ1s/6UsDhbqik
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 22:11:53.2474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adfd55d-c173-4286-5846-08df30897a75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF00059617.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248455
Content-Type: text/plain; charset="utf-8"

The existing implementation only worked for image recipes. Enable SDK
generation for both target and nativesdk manifests. This is based
on the existing implementation, using inspiration from the buildhistory
class on how to connect into the SDK generation.

The code is handled by generating two vex json files, one for target
and one for nativesdk (host) items.  As a final step, the two files
are merged together into a single vex.json file which is deployed
alongside the SDK, and related spdx.json file.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/classes/vex.bbclass | 92 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index b3c2aca762..b4f78a5d49 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -34,6 +34,7 @@ CVE_CHECK_SUMMARY_INDEX_PATH =3D "${CVE_CHECK_SUMMARY_DIR=
}/cve-summary-index.txt"
 CVE_CHECK_DIR ??=3D "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE_JSON ?=3D "${CVE_CHECK_DIR}/${PN}_cve.json"
 CVE_CHECK_MANIFEST_JSON ?=3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.vex.json"
+CVE_CHECK_SDK_MANIFEST_JSON ?=3D "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.=
vex.json"
=20
 # Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?=3D ""
@@ -298,3 +299,94 @@ def cve_write_data_json(d, cve_data, cve_status):
         f.write(write_string)
     with open(index_path, "a+") as f:
         f.write("%s\n" % fragment_path)
+
+def vex_write_sdk_manifest(d, target_type):
+    """
+    Create VEX/CVE manifest when building an sdk
+    """
+
+    import json
+    from oe.sdk import sdk_list_installed_packages
+    from oe.cve_check import cve_check_merge_jsons
+
+    # Create a list of relevant recipies
+    recipies =3D set()
+
+    if target_type =3D=3D "target":
+        pkgdata_dir =3D d.getVar('PKGDATA_DIR')
+    else:
+        pkgdata_dir =3D d.getVar('PKGDATA_DIR_SDK')
+
+    for pkg in list(sdk_list_installed_packages(d, target_type =3D=3D "tar=
get")):
+        pkg_info =3D os.path.join(pkgdata_dir,
+                                'runtime-reverse', pkg)
+        pkg_data =3D oe.packagedata.read_pkgdatafile(pkg_info)
+        recipies.add(pkg_data["PN"])
+
+    build_dir =3D d.getVar("B")
+    json_name =3D d.getVar("TOOLCHAIN_OUTPUTNAME") + '-' + target_type + "=
.vex.json"
+
+    sdk_name =3D os.path.join(build_dir, json_name)
+
+    bb.note("Writing sdk %s VEX manifest: %s" % (target_type, sdk_name))
+
+    json_data =3D {"version":"1", "package": []}
+    text_data =3D ""
+
+    save_pn =3D d.getVar("PN")
+
+    for pkg in recipies:
+        # To be able to use the CVE_CHECK_RECIPE_FILE_JSON variable we hav=
e to evaluate
+        # it with the different PN names set each time.
+        d.setVar("PN", pkg)
+        pkgfilepath =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+        if os.path.exists(pkgfilepath):
+            with open(pkgfilepath) as j:
+                data =3D json.load(j)
+                cve_check_merge_jsons(json_data, data)
+        else:
+            bb.warn("Missing cve file for %s" % pkg)
+
+    d.setVar("PN", save_pn)
+
+    with open(sdk_name, "w") as f:
+        json.dump(json_data, f, indent=3D2)
+
+python vex_write_sdk_manifest_host () {
+    vex_write_sdk_manifest(d, "host")
+}
+
+python vex_write_sdk_manifest_target () {
+    vex_write_sdk_manifest(d, "target")
+}
+
+POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " vex_write_sd=
k_manifest_host"
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " vex_write_=
sdk_manifest_target"
+
+# Merge the target and host vex files for a single SDK file
+python sdk_create_vex() {
+    import json
+
+    build_dir =3D d.getVar("B")
+    target_vex_name =3D d.getVar("TOOLCHAIN_OUTPUTNAME") + '-target' + ".v=
ex.json"
+    host_vex_name =3D d.getVar("TOOLCHAIN_OUTPUTNAME") + '-host' + ".vex.j=
son"
+
+    target_vex_fname =3D os.path.join(build_dir, target_vex_name)
+    host_vex_fname =3D os.path.join(build_dir, host_vex_name)
+
+    json_data =3D {"version":"1", "package": []}
+
+    # Merge the files together
+    for json_file in [ target_vex_fname, host_vex_fname ]:
+        with open(json_file) as j:
+            data =3D json.load(j)
+            json_data["package"].extend(data["package"])
+
+    manifest_name =3D d.getVar("CVE_CHECK_SDK_MANIFEST_JSON")
+    bb.plain("SDK VEX JSON report stored in: %s" % manifest_name)
+
+    with open(manifest_name, "w") as f:
+        json.dump(json_data, f, indent=3D2)
+}
+
+do_populate_sdk[postfuncs] +=3D "sdk_create_vex"
--=20
2.34.1

