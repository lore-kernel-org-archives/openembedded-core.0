Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.3483.1615452390900489360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 00:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RO/ILHXJ;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihNX0UHK+yqrDSloPEuaZkiDJJ4pkAZeimja/oNm7TeyeHo6z7+KIv+wKvEIXFNN7AwIThdrtnDuopOjW5x20PjqWtZ/DDXknFNAQoFpGpg6J91ipK4RQ2k61lxgDyetJZvpJ6OWQf/nD+BZEYE623wAIo+WF7Dv8nnDLnu1IQlWzIv/OuSumSYLecKIMkTe97Gdyjw55QThfjR/c+kTCMxMTlKXS+LSohno5L+hGRHUcEuzXpxn/5Ei9bdLFsUga2UcblHylV5znEXm2GSjY1gd1oWpcA8T97a+0028D31LYu0Yz9GmbpKz16zfVBkxftSZvenSnF/wngXqzr1cVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gw/glyigmp04c5J+1NpUfSwZiSGUIngWE7WcKlME4M=;
 b=RDlK3rzOtjGTgmQmPPAri9+5Z7PFueDgzqEUCehSPXlQRY/LO9YBD2fvDTxsWpio9BtQhCqxpJU8kH3abIYzhhmGNp74G/bW1ku7P/rfueiBWUb9um6/XXsVUbA2ClHwq5sEX9dICsTL2xgdHBZDFORUUKsSF6yAk8VWgFQ45DdBo37DCB9nxwJdu1n6XJggYkY3oxb1CxZ+n+/Sdtns1FMJSETKwnBblN9v1D36cbnR8+08E75uTT6BJ712WjJcqZTDUKtXuFLOgI2jFw1oXB3tXaZN/4D/NrufcH0faX/968+L+imBleLgQOGBmuI2qNfEynlzQIn0d2W9SXsjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gw/glyigmp04c5J+1NpUfSwZiSGUIngWE7WcKlME4M=;
 b=RO/ILHXJGsF9BRqjUSanVSF8lk9yRU3OdHHCvgGCuXAjYXDmqEIuT53Sl8iIfhshfZM5UtgqSerNZCAZncF3ZO5YfOtxW+4RUCemEPz6tJjVKXoJTB0pRVDsbb+40KMXg04veS9PHpHHraDUpVgA8Pu8IjHMqP7j6y+SqkctfuA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 08:46:29 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9%7]) with mapi id 15.20.3890.041; Thu, 11 Mar 2021
 08:46:29 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] image.bbclass: deltask do_packagedata
