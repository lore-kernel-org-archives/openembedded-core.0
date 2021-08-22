Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6421.1629601960785791796
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 20:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=RDO6FSsa;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38687bdd89=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17M3CeJa006478
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 20:12:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=ekCHEZ4uf500ZZqK3/WBcGWTeO+ykXUY9syWdrFrEi8=;
 b=RDO6FSsaYtiQ0F+QsW4GzRm3JXqEHACSpIiaA21/HHb7q6Eb5yrfUC9GpHpBy1pWs+85
 4/XVIJ62vuFVQFLl2JygRQqBwzmr+MrHw8JA/wtlEaSmz5oriDlcoduAPSEmwrCp3pmA
 3CWuwMemxKhp+Lfy6sa37XQRMkDDvGpjcqt/k9GsxbX62ycVns5awRs0+XPpRvAbmwWW
 k+IJyaxwqXh/yWmM0L7S7Y76cDGiEhBHrg8lKaA2GCCIdm9HwvSIgvub0N2IeJhnklQQ
 GkNSvIR12qV8PhvYeElrHcbqbh4aEqVByBE8RhIIPNamWX/Y6fTMIaGOt7NS/womGYB5 QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ak10krarc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 20:12:39 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17M3Cd6h006468
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 20:12:39 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ak10krarb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Aug 2021 20:12:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2FVKjyIvd55lGdGvRJVDE5K0gan3Buv8uVtL2r621xeNjZchUAxnmq6JIkakrfAlVQEUzJRGsmRu04RpFNrxwZEtyRCO5RHvPdONNiL8UKPWnqhMCqkiDlBuToS7IkiCsNVSu4x1I87iSEKHMg9q4eFstcaGDnJTLgZ+hWRL8J+XwDdNZUQWPasNHByl+J7oohIIYGJ6nZ45awvo60ULe0DpzNe6PWzTPTQ3ERp7O00XAssg49zRSZTe4mGpcAsDl633qkIODkvuuyHKQs3gvtsVMqzxLpKqOF8PSBSLNnjBAhIloiLvfBbDdzdAtGOhPRvpD6Iamz0+OokOy6I1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekCHEZ4uf500ZZqK3/WBcGWTeO+ykXUY9syWdrFrEi8=;
 b=YsxiyWSR/IHSNZvOSDI2qyFewVqjwVxOZKOJdO7ER5BT1GuseW6LIMKUEHQ//GTt0Me17O4FVDA/JeatSqIT+veJxSbYlpPu7O03v1AR73Xhq8D0wxSiZWyHee5GhB+1SGGvr7LZKKDwrK3TRvvCrcBneKE9IW+MVlJb5OpYvo1TJcViMCJyDEaDgH4cpuuR0TQgDDjJqbvSQ0EU2kp1OFl1J8lhEgk+wDLO/hAecLMpy3uQLTRVme48G3h+yY8GE7TT+XInljDOVQO1dqIdrw7/po/GqYTzJ8V73oZ/rjUMBPw7VUO6ghglgVVZvpnsrSEHq61z1JFxmgWZ1MVcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sun, 22 Aug
 2021 03:12:36 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4436.023; Sun, 22 Aug 2021
 03:12:36 +0000
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io,
        cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com,
        Khem Raj <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
        saul.wold@windriver.com, martin.jansa@gmail.com, paul@pbarker.dev,
        Trevor Gamblin <trevor.gamblin@windriver.com>,
        anbelski@linux.microsoft.com, Vinay Kumar <vinay.m.engg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
 <20210813151947.55142-1-vinay.m.engg@gmail.com>
 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
 <169C1FA457B99CA0.23238@lists.openembedded.org>
 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
 <169D3274AAECC435.19323@lists.openembedded.org>
