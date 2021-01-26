Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.58])
 by mx.groups.io with SMTP id smtpd.web10.196.1611702848886146114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 15:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Iz7EDWkm;
 spf=pass (domain: windriver.com, ip: 40.107.237.58, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZ16e/5iKWmvEmls8XDBDMt1o9TZinuddP8SYE4fs8UYBdO5gArWe8YcB0Jl3ettRsOJoSvPI9Oj/EQjeWKeT/GXxsSCMtKM+IrlXx41vda+XX4oxL3Zm8/glxOIayqwraRmFIeaBIBlUV6+eEb3OkL6ZGX0nXwSj61kIO+/tj/VrrN95q5mVUmSZq/wswSwBqMB7E8uQ59r9oI0QOTq9SbWX5QtejOt5XwQlAo4JeFPfk2Y8EwH6W8n1GElF++s6LU7y3MA/9td74DpAabS8wjAkmWhm7JAxdvWFGHGsA96XMl4PNKmeyrwR6B1GDwloVS4atQRzwcmnFW0x7+LMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJSy+B/1rhBuP7BH4ld6BH+mb7LmfkFqP3OKwA78NeY=;
 b=RWa7h9coMDzI4BgHFrThSh6WSERil9vhQLXcnGqHvN4iO2mPlK9G09OVmE2A/bQj4MI/PGOXi1qe9J+WF0XV8Gh4UrowIMkK/FE4bx49hi8kXrY2BJaoyaBGfhq1JWX0Jo8zNgI2CD9quNFjYftdrIDwwIoaR95HVRaP15rmxXOxnq+Z0aFzZB8P4a0TkxdB58XXYveR3IVSVx0r/SINxQbiQRHuPnfWnBnkG8qtQToz+2OiKJqVjl0tIUuwUMUbPXjlRdtyeakbFhXJ9Imn+LrnB7CTKv+jQFrjORl114eHCzGuV/TRCwfpPAitfI74YRJAneqOSoqLl0VeuRdLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJSy+B/1rhBuP7BH4ld6BH+mb7LmfkFqP3OKwA78NeY=;
 b=Iz7EDWkmzbg5h2ifng3JyZAXTSKcT3MqeuFYMweNPt8k4axE6lOrGstpLKUHhXlcitokabWLOuwGyPqktWOOiHaJVRP/EXmnWnVLWRYZRZSympzL9PncZ2krGMxbAnfJG4s3T0rR4q08/laaK7OctKSyuzjF7livWFi4f1vlMfk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3216.namprd11.prod.outlook.com (2603:10b6:805:c1::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Tue, 26 Jan
 2021 23:14:07 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%9]) with mapi id 15.20.3763.014; Tue, 26 Jan 2021
 23:14:07 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] sudo: upgrade 1.9.5p1 -> 1.9.5p2
