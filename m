Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.58])
 by mx.groups.io with SMTP id smtpd.web10.1690.1609979602430164702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 16:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QI6aWiyp;
 spf=pass (domain: windriver.com, ip: 40.107.244.58, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=je8VqL3SoZdEA4gxFT6+FEiPVut1Ni/rMWWqbn896ypADrDN/EUALBg+gxd37yH20/gTm3ofGqzbs/S9MOxKFOIkdroJMVspHQG8xvv53UgjgMxMCvTjm76KN9h3PEGzr8ot7VVkV1/41ZnGwskJjHAoVD1O+/yLgnL13+Pecgr+Llmo9sRCPIn4j5sfd1CWpKSqhG0Jq+CnZM+hXcoPshfiYYUqQ4XUV+k8wJOMchsKw+Y+tjzDTfXLVli3gG9OhVs9K9c7fKLC7BIjlgn0IxGl5FPp8ApVPrs+1kgTfyhgILAzQC67mJQDs4eCjSLwie/X/FsqBI2PIzD7eoooLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umJmr3UaoQFPVdkWP0Qu8DfzGpGAGqq2eIco9mGmhj0=;
 b=a+PIov66LtvZ0wWRCYnIl9F2qcyh/SDLkUmU+st+aUZJpCuDMOViCELZyLKBz7X6NjxwSgewEgK/4drz+pm9W1CNYamloEWsiyZ+O7gXkgFElQbHYvlSrf2CID9UvkoPkOvkb012eAIYFcIRDdqX+ckruuWV0vrnp0MYd1P2/DSoESN1esnS5kp50dnwh2uL54AobIRLXbHLzYzC3u/NZjDWOUAf0oiygx/Ow/vvWHPJjFQQLYd1dYvX7+Ur8j3WsdfJsr9dVaeVa+4Ulf98Y1n5v7xJ7gr+YENzuif0b3BD0MknBOn4Xhs/1COlOcot4YPjIzeLiWIz7iBdGKPxWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umJmr3UaoQFPVdkWP0Qu8DfzGpGAGqq2eIco9mGmhj0=;
 b=QI6aWiypRT/CogWiCgXAJSUaWJl/lBJZ4ABTPOLRVOR9fiZJcbRVasp17EqmVQrLVfPCxubWTVsBQxVhhos1Pp1NBqazck/pizYgyYU8QomN2BgDKxj1d0kDVELudL+eARI+SMaYkYLr+PTgQMbMPjbVy6QI9kuykXZWShounKc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 00:33:20 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781%7]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 00:33:20 +0000
Subject: Re: [OE-core] [PATCH] libpam: support usrmerge
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210106084927.30657-1-changqing.li@windriver.com>
 <5b9e857b70fe4e4c346d1f28789bd11a9e9d2beb.camel@linuxfoundation.org>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <bc3c12ce-bf78-be7b-6692-d310e56b660b@windriver.com>
