Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4849.1628669479578790543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 01:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VflgMmiS;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3857d9322a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B86NUA001159
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 01:11:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=uzfG/+mH2Wpn+Z9kJ1VV/0xtrHe7DEygwDser+bhqcQ=;
 b=VflgMmiSpU6b9mR0Qetx/02GpfVbmZzPc4C6U8rUursYQUCjrfkvuF1yKKxw2RdWbNT/
 IE2eFqTkHoWfMt2FBwmMorfDeecP0Nt6dbb+Gxrg77LIYkFvpxLgM3WfPWKNJkOtgFdB
 JKE1deYoRtvkA3sx11eQc1o2KaujYfXZwI8gIbUaa5HVG3RSv0oEsKKWW6uJzkwXpsck
 xy15duDY+ioS27W6ICcy4fhrcHJ87i5vBdm+uDG5TmDL6JC504/STZM8ZE1kNAciuFdK
 2766KqPXXv8QBQp8CdpPMCqoGG4u05wQqnw+OAuGGJWl5VxvwAdUAFE4Fzmkhr5Ut7+t OQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3acanf806m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 01:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyt78Xvqdr70rARMDHeAHZK/tHqEofAm3SVaG99TaMhqhrJHQm+xVmsEwDJ5ILIZ7fs634sU4xkEmbgFVqExl6l0THykD51+wfZOW0XjCgqmrh/Wy7TZdS2IMXaHnKkY3K34L06Ub556IUh2jmAp9Q39f7XljzdLqPPFm2y7Xwpjbg4nM5Ns7sHF698MHIMRcUF4v122Pt28LodGPadnpAhHKfWjKA4J9VjBW67qrBglZGlmiaFg6KRKWVxxQpYgWE392wELyrkCh59ZFWbSBBS9SIjBQDTUJ6++SkQhibTrB3Vp4vY0699841QUJRox/SJDhF+ovWQVHuOOsu0ECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzfG/+mH2Wpn+Z9kJ1VV/0xtrHe7DEygwDser+bhqcQ=;
 b=nrvPJQu5B55/FYMG1FRjztwtd1Rpvxv7QQxoDspZlaR8VrxCxi9asfK3s381ILLcKoCAKsCQfrnxVhyR2dmBd9E176jbXlmb3+tXJsHWiS0VX/qMjWWd3Fwa7I2mH3TH8QJi03suRS/Eh5vYk3TtnxAflWlwHvu5AK/TFK3lBcCiiqi+Hsy7ZPYdGykw+9M/ANfsbgdLKXPSZxFugcn6rbO3gBj8LqYo4Mfp3ojHhWv+2ThCZA37jjzV9ooEdzcLgdo7s2jA2xWD6t4WrbJS1LU7RdRg1CLv+ACxU+o+CWi8v24KN13FS69irVTRJ7xaINRGUb4Ik4nQZqU9nPAKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 08:11:16 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Wed, 11 Aug 2021
 08:11:15 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 V2] shadow: add PACKAGECONFIG for audit and selinux