Message-ID: <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
Date: Sat, 21 Aug 2021 23:12:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <169D3274AAECC435.19323@lists.openembedded.org>
X-ClientProxiedBy: BYAPR06CA0004.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by BYAPR06CA0004.namprd06.prod.outlook.com (2603:10b6:a03:d4::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Sun, 22 Aug 2021 03:12:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bdeb620-5137-4dc9-0a90-08d9651ab0b9
X-MS-TrafficTypeDiagnostic: DM4PR11MB5277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB527745269AD84C5E972240D9F8C39@DM4PR11MB5277.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V4UZ2Ri1LRKqhOyZ1qvG1v/s2Z+arkojI9phxNyYhbBN6O9/dKjNLIsVhYY0WuVU238OkyejVBrDTrmKViNWMckcbPlEHacy3bVTwaCIDF4F8YI2GRHHAm1Q1ieh0pNh/HtuiI8T18JHxeln6In0DnY2MpPs/wWPIG9+k9kRxoMoOjfAmfx/9z+EdaYM+qQlK1wv4NjCWVbpd+/XaOHUQrudnBCc2gwONzUr3gpG3VSZuEEVOgREGt4inPZ+k3tYiMr4WI0qwhXl5mOD7uemr92fMyLoG7vl422oEu7ngK17v1yoAtSkzcVwjcghTJO9pPjfm2VM5Gzacpp5WP6UB+eHCMfdYAdSqdgYHaGzLnomJXnK47SeB0JeKRAIte6bpmWMouzKpW6dShdtXKVpDp7mueSpYodERVccWEyNz3etWxGj3UMbaM6golVwvyCxQQUBj4Bn3OugWFDKxTEeatcp0cEriwHtLthHdpTQQ45iF53yreW3J9w94O6ndQWu0f9pvJKDKVEzyFa2RJATamL4sdLnMedgWO1ax5ZvjaYa4v6e0zm2+GMCaK0ewxXNhId10fccGK74KDAja7LFwWZf6XgUj3InRyoUj4WUTDcivOStAvp68jpm+cI3hUTiPdkL8fDLaEh5/ARchelyGiTBRkNhdIu9BIUauUxdJ+gViXLMU+jplM44Mcc2Cr24blA7PjXm9M/aVfecnX7nS+eNeVckgLvbNyk6XVxwAflvG82sKuvEDPkVDE7wSd7F2p6UgYeQ2Q9o9muRYnE9mUbRYGWBrDW84/uNg8u93ppZND22BwtA5nVoWbJzMI1/DNYs54uWNXM1J09uu7jcVZ02vBGVSsi2kAE2PS+JLSvPuRED25SA3J/70fGxPtLZFwh5448ncKo6fYRfQE+kLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39830400003)(396003)(136003)(346002)(2616005)(956004)(16576012)(31686004)(83380400001)(316002)(4326008)(110136005)(186003)(54906003)(66476007)(7416002)(66946007)(30864003)(15650500001)(5660300002)(6486002)(31696002)(53546011)(966005)(26005)(86362001)(2906002)(36756003)(8676002)(166002)(52116002)(38350700002)(38100700002)(66556008)(478600001)(8936002)(33964004)(43740500002)(45980500001)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVdCdXFoMnJoUlMzS1M5MWpaaWJJMTVadkxzdHQwMXhFNHVEQTBBL3VLYW9Y?=
 =?utf-8?B?VjRCeXNSTGo4aHhWN0UzZ1Bma2syMWVnSUg5Q0VSOCt6ZVRrK21SMyt3UlV1?=
 =?utf-8?B?RmNNR2c3ZHU1cDR6VnJ0Z1Y5YUFraTdLZ2tvR1oyQlV2SmR6Q1dJbE1scHRL?=
 =?utf-8?B?VmgraWRvSGZwd0hSNXRGdDBsQTM4T3MwU0ltbUpXT3p6OXk5Sk5yS29Cc2hE?=
 =?utf-8?B?cUg3cmdmaTluZjhLTUJMSUtMM0hDQUp0NlBIR1JyQ2M1T2w5dUVRMEhRU0NL?=
 =?utf-8?B?NmFJbW5KaXJyRmU2Rk9PNnNzdUc0b0Q0RExidUNqZko2U1ppNjR1MzFDclFM?=
 =?utf-8?B?VEdHYm1lRXpoZ3htQm5zOGNTa2dWV3RmVUtZeU9yaGxZVXd1SjFrS3NuMUdn?=
 =?utf-8?B?R3g3SytiSEMwbTBDQzF3YW01RkJ3a0pOaURyZldoVmpXbXk4dm1yL1Nlc0Rr?=
 =?utf-8?B?ckcwcm9tR3pnQi9oeEt5WGtQTDhVRXNGais4bWc5YVZZNkQweUZwV3RRakVx?=
 =?utf-8?B?bmMzV1ZxOGtvT2pKNTI5VTNEZHE2UFhidUEzTlFZYU5Vb2lUeXFaMlNEdHFQ?=
 =?utf-8?B?MkpEM2ZJL2x1TUNIOFh5MGQ0bXB4Q3o4WS9jOE5VL2FUTHVWVDBIR2NGSjdU?=
 =?utf-8?B?aE9RSzU2QjlIRkYwdzhrUjgwRXBZcXBpV05ZdktIWmhjMHc5K2NwbzJwMDQ2?=
 =?utf-8?B?OWFlV0UwLzd6RjAxVzFOV1FLVVFtYTI5YU9idEM4amJaMXloWThlZUcyKy8x?=
 =?utf-8?B?WndYZjZOMWowVFJ0eVQyQW5ZcEI1aFJ1OEIzZDZndXZvWW96eUpnYnEzWVFF?=
 =?utf-8?B?bmYwTHlIR1lDL2FlMGhnemRDUGVULzB0dEE3UkxocmNlek1LVklBNjEzcUJ2?=
 =?utf-8?B?Vkp4cU9BTC9JL2lOSk94aHZMUzhWYXdodTRrMzJ6VVJwbkVycjBMVVlQQU5u?=
 =?utf-8?B?dUxNeDdCeSsydzJyWExGTzlHVGhhWkZRcW1LZlF2Vnl5alNZb0pkSE5lTTZG?=
 =?utf-8?B?d2lYSjBsU2VNNm9CNjlpQ29ZSkxsbkpJN0Ywd2FuK0VDbUZBZVlwVWVUYUlD?=
 =?utf-8?B?Z1VUR284VnY1Tmcwa2xwRXNRYjV3WjJETS9yRXUyMTFlNjB6ODAyQmQyOHBS?=
 =?utf-8?B?VFdFQjdHSnBZb2FEbU9rTjVsMENUWDE4N21aQ01Ic1FHN09CcjdLUzV3UjYr?=
 =?utf-8?B?VmVnU0FielZKSVVDMXZNM2pFazR3Yi9pN1ZLM1EyaWE5VjlJcDd0V2o4MHFu?=
 =?utf-8?B?dmsxSmVIMDgvcnlRWWZRRm5VbDRtTnNpOFBlZDZoS0REYnl4eWdKTHFVZk1H?=
 =?utf-8?B?eG9aRC9hV1Y1V3dodXFTbnRKRzZTbEV0c0lIUHc5MVl3enNqVnJ4TCtPVmoz?=
 =?utf-8?B?RXF4Snd6RmkvR1NZcStxSVVNVUZaSWg5STdNZzl6YTJja2hSbHM1K0diN2lB?=
 =?utf-8?B?SEwxdk9HTjBKanFzV2tRbW85QTc1ZmllYWFSM0xjV1preFJFTW9admg3cC85?=
 =?utf-8?B?M0VDeTFXS3BNbVhvK0FYMEZWTzRJSytseVFEcGpaVjZRTHllOUNPYXlzMnNC?=
 =?utf-8?B?OExkYlpiT2lJNTBFSkV6SVFKckJCVmxkQjJpV05hL0MyQmx0MjhoakVXK2xJ?=
 =?utf-8?B?YzR6NjZHOVN5aUhzYlQ1WGpkQkJockpqYkxka3JpL2RtUTh6TzR6anZJMWZo?=
 =?utf-8?B?NnVXOURObFFzdWJVN0NaNkVQaFVXbkdUMW1Qd242Q2Y2R3NaNTg0MzJDUGRq?=
 =?utf-8?Q?P3Wof+zRrvIP+eVFc+ygHxCouas54b/2n7iYnS7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdeb620-5137-4dc9-0a90-08d9651ab0b9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2021 03:12:36.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AikfLonLAV3fhqvTHL06DkPn2U6sMJOGu9Omzw/s07DbT1X0HQAH/XV21Hw+kbcRW42WFftQSd75hSqO9dqU3B+typUN7IdXfiymfDuVqog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
X-Proofpoint-ORIG-GUID: nMObyCYVE8_iUpzpyCOWWo5iIgtcA8aC
X-Proofpoint-GUID: Zsog7w8MrjN3Fxd-EwSF1KfKSigRrvXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-21_11,2021-08-20_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108220021
Content-Type: multipart/alternative;
 boundary="------------3636D63EEAC86FE3933D6320"
Content-Language: en-CA

--------------3636D63EEAC86FE3933D6320
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17M3CeJa006478