Date: Tue, 26 Jan 2021 18:13:36 -0500
Message-ID: <20210126231336.6733-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 23:14:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca3052e3-b930-47b5-5dc3-08d8c25014a4
X-MS-TrafficTypeDiagnostic: SN6PR11MB3216:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3216974FC9708DE08C00137A80BC9@SN6PR11MB3216.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p/DmE9q+AnnAK4dRRSYzn0MHuSo9JgVb6QmEiOS4eNWc+crzYOpvo2bpMMU9E9tjInx3U4rFBGAtRssoULVFkBoy8nfKS/lOozeQUL5mYL7TyCTk7LsrYMzyi8QYE9nrx7Ir1fUIK8CNRdMYwe3c4xaIzsYjxvUcyBoSquXPczKwaOpZ92iXJgpePwKGCIOvvlcstA8MXxiu87H+CUVEmolJ2PTCX08fMpUxiCunPVyyNt7Kt0ylDVI/1U5lFoe9Wt5qmUGtIxCS316BqY4/DXjSinNYFz+/sJtDnko6oaXa4p/B/QTP66hOix0yynhgPY4qHE5DXhvRham9dcH9TUW2lq3N5bk4J47gOyatJ8QvBZNd4+DvT4qKtNxuy82JTYxjzk90GLH+N8UQCMVOQ4QiQ5Np1VMuXwjOq4huB2oHEovdaZA39krs2ystx/lCXlpqIoF809VOMpHPYqtXtOu4CKOHPqcHyhWPWV9WNHn9eZ5v7ZBT5tjEFCqtNvyNpiNLK7abVWP6kWYwhrSEtQ2kisG+41QT77v32GDE/WjW89VXweSs4VL2tAg+5J49hBpKPd5gw/JNEZrjtF3MAP74NjmHyPzJjfHcAMjIyb4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(83380400001)(8676002)(186003)(6512007)(16526019)(316002)(26005)(5660300002)(2616005)(6666004)(1076003)(6916009)(478600001)(86362001)(66476007)(2906002)(66556008)(6486002)(956004)(66946007)(52116002)(36756003)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Vtme8Xq7thinD84oKd1SKAzMDq4fOGKQU4Gm8Pj+057v4jRVmeNh9DuPpadA?=
 =?us-ascii?Q?t/vo6cLp0+9SmA+DS7pOAeEn8Qg34vI92INJ2U+SigAREIiqx9sfobDnkv7s?=
 =?us-ascii?Q?cVHf9xrvDCBTCimZrg+1E8qVR6munQbnonSYnmZzC7RHf25TSYpveEdFfqB8?=
 =?us-ascii?Q?mJVixVNikaFQ1kwPTrB0BZb4HfhYmgxz+J6TXL+/R/cSoC4L+JrL6efRyBlf?=
 =?us-ascii?Q?DQ5gymVgEIxXZf3HCefjnrqrB5OutHj1Pv1Ise/gJOj8ztNWH+p9Y1WgWSmS?=
 =?us-ascii?Q?ioTqv7+rsiRA+lTsFfkHAISbYcFF8gOBtzhuaBKrnMbCVe9ngNHpyC/+dgrY?=
 =?us-ascii?Q?7jzqw8jVfZmOBdas8oUqXjHN7vl2k5y7G/2Lwp28fAoMyadIR9JPiDu9lvfl?=
 =?us-ascii?Q?5CWVrjyn2ORSd70mHdBOt6fulaF6ui7B7o/NyM1M2nNvBxrc2OVsZGvG6KJ1?=
 =?us-ascii?Q?g+DL5tIIeEGssI2xuIesz4pnjkMn/qjnKd3PdWFqPrSvwXBvlsf2uOqq0t6X?=
 =?us-ascii?Q?YEglq2psFXEe0WP8j6maOIAC5LR/luoArQLJadqI6OtOMmvpK/6qT22OJcu4?=
 =?us-ascii?Q?WMCW6zgjKdsrwCzHjRCJsSkToMtw3JtZXBDiXowhuDly69vgTHAtyDAR43mh?=
 =?us-ascii?Q?Gu7d72MaeNxYiCag6K5FPIFjVgVdHsuqDWWZQi1EhPhJPpVzftkEAwt6YEoo?=
 =?us-ascii?Q?mWJUjvYvI7TGAFXNcOKrnPwvpvP8UgZaxfqpoXuUFtqJMYkNkAknOlcJbEDP?=
 =?us-ascii?Q?d433mJWWafnM6R+Px4vD9U/8q0NI6OOzwBus9UkfbgRRpaTiabGXr0E01kS9?=
 =?us-ascii?Q?vbVNhfeiD9gJ3+noX/A764jHaeuscPwaYL+rHkZ1Pk4zhNGRXjRBoc13XVtY?=
 =?us-ascii?Q?5vcMmu5AfH+YcXhXrP4sKvLjLNS9htkP36xtMiFbmezRJqS9db3gZc+AVGtm?=
 =?us-ascii?Q?aeLGZRk4b9KdNtfWoqXZROdetUswckclQNdTJx2/CWRh70reYTVc7bzaytzJ?=
 =?us-ascii?Q?foG2R2UJrjbgDqY5Hc5hA3bF13VGAn8rVnMsva5ymLBPoc6pmnGpNr+CvPhq?=
 =?us-ascii?Q?Pwhq+NGY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3052e3-b930-47b5-5dc3-08d8c25014a4
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 23:14:07.4424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4T9U45G4XuxFiZNq7oOWJ8DNRYoQQ/zjoCTbPLbbQblWC+zf4oVrMhKi4CgnIcaX9rLQKHs9tkMXWmN0BwCudA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3216
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Notable fix: CVE-2021-3156

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