Date: Thu, 7 Jan 2021 08:33:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5b9e857b70fe4e4c346d1f28789bd11a9e9d2beb.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0055.apcprd03.prod.outlook.com
 (2603:1096:202:17::25) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR03CA0055.apcprd03.prod.outlook.com (2603:1096:202:17::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Thu, 7 Jan 2021 00:33:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3c27213-2ccb-4e83-8b71-08d8b2a3d59d
X-MS-TrafficTypeDiagnostic: SA2PR11MB5148:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5148E445CFBF2E9E5AA9EA2982AF0@SA2PR11MB5148.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fN3to0gPHQXQ3U/SVKimIot+1mkxj0UV+faAj8BxKKqGIYSRexvDAf40tvZ6tNeFj51lWBjryYOKJ7VtmY7wxslbyVckSzhCdUYqxyOYbQjtFvz3Hu9StE2fLhhooPOM9F+MvNymEpAH7cYufKjln6b55/XmPy/0sdIVCsZ03IbPDxRGa/WN8J+br0uKSqZRXXpRyaaUDDSGtzYJ69rlyGR2od47X4lgcTaE+KLJh09eMQDJGta0hhcHItL2eAvnSMRqYogd6kxaB8K12mYnRpudXETrZ6eqT1OggBQB4ymwfjxQpUBU3xlN93y4QPd6BLvTInhCPL39x7AuOPFoo2/4ZxJWO3ZBrFSul6dKRMB9vmgtCZhbUT7ArL8gnimIa94vWegxS0Sa7YC+LTUPUyZu6p2G089ToijX1nv5w5TUiSIqH+gD4lNUf6iuJObzyRp4Q0Gi15AJYx3bZJuA+1oyRfZwUz847TGSRBYfXAYrYGlAM0tcl0nGIe0jiNKt5KT0yG+G0FKAg2pSLbZkf23AnjseF3ulItfKbDnJJ0IJHGfcE2rJesuqzHbIV1qBf9OBwVU4Udqnb0csiJeYXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(66556008)(66476007)(66946007)(53546011)(26005)(5660300002)(8936002)(31686004)(52116002)(6666004)(16576012)(36756003)(44832011)(8676002)(956004)(2616005)(186003)(316002)(6706004)(6486002)(2906002)(478600001)(31696002)(83380400001)(16526019)(86362001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?0aNHyTpFjlk/7GlSh5JnxpYHGZm9Cq1LkEsMfqOCJrAU/dxwlEmPgqK0fMpU?=
 =?us-ascii?Q?JK9T7Us9+MwB7syz0+dFa/GvmYWuwO8L/+9DGBIow8XR3XRfgyEhcOW445WH?=
 =?us-ascii?Q?lTyy0MB90E+v6KcxKW07gJqhzAeMAlgxjWTj6XTyrZzh88kNZE1vYZq4RTDE?=
 =?us-ascii?Q?GUDUF6xrw9UmIvx7tFEtxjaq3wVBmzOFuQoVAi96muF3jQQce0cDenpXAIIH?=
 =?us-ascii?Q?mFZ13YcVYp7AsjqoK0AEkka5MIWJzVTvQV/aHz6uiK5LeIqQsYXeVsw1eioS?=
 =?us-ascii?Q?gIFTALpvXXvADh5aUxes9AKKA3YMOO0IZO0QZn5FE3G19/XVFLABV5RTv+tU?=
 =?us-ascii?Q?0totjiRWHdXAntCvMySyhtHpGN9cx7FeVmRmhjIhKvvg1G5Ul/FTXvnKoa+P?=
 =?us-ascii?Q?CV8o09cfz+i2WZxHnV650o+brjkFJlZj6KVnr3l8IxjZAIbPwsXIKRcjP+ir?=
 =?us-ascii?Q?Yvw4ud6p6VpV2vKz5Ab78FiFo2mLub3hk8if/IaJo+U8oyxsEpgsvKgGgvmy?=
 =?us-ascii?Q?IZtGCaqWQVnSNh1fxAhqs4Yb8/GvqU4E/HYSOc4PJg58lQiSukjn9BO2bizA?=
 =?us-ascii?Q?zJkMFnK9gb90yPifQ3dycQtmVnGC9Ig2nQY9KJaHDYGTi5nfzjxMfG0BLgeD?=
 =?us-ascii?Q?wi0L92uUm92Oi7wrpJBWN0BRNO3Mp3N3oCY/21V/Qwiv89adRfpErDR9d1U2?=
 =?us-ascii?Q?n+2BjhnpWxXBH4WHZWkrngWFiTntwhIXWZc6ESkUXR6TNzR+Y3PkBSTmRpqO?=
 =?us-ascii?Q?rqBzm9NN3B4kUVjP/wHygzkS1BcVo1nnbQ/vhhUSMCdMeefMbcJqcQvZlL8c?=
 =?us-ascii?Q?KJ2EGdV81i761qc33o7G27+BaqtFJkeAtzZkuRyDvTi3zS7LWrH5VZ/7XPeD?=
 =?us-ascii?Q?DICMt8x9es7Mcl+CrwjZzHLvczVU+i3jZD00/3X54BIqcQWH+M6EWuxjSyGm?=
 =?us-ascii?Q?xg3ziGChHs/2Izd/L9ULsHsj5khGSi7N34bMMmGparTDXgAjsKpFchpANMTl?=
 =?us-ascii?Q?ctvn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 00:33:20.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c27213-2ccb-4e83-8b71-08d8b2a3d59d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zzwZNQZr/rUkJEHmyTbl9PPAZS9yvM0APHzYSPl0usP2xzmZmv+sdwnz8v71KZpyn+PBcil0hRahxLEcT/tGvAQWdS291+8uGk7FDHAuXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 1/6/21 9:58 PM, Richard Purdie wrote:
> On Wed, 2021-01-06 at 16:49 +0800, Changqing Li wrote:
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>  =C2=A0.../0001-Makefile.am-support-usrmage.patch    | 28 ++++++++++++++=
+++++
>>  =C2=A0meta/recipes-extended/pam/libpam_1.5.1.bb     |  1 +
>>  =C2=A02 files changed, 29 insertions(+)
>>  =C2=A0create mode 100644 meta/recipes-extended/pam/libpam/0001-Makefile=
.am-support-usrmage.patch
>>
>> diff --git a/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-u=
srmage.patch b/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-us=
rmage.patch
>> new file mode 100644
>> index 0000000000..5c6bc92705
>> --- /dev/null
>> +++ b/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.=
patch
>> @@ -0,0 +1,28 @@
>> +From c09e012590c1ec2d3b622b64f1bfc10a2286c9ea Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Wed, 6 Jan 2021 12:08:20 +0800
>> +Subject: [PATCH] Makefile.am: support usrmage
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + modules/pam_namespace/Makefile.am | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/modules/pam_namespace/Makefile.am b/modules/pam_namespace/=
Makefile.am
>> +index ddd5fc0..a1f1bec 100644
>> +--- a/modules/pam_namespace/Makefile.am
>> ++++ b/modules/pam_namespace/Makefile.am
>> +@@ -18,7 +18,7 @@ TESTS =3D $(dist_check_SCRIPTS)
>> + securelibdir =3D $(SECUREDIR)
>> + secureconfdir =3D $(SCONFIGDIR)
>> + namespaceddir =3D $(SCONFIGDIR)/namespace.d
>> +-servicedir =3D /lib/systemd/system
>> ++servicedir =3D $(systemd_system_unitdir)
>> +
>> + AM_CFLAGS =3D -I$(top_srcdir)/libpam/include -I$(top_srcdir)/libpamc/i=
nclude \
>> +         -DSECURECONF_DIR=3D\"$(SCONFIGDIR)/\" $(WARN_CFLAGS)
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-ex=
tended/pam/libpam_1.5.1.bb
>> index 486c9d8aad..8c008a9701 100644
>> --- a/meta/recipes-extended/pam/libpam_1.5.1.bb
>> +++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
>> @@ -22,6 +22,7 @@ SRC_URI =3D "https://github.com/linux-pam/linux-pam/re=
leases/download/v${PV}/Linux
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0file://pam.d/other \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0file://libpam-xtests.patch \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0file://0001-modules-pam_namespace-Makefile.am-correctly-install-.patch \
>> +           file://0001-Makefile.am-support-usrmage.patch \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0"
>>  =20
>>
>>
>>
>>  =C2=A0SRC_URI[sha256sum] =3D "201d40730b1135b1b3cdea09f2c28ac634d73181c=
cd0172ceddee3649c5792fc"
> I think we meed to create a patch which stands some better chance of
> making it upstream. Can we add something to allow servicedir to be set
> through configure? That patch might then be acceptable upstream?
Thanks for the comments, I will try to upstream it with more proper=20
change for upstream.
>
> Cheers,
>
> Richard
>