On 2021-08-20 10:48 p.m., Randy MacLeod wrote:
> On 2021-08-20 6:06 a.m., Randy MacLeod wrote:
>> Added Trevor who may be working on upgrading python-cryptography.
>> Added Anatol since he was interested last time we worked on merging.
>>
>> Again, let me know if you want to be dropped by replying privately.
>> No one from the meta-rust community responded last time so I'm
>> assuming that y'all are just on vacation! ;-)
>>
>> On 2021-08-17 10:52 a.m., Randy MacLeod wrote:
>>> On 2021-08-13 11:22 a.m., Vinay Kumar wrote:
>>>> Hi Randy,
>>>>
>>>>>> Vinay or I will look into glibc/qemuppc64
>>>>>> if no one else is working on that.
>>>>
>>>> The failure is due to the below error in libstd-rs package build.
>>>> "error: unrecognized arch "powerpc64le" in target specification"
>>>>
>>>> The reason for this is "arch": "powerpc64le" from the below target
>>>> specific file.
>>>>
>>
>> ,,,
>>
>>>
>>> Thanks Vinay, applied.
>>>
>>> I'll push a new branch to poky-contrib later today.
>>
>>
>> I fixed and worked-around a few issues and pushed a new branch:
>>
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Drmacleod/rust=
-redo-aug-17-2021-a=20
>>
>>
>> 1. There are only a few new commits including Vinay's:
>>
>> =C2=A0=C2=A0 757da4cbf1e rust: remove Rust version 1.51.0 toolchain
>>
>> =C2=A0=C2=A0 a4808f787ca cargo_common: remove http_proxy
>>
>> =C2=A0=C2=A0 b6941135c00 rust-common.inc: Fix build failure with qemuppc=
64.
>>
>>
>> If anyone wants to help by doing test builds, trying to generate and use
>>
>> and SDK with rust in it or anything else, that'd be great.
>>
>>
>>
>> Alex also ran a test build on the Autobuilder:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2439
>>
>>
>>
>> but I have yet to look at the failed stages in the run.
>>
>>
>> Testing logs and debugging notes below for those interested.
>>
>> ../Randy
>>
>>
>>
>> The test:
>> =C2=A0=C2=A0 oe-selftest -r distrodata.Distrodata.test_maintainers
>>
>>
>> is fixed by creating maintainer records for all rusty packages
>> and by removing the older version of the rust toolchain:
>> =C2=A0=C2=A0 757da4cbf1e rust: remove Rust version 1.51.0 toolchain
>>
>>
>>
>> I suppose that if the meta-rust users want to keep an older TC
>> it can live in meta-rust.
>>
>> Then, these tests:
>>
>> =C2=A0=C2=A0 oe-selftest -r sstatetests.SStateTests.test_sstate_noop_sam=
esigs
>>
>> =C2=A0=C2=A0 oe-selftest -r sstatetests.SStateTests.test_sstate_sametune=
_samesigs
>>
>>
>> were failing. One issue was fixed by the work-around of:
>>
>> =C2=A0=C2=A0 a4808f787ca cargo_common: remove http_proxy
>>
>>
>> Debugging the next step was a challenge since I hadn't worked
>> with diffsigs before. Then to simplify, I removed all rusty .bb package
>> =C2=A0=C2=A0 ( by mv foo.bb=20
>> <https://urldefense.com/v3/__http://foo.bb__;!!AjveYdw8EvQ!IgwYWcWmCub5a=
QLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpsy_PUvWQ$>=20
>> foo.bb.hide)
>> until I was down to the first recipe in the dependency tree:
>>
>> =C2=A0=C2=A0 rust-llvm-native.
>>
>> and then running:
>> =C2=A0 oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs =
\
>> sstatetests.SStateTests.test_sstate_sametune_samesigs \
>>
>>
>>
>> 2021-08-19 17:54:12,878 - oe-selftest - INFO
>> - Ran 2 tests in 142.010s
>>
>> - OK
>>
>> - RESULTS:
>>
>> - RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASSED (41.45s)
>>
>> - RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASSED (98.89s)
>>
>> - SUMMARY:
>>
>> - oe-selftest () - Ran 2 tests in 142.012s
>>
>> - oe-selftest - OK - All required tests passed
>> =C2=A0=C2=A0=C2=A0 (successes=3D2, skipped=3D0, failures=3D0, errors=3D0=
)
>>
>>
>> adding the next self consistent group of package:
>> =C2=A0=C2=A0 cargo/cargo-cross-canadian_1.54.0.bb=20
>> <https://urldefense.com/v3/__http://cargo-cross-canadian_1.54.0.bb__;!!A=
jveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpvC=
xIrDwA$>=20
>>
>>
>> =C2=A0=C2=A0 cargo/cargo_1.54.0.bb=20
>> <https://urldefense.com/v3/__http://cargo_1.54.0.bb__;!!AjveYdw8EvQ!IgwY=
WcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWptRWUAvyA$>=20
>>
>>
>> =C2=A0=C2=A0 rust/libstd-rs_1.54.0.bb=20
>> <https://urldefense.com/v3/__http://libstd-rs_1.54.0.bb__;!!AjveYdw8EvQ!=
IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpuNZ1zxTA$>=20
>>
>>
>> =C2=A0=C2=A0 rust/rust-cross-canadian_1.54.0.bb=20
>> <https://urldefense.com/v3/__http://rust-cross-canadian_1.54.0.bb__;!!Aj=
veYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpvu8=
Kgohw$>=20
>>
>>
>> =C2=A0=C2=A0 rust/rust-cross_1.54.0.bb=20
>> <https://urldefense.com/v3/__http://rust-cross_1.54.0.bb__;!!AjveYdw8EvQ=
!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpuYvgjUig$>=
=20
>>
>>
>> =C2=A0=C2=A0 rust/rust-tools-cross-canadian_1.54.0.bb=20
>> <https://urldefense.com/v3/__http://rust-tools-cross-canadian_1.54.0.bb_=
_;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNh=
pWpv42uDIpQ$>=20
>>
>>
>> =C2=A0=C2=A0 rust/rust_1.54.0.bb=20
>> <https://urldefense.com/v3/__http://rust_1.54.0.bb__;!!AjveYdw8EvQ!IgwYW=
cWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWps4C8-W7g$>=20
>>
>>
>>
>>
>> I see another http_proxy failure that seems to require a feature
>> drop in cargo:
>>
>> https://github.com/rust-lang/cargo/blob/master/src/cargo/ops/registry.rs=
#L524=20
>>
>>
>> Patching out a feature doesn't seem like a good idea but
>> maybe someone else has a better one?
>>
>> To see if there were other problems lurking menacingly behind the proxy
>> error, I disabled the http_proxy test in:
>> =C2=A0=C2=A0=C2=A0=C2=A0meta/lib/oeqa/selftest/cases/sstatetests.py=20
>> <https://urldefense.com/v3/__http://sstatetests.py__;!!AjveYdw8EvQ!IgwYW=
cWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWptCntmNRQ$>=20
>>
>>
>>
>> =C2=A0=C2=A0 -http_proxy =3D "http://example.com/"
>>
>> =C2=A0=C2=A0 +http_proxy =3D ""
>>
>>
>> and ran again to find:
>>
>> - RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASSED (50.63s)
>> - RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FAILED (160.05s)
>>
>> so that's somewhat encouraging but there is still the error:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 File ".../meta/lib/oeqa/selftest/cases/sstatete=
sts.py", line 449,
>> =C2=A0=C2=A0 in test_sstate_sametune_samesigs
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 self.assertCountEqual(files1, files2)
>>
>> AssertionError: Element counts were not equal:
>>
>> First has 1, Second has 0:
>> '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\
>> tmp-sstatesamehash/stamps/x86_64-linux/\
>> lib32-rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.\
>> fc54579cc139c777172242c3da3e0'
>>
>>
>> First has 1, Second has 0:
>> '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\
>> tmp-sstatesamehash/stamps/x86_64-linux/\
>> lib32-rust-cross-i686/1.54.0-r0.do_compile.sigdata.\
>> 86cb5a1346b0615cb21fab3c0110cc964ecced'
>>
>>
>> ... lots of similar lines of diffsig info ...
>>
>>
>> Hacking the test to not clean up and
>> running bitbake-dumpsigs on the two sig files for the first error,
>> I get the two files attached. I also attached the
>> =C2=A0=C2=A0 tmp/log/oe-selftest-results.log file.
>>
>> That's it for now.
>
>
> I think I've gotten to the bottom of a chain of sigs that differ in=20
> part due to:
> "Hash for dependent task" differing and found that on leaf node is:
>
> stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_target
>
> See below for my notes and my assertion/question about the next step=20
> needing
> to be deterministically ordering the elements used in rust_gen_target.
>
> ../Randy
>
With a patch from Richard, and the http_proxy check removed,

$ git diff | grep "^[+-]"
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
-http_proxy =3D "http://example.com/"
+http_proxy =3D ""

we have fixed the oe-selftest that was failing.
Any volunteers to stub out the http[s]_proxy code in cargo ?

I've written up a commit log that could use some review and pushed an=20
update to:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacleod/ru=
st-redo-aug-17-2021-a


I starting to work on the YP autobuilder issues.

I can build:
 =C2=A0=C2=A0 $ bitbake cargo-cross-canadian-x86-64

Adding this:

require conf/multilib.conf
MULTILIBS =3D 'multilib:lib32'
DEFAULTTUNE:virtclass-multilib-lib32 =3D 'x86'

to my local.conf, I see that:

$ bitbake lib32-rust

fails with the error:
---
failed to execute command:=20
"/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a/tmp/work/x86-pokymllib32=
-linux/lib32-rust/1.54.0-r0/lib32-recipe-sysroot/usr/lib/llvm-rust/bin/llvm=
-config"=20
"--bindir"
| error: No such file or directory (os error 2)
---

Khem, a MUSL build fails:

$ TCLIBC=3Dmusl=C2=A0 bitbake rust-hello-world
as shown below (1) but I'll see if that's reproducible with a clean build.


I've also rebased to poky master:
 =C2=A0 3fd2dff4eb3 (origin/master, origin/HEAD, master) ref-manual: Fix=20
reference to bbappend section of dev-manual
and the two key oe-selftests still pass with the http_proxy work-around
as does core-image-minimal+rust-hello-world (2) so I've pushed a new=20
branch:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacleod/ru=
st-redo-aug-21-2021-a


Richard, Alex,

 =C2=A0 Is it worth another AB run?

../Randy


1)

$ TCLIBC=3Dmusl=C2=A0 bitbake rust-hello-world

ERROR: rust-cross-x86_64-1.54.0-r0 do_prepare_recipe_sysroot: Error=20
executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure=20
was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
 =C2=A0=C2=A0=C2=A0=C2=A0 0001:
 =C2=A0*** 0002:extend_recipe_sysroot(d)
 =C2=A0=C2=A0=C2=A0=C2=A0 0003:
File:=20
'/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/classes/stagi=
ng.bbclass',=20
lineno: 582, function: extend_recipe_sysroot
 =C2=A0=C2=A0=C2=A0=C2=A0 0578:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 "/bin/" in l or "/sbin/" in l:
 =C2=A0=C2=A0=C2=A0=C2=A0 0579:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # defer /*bin/* files until last in=20
case they need libs
 =C2=A0=C2=A0=C2=A0=C2=A0 0580:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 binfiles[l] =3D (targetdir, dest)
 =C2=A0=C2=A0=C2=A0=C2=A0 0581:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 el=
se:
 =C2=A0*** 0582:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 staging_copyfile(l, targetdir, dest,=20
postinsts, seendirs)
 =C2=A0=C2=A0=C2=A0=C2=A0 0583:
 =C2=A0=C2=A0=C2=A0=C2=A0 0584:=C2=A0=C2=A0=C2=A0 # Handle deferred binfile=
s
 =C2=A0=C2=A0=C2=A0=C2=A0 0585:=C2=A0=C2=A0=C2=A0 for l in binfiles:
 =C2=A0=C2=A0=C2=A0=C2=A0 0586:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (=
targetdir, dest) =3D binfiles[l]
File:=20
'/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/classes/stagi=
ng.bbclass',=20
lineno: 149, function: staging_copyfile
 =C2=A0=C2=A0=C2=A0=C2=A0 0145:=C2=A0=C2=A0=C2=A0 if os.path.islink(c):
 =C2=A0=C2=A0=C2=A0=C2=A0 0146:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l=
inkto =3D os.readlink(c)
 =C2=A0=C2=A0=C2=A0=C2=A0 0147:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f os.path.lexists(dest):
 =C2=A0=C2=A0=C2=A0=C2=A0 0148:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if not os.path.islink(dest):
 =C2=A0*** 0149:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise OSError(errno.EEXIST, "Link %s alre=
ady=20
exists as a file" % dest, dest)
 =C2=A0=C2=A0=C2=A0=C2=A0 0150:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if os.readlink(dest) =3D=3D linkto:
 =C2=A0=C2=A0=C2=A0=C2=A0 0151:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dest
 =C2=A0=C2=A0=C2=A0=C2=A0 0152:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 raise OSError(errno.EEXIST, "Link %s already=20
exists to a different location? (%s vs %s)" % (dest, os.readlink(dest),=20
linkto), dest)
 =C2=A0=C2=A0=C2=A0=C2=A0 0153:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o=
s.symlink(linkto, dest)
Exception: FileExistsError: [Errno 17] Link=20
/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a/tmp/work/x86_64-linux/rus=
t-cross-x86_64/1.54.0-r0/recipe-sysroot/usr/include/c++/11.2.0/x86_64-poky-=
linux=20
already ex'

ERROR: Logfile of failure stored in:=20
/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a/tmp/work/x86_64-linux/rus=
t-cross-x86_64/1.54.0-r0/temp/log.do_prepare_recipe_sysroot.192760=20

ERROR: Task=20
(/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/recipes-devto=
ols/rust/rust-cross_1.54.0.bb:do_prepare_recipe_sysroot)=20
failed with exit code '1'


2) There is a warning for rust-native:

grep WARNING=20
tmp/work/x86_64-linux/rust-native/1.54.0-r0/temp/log.do_populate_sysroot=20
| fmt
WARNING: File
'/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-21-a/tmp/work/x86_64-linux/ru=
st-native/1.54.0-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-linux/bin/=
rust-llvm-dwp'=20

from rust-native was already stripped, this will prevent future debugging!