Date: Wed, 11 Aug 2021 16:11:04 +0800
Message-Id: <20210811081104.82290-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1699E4D06401DA63.2671@lists.openembedded.org>
References: <1699E4D06401DA63.2671@lists.openembedded.org>
X-ClientProxiedBy: HK2PR02CA0169.apcprd02.prod.outlook.com
 (2603:1096:201:1f::29) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0169.apcprd02.prod.outlook.com (2603:1096:201:1f::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 08:11:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f6f8427-5f37-47a6-3d33-08d95c9f9702
X-MS-TrafficTypeDiagnostic: CO1PR11MB4898:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4898F617B5A64E8D6157AAD6F9F89@CO1PR11MB4898.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e/egcDcVdnW5+qsc7YVwpo4oEK1q+84C1h8EazMYmO3+npxWj6CgUJMMnNr+ZAQeGgOg9lZoAZTc+U3fLnJ4KtYaF4zF+ogoODeRasGlCFha2cqjG/EGE2vxeXDLOG260OJkJHCMi/g0xeHByD+ZbPZ2liZRethETXSQi0llkOitjHJKd7UvIWijXGNkwY7JLF3ak/+H3/wCqx/I2qn438v8hV1s2x6FeSKE06cBkrs+wdn0h7bdrjzEldvX8tCFQN6WIjzgtAWlkz4fpE8CnQgrEfYO13GI7RNb8X1xlrvVuEUg6WQw7kxSzeAdI85wPNMAAFlfQWClpoh2bVt7+aRgkymL9AjEUzspZT1+tjHL4OrFgMHBSXdTB94eZtwr6euWinjnmlSNr3N3f4ADerUghpy7NGl4HFC4LsC1c3L2euwKcgdQnhPUX50dA8HlN+s0IXIc9FPayuWBxhGDoxmfcTsPkiOiPWqtmHN4rfyOitA1bes83dqbn0EHVmqd1/TOs2Kyd+aKhn6NDsr6LYrcSmFyFeVOWpOumx+DJ8Jw1MtTxXRAQvxIZeHaiN22iRWIaZLBKmr7q2puF4FDaeJg58eg0obhxmt2T6+KCuNSNmqspAOxa0lEAl+Odf1cSmFtgDcG20oE+mlQw6COQhdVLAQauRMsFp3DPdfKgyf6zEZm1AtoxMzLVjC4b2zHTLyVmFHtLwQNUY/ny/ClOg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(66476007)(52116002)(66556008)(44832011)(36756003)(316002)(83380400001)(186003)(6486002)(2616005)(1076003)(8676002)(956004)(6512007)(66946007)(8936002)(86362001)(478600001)(38350700002)(38100700002)(2906002)(6506007)(6666004)(26005)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?husHYriRDZ4HnzNM67v7VeI1J9VWig031KxEzONu1nPwCxgyxU3ciFJ5hS8l?=
 =?us-ascii?Q?YHX2sGyqw91ZRN/oyEv92mZ99XsCy3xxfH/W7fgAA5ra5nTvONjUgQEWcfj3?=
 =?us-ascii?Q?ZwBKwUSWyuWu/QFQkz5hyLkLIVH96kdwP2YjpKE6K3KJ7esK7hJEv9CuNlM4?=
 =?us-ascii?Q?T/HhoPL8YAWNqU4yMXyHLvGuv50IOH+gNWozcz7TQDEL2/z7ZSN7kBQ6MBek?=
 =?us-ascii?Q?LNUHFYkOOPDKKho12TTsXGxlLkGyx91OdVV0p/vhMXjzn/L3OS9cxyEJ49Cc?=
 =?us-ascii?Q?Ti55DVcjEc1YfcTnXQduYjAzmA9zmFgrsBGYXSF6LTwYmmVouoeN2KQPFFMG?=
 =?us-ascii?Q?g5DaM0L/Hhf6Ebtofy4gVLUm34R9Eo04F4DInbD+u8WNi7M6eU9FnHvPzPb7?=
 =?us-ascii?Q?xdSHl1vIObv300a63xldei6h3JOYGAxkyZI1Pbj6engYwV9G5NYbugEgFckQ?=
 =?us-ascii?Q?3FVE4XnW1ocWrcSpiWShoFH346BWH6F+DjlksZLSDmLXz3jdO5vIFhaN9gHq?=
 =?us-ascii?Q?70M1xPaebz96XdkjCZg36jYkQUqaJKEU8mPsuPV8CfDXK1ZVl2eM7FWsE+3N?=
 =?us-ascii?Q?tDvlgKAkKgV/uiDjMt53NuXvyEeXRCLSBLrIgMFJx9SmdGkbKM1Fo+kQRtp5?=
 =?us-ascii?Q?+1qA/kK/jj4xl/QJsQFLwL8dSbyP+pOh0/P7nxSfyjkMRRcWQ5HbyhWhf3Lg?=
 =?us-ascii?Q?X5C+QX+m4n+z24HMKZXfrw3cg6WCFf5iCCA3d3UZATDW2Bu6ff2YaDqjXNtO?=
 =?us-ascii?Q?ZH8PPSwN9m7OSKsyLuCQaIBMgEoXExtCdaujYIZoEp/ROhxYnPYiw6HBXSgm?=
 =?us-ascii?Q?NpbFdPYfBGpH9wacOd4VXsoWAMNn39nLiVKpIuDqDogDGTJLA6XWGGQFjEe9?=
 =?us-ascii?Q?neaUWDHV54zjiUVtrerAi3v2mJfR8bpijjgg1cXl2TmOBBubINj5DkvrXaH1?=
 =?us-ascii?Q?oh1taBXgKL0pItfXuExkZwXF8hqk2sKMj632mmn2lKrURNPraP22lJ0pz0XN?=
 =?us-ascii?Q?tEqot/WXJrEKyoxHUZ0MVTcGg2OFDhKIbAFHMP6vS8ePUMTdR6u1TaZ2loEq?=
 =?us-ascii?Q?127eQeyayg6/aNLuir2oQjbvz5WKLzLGrWjK6fWTbq+HbrRl4nl7hqv9sLl/?=
 =?us-ascii?Q?BbBMFGFNfViqPg0JWaDQEPDO6UbxXsPCz1wK1vq02LgTdvxghE0Dkg2w+Cg5?=
 =?us-ascii?Q?9jRQqJ5eHEwJEoSbVVDoM72FppsWDL0ZMEXNNCBUwnqeja3/LamDfoZI8nMZ?=
 =?us-ascii?Q?+R0A/sl+OMyrLRkK+q6iodvgb4SeQJnKXtJXUjE8h4QMc/aAP99aYiqvHBoh?=
 =?us-ascii?Q?4JY0x1Q8ntIjnfW/7rxsyAeb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6f8427-5f37-47a6-3d33-08d95c9f9702
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:11:15.5107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J63sVfmaDbFCwINvCUGLWwQf9x3WL5+vVZRxGn+7ONMpiyHa1v+Xa0lFlv+cY0aDe+jNGnDFT3W68hcKdmp1Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
X-Proofpoint-ORIG-GUID: holGr-4ilSW9TmWoPgonPwgCYr6BtIsl
X-Proofpoint-GUID: holGr-4ilSW9TmWoPgonPwgCYr6BtIsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-11_02,2021-08-10_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=960 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110054
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add PACKAGECONFIG for audit and selinux rather than disable them
directly. This is useful for selinux distro feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/shadow/shadow.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 2834509649..495d73c254 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -46,9 +46,7 @@ inherit autotools gettext
 
 export CONFIG_SHELL="/bin/sh"
 
-EXTRA_OECONF += "--without-audit \
-                 --without-libcrack \
-                 --without-selinux \
+EXTRA_OECONF += "--without-libcrack \
                  --with-group-name-max-length=24 \
                  --enable-subordinate-ids=yes \
                  --without-sssd \
@@ -81,6 +79,8 @@ PACKAGECONFIG:class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
+PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
 RDEPENDS:${PN} = "shadow-securetty \
                   base-passwd \
-- 
2.25.1

