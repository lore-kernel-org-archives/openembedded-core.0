Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1880.1632430426432782576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 13:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FFG5cvdb;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4900a564d0=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NJqLbY013565
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 20:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=zYoT6G6Ml/Ql4tvi6bpuHqzBzY5WtkG/3nmLw4ilT+I=;
 b=FFG5cvdbg7RleXszK2ajC9hI+QisvvZKaTaGMAOxnOZgeY4Q3p02/ZboHljaqn+MQpv8
 7JLJ0t7MhpJ+5sFfpjWtWFiSjwUlsNQfRgpeK+BbxC2swuPUuYxZZeBkPb+vwhHH+3Op
 hbhJh0N5fULPDNCldubVfhEYga0awmlLalSF/xAkqGyvckzNW+s0shsjlC3z8f7lXxZE
 cZjSm9oOqsGaH1Jzlj5An566sK4+xttdTS6rE2eCbS5ibDui9XmTpQa0mgznLeEAouER
 OEwPw0zl/ZB+bzEtp3Wyo3AUJLRZW9xr8eG45r9px73OukkjwqxvdeLLPZN+5Sku9s9u LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b8whh8686-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 20:53:44 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18NKpVkI001962
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 20:53:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b8whh8684-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Sep 2021 20:53:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyTyr43D+w2/r4e+boOuuNH3oiA/XZ4tPDoJgDEsIx6ozHrAwivL9QE3yoEtHSIBlRKtH1/EdRpEmXbcEdurP1v2NMo5Kem4SdPE44S+za+PuOfmeWY41D/qavfeoWrCa9QajkfNgz64faO3zukXirGqIt4tShn14pSXP8zwA7yI/5qFl8QoORaXoPCBZc7/TUg7KbROFM1SfYWGTCuNK0hzMC8Q6Vel4W9PwGVzMjftz+QTuXXdR9MMKlw5w1Z6ZklvAsuHm5hOZmU0nTJTUW+4LfbX0bS+PI4MObhFDcLeHZ67S+AThbvX/9sGr2RBVmouvCRDmEUuINUUTsE+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zYoT6G6Ml/Ql4tvi6bpuHqzBzY5WtkG/3nmLw4ilT+I=;
 b=MVoTkJo7wBzowXHtgf7G3k4CJsBLC6wggSBmjqoLPbbF5JVfndfq3Es+lCW/RYDDLg6Non9IH5zFyyGSw6jS9JswqLhzSRLgyzHszxvVOm6cHJJg5rMY57OIFwVwkPVLXjmvkYTmDfGSFjG35IXDx8QuDC4R+FOKHKAJoiMfNomL9z3uQz4S49098TbPVW38GyKefn86BDDE/X72JeUULos92h7IB1xbWJb0eZ1fDfmXuP1+mVGKTOekJtXgCGUb6FPRqxPz/sCokaOKpqoJ017TUjX1ek6uerV3m0x3tkTmzZVNuMLMe1HRLvUjoABjpBoOVgi63qmJIj5SldIjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 20:53:42 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::e5b7:1e6c:e33e:3b52]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::e5b7:1e6c:e33e:3b52%2]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 20:53:41 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Subject: [PATCH v2] create-spdx: Don't collect natives sources