>
> I did learn a bit about this test code that is failing:
>
> https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftes=
t/cases/sstatetests.py#n404
>
> as the comment explains:
>
> |
> The sstate checksums of two identical machines (using the same tune)=20
> should be the
> same, apart from changes within the machine specific stamps directory.=20
> We use the
> qemux86copy machine to test this. Also include multilibs in the test.|
>
> so the good news is that there are: 23185files being checked and
> only 43 are different and if you look at what packages and arches
> differ it's:
>
> x86_64-linux/lib32-rust-cross-i686
> x86_64-linux/rust-cross-i686
> core2-32-poky-linux/rust
> core2-32-poky-linux/libstd-rs
> x86-pokymllib32-linux/lib32-libstd-rs
> x86-pokymllib32-linux/lib32-rust
>
> Note that these are all 32bit multilib builds.
> Maybe that's not so important for the initial merge to oe-core... Richard=
?
>
>
> Looking at core2-32-poky-linux/rust the stages that have different=20
> signatures are:
>
> do_configure
> do_populate_sysroot
> do_package_qa
> do_install
> do_package
> do_packagedata
> do_compile
> do_prepare_recipe_sysroot
> do_package_write_rpm
>
> 9 of the 19 stages. Ok so maybe it's not great news after all. ;-)
>
>
> I'll kept digging down through the tree of dependant diffsigs
> since when looking at do_prepare_recipe_sysroot, it was clear
> that a key difference in it's signatures was due to:
> =C2=A0 "Hash for dependent task ..."
> differing. Finally I found a set of signatures that did not have a
> diff in the dependent task:
>
> stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_target*
>
> The simplified diff is below and the files are attached.
>
> There are a variety of variables that differ only in order, such as:
>
> -List of dependencies for variable TUNE_FEATURES is=20
> {'TUNE_FEATURES:tune-core2-32', 'DEFAULTTUNE'}
> +List of dependencies for variable TUNE_FEATURES is {'DEFAULTTUNE',=20
> 'TUNE_FEATURES:tune-core2-32'}
>
> I assume the next step is to find out where those variables are produced:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/recipes-=
devtools/rust/rust-common.inc?h=3Drmacleod/rust-redo-aug-10-2021-a#n292
>
> and to introduce deterministic order when building them.
>
> ../Randy
>
>
> diff -Naur x86_64-rust-cross-i686-rust-gen-targets/* | grep "^[+-]" |=20
> cut -c -166
> ---=20
> x86_64-rust-cross-i686-rust-gen-targets/1.rust-cross-i686.do_rust_gen_tar=
get=20
> 2021-08-20 22:19:19.883320107 -0400
> +++=20
> x86_64-rust-cross-i686-rust-gen-targets/2.rust-cross-i686.do_rust_gen_tar=
get=20
> 2021-08-20 22:19:19.651319015 -0400
> -basewhitelist: {'CCACHE_TOP_DIR', 'SOURCE_DATE_EPOCH',=20
> 'SDKPKGSUFFIX', 'BB_WORKERCONTEXT', 'FILESEXTRAPATHS', 'HOME',=20
> 'OMP_NUM_THREADS', 'PRSERV_DUMPDIR', 'PRSERV_HO
> +basewhitelist: {'PWD', 'SSTATE_HASHEQUIV_OWNER', 'STAMPS_DIR',=20
> 'CCACHE', 'BB_WORKERCONTEXT', 'COREBASE', 'BBPATH', 'HOME', 'TMPDIR',=20
> 'ERROR_QA', 'SSTATE_HASHEQUIV_ME
> -basehash:=20
> bd66629631e757dcccfc103c13e7de6ac3568677df3ef5ad47dd99e62427caab
> +basehash:=20
> d697cf2cbb5807e83f8b55de8012d5bb9ab8674f4bbf95587fc3ca822a47269b
> -List of dependencies for variable TUNE_ARCH is {'X86ARCH32',=20
> 'X86ARCH64'}
> +List of dependencies for variable TUNE_ARCH is {'X86ARCH64',=20
> 'X86ARCH32'}
> -List of dependencies for variable TUNE_FEATURES is=20
> {'TUNE_FEATURES:tune-core2-32', 'DEFAULTTUNE'}
> +List of dependencies for variable TUNE_FEATURES is {'DEFAULTTUNE',=20
> 'TUNE_FEATURES:tune-core2-32'}
> -List of dependencies for variable llvm_cpu is {'PACKAGE_ARCH',=20
> 'TUNE_FEATURES', 'TRANSLATED_TARGET_ARCH'}
> -List of dependencies for variable llvm_features is=20
> {'llvm_features_from_cc_arch', 'llvm_features_from_tune',=20
> 'llvm_features_from_target_fpu'}
> +List of dependencies for variable llvm_cpu is {'PACKAGE_ARCH',=20
> 'TRANSLATED_TARGET_ARCH', 'TUNE_FEATURES'}
> +List of dependencies for variable llvm_features is=20
> {'llvm_features_from_target_fpu', 'llvm_features_from_cc_arch',=20
> 'llvm_features_from_tune'}
> -List of dependencies for variable llvm_features_from_tune is=20
> {'target_is_armv7', 'TUNE_FEATURES', 'ARM_THUMB_OPT', 'MACHINEOVERRIDES'}
> +List of dependencies for variable llvm_features_from_tune is=20
> {'ARM_THUMB_OPT', 'TUNE_FEATURES', 'target_is_armv7', 'MACHINEOVERRIDES'}
> -List of dependencies for variable rust_gen_target is {'sys_for',=20
> 'arch_to_rust_target_arch', 'RUST_PANIC_STRATEGY', 'prefix_for'}
> +List of dependencies for variable rust_gen_target is {'sys_for',=20
> 'prefix_for', 'arch_to_rust_target_arch', 'RUST_PANIC_STRATEGY'}
> -List of dependencies for variable target_is_armv7 is {'TARGET_ARCH',=20
> 'TUNE_FEATURES', 'MACHINEOVERRIDES'}
> +List of dependencies for variable target_is_armv7 is=20
> {'TUNE_FEATURES', 'TARGET_ARCH', 'MACHINEOVERRIDES'}
> -Variable MACHINE value is qemux86
> -Variable MACHINEOVERRIDES value is=20
> ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '',=20
> d)}${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '', d)}qemua
> +Variable MACHINE value is qemux86copy
> +Variable MACHINEOVERRIDES value is=20
> ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '',=20
> d)}${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '', d)}qemua
> -Computed base hash is=20
> bd66629631e757dcccfc103c13e7de6ac3568677df3ef5ad47dd99e62427caab and=20
> from file=20
> bd66629631e757dcccfc103c13e7de6ac3568677df3ef5ad47dd99e62427caab
> -Computed task hash is=20
> 448a8113230a16ac5d606de18989f98b3700edeb3e7956c6f02207aa76a5d4f3
> +Computed base hash is=20
> d697cf2cbb5807e83f8b55de8012d5bb9ab8674f4bbf95587fc3ca822a47269b and=20
> from file=20
> d697cf2cbb5807e83f8b55de8012d5bb9ab8674f4bbf95587fc3ca822a47269b
> +Computed task hash is=20
> 83d1a26ebe7e2df3f496024a297ba782e145e6982457e09102d5e7c4fbf1b3b7
>
>
>>
>>
>> ../Randy
>>
>>
>>>
>>> ../Randy
>>>>
>>>> On Fri, Aug 13, 2021 at 8:50 PM Vinay Kumar=20
>>>> <vinay.m.engg@gmail.com> wrote:
>>>>>
>>>>> rust-common.inc: Fix build failure with qemuppc64.
>>>>>
>>>>> The glibc build of "rust-hello-world" throws error in libstd-rs=20
>>>>> package.
>>>>> error: unrecognized arch "powerpc64le" in target specification
>>>>>
>>>>> The same got fixed by changing the arch to "powerpc64".
>>>>>
>>>>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>>>>> ---
>>>>> =C2=A0 meta/recipes-devtools/rust/rust-common.inc | 2 ++
>>>>> =C2=A0 1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/meta/recipes-devtools/rust/rust-common.inc=20
>>>>> b/meta/recipes-devtools/rust/rust-common.inc
>>>>> index 350517c723..f574152815 100644
>>>>> --- a/meta/recipes-devtools/rust/rust-common.inc
>>>>> +++ b/meta/recipes-devtools/rust/rust-common.inc
>>>>> @@ -248,6 +248,8 @@ def arch_to_rust_target_arch(arch):
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "mips64=
"
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif arch =3D=3D "armv7":
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "arm"
>>>>> +=C2=A0=C2=A0=C2=A0 elif arch =3D=3D "powerpc64le":
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "powerpc64"
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return arch
>>>>>
>>>>> --=20
>>>>> 2.31.1
>>>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
>
>=20
>

--=20
# Randy MacLeod
# Wind River Linux


--------------3636D63EEAC86FE3933D6320
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2021-08-20 10:48 p.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:169D3274AAECC435.19323@lists.openembedded.org">
      
      <div class="moz-cite-prefix">On 2021-08-20 6:06 a.m., Randy
        MacLeod wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com">Added
        Trevor who may be working on upgrading python-cryptography. <br>
        Added Anatol since he was interested last time we worked on
        merging. <br>
        <br>
        Again, let me know if you want to be dropped by replying
        privately. <br>
        No one from the meta-rust community responded last time so I'm <br>
        assuming that y'all are just on vacation! ;-) <br>
        <br>
        On 2021-08-17 10:52 a.m., Randy MacLeod wrote: <br>
        <blockquote type="cite">On 2021-08-13 11:22 a.m., Vinay Kumar
          wrote: <br>
          <blockquote type="cite">Hi Randy, <br>
            <br>
            <blockquote type="cite">
              <blockquote type="cite">Vinay or I will look into
                glibc/qemuppc64 <br>
                if no one else is working on that. <br>
              </blockquote>
            </blockquote>
            <br>
            The failure is due to the below error in libstd-rs package
            build. <br>
            &quot;error: unrecognized arch &quot;powerpc64le&quot; in target
            specification&quot; <br>
            <br>
            The reason for this is &quot;arch&quot;: &quot;powerpc64le&quot; from the below
            target <br>
            specific file. <br>
            <br>
          </blockquote>
        </blockquote>
        <br>
        ,,, <br>
        <br>
        <blockquote type="cite"> <br>
          Thanks Vinay, applied. <br>
          <br>
          I'll push a new branch to poky-contrib later today. <br>
        </blockquote>
        <br>
        <br>
        I fixed and worked-around a few issues and pushed a new branch:
        <br>
        <br>
        <br>
        <a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmacleod*rust-redo-aug-17-2021-a__;Lw!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWptMgk2PbQ$" moz-do-not-send="true">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a</a>
        <br>
        <br>
        1. There are only a few new commits including Vinay's: <br>
        <br>
        &nbsp;&nbsp; 757da4cbf1e rust: remove Rust version 1.51.0 toolchain <br>
        <br>
        &nbsp;&nbsp; a4808f787ca cargo_common: remove http_proxy <br>
        <br>
        &nbsp;&nbsp; b6941135c00 rust-common.inc: Fix build failure with
        qemuppc64. <br>
        <br>
        <br>
        If anyone wants to help by doing test builds, trying to generate
        and use <br>
        <br>
        and SDK with rust in it or anything else, that'd be great. <br>
        <br>
        <br>
        <br>
        Alex also ran a test build on the Autobuilder: <br>
        <br>
        &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/typhoon/*/builders/83/builds/2439__;Iw!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpvGKhTxpQ$" moz-do-not-send="true">https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2439</a>
        <br>
        <br>
        <br>
        <br>
        but I have yet to look at the failed stages in the run. <br>
        <br>
        <br>
        Testing logs and debugging notes below for those interested. <br>
        <br>
        ../Randy <br>
        <br>
        <br>
        <br>
        The test: <br>
        &nbsp;&nbsp; oe-selftest -r distrodata.Distrodata.test_maintainers <br>
        <br>
        <br>
        is fixed by creating maintainer records for all rusty packages <br>
        and by removing the older version of the rust toolchain: <br>
        &nbsp;&nbsp; 757da4cbf1e rust: remove Rust version 1.51.0 toolchain <br>
        <br>
        <br>
        <br>
        I suppose that if the meta-rust users want to keep an older TC <br>
        it can live in meta-rust. <br>
        <br>
        Then, these tests: <br>
        <br>
        &nbsp;&nbsp; oe-selftest -r
        sstatetests.SStateTests.test_sstate_noop_samesigs <br>
        <br>
        &nbsp;&nbsp; oe-selftest -r
        sstatetests.SStateTests.test_sstate_sametune_samesigs <br>
        <br>
        <br>
        were failing. One issue was fixed by the work-around of: <br>
        <br>
        &nbsp;&nbsp; a4808f787ca cargo_common: remove http_proxy <br>
        <br>
        <br>
        Debugging the next step was a challenge since I hadn't worked <br>
        with diffsigs before. Then to simplify, I removed all rusty .bb
        package <br>
        &nbsp;&nbsp; ( by mv <a href="https://urldefense.com/v3/__http://foo.bb__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpsy_PUvWQ$" moz-do-not-send="true">foo.bb</a> foo.bb.hide) <br>
        until I was down to the first recipe in the dependency tree: <br>
        <br>
        &nbsp;&nbsp; rust-llvm-native. <br>
        <br>
        and then running: <br>
        &nbsp; oe-selftest -r
        sstatetests.SStateTests.test_sstate_noop_samesigs \ <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        sstatetests.SStateTests.test_sstate_sametune_samesigs \ <br>
        <br>
        <br>
        <br>
        2021-08-19 17:54:12,878 - oe-selftest - INFO <br>
        - Ran 2 tests in 142.010s <br>
        <br>
        - OK <br>
        <br>
        - RESULTS: <br>
        <br>
        - RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs: <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASSED (41.45s) <br>
        <br>
        - RESULTS -
        sstatetests.SStateTests.test_sstate_sametune_samesigs: <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASSED (98.89s) <br>
        <br>
        - SUMMARY: <br>
        <br>
        - oe-selftest () - Ran 2 tests in 142.012s <br>
        <br>
        - oe-selftest - OK - All required tests passed <br>
        &nbsp;&nbsp;&nbsp; (successes=2, skipped=0, failures=0, errors=0) <br>
        <br>
        <br>
        adding the next self consistent group of package: <br>
        &nbsp;&nbsp; cargo/<a href="https://urldefense.com/v3/__http://cargo-cross-canadian_1.54.0.bb__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpvCxIrDwA$" moz-do-not-send="true">cargo-cross-canadian_1.54.0.bb</a> <br>
        <br>
        &nbsp;&nbsp; cargo/<a href="https://urldefense.com/v3/__http://cargo_1.54.0.bb__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWptRWUAvyA$" moz-do-not-send="true">cargo_1.54.0.bb</a> <br>
        <br>
        &nbsp;&nbsp; rust/<a href="https://urldefense.com/v3/__http://libstd-rs_1.54.0.bb__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpuNZ1zxTA$" moz-do-not-send="true">libstd-rs_1.54.0.bb</a> <br>
        <br>
        &nbsp;&nbsp; rust/<a href="https://urldefense.com/v3/__http://rust-cross-canadian_1.54.0.bb__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpvu8Kgohw$" moz-do-not-send="true">rust-cross-canadian_1.54.0.bb</a> <br>
        <br>
        &nbsp;&nbsp; rust/<a href="https://urldefense.com/v3/__http://rust-cross_1.54.0.bb__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpuYvgjUig$" moz-do-not-send="true">rust-cross_1.54.0.bb</a> <br>
        <br>
        &nbsp;&nbsp; rust/<a href="https://urldefense.com/v3/__http://rust-tools-cross-canadian_1.54.0.bb__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpv42uDIpQ$" moz-do-not-send="true">rust-tools-cross-canadian_1.54.0.bb</a>
        <br>
        <br>
        &nbsp;&nbsp; rust/<a href="https://urldefense.com/v3/__http://rust_1.54.0.bb__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWps4C8-W7g$" moz-do-not-send="true">rust_1.54.0.bb</a> <br>
        <br>
        <br>
        <br>
        I see another http_proxy failure that seems to require a feature
        <br>
        drop in cargo: <br>
        <br>
        <a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://github.com/rust-lang/cargo/blob/master/src/cargo/ops/registry.rs*L524__;Iw!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpvrZkixnA$" moz-do-not-send="true">https://github.com/rust-lang/cargo/blob/master/src/cargo/ops/registry.rs#L524</a>
        <br>
        <br>
        Patching out a feature doesn't seem like a good idea but <br>
        maybe someone else has a better one? <br>
        <br>
        To see if there were other problems lurking menacingly behind
        the proxy <br>
        error, I disabled the http_proxy test in: <br>
        &nbsp;&nbsp;&nbsp;&nbsp;meta/lib/oeqa/selftest/cases/<a href="https://urldefense.com/v3/__http://sstatetests.py__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWptCntmNRQ$" moz-do-not-send="true">sstatetests.py</a> <br>
        <br>
        <br>
        &nbsp;&nbsp; -http_proxy = <a class="moz-txt-link-rfc2396E" href="https://urldefense.com/v3/__http://example.com/__;!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpu4kBMJAQ$" moz-do-not-send="true">&quot;http://example.com/&quot;</a> <br>
        <br>
        &nbsp;&nbsp; +http_proxy = &quot;&quot; <br>
        <br>
        <br>
        and ran again to find: <br>
        <br>
        - RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs: <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASSED (50.63s) <br>
        - RESULTS -
        sstatetests.SStateTests.test_sstate_sametune_samesigs: <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FAILED (160.05s) <br>
        <br>
        so that's somewhat encouraging but there is still the error: <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; File &quot;.../meta/lib/oeqa/selftest/cases/sstatetests.py&quot;,
        line 449, <br>
        &nbsp;&nbsp; in test_sstate_sametune_samesigs <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; self.assertCountEqual(files1, files2) <br>
        <br>
        AssertionError: Element counts were not equal: <br>
        <br>
        First has 1, Second has 0: <br>
        '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\ <br>
        tmp-sstatesamehash/stamps/x86_64-linux/\ <br>
        lib32-rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.\ <br>
        fc54579cc139c777172242c3da3e0' <br>
        <br>
        <br>
        First has 1, Second has 0: <br>
        '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\ <br>
        tmp-sstatesamehash/stamps/x86_64-linux/\ <br>
        lib32-rust-cross-i686/1.54.0-r0.do_compile.sigdata.\ <br>
        86cb5a1346b0615cb21fab3c0110cc964ecced' <br>
        <br>
        <br>
        ... lots of similar lines of diffsig info ... <br>
        <br>
        <br>
        Hacking the test to not clean up and <br>
        running bitbake-dumpsigs on the two sig files for the first
        error, <br>
        I get the two files attached. I also attached the <br>
        &nbsp;&nbsp; tmp/log/oe-selftest-results.log file. <br>
        <br>
        That's it for now. <br>
      </blockquote>
      <p><br>
      </p>
      <p>I think I've gotten to the bottom of a chain of sigs that
        differ in part due to:<br>
        &quot;Hash for dependent task&quot; differing and found that on leaf node
        is:<br>
      </p>
      <p>&nbsp;
        stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_target</p>
      <p>See below for my notes and my assertion/question about the next
        step needing<br>
        to be deterministically ordering the elements used in
        rust_gen_target. <br>
      </p>
      <p>../Randy<br>
      </p>
    </blockquote>
    <p>With a patch from Richard, and the http_proxy check removed,<br>
    </p>
    <p>$ git diff | grep &quot;^[+-]&quot;
