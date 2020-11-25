Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.600.1606330727280025735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 10:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lnq+90sV;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWhYNVGgrlQcGaXHz7C/EqLmqTHJp4PsBJGBh3Szi6Jcp1aLkJAG9Zjq5nR0UG6xf9MOlg9eQf8fOL4WFERU4+p8bUAQVK57i9SD6N/qjBL/ffhywrc3DQPa91r0EIJzNCfQXTszJ6VHpYV0t7PIGgKtkZm1Q6y93CyOPM3WJ3sKIDRMeQqCtQVZ43g5I8PT24C+uHKwCFa37CJA/wgiHa+CmVo1TQdO1gXxDT+nfDy9Ivu4cK8W5mQY+ZYGgRmKa+4paK9WtvsJDNbFM2tLJMTm29JBFUhilxilivPjkIh1smLiSk1fzKJIaxItRlmX5KeBNHgHaI+OdlRJC4sxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KlU0ttI0jJE3OHeTPFEc4Kxu/atSQqIQh2TApvjg5s=;
 b=LdaefM8vXPJ5YpFEjqFrAehahXhC2D/YY61tyidOTy1XoCAFUnlSe4DiAcWYWbZ+Xo3JHuuVNb7HCc3PA8S6nl7mJruxFwFOI5l30zFs56Q4f8MzrvE4+cL8I8fLt36/Cmj5NRpcPQlNxAJp1LZ/rh6otshKe/447OFi3FmftW0j+5944mEI8JQxTNGaM0LZwKdidF6FVys9hHGiSJFxKXfQX6Ngx3U+uChHOO8VJrCUMkof8XF6ZJZ6wQjj50xBhNFEaVa4rAcgZLWiEzt6t6Kljv6m4d1lbTayJcuYTd1DSVePT09xGKGSvjZ3Bko2y5M7RqAu3I8qGHXS8aJpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KlU0ttI0jJE3OHeTPFEc4Kxu/atSQqIQh2TApvjg5s=;
 b=lnq+90sVgvNeravkIjxRvt+meTqJhJ6E49GynfTOSvrKfXTDC5ndlnOKlYlvbmDx5C79a9zLDGwobTMlv5cUXWuSxHF5I6MeDifhcYi9VAVIwZ0IUkbLcWnOZU3R4pYWnJbqO320gmDQ2i/jindq1O+HdY8ixzgZgde+9NJU+Zs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB1884.namprd11.prod.outlook.com (2603:10b6:3:112::19)
 by DM6PR11MB4137.namprd11.prod.outlook.com (2603:10b6:5:199::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 25 Nov
 2020 18:58:45 +0000
Received: from DM5PR11MB1884.namprd11.prod.outlook.com
 ([fe80::a1f2:8db6:916b:2985]) by DM5PR11MB1884.namprd11.prod.outlook.com
 ([fe80::a1f2:8db6:916b:2985%11]) with mapi id 15.20.3589.022; Wed, 25 Nov
 2020 18:58:44 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/buildhistory: record LICENSE
Date: Wed, 25 Nov 2020 10:58:29 -0800
Message-ID: <20201125185830.3688293-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR19CA0079.namprd19.prod.outlook.com
 (2603:10b6:320:1f::17) To DM5PR11MB1884.namprd11.prod.outlook.com
 (2603:10b6:3:112::19)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by MWHPR19CA0079.namprd19.prod.outlook.com (2603:10b6:320:1f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend Transport; Wed, 25 Nov 2020 18:58:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3848adbc-1ee8-48b7-4a6f-08d8917421f9
X-MS-TrafficTypeDiagnostic: DM6PR11MB4137:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB413781CEFF939FE64A0A107FEEFA0@DM6PR11MB4137.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2UMqPAXU6lubATMnr94YeYif3rHk9qFMDgRm/cDdUcS6Dkx017qyzXdqfpp+DpqUk8CFCo48IP3FqSIuJVDl4//UqnOfUfNPZNBjF2dCsBwuVIPvYhebN4EP69zPNKDp+HPChrRuft/QGBsQuzXqOKx57UycATmRrTr32WAqrkYvo4rNkzBPaxD/oyYXlO3MUddUHrT4AhxDv8F+U098cDzOjuaucFPSNIx1u8xwi0kc/eozwdzQfT0k134ztmYmPqDyDEr6qvzVvnGPjcTII87ku97eLMXxgDxIoFhnwBmo+/4In9EgYgi05YT7p+4j
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1884.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(186003)(16526019)(2906002)(26005)(6666004)(316002)(956004)(66946007)(66476007)(6506007)(66556008)(8676002)(6916009)(1076003)(5660300002)(2616005)(44832011)(86362001)(6512007)(6486002)(52116002)(478600001)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?21Lio0stNsa7ou5CdyzuuJAtR/MqPtBfFZLSZw6rj2TVfDMSa1rZcrXVtktF?=
 =?us-ascii?Q?aU7kbpYJcTMINjH9uDjzmFvSxeeisXOSGFtAtkySua2XpQJAYUco4CkV1pf3?=
 =?us-ascii?Q?ZkQgveohpGp9mPSt/8O8AOItxKhD8gyIfAEC4qupJmCeWsDWrPWU0VBD3l0k?=
 =?us-ascii?Q?qu1M2+bWq7D4DDed+xHVsPOP97YHh/BMiFHxSaVm1CzwqidmJrze2kHc0lGc?=
 =?us-ascii?Q?TjWo35CvMkDEbk5Zd5TXyAYh7OrqpSWHc/H5h9/S0hxA2ViuLB8505f2vZqh?=
 =?us-ascii?Q?xhVEBP47Ta83AKV374pbJ6Mrq+UIC32s69wN+kETpRUtE3GGEgsu/daJIm9x?=
 =?us-ascii?Q?lMYcSRpM0XMdn1LCThFurzjtBL8Jsxm2+mg9IrSbHuXy+z+jsmcGMg+JuCIP?=
 =?us-ascii?Q?akz6NjPEwtTMlCeOTBPdlZOPuEfK/kScaad7HvZDM4Z2tuyypLfbQSbJE+3k?=
 =?us-ascii?Q?eoITCk30ubbQ2C+w0A1q6prGftikgjIS5EYxxcGh5/w5Oe6173oJDsQ6n9v6?=
 =?us-ascii?Q?jiTIHImWw33rEq+ztW+tbF8/TKS83u0w5LHhcL81afVY5vPOmSE5JLFb1W9x?=
 =?us-ascii?Q?zDuDVUcA0SXc7OyDaLlP5XlxLNusd8layS3AoSFnYfVNLjpRb5t+7JDw+Ubz?=
 =?us-ascii?Q?9iQgLsf3g8fJo7l2/Te9GKson3oqtq9zeJ5ieoDa1auYkgfT75phOqlNjhtl?=
 =?us-ascii?Q?0LqtI+mv+t44aQOtTh86XA+2LHJcH7n7jFzAJoGqyYFvFZ61jpcA8LVC0Wu+?=
 =?us-ascii?Q?waFaJw5I0iWgAzNJI7fWlERbBmG7HT/1FWWsRhGS1fLvIVUGJWngUey4htec?=
 =?us-ascii?Q?FEza4HLhdnGo/9+bnULypBauaclmQHlDbTzgwy+Nhy2RdSRLTnrdH76lYgYw?=
 =?us-ascii?Q?6ktJaP+H6doq7bIZ8s8GjW7Tn6PlwhO6vxuUewlAJJ8SlXRLbwt7GKfLu89M?=
 =?us-ascii?Q?nSia01xphvn25Er6kmgMBiIpK39xDVophI2KME4ZUTq2ij/rS1P5VR1Yd1tp?=
 =?us-ascii?Q?5cWq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3848adbc-1ee8-48b7-4a6f-08d8917421f9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1884.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 18:58:44.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvZNeVKtrncEL0xq1oNbP1hafJPX3dVMN08y2iHBeoNuQErc5sCQNhMqRn8QwqTA6BnGJEJfdYqOuHsjddPk/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4137
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Buildhistory stores various bits of information at both recipe
and package level, while there is an associated license manifest
directory tree it would require additional scripting to extract
that information.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/buildhistory.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 7d5e3eb8fd..daae056144 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -115,6 +115,7 @@ python buildhistory_emit_pkghistory() {
             self.packages =3D ""
             self.srcrev =3D ""
             self.layer =3D ""
+            self.license =3D ""
             self.config =3D ""
             self.src_uri =3D ""
=20
@@ -218,6 +219,7 @@ python buildhistory_emit_pkghistory() {
     pv =3D d.getVar('PV')
     pr =3D d.getVar('PR')
     layer =3D bb.utils.get_file_layer(d.getVar('FILE'), d)
+    license =3D d.getVar('LICENSE')
=20
     pkgdata_dir =3D d.getVar('PKGDATA_DIR')
     packages =3D ""
@@ -258,6 +260,7 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar('DEPENDS')=
 or ""))
     rcpinfo.packages =3D packages
     rcpinfo.layer =3D layer
+    rcpinfo.license =3D license
     rcpinfo.config =3D sortlist(oe.utils.squashspaces(d.getVar('PACKAGECON=
FIG') or ""))
     rcpinfo.src_uri =3D oe.utils.squashspaces(d.getVar('SRC_URI') or "")
     write_recipehistory(rcpinfo, d)
@@ -369,6 +372,7 @@ def write_recipehistory(rcpinfo, d):
         f.write(u"DEPENDS =3D %s\n" %  rcpinfo.depends)
         f.write(u"PACKAGES =3D %s\n" %  rcpinfo.packages)
         f.write(u"LAYER =3D %s\n" %  rcpinfo.layer)
+        f.write(u"LICENSE =3D %s\n" %  rcpinfo.license)
         f.write(u"CONFIG =3D %s\n" %  rcpinfo.config)
         f.write(u"SRC_URI =3D %s\n" %  rcpinfo.src_uri)
=20
--=20
2.25.1

