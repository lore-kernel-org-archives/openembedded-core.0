Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.77])
 by mx.groups.io with SMTP id smtpd.web08.10468.1619717245438633991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 10:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nCM7ine9;
 spf=pass (domain: windriver.com, ip: 40.107.93.77, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCNl2vGZVgSG5TNRHmJbercRAH6cFAwPdpEkrF8lBhKHHqu+sioq73jhEzKINBn5dMJvETWENlUhLGIu2FpPvGuOaUzvLu0SD+6nqbWDAzKAHWSP3McHGdZ1oMzwLAyCWRrMUdDvTUyjSwMwcPIIriEqcDLivKDAztOp3nidNPJRc5JWk60ZWZbNsZFaPVeVPt098/B6S+AFeZG8KdHy3O+lqcZhPxqsGmVYXNXQ/2e5bOG69CflChuQ4lJHtuI1QBZO6EXLj7tLCW0nY+uS78IEeNTnDf0feQO+KL/WPxtyB0gj+FEuQtsA4Jz0ELfZQX1OI8q5oL6yxJU+Lf3pxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x42+igeEBsJIGfzFbrfD+ETjvgSltQ1WUSRff3rxq7M=;
 b=c3enymHwhX36b+jqoRtWqQT8RU1O65uQld3uZF6t05ceYfl6b1PJaV0vXZGpE8Z4ep/ua24WebK0RkyFWSc6e/AD1RvcNIuYfwJYl/KacAtJbHmCGJKQqc4X1DDC1Iej9cGFH3j6lOY0TmWZ4GZJcQYKTfQK753HFMgwO7dMd3b7FUbo8Gdz/+zMQeixw2FnbSUu5q7NgUlRtaCVDknU/YqcZN6wcyCaqgGQIV8CjxCVNJODZ1Dg2ch6R1C6u+U0CF5UKSqzfwHTW4hfMG85YxIFzu+pa1pQI2+MRjk1s0kTE3qkrccbLjyXUzAc56x0igd9OYiZ84qG9+wpV1z8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x42+igeEBsJIGfzFbrfD+ETjvgSltQ1WUSRff3rxq7M=;
 b=nCM7ine9e3hVOA/7OnIZNf0WJ4gFVe3baPychGCSPimkbL5edpSBsvpSSbXV9xP8k46/FNHJvAJ8h9TOR/tsWdi3qh8497XY/Mkj55qdhCnK8XisMusxiFXIWKEdSrsmBvh69SufzTRN2qiBZJFdu3M5vXXpgceALWifm5J54wc=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 17:27:24 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 17:27:24 +0000
Subject: Re: TBB: qemuppc build failure with lastest 2021.3
To: Khem Raj <raj.khem@gmail.com>,
 "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>,
 timothy.t.orling@linux.intel.com
CC: akuster808@gmail.com, "MacLeod, Randy" <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <aa8fd032-3e4d-6901-b193-1c7a00862ddf@windriver.com>
 <b59f5590-74b7-40f7-2e11-2592ff9cd0e8@gmail.com>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <9ba9cd48-dc7b-8646-6df7-055c27fd013a@windriver.com>
Date: Thu, 29 Apr 2021 10:27:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <b59f5590-74b7-40f7-2e11-2592ff9cd0e8@gmail.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR14CA0031.namprd14.prod.outlook.com
 (2603:10b6:300:12b::17) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by MWHPR14CA0031.namprd14.prod.outlook.com (2603:10b6:300:12b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend Transport; Thu, 29 Apr 2021 17:27:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b49f88de-3456-43cd-c446-08d90b340d17
X-MS-TrafficTypeDiagnostic: MW3PR11MB4555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4555E53FAF5188B1DA2F66B4EE5F9@MW3PR11MB4555.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sL+5QnEHefV+uB07eQHnrJ/6jMRezz6oQVKSOJ98SC37NkfULyjpg6PiAlURVZJ26xRg2EyUTR5RLO8rPoGIMBQ6pUCRj+nnowDFF8qcCOmuixsj25OkMRIUAxT8J45Lu1wdbauCdl9WiwJch3Srhpd7MvKmI6bM4MGRXVlvS9safuw2G/0FCWKiU3KbVxHX/ubI2Kyv0NkHyrqcLTGtVU0/yQlrKkRLzn5hsrNKj3uG8PcfIIvKQ5vzQ0317KxvptlgmARSWHFOXNETMoGR8dgo7hg6iOxB13f0OoJeRuN5DLxCpx1P5QE7vSiFUS5ZUz8/709IjuLudGmjjJyOUbe6uU8SpKDn6JxL4syRkJvygB8lghyfIaizfKk6lTCdL2Fn5AuVjJx4vc1TLXO7hrLV+/PLLoBTf9EWSaMcFDgaXNCcFKqF4nvkT9EjcXNdn8RkQjxTj5+E/wKwel7Zd4tiK9N6v0r4t82rJ7Er8Fn59SdKSGtbCrPi+2WoU1UBUFcQvhnH42zWznKBWmdJZArNWrmRJOTyBsJ/+1BF7DhHJ49frluX56eq99Iyh/DppyEYpz6qvKB67XqVomqu9yO9HJ4bh0WvHUfiJaKkFQEnPWYVdnR5oLpj+lVTg+iwNBHlZgpTvOwguRYFCbrwwkSDmevcL/K0w3hLhZvz17hW/p1fOTdCrT/wCNfA56AGmfQimHVfo+LX9mt8wKs1bQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(39850400004)(346002)(16576012)(36756003)(38350700002)(8936002)(31686004)(26005)(6486002)(83380400001)(38100700002)(8676002)(110136005)(53546011)(5660300002)(31696002)(478600001)(86362001)(186003)(2906002)(52116002)(316002)(16526019)(66476007)(956004)(66946007)(66556008)(4326008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gu08YcCxxt/29wffkt1XSfdyK6nIAjBAx9yAdso+5V12F2ntIHnZbpE9YYcC?=
 =?us-ascii?Q?/AEMjm/yRjlvuJEAJRGcQ4b4Vm4ve7lzFStQsbow1rGHWNuTAqixTuDbrinv?=
 =?us-ascii?Q?GLYt0lippDMQVE+X7LWhjFqIe8JRBIut3M6gpu8oHM/r5K9u3nHAzK3Vq5LS?=
 =?us-ascii?Q?QpU1Raq8/7vtrh+W/Tx0Ru05wt/ksdc/lUSzb2jkWUPi5K30xSS7OOhnV2UC?=
 =?us-ascii?Q?0ksjCubZIWm59lwvPofsinG9HSognMs7B2avcW4AvgS+PAvmfbQdFrxXks7d?=
 =?us-ascii?Q?PWj826BjlrzvFoW2PlSW+j+pYUHL98i3RLcI/a3Ij+jknoLjkssdtW64X+IN?=
 =?us-ascii?Q?K0K5Iw2ROrjBMt364yogy9SCIp6KBJEOUJp2hiUQrQnRwEXtzaTFnxLMm1wU?=
 =?us-ascii?Q?lat8IGvbn7zlJShVXd71rMvV1RjMua5MFl1NpHXMi6o9I9JYznJgozs7hpL4?=
 =?us-ascii?Q?yKpTnCqH0J3qtkzx4k55bi4ESrSqEXfKPvidxyQW94eB6jMtTHbViw9nFqA4?=
 =?us-ascii?Q?LM7j7856skEFL2XBeO8FVXrX2GxJHuIMi1gz5F2S5WQk2pHPqlZTZIGg4ksg?=
 =?us-ascii?Q?eJgIi8zvs3ZJiEsEmLOLBwgz7hmBRuih3bjyTEEZsaPqqctQCY1zEkcOtYaE?=
 =?us-ascii?Q?QdnuSucCgw92kAanoQXjj7RPT24+r6pv3yW0Vf1ax0qA48YeSyc22JrwXWJV?=
 =?us-ascii?Q?rtkUVV5Cm/kJs3NgLXE/RjnYA6klg6j0ISg8jEjVGumIDRm/nYF5bHHvEgM3?=
 =?us-ascii?Q?lIIyjedFteNHSRJS+PRsqEQfkHWcf8C0igratZHLDQ4hvwcoaxlRutn9Ne/T?=
 =?us-ascii?Q?mSWLED8QmF44PPZ/OlaG2lPnHOVl6hnuUH9thJp5wfoDe+jONBm3HE409tJ4?=
 =?us-ascii?Q?aUFI6ET2hgrpaO2QKi+xK0TgrIu9cCI7rPJJ77kgQQEz2q3/+2MoH50VYc6h?=
 =?us-ascii?Q?im8/5HpRhyFCOOHAJn+yRRRoowr/Qaw56XBWyH3CYtlgzEJaY+KHVyVuy/q4?=
 =?us-ascii?Q?16rbUHHDd1+045HB1gfLwk3Mrauq7vVUOYaLPk2CIYOfjXx9uC0OPK4Dt9Zj?=
 =?us-ascii?Q?HDaRtg7795+KgZJ7xYtas5DY46XxuIhMc658SbOqLgUPYJvFuTc298UjvkEq?=
 =?us-ascii?Q?MN7iXNPIHVn/4ZuScFp4MRDY1eGUwQ8ma0MlAxoqeFseGUZpNpGO/RB/iOEV?=
 =?us-ascii?Q?/cU7VSxhZN7xOfMwDigrwhjSwqQ7TzjzDRSyx8ONUtUe2dP23H5xpGEpozI/?=
 =?us-ascii?Q?/OQ1iFJxaBlL3asFLzX0QcvDyTIXWNB1fq9YoPDzoSolMOiM2O2u50H1g0EK?=
 =?us-ascii?Q?McWN79hX6E0gWd6vgN3HgEz/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49f88de-3456-43cd-c446-08d90b340d17
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 17:27:24.3178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mna+BS9oL06CPL31+P8Z8OErddTKhoX3W7O9lCk77dHj8sNbcK763wy5h4P2UcuSHtDY7ayvzAlgVAJb9lfHaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/29/21 8:54 AM, Khem Raj wrote:
> send a patch to disable it for ppc
>
Sent!

Sau!


> On 4/29/21 8:30 AM, Saul Wold wrote:
>>
>> Naveen:
>>
>> Looks like the latest version of TBB does not build correctly for PPC=20
>> machine targets (qemuppc for sure), it builds for qemuppc64
>>
>> The failure seems to be the handling of __TBB_machine_fetch4()=20
>> definition below, particularly the ITT_ARCH check for PPC64 but not PPC.
>>
>> /srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/202=
1.2.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12:=20
>> error: '__TBB_machine_fetchadd4' was not declared in this scope
>> =C2=A0=C2=A0338 |=C2=A0=C2=A0=C2=A0=C2=A0 return __TBB_machine_fetchadd4=
(ptr, 1) + 1L;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
>>
>>
>> Is TBB supported for PPC?
>>
>> Thanks
>> =C2=A0=C2=A0Sau!
>>
>>
>> #if ITT_ARCH=3D=3DITT_ARCH_IA64
>> #ifdef __INTEL_COMPILER
>> #define __TBB_machine_fetchadd4(addr, val) __fetchadd4_acq((void=20
>> *)addr, val)
>> #else=C2=A0 /* __INTEL_COMPILER */
>> /* TODO: Add Support for not Intel compilers for IA-64 architecture */
>> #endif /* __INTEL_COMPILER */
>> #elif ITT_ARCH=3D=3DITT_ARCH_IA32 || ITT_ARCH=3D=3DITT_ARCH_IA32E /*=20
>> ITT_ARCH!=3DITT_ARCH_IA64 */
>> ITT_INLINE long
>> __TBB_machine_fetchadd4(volatile void* ptr, long addend)=20
>> ITT_INLINE_ATTRIBUTE;
>> ITT_INLINE long __TBB_machine_fetchadd4(volatile void* ptr, long addend)
>> {
>> =C2=A0=C2=A0=C2=A0 long result;
>> =C2=A0=C2=A0=C2=A0 __asm__ __volatile__("lock\nxadd %0,%1"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : "=3Dr"(result),"=3Dm"(*(int*)ptr)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : "0"(addend), "m"(*(int*)ptr)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : "memory");
>> =C2=A0=C2=A0=C2=A0 return result;
>> }
>> #elif ITT_ARCH=3D=3DITT_ARCH_ARM || ITT_ARCH=3D=3DITT_ARCH_PPC64
>> #define __TBB_machine_fetchadd4(addr, val) __sync_fetch_and_add(addr,=20
>> val)
>> #endif /* ITT_ARCH=3D=3DITT_ARCH_IA64 */
>> #ifndef ITT_SIMPLE_INIT
>> ITT_INLINE long
>> __itt_interlocked_increment(volatile long* ptr) ITT_INLINE_ATTRIBUTE;
>> ITT_INLINE long __itt_interlocked_increment(volatile long* ptr)
>> {
>> =C2=A0=C2=A0=C2=A0 return __TBB_machine_fetchadd4(ptr, 1) + 1L;
>> }
>> #endif /* ITT_SIMPLE_INIT */
>>

--=20
Sau!