<br>
      --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
<br>
      +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
<br>
      -http_proxy = <a class="moz-txt-link-rfc2396E" href="http://example.com/">&quot;http://example.com/&quot;</a>
<br>
      +http_proxy = &quot;&quot;
<br>
      <br>
    </p>
    <p>we have fixed the oe-selftest that was failing.<br>
      Any volunteers to stub out the http[s]_proxy code in cargo ?</p>
    <p>I've written up a commit log that could use some review and
      pushed an update to:<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a</a><br>
    </p>
    <br>
    I starting to work on the YP autobuilder issues.<br>
    <p>I can build:<br>
      &nbsp;&nbsp; $ bitbake cargo-cross-canadian-x86-64
<br>
    </p>
    <p>Adding this:</p>
    <pre class="select-content log"><div class="logline ng-scope"><span class="no-wrap log_o" data-linenumber-content="41"><span class="">  require conf/multilib.conf</span></span></div><div class="logline ng-scope"><span class="no-wrap log_o" data-linenumber-content="42"><span class="">  MULTILIBS = 'multilib:lib32'</span></span></div><div class="logline ng-scope"><span class="no-wrap log_o" data-linenumber-content="43"><span class="">  DEFAULTTUNE:virtclass-multilib-lib32 = 'x86'</span></span></div><div class="logline ng-scope"><span class="no-wrap log_o" data-linenumber-content="43"><span class="">
