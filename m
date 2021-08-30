Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.44])
 by mx.groups.io with SMTP id smtpd.web10.14134.1630309212767296942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@synaptics.onmicrosoft.com header.s=selector2-synaptics-onmicrosoft-com header.b=EJ54zgyv;
 spf=pass (domain: synaptics.com, ip: 40.107.92.44, mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKAqVgWsTeh2QdIpzayjtTocg8AcpwV4Hb5mRGoE7V/O4wESxBYcphbZqHj1wmLrWX5zEwjGFbDweNc84FGkDBZO9azeZxRe1ufIVKBAM8av9SJcj/G2gA5sikN18pBqT9RfiHL6Nt0DlgNeTA0LyO0Od7C53NmIZRfgu+wIptUAg8lww2BTpxZkzUb/S1F1Wu0o+fjXxOjmJu+EOsHQVbrXbBL4kU2rs4JR0Uu1X+wTEDWP3USYMOXoUuBRPIhIF/swnm64b/uQydfSLxfFXGu9LR49gjR6UKC7weZFj78nv4Y+hHblhlIx5BxBXG8KNJgeJsSV8bOY6Nf8RF0XuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HhkvPhyaI0qwLY7y59gSSQ28iay0FLlq/fPCf6ThzI=;
 b=Xf1FjmDFUJMuCgfaq2F0dXIKvyMoc+W9mp9N5sVX6CfB3iuYXSk+1QMP32LuVXPUYH+HOSf6cOJLyQUbp4Iro9rfxj1SgYU0mPX+G4eFhV2cnH9BroQgq87MaD/XQOenkrLgaUSDZSSuXZhKmbJ6CHEctZQVs6w3Y6dS0F2uBfAI+q0hgSAVB2ULLdUoo8dca9Rq5tNEypeoJe5OHVA6pxI5bwYwe3jWHwBxLchjdgrKCC6zjG1Xyr/3M77HvMduP+ldMsXL35GKSyGGoCi4Hmwkm3k804k8WSRm3HjAjg/XsrRU0axSa2purgHLuePyQ1GhwvDzOsL8bK42Fe/miQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HhkvPhyaI0qwLY7y59gSSQ28iay0FLlq/fPCf6ThzI=;
 b=EJ54zgyv8NaXoemhMRj7UVqRL3D7q37g0HUQK8ZKJCdSjAkADtzBvaSHeEs3Vg/NXy+x8Y2EgSOMuNCrZhVhSZZW/2Fj1aUm+gJ3+P4URsTFXQi2pkBWzsdQEGByVrZT6bPOzZ5FKrN6RAQSYugcQM5W01YonbRjQNZ7t+gu2Ts=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM4PR03MB6109.namprd03.prod.outlook.com (2603:10b6:5:394::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 07:40:11 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11%7]) with mapi id 15.20.4457.023; Mon, 30 Aug 2021
 07:40:11 +0000
Subject: Re: [OE-core] [PATCH 0/2] support building for Android target
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210820061150.146518-1-randy.li@synaptics.com>
 <bd668eb2-7062-cf7f-f03b-0432aa59894e@gmail.com>