Date: Thu, 11 Mar 2021 00:46:22 -0800
Message-Id: <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1615452338.git.liezhi.yang@windriver.com>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BYAPR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:a03:100::28) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR08CA0015.namprd08.prod.outlook.com (2603:10b6:a03:100::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 08:46:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be4da7c5-df18-4e98-57ee-08d8e46a298a
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5040:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB504071AFECD59956CE9AE697FF909@SJ0PR11MB5040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gb+b/4ZkUNhNI7Dlhv9gjfLk2C/Eu2wHKOjZ71/cD/kxmXgowRvP+qbmFpv00SWCw0q7PFY/H1ZniCmJp9/1ZcLY5DZvVCeUtf6RcWMSbORODZykOvsnBtiNtNvieV7cso8h2xRYgpONXHnneUqEPT+Q2YqmoOR4bZ5q/aBFN1NTrQ5/o5tdywcn2flzawZnYieqP04jnQRX/z0EVm/3u6Om89nEqDUv/885c+vWhBOwdR1zNoyUIt5BURPS3/ZBXoHvELJXzeI5lPkQtrbw+QJVwldW1ElqBuP4GjeF0W9omeLtHnjDEg2bp4piQVnXhkh5mSBL/qVg1XMBgBIRd9ArPkCtYfNDtAEmBffYlKqTVfkGtlFm0bAsBhwmJCubpotDzQDBYEHRF2fswWw98w/wXHNOeiWhIuXJgRYBTa7CNOsO2jGaPShorbxDRgsCinMPtAt2sT0HmAii9HDzcjDP1FZXgGkIDuZUTFHkS0w36WG1N2+cVxHpC85qJySA46phNTvpPVLIJexoVop+vzMZs3yXEga5SO0XVYxDFHMoJgICpiy66cq6y3UcW+3bv14U311qbQZb2StURHCeFGV775TkpK9Y0XevnqJ7p3U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(36756003)(8676002)(8936002)(478600001)(6512007)(5660300002)(956004)(66556008)(6916009)(966005)(66476007)(6666004)(2616005)(6486002)(86362001)(316002)(52116002)(66946007)(6506007)(16526019)(26005)(83380400001)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?w6cM19DjuautCivepJMw+q2bN88wufYHwlsId6q4PI2oCXJXxRFNWYxM6oRD?=
 =?us-ascii?Q?mxZ4yov8XcasPtCEyZs3+wS80SQDAHhzCQV82VpyZChYtR+ooXbK7Cq5fD79?=
 =?us-ascii?Q?VTKk0+MaSkH5kQLZEy0xNEpHZEz2Z8E6Bi+Q7+Axo6yGmNHYz0xhzgkBCI80?=
 =?us-ascii?Q?plsQrILXiy4ozfIPpmvcuYHwamkE4bRcSZbiY3kWWdmbew8dWjKd8zWjFMRa?=
 =?us-ascii?Q?riCG2ZzsHEJiStH6IAkitImHATrkt1YlTMhVLmOkYT0R5xy9pA5vNnJ3+3g0?=
 =?us-ascii?Q?tZDrsA9sQiu7ty8WGzybURNpn5y9lyQpOWD7NtaEbMNCtf9o3BKvKEcgbVK6?=
 =?us-ascii?Q?eWKhzIew5y3z3n2mYDDds7UWA9f9IoamiA2y4HsAXNDhqyVHEXnalV456Fzi?=
 =?us-ascii?Q?NyHP4FWdq63XWqvqhpbLVnInyHzTPabfkGQfglBplTet7v+f2jnhgtDgWdhz?=
 =?us-ascii?Q?Yl9IZsNLgU7SB9W1DEV3Z9xBd29pRoOA2wLld607r/A5T7OkQLmn780Jjfrk?=
 =?us-ascii?Q?KB4BlAZ1TUJJXfT6A5zSHFAfqE4qqtfJBANRrR5QKUq/4Xqo6vogezSQb8yf?=
 =?us-ascii?Q?nfwvOclmXhLRY+jE3cC6H4SchiqwMY6d/I+SsZI2zGaeJJgXQsLBAk4e9R5J?=
 =?us-ascii?Q?ljZKf/MdOAKjUu2Vome3LyZySBeyDBf6AMTdnB7KMleMNDIpuHHICy6E7OQL?=
 =?us-ascii?Q?ajF4CB/aSVyOrybGqThUMmUMvW94JFEUPpZw5itph7YsMZmMFLK4EmZriZF8?=
 =?us-ascii?Q?u+rQZueox7UKrTciA2N+NmWOOmXuXsetswMwJSYWY4itUQXzXN39u785dc8e?=
 =?us-ascii?Q?JtNUTBCr0BIivySmj2H5BbaR1SKqFaHdkx5X2SHYCblW0wFkKfX2FBHAYqoh?=
 =?us-ascii?Q?gz2pRsRxI4/z57Ld2JNFbLkP+M099NXsGHJFyZxpSySDlkFfT6JRLQ34Pebb?=
 =?us-ascii?Q?3EQFd/lUH2H8S35qVWMDRu3GtupjyUMuquOiJ9LmbyNYpCN6bVmaFJsyayBF?=
 =?us-ascii?Q?v3FtiF0nH+e90ngW7pV5qZoVJ6NmuLkJq0AtTjrDjTmFymyIjciTDXD7d6tA?=
 =?us-ascii?Q?ldFbNIKAZPVW3zqju6k2y3MVfDAGLhtlwsKC094nw46kj+YB7Wvwf+K7yu4a?=
 =?us-ascii?Q?XyyDaKodAovdRRnxs+oBUjgmOj5qORnTZaCoGSs3GmICEBXt/lNCAG8qhRwj?=
 =?us-ascii?Q?KO66yZpG/OBHzGPdEvKePuJFlT1Xxpb/0M1mOPaqBYLeiGn5Bnz6dvYkf80U?=
 =?us-ascii?Q?rip02LRSXtWz7cRnDAHqj6Z4xX2bkOs5M+8mRxxCb79NBG1p3QKPkfGEDWDp?=
 =?us-ascii?Q?JNUBqsE2rvpabiY9N9n/BLp0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be4da7c5-df18-4e98-57ee-08d8e46a298a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 08:46:28.9082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozbOlCR1YpTiiUeFjm5zcv+FxIZBAnx6ICFiVdrsi/h9m1yjHrCg0N88cEscM5R4bFMjJJEah4VYpev0Ti+iNx6s2sEcmJNkFTcPjfcQL2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
Content-Type: text/plain

This can fix a do_package error when compile with meta-secure-core layer:
http://layers.openembedded.org/layerindex/branch/master/layer/meta-secure-core/

$ bitbake kernel-initramfs
[snip]
WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-secure-core-image-initramfs.packagedata
not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_x86_64-nativesdk (variant '')?
[snip]

This is because kernel-initramfs wants to pack an initramfs image into
kernel-initramfs.rpm which adds a dependency in kernel-initramfs.bb to do this:

d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')

This causes kernel-initramfs' do_package depends on
${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we will get the
error. Delete do_packagedata as other do_package relelated tasks for the image
recipe will fix the error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 41fc3291781..b5586536355 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -612,7 +612,7 @@ deltask do_populate_lic
 deltask do_populate_sysroot
 do_package[noexec] = "1"
 deltask do_package_qa
-do_packagedata[noexec] = "1"
+deltask do_packagedata
 deltask do_package_write_ipk
 deltask do_package_write_deb
 deltask do_package_write_rpm
-- 
2.17.1