</span></span></div></pre>
    <p>to my local.conf, I see that:<br>
    </p>
    <p>$ bitbake lib32-rust</p>
    <p>fails with the error:<br>
      ---<br>
      failed to execute command:
&quot;/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a/tmp/work/x86-pokymllib32-linux/lib32-rust/1.54.0-r0/lib32-recipe-sysroot/usr/lib/llvm-rust/bin/llvm-config&quot;
      &quot;--bindir&quot;
<br>
      | error: No such file or directory (os error 2)
<br>
      ---<br>
      <br>
    </p>
    <p>Khem, a MUSL build fails:<br>
    </p>
    <p>$ TCLIBC=musl&nbsp; bitbake rust-hello-world<br>
      as shown below (1) but I'll see if that's reproducible with a
      clean build.<br>
    </p>
    <p><br>
    </p>
    <p>I've also rebased to poky master:<br>
      &nbsp; 3fd2dff4eb3 (origin/master, origin/HEAD, master) ref-manual: Fix
      reference to bbappend section of dev-manual
      <br>
      and the two key oe-selftests still pass with the http_proxy
      work-around <br>
      as does core-image-minimal+rust-hello-world (2) so I've pushed a
      new branch: <br>
    </p>
    <p>&nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-21-2021-a">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-21-2021-a</a><br>
    </p>
    <p><br>
    </p>
    <p>Richard, Alex,</p>
    <p>&nbsp; Is it worth another AB run?</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p>1)<br>
    </p>
    <p>$ TCLIBC=musl&nbsp; bitbake rust-hello-world</p>
    <p>ERROR: rust-cross-x86_64-1.54.0-r0 do_prepare_recipe_sysroot:
      Error executing a python function in exec_python_func()
      autogenerated:
<br>
      &nbsp;<br>
      The stack trace of python calls that resulted in this
      exception/failure was:
<br>
      File: 'exec_python_func() autogenerated', lineno: 2, function:
      &lt;module&gt;
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0001:
<br>
      &nbsp;*** 0002:extend_recipe_sysroot(d)
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0003:
<br>
      File:
'/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/classes/staging.bbclass',
      lineno: 582, function: extend_recipe_sysroot
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0578:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;/bin/&quot; in l or &quot;/sbin/&quot; in l:
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0579:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # defer /*bin/* files until last
      in case they need libs
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0580:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; binfiles[l] = (targetdir, dest)
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0581:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:
<br>
      &nbsp;*** 0582:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; staging_copyfile(l, targetdir,
      dest, postinsts, seendirs)
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0583:
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0584:&nbsp;&nbsp;&nbsp; # Handle deferred binfiles
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0585:&nbsp;&nbsp;&nbsp; for l in binfiles:
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0586:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (targetdir, dest) = binfiles[l]
<br>
      File:
'/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/classes/staging.bbclass',
      lineno: 149, function: staging_copyfile
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0145:&nbsp;&nbsp;&nbsp; if os.path.islink(c):
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0146:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linkto = os.readlink(c)
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0147:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if os.path.lexists(dest):
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0148:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not os.path.islink(dest):
<br>
      &nbsp;*** 0149:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raise OSError(errno.EEXIST, &quot;Link %s
      already exists as a file&quot; % dest, dest)
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0150:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if os.readlink(dest) == linkto:
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0151:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dest
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0152:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raise OSError(errno.EEXIST, &quot;Link %s already
      exists to a different location? (%s vs %s)&quot; % (dest,
      os.readlink(dest), linkto), dest)
<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 0153:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.symlink(linkto, dest)
<br>
      Exception: FileExistsError: [Errno 17] Link
/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a/tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot/usr/include/c++/11.2.0/x86_64-poky-linux
      already ex'
<br>
      &nbsp;<br>
      ERROR: Logfile of failure stored in:
/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a/tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/temp/log.do_prepare_recipe_sysroot.192760
<br>
      ERROR: Task
(/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_prepare_recipe_sysroot)
      failed with exit code '1' <br>
    </p>
    <p><br>
    </p>
    <p>2) There is a warning for rust-native:<br>
    </p>
    <p>grep WARNING
      tmp/work/x86_64-linux/rust-native/1.54.0-r0/temp/log.do_populate_sysroot
      | fmt
<br>
      WARNING: File
<br>
'/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-21-a/tmp/work/x86_64-linux/rust-native/1.54.0-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-linux/bin/rust-llvm-dwp'
<br>
      from rust-native was already stripped, this will prevent future
      debugging!
<br>
      <br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:169D3274AAECC435.19323@lists.openembedded.org">
      <p> </p>
      <p><br>
      </p>
      <p>I did learn a bit about this test code that is failing:<br>
        <br>
        <a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/sstatetests.py*n404__;Iw!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpveCCPvyA$" moz-do-not-send="true">https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/sstatetests.py#n404</a><br>
      </p>
      <p>as the comment explains:</p>
      <pre><code><pre><span class="sd">        The sstate checksums of two identical machines (using the same tune) should be the</span>
