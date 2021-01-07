Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.55])
 by mx.groups.io with SMTP id smtpd.web08.6667.1610017226791596697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 03:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GtIBUps6;
 spf=pass (domain: windriver.com, ip: 40.107.75.55, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vkt2roIYiLcWEvoJL6Yv6REZqp2gpVGCkAvDXObt9nAX6DdT4Pkfiia9Yz6ZIlrh5AnND3mqhDWG8RBfRxmMHLUCU/YtmUQgatZ0FHtHh1o004JbnpRUXFOoI31pcxA01AOrOeEg+5VODzwx2Gpzj+HVxxL2xw7h0BimBqSkgjY9Y27/+5Lw+ZxitDsnnye4eCQhqnFAI0ZxzKsxvG++7UgroREVW3oYj0ykmJB0cMhKbM/xQhq1wm5PMB7rocGFO7YQJkMJ3DM0KxcAw0BsPReXgofvuOXX8nGb6vyArodGfGyra1UyC9A63ine9HmC+C5z6WLhUqSX2emIQ2mfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opPsw06dgzMRZYxDz56XEvE39nDSHJ3FuzJkBD1oRks=;
 b=oEvxXZU8mHm4MKlKwkv5eKXgujf1DgWkjGElDPgRLDUtk9JMR/WTaMfsvnqgG2yMPBZiEASjj/tN8lr+W982i7Xi1kncrwTHXx4WIDW9RZHc4TW+XAcV54joiSXC7n4cw5TUVOtlxJwZXSF/d5QtgQiBtSTjRka6K4/UIM38OqEVj8jVvzoP+Pg29D6ovfRwUhKwpga6BMoLDt1p1k8hZ1B0uGmYqYC0Vq5JQb3/yHGFxQZWhOQa4Ep3NTUT8P+PGK7gf3aPLotkP55E1K1fUKaLoH0jH8+GWKCyqxVTWgVK71MQ1hBGJoGoOYVawkFZ9raurFIkZoKGzTyikeA5WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opPsw06dgzMRZYxDz56XEvE39nDSHJ3FuzJkBD1oRks=;
 b=GtIBUps6Xof7a/nWELyVAItUHP65oZsf8jFApizXy48k4Zkxv4EpfMPZ1bGxA+FVxzCSlVNFiBJGlSbFzo3XlvYcRK+pXgtyl0gqlgSQTZ55Bd9RSonoCLI3yVmyC+zm2mIVgoBVNbcJjokyc4eyzMuXtLqKpQV6gViOtKIURIo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SA2PR11MB5148.namprd11.prod.outlook.com (20.182.119.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Thu, 7 Jan 2021 11:00:24 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 11:00:24 +0000
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <cover.1609934927.git.liezhi.yang@windriver.com>
 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
 <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
 <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com>
 <3966f6f4c6c748f36c73bfccaaa36fdea6b34e63.camel@linuxfoundation.org>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <8eb45b12-acb2-ce3e-c821-3c381c1107f7@windriver.com>
Date: Thu, 7 Jan 2021 18:59:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <3966f6f4c6c748f36c73bfccaaa36fdea6b34e63.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::25) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.0 via Frontend Transport; Thu, 7 Jan 2021 11:00:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b35d058a-ec8f-469a-8a8b-08d8b2fb6f69
X-MS-TrafficTypeDiagnostic: SA2PR11MB5148:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5148CA5D966E335AFD5382E5FFAF0@SA2PR11MB5148.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2iJMsIUizAgbuft9I62ALDKWLjG1jBJR4rAN4xq/wIE3m++6L86WGVcB4JwojDnChGQnenRIO4c/OYGC/1af6pSp8Clor6JyJxVnioBUaqzGIr2oO+fXNlw4XMRtmlptN2MjvJh79qY1pCOECKFk4q6yFJzu+KB6FWM5UXAnGmi6ZfIpCR0FN5ewPYj29xEkEBMo3AUfCSZc0qzMlrY7O/V6Di6vpfvppTBq5C5cVRPjdnyZGCWM8CJ8SyRrbn9v/NgkSw8dDlxoFBKR9JLArUcIu5nQUUFPYQ5vGHk5iFlxhg19dZpYt3JaCj+ODtEgN0MNSjPSc/eBfMrxL1boyLgpPob7CDYdFUXjrXLyZf3FQVXu+EYXIfheD14ZeNrSAWmqWfy9V/U/oHkc3Wnp2zcMk7A5DX+h8Cdws42qztSwEZj2QrH1gylk8exSgRjywKKdIfuL7uw8qp2Q+xI1hHfyIRk+IPaqtUtPdSW5fqSh+kPyVURQD1M8T+2ZadpZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(136003)(346002)(366004)(66556008)(66476007)(66946007)(5660300002)(26005)(53546011)(8936002)(31686004)(52116002)(16576012)(36756003)(186003)(8676002)(2616005)(956004)(6706004)(6486002)(316002)(478600001)(2906002)(86362001)(31696002)(6666004)(16526019)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?kwQorvCo+0uDf7RI9R6zeyYt88ARqzdjKrSSUz2mIf+oLzfxadBtykClV9AU?=
 =?us-ascii?Q?0xGTBKOmyYe9U/RoChHf8hW46Jx6r2D+W7xO12QFm+3EWCYXziRL5kMF+A5t?=
 =?us-ascii?Q?Ll6toWPBS0rpdjSB1nk0xIfNRtRMTRDN2PvJZOJ2yR6xfwW3X+dDyWoZeKsJ?=
 =?us-ascii?Q?GDOJhPzo/CT2NtrksPqOiAzVyR7A1SXxtAOSo1Ke2qgpxqQouomVGXK8wmjr?=
 =?us-ascii?Q?um5BiMcVVpV3tCivlAGsPF+bbpZ4c9cD8LYJhB+uw+CFr/p6BBWUCLqqeVR5?=
 =?us-ascii?Q?vSjv2ngEyJjQFCUYZCUd2bpq+3pqas7Mbd2ivvJjSb0jSd7CbihUitIGsV+g?=
 =?us-ascii?Q?4tdTPDkr2ajLdGIQVtbS4RjI71Ch2sDXlbf8RJmkBNn48JH2UhnODGbKeiZ0?=
 =?us-ascii?Q?50YQHN20hNy084b2S1YAGN2X0e8ZTTFXvJlpESfo0W6yVZGFeVEyaooutF/1?=
 =?us-ascii?Q?IMHkX0VC/2uF1WkXd0di1nfPvwiLByrpumAU0DsWI6K0NOxsJfMY/DGoTb7J?=
 =?us-ascii?Q?E3tAU9QkJOT2BHs3CeezD6l5d9Y0or2uLzr550Nn7x057UBcqJJmzTsiYa7P?=
 =?us-ascii?Q?+xnW0TpKZ/v+pTggusX8sNhQD5tSoAgH1i5ppW+EG9ELRjkyrD75zY3BPGhA?=
 =?us-ascii?Q?NbjlmuIR0yc1ZowldiVyAnr20d4YyFEOyW9SXU4Kgl9o5Pui5scp2coCJlaI?=
 =?us-ascii?Q?53xk/kiGWsGUnm4Dqq9GXOWMDr1+irJ26lTuG2EclPNAC3rVlxXQeee++Ed3?=
 =?us-ascii?Q?qYGHPqlvTAdp4kJHf7cG/LrihArkrnpwN2YwHV2Fw6eRhm+JAksNwGF9uO5V?=
 =?us-ascii?Q?uv7lJhxh/vhjUCmaJlvzeu1tWAzFL7Dfqt6nGSQ1Aaj0TcXM/f/BEYdUqQCq?=
 =?us-ascii?Q?Uiv181FpQMJJfer//zSWGGtp5cMwGLBB7wDRX5WpnUbBAYCy2A2Thgwh2nBs?=
 =?us-ascii?Q?jRSTfMR71VqXkNYVRLF/W9wRByaL322aEc4RQ69xwDALbSYRPK8c907o3/0u?=
 =?us-ascii?Q?Rcnw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 11:00:24.7928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b35d058a-ec8f-469a-8a8b-08d8b2fb6f69
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFfZ11yPdeAdm/qFQBHQOpNKp6De17/t00G98fKQuNOpcNIgPJjaoXBniKEHWpoPJkiX0kpWLn59+8NaGCszLDZBEqfPfK1QDdNs1zSYLDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi RP,

On 1/7/21 6:40 PM, Richard Purdie wrote:
> On Thu, 2021-01-07 at 10:44 +0800, Robert Yang wrote:
>> Hi RP,
>>
>> On 1/6/21 9:56 PM, Richard Purdie wrote:
>>> On Wed, 2021-01-06 at 04:09 -0800, Robert Yang wrote:
>>>> Add it to buildtools-tarball so that there will be a unify version of =
ccache,
>>>> which can help avoid various compile errors.
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>  =C2=A0=C2=A0meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>>>>  =C2=A0=C2=A01 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recip=
es-core/meta/buildtools-tarball.bb
>>>> index 9da81d55235..2ffdd7c7253 100644
>>>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>>>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>>>> @@ -29,6 +29,7 @@ TOOLCHAIN_HOST_TASK ?=3D "\
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-rpcsvc-proto \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-patch \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-mtools \
>>>> +    nativesdk-ccache \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"
>>>
>>> My view is we should not start to ship ccache with buildtools by
>>> default. Its something that the user can install if they want/need it
>>
>>
>> The problem is that user installed ccache may not work with our recipes,=
 for
>> example, we found the following recipes failed to build with ccache on d=
ifferent
>> hosts:
>>
>> cdrtools-native
>> fribidi
>> rocksdb
>>
>>
>> So have a fixed version of ccache can make sure the recipes work well, i=
t also
>> helps us to reproduce the errors easily when user reported a bug.
>=20
> I really do not want ccache in buildtools. If this is such a problem,
> we need to work out how to resolve the circular dependency issues so
> ccache-native can work again.

There are two problems to use cache-native now:
* ccache-native depends on cmake-native and zstd-native which makes it requ=
ires
   more time to build, so it might be a bottleneck for the build

* We need disable ccache-native for about 20 native recipes to resolve the=
=20
circular dependency.

It seems that there isn't a good way to fix the problem, or we have to disa=
ble
ccache for native recipes, only make other recipes (cross, target and nativ=
esdk)
use ccache-native.

Host's ccache isn't reliable from the history.

// Robert

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