Date: Thu, 23 Sep 2021 13:53:28 -0700
Message-Id: <20210923205328.2662727-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MWHPR14CA0056.namprd14.prod.outlook.com
 (2603:10b6:300:81::18) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR14CA0056.namprd14.prod.outlook.com (2603:10b6:300:81::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 20:53:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5443f066-b19b-4f8b-e567-08d97ed439a4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4960:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB496064DB5847A35797175D6AEEA39@SJ0PR11MB4960.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/SR7FeGPbv60n3V4AFJLo7wfGCxOJM6cVgmZmG/gA+5WCDLfnZWe4Biujp6wYdy9y7XoDey2nyCLXv4yH1Aj5FHeKGjfvqJB51N62zRhWfZeSskxb3FnQAAayaW6RpuHgFYp9+AjHV43wuTWZWZmP/xuuc12znjBT9G4ZYJtb7o8fTBgdidijjySt25cKTyjAZB9XFxNF4L4aU/H6RquNfKpUMXcmAyz9+FpalqTJ5kW1i3W9GmfLw2v6iAxKhyr/n2BBEdqp/AvMeF3+mQJZ8t/zuJdzqHctEXdXRbnVtGDEwvLdmXQtzLvTaNOt0+VzcotioXaSWHzvD6tzJhudYGWuocM/0/3eZ7Y1zdTH927fnt6ZWOCtwmSFvEKZwEsLNIiyfsD05n6QSatQi5tLYAT1ZsjZBty0o9M6P5Bx48aoApqY0EIxUmfgtQOWz8Cv74aiPx0eyyouQwMT3NzQPRkeISo8thbJByl2qD8feQgZTE6/RNuWpuPdkridssnM4JuuRD9+lIlFRWWPPKbQPAgb514ybn7sCgHd2D4enbEgmM/f12XW2ac/OvIFN5HDAStlHDVoOBn2lsvk7Wyr/Nr5WecwQE/ojj0OhM5qJmoHzxPtHVwU8gOf3yO93W/DLjQMBYtW8wPQaDtlvGo/559camTVQjQCIVqpeEgj+hZhlPwHVuE/pgqHWlKmh7S8b0aCDOHSi4/gJ2FuH9UBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5085.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(186003)(956004)(66556008)(6506007)(8676002)(66946007)(6486002)(5660300002)(8936002)(6512007)(2616005)(36756003)(66476007)(508600001)(38350700002)(52116002)(316002)(83380400001)(86362001)(26005)(1076003)(38100700002)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7UYj5hVjH9WA1oVLQaSPnVNlXVh6Y2J8QIj+3M244w5V9AlhW27nAtFXEoqe?=
 =?us-ascii?Q?UDIWYsM7TBG7dwuIQl0pCoTrC39L9pM/Lj4F/2c0upBAYkxKlb8VZjDA5NLw?=
 =?us-ascii?Q?qdgLS09CsOkc/X3vQLX+ovk1aT4QG6e/R4QEUHc1kGfLFSU8l4XczrwDxWnn?=
 =?us-ascii?Q?srBnUEgYQ4jl/RFQ8UsTk/d7xI5GuoOn+mmELjDy3kUXvBMQMPGSmzlyDid1?=
 =?us-ascii?Q?a0X8wwiX8pqpDAguC4vWxzK2jf44Z9INkG2q79KRpvv1rTx9j69HgG51SfMo?=
 =?us-ascii?Q?YhcF2BUdFq3IYjEmPpDrKjiMazLeP0ALcSmfYnVAskcdbhtINSyzTcmU8ko5?=
 =?us-ascii?Q?1wHQEslk0W8SUhNEb2JR4sGc2nUpqrCI4YsZL+2zubWYY0ydhLaNW6hMgd4K?=
 =?us-ascii?Q?xi1SsD6krVV//fG1+gWE/hPTLRXIJKVZQQD0qrzBo2cw2Un6xaJacxHetYHd?=
 =?us-ascii?Q?zCJr4TakWzKFhoFmMhs2mDK/mlQJUPQhKAO7vNW0NJffVfGkfz6c2cIAEES5?=
 =?us-ascii?Q?t9vOAUzGWh18jCk2ZY+prYKB/za/fu1ULajFJKIMZz//oSpntKvr6QfRqmBi?=
 =?us-ascii?Q?v72JJB2jt3N854mH5je3oONvuO1Oe/92WqKKKF9EEchfyagUX8Bpl8JCdAG/?=
 =?us-ascii?Q?5ElMG7YtohSIZY7ALO/B+SHriGd5Nelj2n+3C7bpu87hT+34jpLQd6NsuA9W?=
 =?us-ascii?Q?H108lY8xnMgVy4FpS8tedZQDM4Ui/tfadrwCG6wmmIOJWOd7Q0E1XA0N90oP?=
 =?us-ascii?Q?Eo9lv1j0M18J2wpARW5j+g+5/d1kA039PzGCn51EKLQcr+R5KhGWYlSQavAb?=
 =?us-ascii?Q?3DAvwTYv9kS6PEf7VouSWFngsiE0vnyiTuQLPrJk/gso+ri4ex7DS+UN3SR4?=
 =?us-ascii?Q?//fQwIHW1WOgNogGVDFcwyHIWZfCG2caCgvqAxL/Xp8o3lVKRNVmL9Ib5L+l?=
 =?us-ascii?Q?poJxZ5nc6ncFkuz3dFXD6WnVpK1Gzx7wyebFupPrmdfP7T/J00UtkmYLWWD9?=
 =?us-ascii?Q?vtBAg3/ZqZ4YiS+BABXgnx5fazsmSR17VeRpYStXM/F4W2/h9H5ovpRQbG6F?=
 =?us-ascii?Q?loL/O29tnlvufbRIqexgbY/29tbSrqd6mWFujOwoNHLOagBsEYa67Z0jFiXB?=
 =?us-ascii?Q?PHs6IM6kksh//Lv3elw7LQ1mRDe/COUMiy5840NIlYtWyta/iiHw6D6wYEgk?=
 =?us-ascii?Q?e5t33mlo/pvOWH9rhYB3bn/DWm76Rbzh7ayS/lySdUy5PwB07XJrSbqXQ1g7?=
 =?us-ascii?Q?0KXKJRTRhyobzaHHBVYqlpNvMC77+ZtDn7KVnspxcpR3EpLXTNmm9S1mDFgc?=
 =?us-ascii?Q?P5QnIrcsz9MMq/1PqxJJGJdW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5443f066-b19b-4f8b-e567-08d97ed439a4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 20:53:41.6513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dk2vI7Frp38jtDYWb2Fknx205JyGKH9oeLEmbtCyFBMnhu/KE0SRSa8T0PHoc6prkYUrquAtWU7x+AtRg1K+GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
X-Proofpoint-GUID: deUy7QLfkLCtuGlK0A_naF6UjfRAjzz8
X-Proofpoint-ORIG-GUID: YBzbwCQrop5nwBXErBOJFSgQIP17CQcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_06,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230120
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Extend the SPDXPackage to include is_native so it can be used later in
the processing.

When the collect_dep_sources() runs, it collects sources from both native
and non-native recipes. Later when the GENERATED_FROM matching occurs it
may find the file (via checksum) from the native recipe since it's the
same checksum as the target file. The that are generated DocumentRefs
point to the native recipe rather than the target recipe DocumentRef.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx.bbclass | 11 +++++++++--
 meta/lib/oe/spdx.py              |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 3c73c21c04..e565f0bf6c 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
 
     sources = {}
     for dep in dep_recipes:
+        # Don't collect sources from native recipes as they
+        # match non-native sources also.
+        if dep.recipe.is_native == "True":
+            continue
         recipe_files = set(dep.recipe.hasFiles)
 
         for spdx_file in dep.doc.files:
@@ -382,7 +386,6 @@ python do_create_spdx() {
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
-    is_native = bb.data.inherits_class("native", d)
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
@@ -401,6 +404,10 @@ python do_create_spdx() {
     recipe.name = d.getVar("PN")
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
+    if bb.data.inherits_class("native", d):
+        recipe.is_native = "True"
+    else:
+        recipe.is_native = "False"
 
     for s in d.getVar('SRC_URI').split():
         if not s.startswith("file://"):
@@ -480,7 +487,7 @@ python do_create_spdx() {
     sources = collect_dep_sources(d, dep_recipes)
     found_licenses = {license.name:recipe_ref.externalDocumentId + ":" + license.licenseId for license in doc.hasExtractedLicensingInfos}
 
-    if not is_native:
+    if recipe.is_native is "False":
         bb.build.exec_func("read_subpackage_metadata", d)
 
         pkgdest = Path(d.getVar("PKGDEST"))
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 9814fbfd66..452148f339 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -164,6 +164,7 @@ class SPDXPackage(SPDXObject):
     packageVerificationCode = _Object(SPDXPackageVerificationCode)
     hasFiles = _StringList()
     packageFileName = _String()
+    is_native = _String()
 
 
 class SPDXFile(SPDXObject):
-- 
2.25.1

