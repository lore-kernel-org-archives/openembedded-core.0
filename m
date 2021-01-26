Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.63])
 by mx.groups.io with SMTP id smtpd.web12.86.1611702370400750758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 15:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=S+mbcydN;
 spf=pass (domain: windriver.com, ip: 40.107.93.63, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leubO8mM1N5TOlCkQQjSjhaGY8o8PTbK2ezFaWHzH4kc3wSN+5OvXBVXa+cDkN+PNlfsQsRXx3gRjauCwPYrYh83q7047YTFnA51FJ/nZ2tkrabu9jQhO5BI1gaKlk3VG1D4NiUyQBql35Lum2b0chI9q/yz43WB5Px8a4sB6O2GZU7l6JILPT2dbD4s4DziAdh9Q+CjjIKw/d/H2l9ybnFGH37HbSvT04/m162zvL79pG67ddMjJqzRmLsMnlmCBCYnUX/OYWXk7QB1Ok1AnVVHbrjHB1vcV1CEbcxxXgJFskPASSZbHm5grFWOsZ2CSkheUEFrpI4j/GXoqhaCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neyxGj6XNLhVa9tNUFXSeP22LTIf93mHEPoantR28UI=;
 b=C9qgI4iTeKgUjt9cEB38kgHGgvLsZpla8YaUd/5FPkCKtyND66onaNlhtBtUE1DeptLvOL95jb5I3sdRjiBc3WfIvbZRf7MNBcBvJMJ1IWCGD0GmiVYvndPJfR/5a/spfvoibbLOSueGPmCVX9PsYkyQlOi5G0psoS/lnvxzu/Hr70Qh/tv5ePAmW4EaFb8Nrrf2L7nWfEuMYIp9FwkzzOnmMewxofedl9SKKu9YgL0XVyx88IFlwUQE9Kdw36ED36j5bvbYe1V26hl01zmq3qmsHLvbiqPG/nIvwbU0c5RvM4gOjIzhREkDKVvHnrfs266AHe0mMODLOGr4o2L3bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neyxGj6XNLhVa9tNUFXSeP22LTIf93mHEPoantR28UI=;
 b=S+mbcydNSu4+cp9+vCRXNk+CbgZxvrUH8gLGa7BKYZgxxpyS+6+WDMlaU48MtZ/EQ6mwJIo9q+tz4EmCZYyMpIU3hTnzXNxydcTw1T0ycUl4/S+HlZRXJO49Y2/VqM5GuIrFAr09Ld3PqUBll0Dkw/SaXD8SNDdW3bUc20J0NLQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 23:06:08 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%9]) with mapi id 15.20.3763.014; Tue, 26 Jan 2021
 23:06:08 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] sudo: upgrade 1.9.4p1 -> 1.9.5p1