From: "Hsia-Jun Li" <randy.li@synaptics.com>
Message-ID: <a6f84634-92c3-8c13-747c-ae769146b09c@synaptics.com>
Date: Mon, 30 Aug 2021 15:40:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <bd668eb2-7062-cf7f-f03b-0432aa59894e@gmail.com>
X-ClientProxiedBy: PH0PR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:510:4::18) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
Return-Path: Randy.Li@synaptics.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.70.52.23] (192.147.44.15) by PH0PR07CA0103.namprd07.prod.outlook.com (2603:10b6:510:4::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Mon, 30 Aug 2021 07:40:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e1162db-2434-4e5f-f46e-08d96b896592
X-MS-TrafficTypeDiagnostic: DM4PR03MB6109:
X-Microsoft-Antispam-PRVS: 
	<DM4PR03MB610911599F9A7AA40F277AF586CB9@DM4PR03MB6109.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:212;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B/h93fa/OP+TM0NrJbZKef7tHlMa0tFeoXVy+U0IUpKJaQOuMDCMjFuGHEIMPWy1k415lOEqZckrIXtCC0E1DKOUNB0HhNUZplxUMB2DkCSCcUrPqy/2FpRRalnOHzHDu5/0pUmoLdxgPppVPeBjEuAc1lrfS9WXw93ecSxWEHwbOGaNZyiQTCaabysP+OsC8HtPPtr2EdFgf5stIop8pA5nsodFjr+f1X76PtrNxOXvmmoN2OVC+40c2n1b/GMouucCC/TMhI2BHw3n7ZmIMY8yW3UW1D+s4T1So8iBCj5GubAOUrKG09pjNeIG79VZKAmp5oVd9XPcQwxbkSPytHMiRUsewWdNehJ/AlqEbTVwBTGzupRUxKLSzB5vh+dWyAgEbaoUAQSxQad4LX6yfaJVeRaSxxJryjV/Ky3BO9zfTFAMkJlzW/c4CR0kcyuAHiZq03wolXZlqWq4cqkbyegKCp5ec/fZGC58PJJSZ4K9xvHFhgcnCpyL156ZlbyZdaRO1y7lwFW6hwDBSORHFQCQ0UzbLKvwqCQ2FgYAgvRVznN1zblbWtlBXO3sAzFjJteD1TPrZcQwcW2hN7MH1yb1/Bfs8QznqSDT4cgwDZ97qeAfbjauOE1Xlukebn1lGMpJFB9bWKrBo0NVIASXFko3ttEMQYu9vTsLXuIHcPtYgnp1tjgnJBT2MwKDd38mJ5fgDA4m/4zUuaW0H121eEOUUDJGDgdcJSOyXogExdpF4R39rGZzfJNKzDo0d4VoBO5fNZ5C5bOG8yZTQxWYcMwgsZmPOzf2+hu82GiFh4MJlWCrv5mAXa1ylpgECGBpQajIPKp2oAt+Cu4mmUSO5eIn4egfIgTNXLZD+uoVuCU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(8676002)(316002)(966005)(2906002)(6666004)(36756003)(956004)(2616005)(5660300002)(52116002)(38100700002)(38350700002)(86362001)(6486002)(508600001)(53546011)(26005)(186003)(31696002)(83380400001)(8936002)(31686004)(66556008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mTSQL2Vpu/XLMBVh/tAl9J4nLoFzt4XnWJXH8FlDCQ43WApAU+CHRp/XuPIg?=
 =?us-ascii?Q?l9Hf7LUo5BsYZHq5IpSmXoOf33bQugWPUOLk7LLTZEWgYwi1rGnoG5k5AHG2?=
 =?us-ascii?Q?mtZeBP4YI4BN2uaZr+iTV8lLp89dVVFFDyMiqmKxzAcJrOjMgkjm+HZpV0zk?=
 =?us-ascii?Q?wkMJSAHOS8arGyZt29Q7e6Ihd7bAO750QHlnrHV8Qyed3QZczfwXewRdDeyh?=
 =?us-ascii?Q?SugkET04RSZ3iBxA8I9j80bO+GvYh9yUohdwYZzHjZHp2podejMdalUqiCil?=
 =?us-ascii?Q?dDv8+ASOIkEMo7RC99magjZOb1Jaq9DT/E8g9l4ynkYCig2qH63Bx2c+dQxK?=
 =?us-ascii?Q?N9r/2SxiGJKuaQbfWzec9+m2JwvnkBVzsEF5O1RPQy9WZtc65HRYNODqyJUI?=
 =?us-ascii?Q?uCaCDbd2XvQEPCowiVjpYgIzKSYv5lnle8rnjTn4e/u6lSymsl9EpaRxyIWM?=
 =?us-ascii?Q?L8kRcjJQqROHbr3yrdiL2MWQBwnbP4eCaSs2hNupbzvUHdLTJh+Sm8F6ilP5?=
 =?us-ascii?Q?Ps8pB8680jMEj4es+PB38Ie91BQBxoCJOuUExZwwVxURer6oz9erSXSIv+k0?=
 =?us-ascii?Q?rk3tszZina0T9Pnuw5kvJANVAkkazg6KUNnTbz7tvCoF6HhyfvlEWEN0d5mE?=
 =?us-ascii?Q?2iQ7NEuxIvbjPM2taa6Rx+6dsyleshXGhlJuanBK6SrbD19UONB1FuG/2TwY?=
 =?us-ascii?Q?G2ScaUbS1+jhSihC6lYarg0EoYOKm8ZFbVKHBxClemq3woiFEhRPmf28Iod8?=
 =?us-ascii?Q?7nrYgJlbQI4vVV5XUsHACaiBse3AsaxIjtgQAVKyaNQUmoAKJ3olL2oHS6fh?=
 =?us-ascii?Q?M0UeiuUdS0lgo/m5RZMV47njyQKgoB3bV/LFAp6pMcUxX8IwlcwNEXpIeEm/?=
 =?us-ascii?Q?jJ2mkGVMtDraa+uEeNLR4sXfb5cIKrzayN/p80u49e4LpXTBvHS+wU4qy52f?=
 =?us-ascii?Q?BPSSD7eKDYlrqi3Q+Sj+jYKqL0RAL7Jz4hMUHFLTsEHo8Ts/Ngad0hWlLxcv?=
 =?us-ascii?Q?2h0RtpkySltUeeicMOGnZzQ28As+gliEaTv0JsZ42ldA2isp2kr7gzRGnvgH?=
 =?us-ascii?Q?Ax65/lJMMLTUXs/FRbFGit9XrXOxq07MDsV2d4vxaRH+s1xSZoA7bOYAf7f1?=
 =?us-ascii?Q?LmDZjwULb4SpSPbmryVmiO1Zpni5x3LuAgBmqgZLu4IR0N5bQNVQqp8AbVm5?=
 =?us-ascii?Q?h5OlRAjeqkr6rec3Td0Zy/yrEwJq7D9/r4kGn5DoLgUP0vRVWB4k0xx/rBTf?=
 =?us-ascii?Q?OJlbVSFPuTbO9kncVTb791kdCcaklKdVRnBm4RBhzOHHgu1uCHMR42fymwLO?=
 =?us-ascii?Q?TCOOQ6txKd74a4ulaC9dRyp7?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1162db-2434-4e5f-f46e-08d96b896592
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 07:40:10.9661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTCwACKgo4ClfL/wRrZkl67teLcYmvNnTOFqbjngbvtYLomvDA0iCaXkLbsJ8duyewWkpBZazklYpLlCvAKW5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6109
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/21/21 1:34 AM, Khem Raj wrote:
> CAUTION: Email originated externally, do not click links or open=20
> attachments unless you recognize the sender and know the content is safe.
>=20
>=20
> On 8/19/21 11:11 PM, Hsia-Jun Li wrote:
>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>
>> You may check the meta-android-ndk I posted to the -devel
>> list before.
>>
>=20
> These patches look ok. Can you explain why we want to ignore canadian
> sdk for bionic ?
Sorry for later reply

Because it is hard to let android ndk toolchain pass the whitelist
in that script.


The libc used in Android is bionic but the android ndk toolchain would=20
not take that name in its prefix.
>=20
>> Hsia-Jun Li (2):
>> =C2=A0=C2=A0 cross-canadian: skip it for Android bionic
>> =C2=A0=C2=A0 machine_dict: Add Android OS to it
>>
>> =C2=A0 meta/classes/cross-canadian.bbclass | 2 +-
>> =C2=A0 meta/lib/oe/elf.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++++++++
>> =C2=A0 2 files changed, 9 insertions(+), 1 deletion(-)
>>
>>
>>
>>
>>
>=20
>=20
>=20
>=20

--=20
Hsia-Jun(Randy) Li