<span class="sd">        same, apart from changes within the machine specific stamps directory. We use the</span>
<span class="sd">        qemux86copy machine to test this. Also include multilibs in the test.</span></pre></code></pre>
      <p>so the good news is that there are: 23185files being checked
        and<br>
        only 43 are different and if you look at what packages and
        arches<br>
        differ it's:</p>
      <p>x86_64-linux/lib32-rust-cross-i686
        <br>
        x86_64-linux/rust-cross-i686
        <br>
        core2-32-poky-linux/rust
        <br>
        core2-32-poky-linux/libstd-rs
        <br>
        x86-pokymllib32-linux/lib32-libstd-rs
        <br>
        x86-pokymllib32-linux/lib32-rust <br>
      </p>
      <p>Note that these are all 32bit multilib builds.<br>
        Maybe that's not so important for the initial merge to
        oe-core... Richard?<br>
      </p>
      <p><br>
      </p>
      <p>Looking at core2-32-poky-linux/rust the stages that have
        different signatures are:<br>
      </p>
      <p>do_configure
        <br>
        do_populate_sysroot
        <br>
        do_package_qa
        <br>
        do_install
        <br>
        do_package
        <br>
        do_packagedata
        <br>
        do_compile
        <br>
        do_prepare_recipe_sysroot
        <br>
        do_package_write_rpm
        <br>
      </p>
      <p>9 of the 19 stages. Ok so maybe it's not great news after all.
        ;-)</p>
      <p><br>
      </p>
      <p>I'll kept digging down through the tree of dependant diffsigs<br>
        since when looking at do_prepare_recipe_sysroot, it was clear<br>
        that a key difference in it's signatures was due to: <br>
        &nbsp; &quot;Hash for dependent task ...&quot;<br>
        differing. Finally I found a set of signatures that did not have
        a <br>
        diff in the dependent task:<br>
      </p>
      <p>&nbsp;&nbsp;
        stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_target*</p>
      <p>The simplified diff is below and the files are attached.</p>
      <p>There are a variety of variables that differ only in order,
        such as:</p>
      <p>-List of dependencies for variable TUNE_FEATURES is
        {'TUNE_FEATURES:tune-core2-32', 'DEFAULTTUNE'}
        <br>
        +List of dependencies for variable TUNE_FEATURES is
        {'DEFAULTTUNE', 'TUNE_FEATURES:tune-core2-32'}
        <br>
        <br>
      </p>
      <p>I assume the next step is to find out where those variables are
        produced:<br>
        &nbsp;&nbsp;
        <a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/rust/rust-common.inc?h=rmacleod*rust-redo-aug-10-2021-a*n292__;LyM!!AjveYdw8EvQ!IgwYWcWmCub5aQLbkRB6aDq3QRH6tsJ6nak3hdCaB0jy1kp9MmL2hQHzPNhpWpshKolVbg$" moz-do-not-send="true">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/rust/rust-common.inc?h=rmacleod/rust-redo-aug-10-2021-a#n292</a><br>
      </p>
      <p> and to introduce deterministic order when building them.<br>
      </p>
      <p>../Randy</p>
      <p><br>
      </p>
      <p>diff -Naur x86_64-rust-cross-i686-rust-gen-targets/* | grep
        &quot;^[+-]&quot; | cut -c -166
        <br>
        ---
x86_64-rust-cross-i686-rust-gen-targets/1.rust-cross-i686.do_rust_gen_target&nbsp;&nbsp;&nbsp;
        2021-08-20 22:19:19.883320107 -0400
        <br>
        +++
x86_64-rust-cross-i686-rust-gen-targets/2.rust-cross-i686.do_rust_gen_target&nbsp;&nbsp;&nbsp;
        2021-08-20 22:19:19.651319015 -0400
        <br>
        -basewhitelist: {'CCACHE_TOP_DIR', 'SOURCE_DATE_EPOCH',
        'SDKPKGSUFFIX', 'BB_WORKERCONTEXT', 'FILESEXTRAPATHS', 'HOME',
        'OMP_NUM_THREADS', 'PRSERV_DUMPDIR', 'PRSERV_HO
        <br>
        +basewhitelist: {'PWD', 'SSTATE_HASHEQUIV_OWNER', 'STAMPS_DIR',
        'CCACHE', 'BB_WORKERCONTEXT', 'COREBASE', 'BBPATH', 'HOME',
        'TMPDIR', 'ERROR_QA', 'SSTATE_HASHEQUIV_ME
        <br>
        -basehash:
        bd66629631e757dcccfc103c13e7de6ac3568677df3ef5ad47dd99e62427caab
        <br>
        +basehash:
        d697cf2cbb5807e83f8b55de8012d5bb9ab8674f4bbf95587fc3ca822a47269b
        <br>
        -List of dependencies for variable TUNE_ARCH is {'X86ARCH32',
        'X86ARCH64'}
        <br>
        +List of dependencies for variable TUNE_ARCH is {'X86ARCH64',
        'X86ARCH32'}
        <br>
        -List of dependencies for variable TUNE_FEATURES is
        {'TUNE_FEATURES:tune-core2-32', 'DEFAULTTUNE'}
        <br>
        +List of dependencies for variable TUNE_FEATURES is
        {'DEFAULTTUNE', 'TUNE_FEATURES:tune-core2-32'}
        <br>
        -List of dependencies for variable llvm_cpu is {'PACKAGE_ARCH',
        'TUNE_FEATURES', 'TRANSLATED_TARGET_ARCH'}
        <br>
        -List of dependencies for variable llvm_features is
        {'llvm_features_from_cc_arch', 'llvm_features_from_tune',
        'llvm_features_from_target_fpu'}
        <br>
        +List of dependencies for variable llvm_cpu is {'PACKAGE_ARCH',
        'TRANSLATED_TARGET_ARCH', 'TUNE_FEATURES'}
        <br>
        +List of dependencies for variable llvm_features is
        {'llvm_features_from_target_fpu', 'llvm_features_from_cc_arch',
        'llvm_features_from_tune'}
        <br>
        -List of dependencies for variable llvm_features_from_tune is
        {'target_is_armv7', 'TUNE_FEATURES', 'ARM_THUMB_OPT',
        'MACHINEOVERRIDES'}
        <br>
        +List of dependencies for variable llvm_features_from_tune is
        {'ARM_THUMB_OPT', 'TUNE_FEATURES', 'target_is_armv7',
        'MACHINEOVERRIDES'}
        <br>
        -List of dependencies for variable rust_gen_target is
        {'sys_for', 'arch_to_rust_target_arch', 'RUST_PANIC_STRATEGY',
        'prefix_for'}
        <br>
        +List of dependencies for variable rust_gen_target is
        {'sys_for', 'prefix_for', 'arch_to_rust_target_arch',
        'RUST_PANIC_STRATEGY'}
        <br>
        -List of dependencies for variable target_is_armv7 is
        {'TARGET_ARCH', 'TUNE_FEATURES', 'MACHINEOVERRIDES'}
        <br>
        +List of dependencies for variable target_is_armv7 is
        {'TUNE_FEATURES', 'TARGET_ARCH', 'MACHINEOVERRIDES'}
        <br>
        -Variable MACHINE value is qemux86
        <br>
        -Variable MACHINEOVERRIDES value is
        ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '',
        d)}${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '',
        d)}qemua
        <br>
        +Variable MACHINE value is qemux86copy
        <br>
        +Variable MACHINEOVERRIDES value is
        ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '',
        d)}${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '',
        d)}qemua
        <br>
        -Computed base hash is
        bd66629631e757dcccfc103c13e7de6ac3568677df3ef5ad47dd99e62427caab
        and from file
        bd66629631e757dcccfc103c13e7de6ac3568677df3ef5ad47dd99e62427caab
        <br>
        -Computed task hash is
        448a8113230a16ac5d606de18989f98b3700edeb3e7956c6f02207aa76a5d4f3
        <br>
        +Computed base hash is
        d697cf2cbb5807e83f8b55de8012d5bb9ab8674f4bbf95587fc3ca822a47269b
        and from file
        d697cf2cbb5807e83f8b55de8012d5bb9ab8674f4bbf95587fc3ca822a47269b
        <br>
        +Computed task hash is
        83d1a26ebe7e2df3f496024a297ba782e145e6982457e09102d5e7c4fbf1b3b7
        <br>
        <br>
      </p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com"> <br>
        <br>
        ../Randy <br>
        <br>
        <br>
        <blockquote type="cite"> <br>
          ../Randy <br>
          <blockquote type="cite"> <br>
            On Fri, Aug 13, 2021 at 8:50 PM Vinay Kumar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.m.engg@gmail.com" moz-do-not-send="true">&lt;vinay.m.engg@gmail.com&gt;</a>
            wrote: <br>
            <blockquote type="cite"> <br>
              rust-common.inc: Fix build failure with qemuppc64. <br>
              <br>
              The glibc build of &quot;rust-hello-world&quot; throws error in
              libstd-rs package. <br>
              error: unrecognized arch &quot;powerpc64le&quot; in target
              specification <br>
              <br>
              The same got fixed by changing the arch to &quot;powerpc64&quot;. <br>
              <br>
              Signed-off-by: Vinay Kumar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.m.engg@gmail.com" moz-do-not-send="true">&lt;vinay.m.engg@gmail.com&gt;</a>
              <br>
              --- <br>
              &nbsp; meta/recipes-devtools/rust/rust-common.inc | 2 ++ <br>
              &nbsp; 1 file changed, 2 insertions(+) <br>
              <br>
              diff --git a/meta/recipes-devtools/rust/rust-common.inc
              b/meta/recipes-devtools/rust/rust-common.inc <br>
              index 350517c723..f574152815 100644 <br>
              --- a/meta/recipes-devtools/rust/rust-common.inc <br>
              +++ b/meta/recipes-devtools/rust/rust-common.inc <br>
              @@ -248,6 +248,8 @@ def arch_to_rust_target_arch(arch): <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;mips64&quot; <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif arch == &quot;armv7&quot;: <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;arm&quot; <br>
              +&nbsp;&nbsp;&nbsp; elif arch == &quot;powerpc64le&quot;: <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;powerpc64&quot; <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else: <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return arch <br>
              <br>
              --&nbsp;<br>
              2.31.1 <br>
              <br>
            </blockquote>
          </blockquote>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
        <br>
        <br>
      </blockquote>
      <p><br>
      </p>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------3636D63EEAC86FE3933D6320--