Date: Tue, 26 Jan 2021 17:46:42 -0500
Message-ID: <20210126224642.29586-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::48) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 23:06:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22789b3c-a779-4beb-41e9-08d8c24ef74d
X-MS-TrafficTypeDiagnostic: SA0PR11MB4703:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB47035E452DA125533E804C7380BC9@SA0PR11MB4703.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GiUnkbzKSd/U1CwicpsfaYyw6oDw+SVQ77Z7vol2RV2fEBWa9nmDCF4lYEKCzKHEg3f8diukW3SU8KV1VEP2bkKBnXLxzLinCznXn8r6/8be7OEyBXbn9Vg+6CVvwzUHr8y1lISB6GDK3zOpa/tJN3gQFBpIPFPwa2laTtgIdMN2D8wVgw8TKtXZ5TSAnNlF59eYRltzuZTFyVza6v1ydKB5vhwm3xWRGhhbZsosInN4GeMgruckf5bij9rxp90qh1AxTOrKUpRgTwK2fSVzWXpjlRSl56fB8iSk2YwwQ5Dh4fZcg/59MVyCtF5pRQxWviBJmuxady4gDLOKYsXR/9UTDv+14kVzm4v7yy110bc1o3OXwytPQyf8lgoW4MRT2/LVnUbxbqUkd+tFgb7/6T3Bo8eDgcMSiQL2UROCW8Tb/o4VYQFG38MYlYXFwsAQsxgb3FfoM7n8umC8SYQMhvxUDg4EJ9e4fsOrpa/KmVT64GYy16Zd1ZaSFoimsMxGwva9qqMAZULP4x++WaO+g4GQU6taxYKFcTFNM7M1DeuK+4Om1wdetbJ3lPly/fljzyPEQGo41S37F8G4FrqcfC4/8B2EOUdXdZfMZBNB4MY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(366004)(396003)(136003)(36756003)(66556008)(6512007)(186003)(66946007)(16526019)(66476007)(8676002)(26005)(6666004)(2616005)(1076003)(52116002)(478600001)(6506007)(6486002)(83380400001)(8936002)(5660300002)(316002)(86362001)(2906002)(6916009)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Ljy7JNYnjngMqryHh70M5g8B3bw33I5twmYUtrZzlrXoXkDqLOgKw9siRQYa?=
 =?us-ascii?Q?TBsNdaqWivp3TjE/hUZAJgMBuAvEQPNMTGI8GLcRG8NIWFZnYa4wYDBk9Dbs?=
 =?us-ascii?Q?s41aZYKTKD3+c1yRj43kuAK5yR7ArkBTYT1ArM3cC4mfMwZVIv6yyPGlGIx2?=
 =?us-ascii?Q?jLUL2wVSW4XTVWv7HNsrlrZUyUADD2A8gQU2y5h6pjKa2ih2LagdrXm3OPcM?=
 =?us-ascii?Q?9PtN7gi47P0zOqcCu/T3Oa+KGnRV9xCFPzFqbZjJ1RKGPYe5rP79mKrWYchc?=
 =?us-ascii?Q?VNskhXwgfs2nxdWnKGZLNCBKcoWktPnjWvKDZZOj7R+/wc8OJPDP3GJOKnYw?=
 =?us-ascii?Q?SDf35hdzpW8o2idrPXIl0lKlgwYXrxWHjyAbJPUyf9aaPcl5/waNx2RO8sQV?=
 =?us-ascii?Q?3VcdjaJ2ncRsedMw720ko6F96ryDFXeKZL9k+pE621Nd868aKPXMvzbPaXmn?=
 =?us-ascii?Q?lsmWIiTJbH2pO6LOCGzz1PIxp87Bo/zE7Sy5BvF5ZfZ1Erh7YX+JS9KudFpY?=
 =?us-ascii?Q?s3BD6407jgh+Ej/VWtF8pJEEV2WKMtBRl8iFrZnwLL1ljLhlNv7t1GJJ81Uq?=
 =?us-ascii?Q?tuvAcLf4GjYI40d+fvsfJVt1vDv1N5dx+rUmv4JyY7o+P1aKXBT6fogLBxC+?=
 =?us-ascii?Q?+HmNZLO+M6LU3oFIVzVaMwjZirM8ngTHN3bP0oZtgWtVZWYeSHlk6qsRB74P?=
 =?us-ascii?Q?T1ny73lY0TnAOF+99xRmFxr5EHbGCGwYtG/kpb68LPFWLcnNEShRqX7Q2Zbn?=
 =?us-ascii?Q?6cbwoG3KMHswtcHmPRaJqS9kiZqQs1afwOnIOgTSaF//h3HrW6guXS3T4Csh?=
 =?us-ascii?Q?nEwVkaN0ay8CVmBIcxj5QDJ9ofTMEpIU6NnwU0J7Kl31AIs+PADAT5A5Rvd0?=
 =?us-ascii?Q?o62YUDnx0dWsZwnFO63I9hcEB3CZnvZAYvXIcT/QfFIBkVoI6HFUI8w3F7Ou?=
 =?us-ascii?Q?04wVeS5yR/ABJ5atREgAml/C8JP+5Ao0gqLuQX3W8sBsaRDqy+wUTYt3yevl?=
 =?us-ascii?Q?symb0zdqkTgkq9DcMblMtGuqWRya5HOY+KcbRsV1VoJsMGE/e6jY/CzKlsS3?=
 =?us-ascii?Q?9No5HpP5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22789b3c-a779-4beb-41e9-08d8c24ef74d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 23:06:08.7538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIC72JYckmZB3cYUESwm3oNLb6pEr8s/YgmEggBDZifLeFO6eELHtjspxwy4GYF15Py1XMDF4qu+xyAbvQO4lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Mostly a cve fix: CVE-2021-3156

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.5p1.bb =3D> sudo_1.9.5p2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.5p1.bb =3D> sudo_1.9.5p2.bb} (=
96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.5p1.bb b/meta/recipes-exte=
nded/sudo/sudo_1.9.5p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.5p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.5p2.bb
index 65f5480682..ca23e94ace 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.5p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.5p2.bb
@@ -7,7 +7,7 @@ SRC_URI =3D "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
=20
 PAM_SRC_URI =3D "file://sudo.pam"
=20
-SRC_URI[sha256sum] =3D "4dddf37c22653defada299e5681e0daef54bb6f5fc950f6399=
7bb8eb966b7882"
+SRC_URI[sha256sum] =3D "539e2ef43c8a55026697fb0474ab6a925a11206b5aa58710cb=
42a0e1c81f0978"
=20
 DEPENDS +=3D " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam'=
, 'libpam', '', d)}"
 RDEPENDS_${PN} +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-=
plugin-limits pam-plugin-keyinit', '', d)}"
--=20
2.29.2

