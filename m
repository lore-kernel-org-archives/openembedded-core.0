Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.6739.1629514116088836688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 19:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=jWn+DOlU;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3867093af7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17L2mZXA023207
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 02:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=VezWBcOGwyHUBAm2YGGo5EIn4A8i3Fmz7/fHlLftIx8=;
 b=jWn+DOlUcj5/hXf6ZDZN5k8GOP1zgd24RVPOstnfqgGvHxOJTJky9zuWaXuc2klMQyhr
 3r1tdZzmaNQwXCSFeGCUxBiQ6rQhZ8c9l2mTTNHcVazy3MO4U8AB24DbyQKaWoK3OwlA
 XOQklPePOwJnFerpD0l6hWiKiWc5Zu4AB0KFGRFTwDJ8udKDSH592MSsGCaoVoEFdk5X
 BPWGkhREsjgaRYfcHJAAU+i6oQRQI+Q2fuKJBqiT3fuzwtLdRjsEEJpfjMXvlLiNW+sa
 XIjjzO3789WX6yLOcFFv9LiSyG1NIIusHYlCGAxRvBx0HTAV2FOkLcN3Y5t6+WkiQbtc KA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ajpq2g1yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 02:48:34 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17L2mY1E023077
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 02:48:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ajpq2g1yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Aug 2021 02:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N01euilNZcGF8CTf9B/4lZ+Ki1ZIFql65QRoJEsYwIQc8AwQbC3kNCeb2AT7q6oziub8GCTfoAtghZB1C7/4a/ZsKKLamYhbn24PrwYz2jebKVneyCdOVtEHVQlC+kCzqy0pm1FMw/advx5aTwg8oBOpXqIvuqCc/dw7iH3x8dX0MnSZIDdtcMM8Wzq3jFGskOHA8N5GKcyzeKyS9W7ELZrSBJX1jwDabyg0n9gcT7Cbds0LnhOfG9ElunCH34BfQo2Tw6DPrlAcMOsyEsXWnREK/P57SyxlSh7C1eSnCVBNWkWp8Pxuc3ruzo5n5oJkkUS5Bzvc8vWEqG/DCqZbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VezWBcOGwyHUBAm2YGGo5EIn4A8i3Fmz7/fHlLftIx8=;
 b=exvQNHW+40iaNIVMXwUTfeOO++9OYUVP6Z17r/B5RSGQegi4OsXVZ0BUOhbk9jC9vqn5AfeaqxB2C4T38MwCKo7SfEmvJfHqYglaFfpOaDqXU/T57A4+NOSfokCQzbLit7UAdMpFboJpHoGc7UU0ZN0o8Pzow+35yDPvsep841ujcBh2XMbUopriB+f7sTJ0YHe/cpRvEFacm9faZgRJMK/miNMWqIbNQRozyn6ShJdA11YhouVM+bQpEh4v39EiMqNP6bdjsDGSO2cCoX9dTnafy35BJCvqGuUN5VyUmRsbKTwFvlO+EoX2ESmrpiXI9XPd0inA4ndZjJIcLEVMjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sat, 21 Aug
 2021 02:48:32 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4415.026; Sat, 21 Aug 2021
 02:48:32 +0000
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
        anbelski@linux.microsoft.com, Vinay Kumar <vinay.m.engg@gmail.com>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
 <20210813151947.55142-1-vinay.m.engg@gmail.com>
 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
 <169C1FA457B99CA0.23238@lists.openembedded.org>
 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
Message-ID: <56e32f4e-3a48-fa45-1b6e-bb1dc549a8e4@windriver.com>
Date: Fri, 20 Aug 2021 22:48:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
X-ClientProxiedBy: BYAPR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:a03:60::24) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by BYAPR07CA0047.namprd07.prod.outlook.com (2603:10b6:a03:60::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Sat, 21 Aug 2021 02:48:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17b02856-b9e1-4b5f-009a-08d9644e295b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4595:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45958310C2D231762E2CEC34F8C29@DM6PR11MB4595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AOUJydPjiDnCh7lYOf6ca6K4BWxHs2b9W4Yskl2PmZWDZFFc7oeVOAFM1Wx156/SPeoeD9mjbC2JWM/rWxrynDEYtynJCeMhJ++HCkMrfTfdDVMF1NhbZc1PJhXxOimMhipDotZIcqXO5VNd0zkuRcOFR4BAU30UHVfHd86sBqGKNivVliesU6fOS745umpbhIvgL6m4Ev3Ev+gPYiQajZpCv7N1FaQL2Yf0u8djiFEPLLSRZihKwoWSaCGcRW5nVKt4HxsNGkP9ZM66qECocj7j7ByuUlrzfGjnOnG/eA61RUBjWrynpPgqWXKU5XI0W1yix+U+OW3uBBk2LAc7xJIJjQw5lDbITaDUHUuJ07yL6qhqKMSM2QFnswfZ2YreXycnNo9IWLRa7QPVM8gtLjrGhA1Tn2d/4y0ZXuEe46XKz+DE0agw+se8W9GIJpARMuwenoi2pIrtd9WUse4PrDeFskX82y6yYJQeYLn+wfX0iRTgNUoN1n6Zi02dViTfgUCVUwsCuee0Y/XtCMCqPGBPuVrvHdwC5I/7u9ka064b7Ddh+yr9P1WaZf+P6JsbKU+ZpFv7KDja5+6XhirGqPwv95sELJaCm2Q7gBQ4scyLo4R73FTGsKGoizws+UogipAH64XE6CiHwIABqRI0oi89XpEGgG06sUaGyV3RTxkTjmILR1U8kmJCRtyQa0O9tktuXjQq8xQuOX1HeN01WNe4UxR2Fdp/wh4o59AEgCu7CH8L0HdcNyMEmg5SjOpo0p1knT679+ePg6lPxjAQ0PK5ohLexIfTUx3iRiKg1h1h7IyfMUkUzHOsvnBIU+5UKgN1mcQdPym4j/5DvKNyoNMtQHwRKiwtvjZKcmFK7kJNJ3SpHHhuDAqqsUSFrwRc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39850400004)(316002)(2616005)(86362001)(16576012)(31696002)(5660300002)(956004)(8936002)(15650500001)(4326008)(235185007)(54906003)(31686004)(7416002)(30864003)(8676002)(66556008)(33964004)(66476007)(83380400001)(26005)(478600001)(2906002)(66576008)(66946007)(38100700002)(110136005)(38350700002)(166002)(966005)(6486002)(53546011)(52116002)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a20ySXJKQkU2aGtyOEJCTWFUMENPdk9kU3FEd0xPWW82OXQyUkFiQUptM0tL?=
 =?utf-8?B?R2YzUzVGajU3TjJyZkNjUmVSOXVYU2ptTlNkaFdUVFJ6TmlrWFQ5NFpRZ2p3?=
 =?utf-8?B?SjZ4NW5TOE05WTJ0ek9kYUpYaVE2dkp0eU4rUkhuR2xFTkkxajFub1ZCWmo0?=
 =?utf-8?B?UUxadG90dndoQUExLzF1bFFlYzRSYXJSNnhmQjZreDR0TDFtelpoVXMrVjhW?=
 =?utf-8?B?dURtWjkzNkdwZ1ZoWFV6ZEJzdnk3OWtvczJBOHBxVXo2SVFLSVQvanJwTllS?=
 =?utf-8?B?VzIwWTJ1L3VkbkFmME5SeG1iV3pwb1hSdjJCTXVQVlJ2cGlHUG1ZZVBNVkhv?=
 =?utf-8?B?LzhrV2dLWjBNK2d3cWpwVkhyWmdzeTFBWEtYQU5NSUQyZEtCYjhsUHFuRURt?=
 =?utf-8?B?SjRNekpYb1d0TEZzRkZWcGRWY3NnSmRoK2FmaW1hWmZoRDJyclhiRUtRR3Qw?=
 =?utf-8?B?L2wwQ0kvNWJVK3E5QTRkMk83Y2FkMlp2NXVtQitKUVcvZWcvMzZtVUhxQ1lu?=
 =?utf-8?B?aWdMdy9oRmx0eDA0S0JrcGJvZDRrYm1WeFBDL2Z0RWRHeWRvMWlqL0JwcXNy?=
 =?utf-8?B?SmxHTmZPWXkxSHFXUE1odFlESW9hcjB3cWVtWUdRQ1hiOTdlNUlWR3EzVWlR?=
 =?utf-8?B?bG5tYVUzUGNiK0N3ZmZEOHBMZ0dDMWl6ZlUrRjV1K3RWL21qcUVSMWdUS2t0?=
 =?utf-8?B?c3J0YmMzTGVjT0tJMmxUZG9YZENuRFNXRTJjdjg4RHZndUl1NDY3MTlPM2ZJ?=
 =?utf-8?B?WHZ3K0VwTW5kZm05dWoxVFlMWVZaaitNWjZrUzVKdHpSci92NkpOdm4wMEY0?=
 =?utf-8?B?eGJhTGFPQm5Cd0Y4TTJaUExpMGFKWmVWZnFPY1ByWktxK0VFSlVZNnExY2l2?=
 =?utf-8?B?MHZtT1BHL2NkemxRaWM3YjJLSnhyRFVSMFRLT0tNa0RpeWRSNWwrWVhIL1lQ?=
 =?utf-8?B?b3ptLzBPWWhaM25pa0ZLZG0vdTRLUnNobTVub2FuWHprL0FYUEdHdzAwM3pM?=
 =?utf-8?B?U2daWEpsM1V6Rkc0TUJDbitzNUNwQ2dldzZLMFQzZm9FZ3NyazVCTldsa1Fj?=
 =?utf-8?B?M09ZM0p1SkNmL3U5YVdnL3NjMUppakpXZTBsSXV3UGd2b0ZWaHRhVnJ5bGRq?=
 =?utf-8?B?Qm5CU0pYdUN2MXpjVEEzNFVnTGo4OFV3Rmh3aTYwRC9KdVh4Z09qaUVvUmYz?=
 =?utf-8?B?cjF1ZnM4eWRRbkdYTWhXd3ZHa2FwVmhqUi9nTmx3K2VlQS9NZ0x4cmNKYitw?=
 =?utf-8?B?U0VXekdXdWw4dUltZ1gzTjZsMndUbnJJY2tRK2JnMXFzeEdldXR5YlZlVnVL?=
 =?utf-8?B?WlFHbXpDNnNxQWVBdU5mMDFzaE42eExISkszMGRIalMwek85TXpyanpiS3BB?=
 =?utf-8?B?a3hEb1NFbFVsMUdUNHkzWk9pVUNTKzFOR2FoZDR5bzdBSDJvMko3UzR1Tkpv?=
 =?utf-8?B?ckcrQjBoZjlnVWE5ZnlNRnlQUk5xY0tUNlZBOC9wc05leko3Nm4xWG1Bb0dR?=
 =?utf-8?B?eHhGdUdQZ0haU0N4R0hhZ3JQOVBaalB0dU9LYzhJZjlEU1VKQVB6ZFRENFUy?=
 =?utf-8?B?by9WYkUyK04yeVBXNGJZN3BHb0JTK3N3enFsdHJtVmd6TExhWGk0eGl3c1Vo?=
 =?utf-8?B?eHBDend5dFJBczJyS0hLR0I1ZUgzd2ZPZTh4bSt4clYzaDU5RkVXN1lwSHVj?=
 =?utf-8?B?VWZFdUVZL3NWRjRHbDNWLy9EYTQrT1ZuWDZJMTJIcVNoR3hnSWptaWNNQ0tw?=
 =?utf-8?Q?mUePI94exxnRwt9NX4uvGCi3UbCe+xjE9U/3WZI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b02856-b9e1-4b5f-009a-08d9644e295b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2021 02:48:31.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYKgdeZhxwKu9Cbg7/yO7pvx4vxwYpMQxYRl8sltPVNYOeam5W3U0askZGnaxp+xgb4po5+DjdFMsgKGh+na1frE5dtaA/HX6pd/69mVVhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
X-Proofpoint-GUID: Xj68ar4Gv_m6qVbxBDkKNzbOSd8oPRoy
X-Proofpoint-ORIG-GUID: UFlxSNDTHFl7WSMNm3Ch2oBErNlR3hlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-20_11,2021-08-20_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108210015
X-Groupsio-MsgNum: 155051
Content-Type: multipart/mixed;
 boundary="------------ECD9F43D689B1AB7E99C7024"
Content-Language: en-CA

--------------ECD9F43D689B1AB7E99C7024
Content-Type: multipart/alternative;
 boundary="------------E6F75AA6958EA8D5CE4D5C7C"

--------------E6F75AA6958EA8D5CE4D5C7C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17L2mZXA023207

On 2021-08-20 6:06 a.m., Randy MacLeod wrote:
> Added Trevor who may be working on upgrading python-cryptography.
> Added Anatol since he was interested last time we worked on merging.
>
> Again, let me know if you want to be dropped by replying privately.
> No one from the meta-rust community responded last time so I'm
> assuming that y'all are just on vacation! ;-)
>
> On 2021-08-17 10:52 a.m., Randy MacLeod wrote:
>> On 2021-08-13 11:22 a.m., Vinay Kumar wrote:
>>> Hi Randy,
>>>
>>>>> Vinay or I will look into glibc/qemuppc64
>>>>> if no one else is working on that.
>>>
>>> The failure is due to the below error in libstd-rs package build.
>>> "error: unrecognized arch "powerpc64le" in target specification"
>>>
>>> The reason for this is "arch": "powerpc64le" from the below target
>>> specific file.
>>>
>
> ,,,
>
>>
>> Thanks Vinay, applied.
>>
>> I'll push a new branch to poky-contrib later today.
>
>
> I fixed and worked-around a few issues and pushed a new branch:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Drmacleod/rust-=
redo-aug-17-2021-a=20
>
>
> 1. There are only a few new commits including Vinay's:
>
> =C2=A0=C2=A0 757da4cbf1e rust: remove Rust version 1.51.0 toolchain
>
> =C2=A0=C2=A0 a4808f787ca cargo_common: remove http_proxy
>
> =C2=A0=C2=A0 b6941135c00 rust-common.inc: Fix build failure with qemuppc6=
4.
>
>
> If anyone wants to help by doing test builds, trying to generate and use
>
> and SDK with rust in it or anything else, that'd be great.
>
>
>
> Alex also ran a test build on the Autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2439
>
>
>
> but I have yet to look at the failed stages in the run.
>
>
> Testing logs and debugging notes below for those interested.
>
> ../Randy
>
>
>
> The test:
> =C2=A0=C2=A0 oe-selftest -r distrodata.Distrodata.test_maintainers
>
>
> is fixed by creating maintainer records for all rusty packages
> and by removing the older version of the rust toolchain:
> =C2=A0=C2=A0 757da4cbf1e rust: remove Rust version 1.51.0 toolchain
>
>
>
> I suppose that if the meta-rust users want to keep an older TC
> it can live in meta-rust.
>
> Then, these tests:
>
> =C2=A0=C2=A0 oe-selftest -r sstatetests.SStateTests.test_sstate_noop_same=
sigs
>
> =C2=A0=C2=A0 oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_=
samesigs
>
>
> were failing. One issue was fixed by the work-around of:
>
> =C2=A0=C2=A0 a4808f787ca cargo_common: remove http_proxy
>
>
> Debugging the next step was a challenge since I hadn't worked
> with diffsigs before. Then to simplify, I removed all rusty .bb package
> =C2=A0=C2=A0 ( by mv foo.bb foo.bb.hide)
> until I was down to the first recipe in the dependency tree:
>
> =C2=A0=C2=A0 rust-llvm-native.
>
> and then running:
> =C2=A0 oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs \
> sstatetests.SStateTests.test_sstate_sametune_samesigs \
>
>
>
> 2021-08-19 17:54:12,878 - oe-selftest - INFO
> - Ran 2 tests in 142.010s
>
> - OK
>
> - RESULTS:
>
> - RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASSED (41.45s)
>
> - RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASSED (98.89s)
>
> - SUMMARY:
>
> - oe-selftest () - Ran 2 tests in 142.012s
>
> - oe-selftest - OK - All required tests passed
> =C2=A0=C2=A0=C2=A0 (successes=3D2, skipped=3D0, failures=3D0, errors=3D0)
>
>
> adding the next self consistent group of package:
> =C2=A0=C2=A0 cargo/cargo-cross-canadian_1.54.0.bb
>
> =C2=A0=C2=A0 cargo/cargo_1.54.0.bb
>
> =C2=A0=C2=A0 rust/libstd-rs_1.54.0.bb
>
> =C2=A0=C2=A0 rust/rust-cross-canadian_1.54.0.bb
>
> =C2=A0=C2=A0 rust/rust-cross_1.54.0.bb
>
> =C2=A0=C2=A0 rust/rust-tools-cross-canadian_1.54.0.bb
>
> =C2=A0=C2=A0 rust/rust_1.54.0.bb
>
>
>
> I see another http_proxy failure that seems to require a feature
> drop in cargo:
>
> https://github.com/rust-lang/cargo/blob/master/src/cargo/ops/registry.rs#=
L524=20
>
>
> Patching out a feature doesn't seem like a good idea but
> maybe someone else has a better one?
>
> To see if there were other problems lurking menacingly behind the proxy
> error, I disabled the http_proxy test in:
> =C2=A0=C2=A0=C2=A0=C2=A0meta/lib/oeqa/selftest/cases/sstatetests.py
>
>
> =C2=A0=C2=A0 -http_proxy =3D "http://example.com/"
>
> =C2=A0=C2=A0 +http_proxy =3D ""
>
>
> and ran again to find:
>
> - RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASSED (50.63s)
> - RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FAILED (160.05s)
>
> so that's somewhat encouraging but there is still the error:
>
> =C2=A0=C2=A0=C2=A0=C2=A0 File ".../meta/lib/oeqa/selftest/cases/sstatetes=
ts.py", line 449,
> =C2=A0=C2=A0 in test_sstate_sametune_samesigs
>
> =C2=A0=C2=A0=C2=A0=C2=A0 self.assertCountEqual(files1, files2)
>
> AssertionError: Element counts were not equal:
>
> First has 1, Second has 0:
> '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\
> tmp-sstatesamehash/stamps/x86_64-linux/\
> lib32-rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.\
> fc54579cc139c777172242c3da3e0'
>
>
> First has 1, Second has 0:
> '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\
> tmp-sstatesamehash/stamps/x86_64-linux/\
> lib32-rust-cross-i686/1.54.0-r0.do_compile.sigdata.\
> 86cb5a1346b0615cb21fab3c0110cc964ecced'
>
>
> ... lots of similar lines of diffsig info ...
>
>
> Hacking the test to not clean up and
> running bitbake-dumpsigs on the two sig files for the first error,
> I get the two files attached. I also attached the
> =C2=A0=C2=A0 tmp/log/oe-selftest-results.log file.
>
> That's it for now.


I think I've gotten to the bottom of a chain of sigs that differ in part=20
due to:
"Hash for dependent task" differing and found that on leaf node is:

stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_target

See below for my notes and my assertion/question about the next step needin=
g
to be deterministically ordering the elements used in rust_gen_target.

../Randy


I did learn a bit about this test code that is failing:

https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/=
cases/sstatetests.py#n404

as the comment explains:

|

The sstate checksums of two identical machines (using the same tune)=20
should be the
same, apart from changes within the machine specific stamps directory.=20
We use the
qemux86copy machine to test this. Also include multilibs in the test.|

so the good news is that there are: 23185files being checked and
only 43 are different and if you look at what packages and arches
differ it's:

x86_64-linux/lib32-rust-cross-i686
x86_64-linux/rust-cross-i686
core2-32-poky-linux/rust
core2-32-poky-linux/libstd-rs
x86-pokymllib32-linux/lib32-libstd-rs
x86-pokymllib32-linux/lib32-rust

Note that these are all 32bit multilib builds.
Maybe that's not so important for the initial merge to oe-core... Richard?


Looking at core2-32-poky-linux/rust the stages that have different=20
signatures are:

do_configure
do_populate_sysroot
do_package_qa
do_install
do_package
do_packagedata
do_compile
do_prepare_recipe_sysroot
do_package_write_rpm

9 of the 19 stages. Ok so maybe it's not great news after all. ;-)


I'll kept digging down through the tree of dependant diffsigs
since when looking at do_prepare_recipe_sysroot, it was clear
that a key difference in it's signatures was due to:
 =C2=A0 "Hash for dependent task ..."
differing. Finally I found a set of signatures that did not have a
diff in the dependent task:

stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_target*

The simplified diff is below and the files are attached.

There are a variety of variables that differ only in order, such as:

-List of dependencies for variable TUNE_FEATURES is=20
{'TUNE_FEATURES:tune-core2-32', 'DEFAULTTUNE'}
+List of dependencies for variable TUNE_FEATURES is {'DEFAULTTUNE',=20
'TUNE_FEATURES:tune-core2-32'}

I assume the next step is to find out where those variables are produced:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/recipes-de=
vtools/rust/rust-common.inc?h=3Drmacleod/rust-redo-aug-10-2021-a#n292

and to introduce deterministic order when building them.

../Randy


diff -Naur x86_64-rust-cross-i686-rust-gen-targets/* | grep "^[+-]" |=20
cut -c -166
---=20
x86_64-rust-cross-i686-rust-gen-targets/1.rust-cross-i686.do_rust_gen_targe=
t=20
2021-08-20 22:19:19.883320107 -0400
+++=20
x86_64-rust-cross-i686-rust-gen-targets/2.rust-cross-i686.do_rust_gen_targe=
t=20
2021-08-20 22:19:19.651319015 -0400
-basewhitelist: {'CCACHE_TOP_DIR', 'SOURCE_DATE_EPOCH', 'SDKPKGSUFFIX',=20
'BB_WORKERCONTEXT', 'FILESEXTRAPATHS', 'HOME', 'OMP_NUM_THREADS',=20
'PRSERV_DUMPDIR', 'PRSERV_HO
+basewhitelist: {'PWD', 'SSTATE_HASHEQUIV_OWNER', 'STAMPS_DIR',=20
'CCACHE', 'BB_WORKERCONTEXT', 'COREBASE', 'BBPATH', 'HOME', 'TMPDIR',=20
'ERROR_QA', 'SSTATE_HASHEQUIV_ME
-basehash: bd66629631e757dcccfc103c13e7de6ac3568677df3ef5ad47dd99e62427caab
+basehash: d697cf2cbb5807e83f8b55de8012d5bb9ab8674f4bbf95587fc3ca822a47269b
-List of dependencies for variable TUNE_ARCH is {'X86ARCH32', 'X86ARCH64'}
+List of dependencies for variable TUNE_ARCH is {'X86ARCH64', 'X86ARCH32'}
-List of dependencies for variable TUNE_FEATURES is=20
{'TUNE_FEATURES:tune-core2-32', 'DEFAULTTUNE'}
+List of dependencies for variable TUNE_FEATURES is {'DEFAULTTUNE',=20
'TUNE_FEATURES:tune-core2-32'}
-List of dependencies for variable llvm_cpu is {'PACKAGE_ARCH',=20
'TUNE_FEATURES', 'TRANSLATED_TARGET_ARCH'}
-List of dependencies for variable llvm_features is=20
{'llvm_features_from_cc_arch', 'llvm_features_from_tune',=20
'llvm_features_from_target_fpu'}
+List of dependencies for variable llvm_cpu is {'PACKAGE_ARCH',=20
'TRANSLATED_TARGET_ARCH', 'TUNE_FEATURES'}
+List of dependencies for variable llvm_features is=20
{'llvm_features_from_target_fpu', 'llvm_features_from_cc_arch',=20
'llvm_features_from_tune'}
-List of dependencies for variable llvm_features_from_tune is=20
{'target_is_armv7', 'TUNE_FEATURES', 'ARM_THUMB_OPT', 'MACHINEOVERRIDES'}
+List of dependencies for variable llvm_features_from_tune is=20
{'ARM_THUMB_OPT', 'TUNE_FEATURES', 'target_is_armv7', 'MACHINEOVERRIDES'}
-List of dependencies for variable rust_gen_target is {'sys_for',=20
'arch_to_rust_target_arch', 'RUST_PANIC_STRATEGY', 'prefix_for'}
+List of dependencies for variable rust_gen_target is {'sys_for',=20
'prefix_for', 'arch_to_rust_target_arch', 'RUST_PANIC_STRATEGY'}
-List of dependencies for variable target_is_armv7 is {'TARGET_ARCH',=20
'TUNE_FEATURES', 'MACHINEOVERRIDES'}
+List of dependencies for variable target_is_armv7 is {'TUNE_FEATURES',=20
'TARGET_ARCH', 'MACHINEOVERRIDES'}
-Variable MACHINE value is qemux86
-Variable MACHINEOVERRIDES value is=20
${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '',=20
d)}${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '', d)}qemua
+Variable MACHINE value is qemux86copy
+Variable MACHINEOVERRIDES value is=20
${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '',=20
d)}${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '', d)}qemua
-Computed base hash is=20
bd66629631e757dcccfc103c13e7de6ac3568677df3ef5ad47dd99e62427caab and=20
from file bd66629631e757dcccfc103c13e7de6ac3568677df3ef5ad47dd99e62427caab
-Computed task hash is=20
448a8113230a16ac5d606de18989f98b3700edeb3e7956c6f02207aa76a5d4f3
+Computed base hash is=20
d697cf2cbb5807e83f8b55de8012d5bb9ab8674f4bbf95587fc3ca822a47269b and=20
from file d697cf2cbb5807e83f8b55de8012d5bb9ab8674f4bbf95587fc3ca822a47269b
+Computed task hash is=20
83d1a26ebe7e2df3f496024a297ba782e145e6982457e09102d5e7c4fbf1b3b7


>
>
> ../Randy
>
>
>>
>> ../Randy
>>>
>>> On Fri, Aug 13, 2021 at 8:50 PM Vinay Kumar <vinay.m.engg@gmail.com>=20
>>> wrote:
>>>>
>>>> rust-common.inc: Fix build failure with qemuppc64.
>>>>
>>>> The glibc build of "rust-hello-world" throws error in libstd-rs=20
>>>> package.
>>>> error: unrecognized arch "powerpc64le" in target specification
>>>>
>>>> The same got fixed by changing the arch to "powerpc64".
>>>>
>>>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>>>> ---
>>>> =C2=A0 meta/recipes-devtools/rust/rust-common.inc | 2 ++
>>>> =C2=A0 1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-devtools/rust/rust-common.inc=20
>>>> b/meta/recipes-devtools/rust/rust-common.inc
>>>> index 350517c723..f574152815 100644
>>>> --- a/meta/recipes-devtools/rust/rust-common.inc
>>>> +++ b/meta/recipes-devtools/rust/rust-common.inc
>>>> @@ -248,6 +248,8 @@ def arch_to_rust_target_arch(arch):
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "mips64"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif arch =3D=3D "armv7":
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "arm"
>>>> +=C2=A0=C2=A0=C2=A0 elif arch =3D=3D "powerpc64le":
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "powerpc64"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return arch
>>>>
>>>> --=20
>>>> 2.31.1
>>>>
>>
>>
>>
>>
>>=20
>>
>
>

--=20
# Randy MacLeod
# Wind River Linux


--------------E6F75AA6958EA8D5CE4D5C7C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2021-08-20 6:06 a.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com">Added
      Trevor who may be working on upgrading python-cryptography.
      <br>
      Added Anatol since he was interested last time we worked on
      merging.
      <br>
      <br>
      Again, let me know if you want to be dropped by replying
      privately.
      <br>
      No one from the meta-rust community responded last time so I'm
      <br>
      assuming that y'all are just on vacation! ;-)
      <br>
      <br>
      On 2021-08-17 10:52 a.m., Randy MacLeod wrote:
      <br>
      <blockquote type="cite">On 2021-08-13 11:22 a.m., Vinay Kumar
        wrote:
        <br>
        <blockquote type="cite">Hi Randy,
          <br>
          <br>
          <blockquote type="cite">
            <blockquote type="cite">Vinay or I will look into
              glibc/qemuppc64
              <br>
              if no one else is working on that.
              <br>
            </blockquote>
          </blockquote>
          <br>
          The failure is due to the below error in libstd-rs package
          build.
          <br>
          &quot;error: unrecognized arch &quot;powerpc64le&quot; in target
          specification&quot;
          <br>
          <br>
          The reason for this is &quot;arch&quot;: &quot;powerpc64le&quot; from the below
          target
          <br>
          specific file.
          <br>
          <br>
        </blockquote>
      </blockquote>
      <br>
      ,,,
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Thanks Vinay, applied.
        <br>
        <br>
        I'll push a new branch to poky-contrib later today.
        <br>
      </blockquote>
      <br>
      <br>
      I fixed and worked-around a few issues and pushed a new branch:
      <br>
      <br>
      <br>
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a</a>
      <br>
      <br>
      1. There are only a few new commits including Vinay's:
      <br>
      <br>
      &nbsp;&nbsp; 757da4cbf1e rust: remove Rust version 1.51.0 toolchain
      <br>
      <br>
      &nbsp;&nbsp; a4808f787ca cargo_common: remove http_proxy
      <br>
      <br>
      &nbsp;&nbsp; b6941135c00 rust-common.inc: Fix build failure with qemuppc64.
      <br>
      <br>
      <br>
      If anyone wants to help by doing test builds, trying to generate
      and use
      <br>
      <br>
      and SDK with rust in it or anything else, that'd be great.
      <br>
      <br>
      <br>
      <br>
      Alex also ran a test build on the Autobuilder:
      <br>
      <br>
      &nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2439">https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2439</a>
      <br>
      <br>
      <br>
      <br>
      but I have yet to look at the failed stages in the run.
      <br>
      <br>
      <br>
      Testing logs and debugging notes below for those interested.
      <br>
      <br>
      ../Randy
      <br>
      <br>
      <br>
      <br>
      The test:
      <br>
      &nbsp;&nbsp; oe-selftest -r distrodata.Distrodata.test_maintainers
      <br>
      <br>
      <br>
      is fixed by creating maintainer records for all rusty packages
      <br>
      and by removing the older version of the rust toolchain:
      <br>
      &nbsp;&nbsp; 757da4cbf1e rust: remove Rust version 1.51.0 toolchain
      <br>
      <br>
      <br>
      <br>
      I suppose that if the meta-rust users want to keep an older TC
      <br>
      it can live in meta-rust.
      <br>
      <br>
      Then, these tests:
      <br>
      <br>
      &nbsp;&nbsp; oe-selftest -r
      sstatetests.SStateTests.test_sstate_noop_samesigs
      <br>
      <br>
      &nbsp;&nbsp; oe-selftest -r
      sstatetests.SStateTests.test_sstate_sametune_samesigs
      <br>
      <br>
      <br>
      were failing. One issue was fixed by the work-around of:
      <br>
      <br>
      &nbsp;&nbsp; a4808f787ca cargo_common: remove http_proxy
      <br>
      <br>
      <br>
      Debugging the next step was a challenge since I hadn't worked
      <br>
      with diffsigs before. Then to simplify, I removed all rusty .bb
      package
      <br>
      &nbsp;&nbsp; ( by mv foo.bb foo.bb.hide)
      <br>
      until I was down to the first recipe in the dependency tree:
      <br>
      <br>
      &nbsp;&nbsp; rust-llvm-native.
      <br>
      <br>
      and then running:
      <br>
      &nbsp; oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs
      \
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      sstatetests.SStateTests.test_sstate_sametune_samesigs \
      <br>
      <br>
      <br>
      <br>
      2021-08-19 17:54:12,878 - oe-selftest - INFO
      <br>
      - Ran 2 tests in 142.010s
      <br>
      <br>
      - OK
      <br>
      <br>
      - RESULTS:
      <br>
      <br>
      - RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs:
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASSED (41.45s)
      <br>
      <br>
      - RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs:
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASSED (98.89s)
      <br>
      <br>
      - SUMMARY:
      <br>
      <br>
      - oe-selftest () - Ran 2 tests in 142.012s
      <br>
      <br>
      - oe-selftest - OK - All required tests passed
      <br>
      &nbsp;&nbsp;&nbsp; (successes=2, skipped=0, failures=0, errors=0)
      <br>
      <br>
      <br>
      adding the next self consistent group of package:
      <br>
      &nbsp;&nbsp; cargo/cargo-cross-canadian_1.54.0.bb
      <br>
      <br>
      &nbsp;&nbsp; cargo/cargo_1.54.0.bb
      <br>
      <br>
      &nbsp;&nbsp; rust/libstd-rs_1.54.0.bb
      <br>
      <br>
      &nbsp;&nbsp; rust/rust-cross-canadian_1.54.0.bb
      <br>
      <br>
      &nbsp;&nbsp; rust/rust-cross_1.54.0.bb
      <br>
      <br>
      &nbsp;&nbsp; rust/rust-tools-cross-canadian_1.54.0.bb
      <br>
      <br>
      &nbsp;&nbsp; rust/rust_1.54.0.bb
      <br>
      <br>
      <br>
      <br>
      I see another http_proxy failure that seems to require a feature
      <br>
      drop in cargo:
      <br>
      <br>
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/cargo/blob/master/src/cargo/ops/registry.rs#L524">https://github.com/rust-lang/cargo/blob/master/src/cargo/ops/registry.rs#L524</a>
      <br>
      <br>
      Patching out a feature doesn't seem like a good idea but
      <br>
      maybe someone else has a better one?
      <br>
      <br>
      To see if there were other problems lurking menacingly behind the
      proxy
      <br>
      error, I disabled the http_proxy test in:
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;meta/lib/oeqa/selftest/cases/sstatetests.py
      <br>
      <br>
      <br>
      &nbsp;&nbsp; -http_proxy = <a class="moz-txt-link-rfc2396E" href="http://example.com/">&quot;http://example.com/&quot;</a>
      <br>
      <br>
      &nbsp;&nbsp; +http_proxy = &quot;&quot;
      <br>
      <br>
      <br>
      and ran again to find:
      <br>
      <br>
      - RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs:
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASSED (50.63s)
      <br>
      - RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs:
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FAILED (160.05s)
      <br>
      <br>
      so that's somewhat encouraging but there is still the error:
      <br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp; File &quot;.../meta/lib/oeqa/selftest/cases/sstatetests.py&quot;, line
      449,
      <br>
      &nbsp;&nbsp; in test_sstate_sametune_samesigs
      <br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp; self.assertCountEqual(files1, files2)
      <br>
      <br>
      AssertionError: Element counts were not equal:
      <br>
      <br>
      First has 1, Second has 0:
      <br>
      '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\
      <br>
      tmp-sstatesamehash/stamps/x86_64-linux/\
      <br>
      lib32-rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.\
      <br>
      fc54579cc139c777172242c3da3e0'
      <br>
      <br>
      <br>
      First has 1, Second has 0:
      <br>
      '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\
      <br>
      tmp-sstatesamehash/stamps/x86_64-linux/\
      <br>
      lib32-rust-cross-i686/1.54.0-r0.do_compile.sigdata.\
      <br>
      86cb5a1346b0615cb21fab3c0110cc964ecced'
      <br>
      <br>
      <br>
      ... lots of similar lines of diffsig info ...
      <br>
      <br>
      <br>
      Hacking the test to not clean up and
      <br>
      running bitbake-dumpsigs on the two sig files for the first error,
      <br>
      I get the two files attached. I also attached the
      <br>
      &nbsp;&nbsp; tmp/log/oe-selftest-results.log file.
      <br>
      <br>
      That's it for now.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>I think I've gotten to the bottom of a chain of sigs that differ
      in part due to:<br>
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
    <p><br>
    </p>
    <p>I did learn a bit about this test code that is failing:<br>
      <br>
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/sstatetests.py#n404">https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/sstatetests.py#n404</a><br>
    </p>
    <p>as the comment explains:</p>
    <pre><code><pre><span class="sd">        The sstate checksums of two identical machines (using the same tune) should be the</span>
<span class="sd">        same, apart from changes within the machine specific stamps directory. We use the</span>
<span class="sd">        qemux86copy machine to test this. Also include multilibs in the test.</span></pre></code></pre>
    <p>so the good news is that there are: 23185files being checked and<br>
      only 43 are different and if you look at what packages and arches<br>
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
      Maybe that's not so important for the initial merge to oe-core...
      Richard?<br>
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
      differing. Finally I found a set of signatures that did not have a
      <br>
      diff in the dependent task:<br>
    </p>
    <p>&nbsp;&nbsp;
      stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_target*</p>
    <p>The simplified diff is below and the files are attached.</p>
    <p>There are a variety of variables that differ only in order, such
      as:</p>
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
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/rust/rust-common.inc?h=rmacleod/rust-redo-aug-10-2021-a#n292">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/rust/rust-common.inc?h=rmacleod/rust-redo-aug-10-2021-a#n292</a><br>
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
      -List of dependencies for variable rust_gen_target is {'sys_for',
      'arch_to_rust_target_arch', 'RUST_PANIC_STRATEGY', 'prefix_for'}
<br>
      +List of dependencies for variable rust_gen_target is {'sys_for',
      'prefix_for', 'arch_to_rust_target_arch', 'RUST_PANIC_STRATEGY'}
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
    <blockquote type="cite" cite="mid:15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com">
      <br>
      <br>
      ../Randy
      <br>
      <br>
      <br>
      <blockquote type="cite">
        <br>
        ../Randy
        <br>
        <blockquote type="cite">
          <br>
          On Fri, Aug 13, 2021 at 8:50 PM Vinay Kumar
          <a class="moz-txt-link-rfc2396E" href="mailto:vinay.m.engg@gmail.com">&lt;vinay.m.engg@gmail.com&gt;</a> wrote:
          <br>
          <blockquote type="cite">
            <br>
            rust-common.inc: Fix build failure with qemuppc64.
            <br>
            <br>
            The glibc build of &quot;rust-hello-world&quot; throws error in
            libstd-rs package.
            <br>
            error: unrecognized arch &quot;powerpc64le&quot; in target
            specification
            <br>
            <br>
            The same got fixed by changing the arch to &quot;powerpc64&quot;.
            <br>
            <br>
            Signed-off-by: Vinay Kumar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.m.engg@gmail.com">&lt;vinay.m.engg@gmail.com&gt;</a>
            <br>
            ---
            <br>
            &nbsp; meta/recipes-devtools/rust/rust-common.inc | 2 ++
            <br>
            &nbsp; 1 file changed, 2 insertions(+)
            <br>
            <br>
            diff --git a/meta/recipes-devtools/rust/rust-common.inc
            b/meta/recipes-devtools/rust/rust-common.inc
            <br>
            index 350517c723..f574152815 100644
            <br>
            --- a/meta/recipes-devtools/rust/rust-common.inc
            <br>
            +++ b/meta/recipes-devtools/rust/rust-common.inc
            <br>
            @@ -248,6 +248,8 @@ def arch_to_rust_target_arch(arch):
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;mips64&quot;
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif arch == &quot;armv7&quot;:
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;arm&quot;
            <br>
            +&nbsp;&nbsp;&nbsp; elif arch == &quot;powerpc64le&quot;:
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;powerpc64&quot;
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return arch
            <br>
            <br>
            --&nbsp;<br>
            2.31.1
            <br>
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
  </body>
</html>

--------------E6F75AA6958EA8D5CE4D5C7C--

--------------ECD9F43D689B1AB7E99C7024
Content-Type: text/plain; charset=UTF-8;
 name="1.rust-cross-i686.do_rust_gen_target"
Content-Disposition: attachment;
 filename="1.rust-cross-i686.do_rust_gen_target"
Content-Transfer-Encoding: base64

YmFzZXdoaXRlbGlzdDogeydDQ0FDSEVfVE9QX0RJUicsICdTT1VSQ0VfREFURV9FUE9DSCcsICdT
REtQS0dTVUZGSVgnLCAnQkJfV09SS0VSQ09OVEVYVCcsICdGSUxFU0VYVFJBUEFUSFMnLCAnSE9N
RScsICdPTVBfTlVNX1RIUkVBRFMnLCAnUFJTRVJWX0RVTVBESVInLCAnUFJTRVJWX0hPU1QnLCAn
QkJTRVJWRVInLCAnUEFSQUxMRUxfTUFLRScsICdCQlBBVEgnLCAnRVJST1JfUUEnLCAnRklMRV9E
SVJOQU1FJywgJ1RISVNESVInLCAnQkJfSEFTSFNFUlZFJywgJ1BLR0RBVEFfRElSJywgJ1NUQU1Q
U19ESVInLCAnU1NUQVRFX1BLR0FSQ0gnLCAnQkJfTElNSVRFRERFUFMnLCAnU1RBR0lOR19ESVJf
VEFSR0VUJywgJ0ZJTEUnLCAnTE9HTkFNRScsICdUTVBESVInLCAnZXh0ZW5kX3JlY2lwZV9zeXNy
b290JywgJ0dJVF9DRUlMSU5HX0RJUkVDVE9SSUVTJywgJ1NTVEFURV9IQVNIRVFVSVZfTUVUSE9E
JywgJ0JVSUxEX0FSQ0gnLCAnU0hFTEwnLCAnUFNFVURPX0lHTk9SRV9QQVRIUycsICdTVEFHSU5H
X0RJUl9IT1NUJywgJ1dBUk5fUUEnLCAnUFdEJywgJ0JCX1RBU0tIQVNIJywgJ1BSU0VSVl9MT0NL
RE9XTicsICdCQl9VTklIQVNIJywgJ0NDQUNIRV9OT0hBU0hESVInLCAnU1NUQVRFX0hBU0hFUVVJ
Vl9PV05FUicsICdTU1RBVEVfRElSJywgJ0RMX0RJUicsICdTU1RBVEVfSEFTSEVRVUlWX1JFUE9S
VF9UQVNLREFUQScsICdGSUxFU1BBVEgnLCAnUFJTRVJWX0RVTVBGSUxFJywgJ0NDQUNIRV9ESVIn
LCAnQlVJTERISVNUT1JZX0RJUicsICdQQVRIJywgJ0VYVEVSTkFMX1RPT0xDSEFJTicsICdXT1JL
RElSJywgJ0NPUkVCQVNFJywgJ0RFUExPWV9ESVInLCAnTElDRU5TRV9QQVRIJywgJ0NDQUNIRScs
ICdVU0VSJywgJ1NUQU1QQ0xFQU4nfQp0YXNrd2hpdGVsaXN0OiBOb25lClRhc2sgZGVwZW5kZW5j
aWVzOiBbJ0FSTV9USFVNQl9PUFQnLCAnREVGQVVMVFRVTkUnLCAnTUFDSElORScsICdNQUNISU5F
T1ZFUlJJREVTJywgJ1BBQ0tBR0VfQVJDSCcsICdSVVNUX1BBTklDX1NUUkFURUdZJywgJ1RBUkdF
VF9BUkNIJywgJ1RBUkdFVF9DQ19BUkNIJywgJ1RBUkdFVF9GUFUnLCAnVEFSR0VUX0xMVk1fQ1BV
JywgJ1RBUkdFVF9MTFZNX0ZFQVRVUkVTJywgJ1RSQU5TTEFURURfVEFSR0VUX0FSQ0gnLCAnVFVO
RV9BUkNIJywgJ1RVTkVfQ0NBUkdTJywgJ1RVTkVfRkVBVFVSRVMnLCAnVFVORV9GRUFUVVJFUzp0
dW5lLWNvcmUyLTMyJywgJ1RVTkVfRkVBVFVSRVM6dHVuZS14ODYnLCAnWDg2QVJDSDMyJywgJ1g4
NkFSQ0g2NCcsICdhcmNoX3RvX3J1c3RfdGFyZ2V0X2FyY2gnLCAnbGx2bV9jcHUnLCAnbGx2bV9m
ZWF0dXJlcycsICdsbHZtX2ZlYXR1cmVzX2Zyb21fY2NfYXJjaCcsICdsbHZtX2ZlYXR1cmVzX2Zy
b21fdGFyZ2V0X2ZwdScsICdsbHZtX2ZlYXR1cmVzX2Zyb21fdHVuZScsICdwcmVmaXhfZm9yJywg
J3J1c3RfZ2VuX3RhcmdldCcsICdzeXNfZm9yJywgJ3RhcmdldF9pc19hcm12NyddCmJhc2VoYXNo
OiBiZDY2NjI5NjMxZTc1N2RjY2NmYzEwM2MxM2U3ZGU2YWMzNTY4Njc3ZGYzZWY1YWQ0N2RkOTll
NjI0MjdjYWFiCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBBUk1fVEhVTUJfT1BU
IGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBERUZBVUxUVFVORSBp
cyBzZXQoKQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgTUFDSElORSBpcyBzZXQo
KQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgTUFDSElORU9WRVJSSURFUyBpcyB7
J01BQ0hJTkUnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgUEFDS0FHRV9BUkNI
IGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBSVVNUX1BBTklDX1NU
UkFURUdZIGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUQVJHRVRf
QVJDSCBpcyB7J1RVTkVfQVJDSCd9Ckxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBU
QVJHRVRfQ0NfQVJDSCBpcyB7J1RVTkVfQ0NBUkdTJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9y
IHZhcmlhYmxlIFRBUkdFVF9GUFUgaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZh
cmlhYmxlIFRBUkdFVF9MTFZNX0NQVSBpcyB7J2xsdm1fY3B1J30KTGlzdCBvZiBkZXBlbmRlbmNp
ZXMgZm9yIHZhcmlhYmxlIFRBUkdFVF9MTFZNX0ZFQVRVUkVTIGlzIHsnbGx2bV9mZWF0dXJlcyd9
Ckxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUUkFOU0xBVEVEX1RBUkdFVF9BUkNI
IGlzIHsnVEFSR0VUX0FSQ0gnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgVFVO
RV9BUkNIIGlzIHsnWDg2QVJDSDMyJywgJ1g4NkFSQ0g2NCd9Ckxpc3Qgb2YgZGVwZW5kZW5jaWVz
IGZvciB2YXJpYWJsZSBUVU5FX0NDQVJHUyBpcyBzZXQoKQpMaXN0IG9mIGRlcGVuZGVuY2llcyBm
b3IgdmFyaWFibGUgVFVORV9GRUFUVVJFUyBpcyB7J1RVTkVfRkVBVFVSRVM6dHVuZS1jb3JlMi0z
MicsICdERUZBVUxUVFVORSd9Ckxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUVU5F
X0ZFQVRVUkVTOnR1bmUtY29yZTItMzIgaXMgeydUVU5FX0ZFQVRVUkVTOnR1bmUteDg2J30KTGlz
dCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIFRVTkVfRkVBVFVSRVM6dHVuZS14ODYgaXMg
c2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIFg4NkFSQ0gzMiBpcyBzZXQo
KQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgWDg2QVJDSDY0IGlzIHNldCgpCkxp
c3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBhcmNoX3RvX3J1c3RfdGFyZ2V0X2FyY2gg
aXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIGxsdm1fY3B1IGlzIHsn
UEFDS0FHRV9BUkNIJywgJ1RVTkVfRkVBVFVSRVMnLCAnVFJBTlNMQVRFRF9UQVJHRVRfQVJDSCd9
Ckxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBsbHZtX2ZlYXR1cmVzIGlzIHsnbGx2
bV9mZWF0dXJlc19mcm9tX2NjX2FyY2gnLCAnbGx2bV9mZWF0dXJlc19mcm9tX3R1bmUnLCAnbGx2
bV9mZWF0dXJlc19mcm9tX3RhcmdldF9mcHUnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFy
aWFibGUgbGx2bV9mZWF0dXJlc19mcm9tX2NjX2FyY2ggaXMgeydUQVJHRVRfQ0NfQVJDSCd9Ckxp
c3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBsbHZtX2ZlYXR1cmVzX2Zyb21fdGFyZ2V0
X2ZwdSBpcyB7J1RBUkdFVF9GUFUnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUg
bGx2bV9mZWF0dXJlc19mcm9tX3R1bmUgaXMgeyd0YXJnZXRfaXNfYXJtdjcnLCAnVFVORV9GRUFU
VVJFUycsICdBUk1fVEhVTUJfT1BUJywgJ01BQ0hJTkVPVkVSUklERVMnfQpMaXN0IG9mIGRlcGVu
ZGVuY2llcyBmb3IgdmFyaWFibGUgcHJlZml4X2ZvciBpcyBzZXQoKQpMaXN0IG9mIGRlcGVuZGVu
Y2llcyBmb3IgdmFyaWFibGUgcnVzdF9nZW5fdGFyZ2V0IGlzIHsnc3lzX2ZvcicsICdhcmNoX3Rv
X3J1c3RfdGFyZ2V0X2FyY2gnLCAnUlVTVF9QQU5JQ19TVFJBVEVHWScsICdwcmVmaXhfZm9yJ30K
TGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIHN5c19mb3IgaXMgc2V0KCkKTGlzdCBv
ZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIHRhcmdldF9pc19hcm12NyBpcyB7J1RBUkdFVF9B
UkNIJywgJ1RVTkVfRkVBVFVSRVMnLCAnTUFDSElORU9WRVJSSURFUyd9ClZhcmlhYmxlIGRvX3J1
c3RfZ2VuX3RhcmdldHMgdmFsdWUgaXMgICAgIHdkID0gZC5nZXRWYXIoJ1dPUktESVInKSArICcv
dGFyZ2V0cy8nCiAgICAjIEl0IGlzIGltcG9ydGFudCAnVEFSR0VUJyBpcyBsYXN0IGhlcmUgc28g
dGhhdCBpdCBvdmVycmlkZXMgb3VyIGxlc3MKICAgICMgaW5mb3JtZWQgY2hvaWNlcyBmb3IgQlVJ
TEQgJiBIT1NUIGlmIFRBUkdFVCBoYXBwZW5zIHRvIGJlIHRoZSBzYW1lIGFzCiAgICAjIGVpdGhl
ciBvZiB0aGVtLgogICAgZm9yIHRoaW5nIGluIFsnQlVJTEQnLCAnSE9TVCcsICdUQVJHRVQnXToK
ICAgICAgICBiYi5kZWJ1ZygxLCAicnVzdF9nZW5fdGFyZ2V0IGZvciAiICsgdGhpbmcpCiAgICAg
ICAgZmVhdHVyZXMgPSAiIgogICAgICAgIGNwdSA9ICJnZW5lcmljIgogICAgICAgIGFyY2ggPSBk
LmdldFZhcigne31fQVJDSCcuZm9ybWF0KHRoaW5nKSkKICAgICAgICBpZiB0aGluZyBpcyAiVEFS
R0VUIjoKICAgICAgICAgICAgIyBhcm0gYW5kIGFybXY3IGhhdmUgZGlmZmVyZW50IHRhcmdldHMg
aW4gbGx2bQogICAgICAgICAgICBpZiBhcmNoID09ICJhcm0iIGFuZCB0YXJnZXRfaXNfYXJtdjco
ZCk6CiAgICAgICAgICAgICAgICBhcmNoID0gJ2FybXY3JwogICAgICAgICAgICBmZWF0dXJlcyA9
IGQuZ2V0VmFyKCdUQVJHRVRfTExWTV9GRUFUVVJFUycpIG9yICIiCiAgICAgICAgICAgIGNwdSA9
IGQuZ2V0VmFyKCdUQVJHRVRfTExWTV9DUFUnKQogICAgICAgIHJ1c3RfZ2VuX3RhcmdldChkLCB0
aGluZywgd2QsIGZlYXR1cmVzLCBjcHUsIGFyY2gpCgpWYXJpYWJsZSBBUk1fVEhVTUJfT1BUIHZh
bHVlIGlzIE5vbmUKVmFyaWFibGUgREVGQVVMVFRVTkUgdmFsdWUgaXMgY29yZTItMzIKVmFyaWFi
bGUgTUFDSElORSB2YWx1ZSBpcyBxZW11eDg2ClZhcmlhYmxlIE1BQ0hJTkVPVkVSUklERVMgdmFs
dWUgaXMgJHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLCAnbXgzMicsICd4ODYt
eDMyOicsICcnLCBkKX0ke0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsICdtMzIn
LCAneDg2OicsICcnLCBkKX1xZW11YWxsOiR7TUFDSElORX0KVFVORV9GRUFUVVJFU3ttMzJ9ID0g
U2V0ClRVTkVfRkVBVFVSRVN7bXgzMn0gPSBVbnNldApWYXJpYWJsZSBQQUNLQUdFX0FSQ0ggdmFs
dWUgaXMgJHtCVUlMRF9BUkNIfQpWYXJpYWJsZSBSVVNUX1BBTklDX1NUUkFURUdZIHZhbHVlIGlz
IHVud2luZApWYXJpYWJsZSBUQVJHRVRfQVJDSCB2YWx1ZSBpcyAke1RVTkVfQVJDSH0KVmFyaWFi
bGUgVEFSR0VUX0NDX0FSQ0ggdmFsdWUgaXMgJHtUVU5FX0NDQVJHU30gLS1zeXNyb290PSR7U1RB
R0lOR19ESVJfVEFSR0VUfQpWYXJpYWJsZSBUQVJHRVRfRlBVIHZhbHVlIGlzIApWYXJpYWJsZSBU
QVJHRVRfTExWTV9DUFUgdmFsdWUgaXMgJHtAbGx2bV9jcHUoZCl9ClZhcmlhYmxlIFRBUkdFVF9M
TFZNX0ZFQVRVUkVTIHZhbHVlIGlzICR7QGxsdm1fZmVhdHVyZXMoZCl9ClZhcmlhYmxlIFRSQU5T
TEFURURfVEFSR0VUX0FSQ0ggdmFsdWUgaXMgJHtAZC5nZXRWYXIoJ1RBUkdFVF9BUkNIJykucmVw
bGFjZSgiXyIsICItIil9ClZhcmlhYmxlIFRVTkVfQVJDSCB2YWx1ZSBpcyAke0BiYi51dGlscy5j
b250YWlucygnVFVORV9GRUFUVVJFUycsICdtMzInLCAnJHtYODZBUkNIMzJ9JywgJycsIGQpfSR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdUVU5FX0ZFQVRVUkVTJywgJ214MzInLCAnJHtYODZBUkNINjR9
JywgJycsIGQpfSR7QGJiLnV0aWxzLmNvbnRhaW5zKCdUVU5FX0ZFQVRVUkVTJywgJ202NCcsICck
e1g4NkFSQ0g2NH0nLCAnJywgZCl9ClRVTkVfRkVBVFVSRVN7bTMyfSA9IFNldApUVU5FX0ZFQVRV
UkVTe202NH0gPSBVbnNldApUVU5FX0ZFQVRVUkVTe214MzJ9ID0gVW5zZXQKVmFyaWFibGUgVFVO
RV9DQ0FSR1MgdmFsdWUgaXMgIC1tMzIgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMg
LW1mcG1hdGg9c3NlClZhcmlhYmxlIFRVTkVfRkVBVFVSRVMgdmFsdWUgaXMgJHtUVU5FX0ZFQVRV
UkVTOnR1bmUtJHtERUZBVUxUVFVORX19ClZhcmlhYmxlIFRVTkVfRkVBVFVSRVM6dHVuZS1jb3Jl
Mi0zMiB2YWx1ZSBpcyAke1RVTkVfRkVBVFVSRVM6dHVuZS14ODZ9IGNvcmUyClZhcmlhYmxlIFRV
TkVfRkVBVFVSRVM6dHVuZS14ODYgdmFsdWUgaXMgbTMyClZhcmlhYmxlIFg4NkFSQ0gzMiB2YWx1
ZSBpcyBpNjg2ClZhcmlhYmxlIFg4NkFSQ0g2NCB2YWx1ZSBpcyB4ODZfNjQKVmFyaWFibGUgYXJj
aF90b19ydXN0X3RhcmdldF9hcmNoIHZhbHVlIGlzIGRlZiBhcmNoX3RvX3J1c3RfdGFyZ2V0X2Fy
Y2goYXJjaCk6CiAgICBpZiBhcmNoID09ICJpNTg2IiBvciBhcmNoID09ICJpNjg2IjoKICAgICAg
ICByZXR1cm4gIng4NiIKICAgIGVsaWYgYXJjaCA9PSAibWlwc2VsIjoKICAgICAgICByZXR1cm4g
Im1pcHMiCiAgICBlbGlmIGFyY2ggPT0gIm1pcDY0c2VsIjoKICAgICAgICByZXR1cm4gIm1pcHM2
NCIKICAgIGVsaWYgYXJjaCA9PSAiYXJtdjciOgogICAgICAgIHJldHVybiAiYXJtIgogICAgZWxp
ZiBhcmNoID09ICJwb3dlcnBjNjRsZSI6CiAgICAgICAgcmV0dXJuICJwb3dlcnBjNjQiCiAgICBl
bHNlOgogICAgICAgIHJldHVybiBhcmNoCgojIGdlbmVyYXRlcyBvdXIgdGFyZ2V0IENQVSB2YWx1
ZQpWYXJpYWJsZSBsbHZtX2NwdSB2YWx1ZSBpcyBkZWYgbGx2bV9jcHUoZCk6CiAgICBjcHUgPSBk
LmdldFZhcignUEFDS0FHRV9BUkNIJykKICAgIHRhcmdldCA9IGQuZ2V0VmFyKCdUUkFOU0xBVEVE
X1RBUkdFVF9BUkNIJykKCiAgICB0cmFucyA9IHt9CiAgICB0cmFuc1snY29yZWk3LTY0J10gPSAi
Y29yZWk3IgogICAgdHJhbnNbJ2NvcmUyLTMyJ10gPSAiY29yZTIiCiAgICB0cmFuc1sneDg2LTY0
J10gPSAieDg2LTY0IgogICAgdHJhbnNbJ2k2ODYnXSA9ICJpNjg2IgogICAgdHJhbnNbJ2k1ODYn
XSA9ICJpNTg2IgogICAgdHJhbnNbJ3Bvd2VycGMnXSA9ICJwb3dlcnBjIgogICAgdHJhbnNbJ21p
cHM2NCddID0gIm1pcHM2NCIKICAgIHRyYW5zWydtaXBzNjRlbCddID0gIm1pcHM2NCIKICAgIHRy
YW5zWydyaXNjdjY0J10gPSAiZ2VuZXJpYy1ydjY0IgogICAgdHJhbnNbJ3Jpc2N2MzInXSA9ICJn
ZW5lcmljLXJ2MzIiCgogICAgaWYgdGFyZ2V0IGluIFsibWlwcyIsICJtaXBzZWwiXToKICAgICAg
ICBmZWF0ID0gZnJvemVuc2V0KGQuZ2V0VmFyKCdUVU5FX0ZFQVRVUkVTJykuc3BsaXQoKSkKICAg
ICAgICBpZiAibWlwczMycjIiIGluIGZlYXQ6CiAgICAgICAgICAgIHRyYW5zWydtaXBzZWwnXSA9
ICJtaXBzMzJyMiIKICAgICAgICAgICAgdHJhbnNbJ21pcHMnXSA9ICJtaXBzMzJyMiIKICAgICAg
ICBlbGlmICJtaXBzMzIiIGluIGZlYXQ6CiAgICAgICAgICAgIHRyYW5zWydtaXBzZWwnXSA9ICJt
aXBzMzIiCiAgICAgICAgICAgIHRyYW5zWydtaXBzJ10gPSAibWlwczMyIgoKICAgIHRyeToKICAg
ICAgICByZXR1cm4gdHJhbnNbY3B1XQogICAgZXhjZXB0OgogICAgICAgIHJldHVybiB0cmFucy5n
ZXQodGFyZ2V0LCAiZ2VuZXJpYyIpCgpWYXJpYWJsZSBsbHZtX2ZlYXR1cmVzIHZhbHVlIGlzIGRl
ZiBsbHZtX2ZlYXR1cmVzKGQpOgogICAgcmV0dXJuICcsJy5qb2luKGxsdm1fZmVhdHVyZXNfZnJv
bV90dW5lKGQpICsKICAgICAgICAgICAgICAgICAgICBsbHZtX2ZlYXR1cmVzX2Zyb21fY2NfYXJj
aChkKSArCiAgICAgICAgICAgICAgICAgICAgbGx2bV9mZWF0dXJlc19mcm9tX3RhcmdldF9mcHUo
ZCkpCgoKIyMgYXJtLXVua25vd24tbGludXgtZ251ZWFiaWhmClZhcmlhYmxlIGxsdm1fZmVhdHVy
ZXNfZnJvbV9jY19hcmNoIHZhbHVlIGlzIGRlZiBsbHZtX2ZlYXR1cmVzX2Zyb21fY2NfYXJjaChk
KToKICAgIGYgPSBbXQogICAgZmVhdCA9IGQuZ2V0VmFyKCdUQVJHRVRfQ0NfQVJDSCcpCiAgICBp
ZiBub3QgZmVhdDoKICAgICAgICByZXR1cm4gW10KICAgIGZlYXQgPSBmcm96ZW5zZXQoZmVhdC5z
cGxpdCgpKQoKICAgIGlmICctbW1teCcgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK21teCIp
CiAgICBpZiAnLW1zc2UnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIitzc2UiKQogICAgaWYg
Jy1tc3NlMicgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK3NzZTIiKQogICAgaWYgJy1tc3Nl
MycgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK3NzZTMiKQogICAgaWYgJy1tc3NzZTMnIGlu
IGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIitzc3NlMyIpCiAgICBpZiAnLW1zc2U0LjEnIGluIGZl
YXQ6CiAgICAgICAgZi5hcHBlbmQoIitzc2U0LjEiKQogICAgaWYgJy1tc3NlNC4yJyBpbiBmZWF0
OgogICAgICAgIGYuYXBwZW5kKCIrc3NlNC4yIikKICAgIGlmICctbXNzZTRhJyBpbiBmZWF0Ogog
ICAgICAgIGYuYXBwZW5kKCIrc3NlNGEiKQogICAgaWYgJy1tYXZ4JyBpbiBmZWF0OgogICAgICAg
IGYuYXBwZW5kKCIrYXZ4IikKICAgIGlmICctbWF2eDInIGluIGZlYXQ6CiAgICAgICAgZi5hcHBl
bmQoIithdngyIikKCiAgICByZXR1cm4gZgoKVmFyaWFibGUgbGx2bV9mZWF0dXJlc19mcm9tX3Rh
cmdldF9mcHUgdmFsdWUgaXMgZGVmIGxsdm1fZmVhdHVyZXNfZnJvbV90YXJnZXRfZnB1KGQpOgog
ICAgIyBUQVJHRVRfRlBVIGNhbiBiZSBoYXJkIG9yIHNvZnQuICtzb2Z0LWZsb2F0IHRlbGwgbGx2
bSB0byB1c2Ugc29mdCBmbG9hdAogICAgIyBBQkkuIFRoZXJlIGlzIG5vIG9wdGlvbiBmb3IgaGFy
ZC4KCiAgICBmcHUgPSBkLmdldFZhcignVEFSR0VUX0ZQVScsIFRydWUpCiAgICByZXR1cm4gWyIr
c29mdC1mbG9hdCJdIGlmIGZwdSA9PSAic29mdCIgZWxzZSBbXQoKVmFyaWFibGUgbGx2bV9mZWF0
dXJlc19mcm9tX3R1bmUgdmFsdWUgaXMgZGVmIGxsdm1fZmVhdHVyZXNfZnJvbV90dW5lKGQpOgog
ICAgZiA9IFtdCiAgICBmZWF0ID0gZC5nZXRWYXIoJ1RVTkVfRkVBVFVSRVMnKQogICAgaWYgbm90
IGZlYXQ6CiAgICAgICAgcmV0dXJuIFtdCiAgICBmZWF0ID0gZnJvemVuc2V0KGZlYXQuc3BsaXQo
KSkKCiAgICBtYWNoX292ZXJyaWRlcyA9IGQuZ2V0VmFyKCdNQUNISU5FT1ZFUlJJREVTJykKICAg
IG1hY2hfb3ZlcnJpZGVzID0gZnJvemVuc2V0KG1hY2hfb3ZlcnJpZGVzLnNwbGl0KCc6JykpCgog
ICAgaWYgJ3ZmcHY0JyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrdmZwNCIpCiAgICBpZiAn
dmZwdjMnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIit2ZnAzIikKICAgIGlmICd2ZnB2M2Qx
NicgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2QxNiIpCgogICAgaWYgJ3ZmcHYyJyBpbiBm
ZWF0IG9yICd2ZnAnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIit2ZnAyIikKCiAgICBpZiAn
bmVvbicgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK25lb24iKQoKICAgIGlmICdtaXBzMzIn
IGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIittaXBzMzIiKQoKICAgIGlmICdtaXBzMzJyMicg
aW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK21pcHMzMnIyIikKCiAgICBpZiB0YXJnZXRfaXNf
YXJtdjcoZCk6CiAgICAgICAgZi5hcHBlbmQoJyt2NycpCgogICAgaWYgKCdhcm12NicgaW4gbWFj
aF9vdmVycmlkZXMpIG9yICgnYXJtdjYnIGluIGZlYXQpOgogICAgICAgIGYuYXBwZW5kKCIrdjYi
KQogICAgaWYgJ2FybXY1dGUnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIitzdHJpY3QtYWxp
Z24iKQogICAgICAgIGYuYXBwZW5kKCIrdjV0ZSIpCiAgICBlbGlmICdhcm12NScgaW4gZmVhdDoK
ICAgICAgICBmLmFwcGVuZCgiK3N0cmljdC1hbGlnbiIpCiAgICAgICAgZi5hcHBlbmQoIit2NSIp
CgogICAgaWYgKCdhcm12NCcgaW4gbWFjaF9vdmVycmlkZXMpIG9yICgnYXJtdjQnIGluIGZlYXQp
OgogICAgICAgIGYuYXBwZW5kKCIrc3RyaWN0LWFsaWduIikKCiAgICBpZiAnZHNwJyBpbiBmZWF0
OgogICAgICAgIGYuYXBwZW5kKCIrZHNwIikKCiAgICBpZiAndGh1bWInIGluIGZlYXQ6CiAgICAg
ICAgaWYgZC5nZXRWYXIoJ0FSTV9USFVNQl9PUFQnKSA9PSAidGh1bWIiOgogICAgICAgICAgICBp
ZiB0YXJnZXRfaXNfYXJtdjcoZCk6CiAgICAgICAgICAgICAgICBmLmFwcGVuZCgnK3RodW1iMicp
CiAgICAgICAgICAgIGYuYXBwZW5kKCIrdGh1bWItbW9kZSIpCgogICAgaWYgJ2NvcnRleGE1JyBp
biBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrYTUiKQogICAgaWYgJ2NvcnRleGE3JyBpbiBmZWF0
OgogICAgICAgIGYuYXBwZW5kKCIrYTciKQogICAgaWYgJ2NvcnRleGE5JyBpbiBmZWF0OgogICAg
ICAgIGYuYXBwZW5kKCIrYTkiKQogICAgaWYgJ2NvcnRleGExNScgaW4gZmVhdDoKICAgICAgICBm
LmFwcGVuZCgiK2ExNSIpCiAgICBpZiAnY29ydGV4YTE3JyBpbiBmZWF0OgogICAgICAgIGYuYXBw
ZW5kKCIrYTE3IikKICAgIGlmICgncmlzY3Y2NCcgaW4gZmVhdCkgb3IgKCdyaXNjdjMyJyBpbiBm
ZWF0KToKICAgICAgICBmLmFwcGVuZCgiK2EsK2MsK2QsK2YsK20iKQogICAgcmV0dXJuIGYKCiMg
VEFSR0VUX0NDX0FSQ0ggY2hhbmdlcyBmcm9tIGJ1aWxkL2Nyb3NzL3RhcmdldCBzbyBpdCdsbCBk
byB0aGUgcmlnaHQgdGhpbmcKIyB0aGlzIHNob3VsZCBnbyBhd2F5IHdoZW4gaHR0cHM6Ly9naXRo
dWIuY29tL3J1c3QtbGFuZy9ydXN0L3B1bGwvMzE3MDkgaXMKIyBzdGFibGUgKDEuOS4wPykKVmFy
aWFibGUgcHJlZml4X2ZvciB2YWx1ZSBpcyBkZWYgcHJlZml4X2ZvcihkLCB0aGluZyk6CiAgICBy
ZXR1cm4gZC5nZXRWYXIoJ3t9X1BSRUZJWCcuZm9ybWF0KHRoaW5nKSkKCiMgQ29udmVydCBhIG5v
cm1hbCBhcmNoIChIT1NUX0FSQ0gsIFRBUkdFVF9BUkNILCBCVUlMRF9BUkNILCBldGMpIHRvIHNv
bWV0aGluZwojIHJ1c3QncyBpbnRlcm5hbHMgd29uJ3QgY2hva2Ugb24uClZhcmlhYmxlIHJ1c3Rf
Z2VuX3RhcmdldCB2YWx1ZSBpcyBkZWYgcnVzdF9nZW5fdGFyZ2V0KGQsIHRoaW5nLCB3ZCwgZmVh
dHVyZXMsIGNwdSwgYXJjaCk6CiAgICBpbXBvcnQganNvbgogICAgc3lzID0gc3lzX2ZvcihkLCB0
aGluZykKICAgIHByZWZpeCA9IHByZWZpeF9mb3IoZCwgdGhpbmcpCgogICAgZmVhdHVyZXMgPSBm
ZWF0dXJlcyBvciBkLmdldFZhckZsYWcoJ0ZFQVRVUkVTJywgYXJjaCkgb3IgIiIKICAgIGZlYXR1
cmVzID0gZmVhdHVyZXMuc3RyaXAoKQoKICAgICMgYnVpbGQgdHNwZWMKICAgIHRzcGVjID0ge30K
ICAgIHRzcGVjWydsbHZtLXRhcmdldCddID0gZC5nZXRWYXJGbGFnKCdMTFZNX1RBUkdFVCcsIGFy
Y2gpCiAgICB0c3BlY1snZGF0YS1sYXlvdXQnXSA9IGQuZ2V0VmFyRmxhZygnREFUQV9MQVlPVVQn
LCBhcmNoKQogICAgdHNwZWNbJ21heC1hdG9taWMtd2lkdGgnXSA9IGludChkLmdldFZhckZsYWco
J01BWF9BVE9NSUNfV0lEVEgnLCBhcmNoKSkKICAgIHRzcGVjWyd0YXJnZXQtcG9pbnRlci13aWR0
aCddID0gZC5nZXRWYXJGbGFnKCdUQVJHRVRfUE9JTlRFUl9XSURUSCcsIGFyY2gpCiAgICB0c3Bl
Y1sndGFyZ2V0LWMtaW50LXdpZHRoJ10gPSBkLmdldFZhckZsYWcoJ1RBUkdFVF9DX0lOVF9XSURU
SCcsIGFyY2gpCiAgICB0c3BlY1sndGFyZ2V0LWVuZGlhbiddID0gZC5nZXRWYXJGbGFnKCdUQVJH
RVRfRU5ESUFOJywgYXJjaCkKICAgIHRzcGVjWydhcmNoJ10gPSBhcmNoX3RvX3J1c3RfdGFyZ2V0
X2FyY2goYXJjaCkKICAgIHRzcGVjWydvcyddID0gImxpbnV4IgogICAgaWYgIm11c2wiIGluIHRz
cGVjWydsbHZtLXRhcmdldCddOgogICAgICAgIHRzcGVjWydlbnYnXSA9ICJtdXNsIgogICAgZWxz
ZToKICAgICAgICB0c3BlY1snZW52J10gPSAiZ251IgogICAgaWYgInJpc2N2NjQiIGluIHRzcGVj
WydsbHZtLXRhcmdldCddOgogICAgICAgIHRzcGVjWydsbHZtLWFiaW5hbWUnXSA9ICJscDY0ZCIK
ICAgIGlmICJyaXNjdjMyIiBpbiB0c3BlY1snbGx2bS10YXJnZXQnXToKICAgICAgICB0c3BlY1sn
bGx2bS1hYmluYW1lJ10gPSAiaWxwMzJkIgogICAgdHNwZWNbJ3ZlbmRvciddID0gInVua25vd24i
CiAgICB0c3BlY1sndGFyZ2V0LWZhbWlseSddID0gInVuaXgiCiAgICB0c3BlY1snbGlua2VyJ10g
PSAie317fWdjYyIuZm9ybWF0KGQuZ2V0VmFyKCdDQ0FDSEUnKSwgcHJlZml4KQogICAgdHNwZWNb
J2FyJ10gPSAie31hciIuZm9ybWF0KHByZWZpeCkKICAgIHRzcGVjWydjcHUnXSA9IGNwdQogICAg
aWYgZmVhdHVyZXMgIT0gIiI6CiAgICAgICAgdHNwZWNbJ2ZlYXR1cmVzJ10gPSBmZWF0dXJlcwog
ICAgdHNwZWNbJ2R5bmFtaWMtbGlua2luZyddID0gVHJ1ZQogICAgdHNwZWNbJ2V4ZWN1dGFibGVz
J10gPSBUcnVlCiAgICB0c3BlY1snbGlua2VyLWlzLWdudSddID0gVHJ1ZQogICAgdHNwZWNbJ2xp
bmtlci1mbGF2b3InXSA9ICJnY2MiCiAgICB0c3BlY1snaGFzLXJwYXRoJ10gPSBUcnVlCiAgICB0
c3BlY1snaGFzLWVsZi10bHMnXSA9IFRydWUKICAgIHRzcGVjWydwb3NpdGlvbi1pbmRlcGVuZGVu
dC1leGVjdXRhYmxlcyddID0gVHJ1ZQogICAgdHNwZWNbJ3BhbmljLXN0cmF0ZWd5J10gPSBkLmdl
dFZhcigiUlVTVF9QQU5JQ19TVFJBVEVHWSIpCgogICAgIyB3cml0ZSBvdXQgdGhlIHRhcmdldCBz
cGVjIGpzb24gZmlsZQogICAgd2l0aCBvcGVuKHdkICsgc3lzICsgJy5qc29uJywgJ3cnKSBhcyBm
OgogICAgICAgIGpzb24uZHVtcCh0c3BlYywgZiwgaW5kZW50PTQpCgpWYXJpYWJsZSBzeXNfZm9y
IHZhbHVlIGlzIGRlZiBzeXNfZm9yKGQsIHRoaW5nKToKICAgIHJldHVybiBkLmdldFZhcigne31f
U1lTJy5mb3JtYXQodGhpbmcpKQoKVmFyaWFibGUgdGFyZ2V0X2lzX2FybXY3IHZhbHVlIGlzIGRl
ZiB0YXJnZXRfaXNfYXJtdjcoZCk6CiAgICAnJydEZXRlcm1pbmUgaWYgdGFyZ2V0IGlzIGFybXY3
JycnCiAgICAjIFRVTkVfRkVBVFVSRVMgbWF5IGluY2x1ZGUgYXJtKiBldmVuIGlmIHRoZSB0YXJn
ZXQgaXMgbm90IGFybQogICAgIyBpbiB0aGUgY2FzZSBvZiAqLW5hdGl2ZSBwYWNrYWdlcwogICAg
aWYgZC5nZXRWYXIoJ1RBUkdFVF9BUkNIJykgIT0gJ2FybSc6CiAgICAgICAgcmV0dXJuIEZhbHNl
CgogICAgZmVhdCA9IGQuZ2V0VmFyKCdUVU5FX0ZFQVRVUkVTJykKICAgIGZlYXQgPSBmcm96ZW5z
ZXQoZmVhdC5zcGxpdCgpKQogICAgbWFjaF9vdmVycmlkZXMgPSBkLmdldFZhcignTUFDSElORU9W
RVJSSURFUycpCiAgICBtYWNoX292ZXJyaWRlcyA9IGZyb3plbnNldChtYWNoX292ZXJyaWRlcy5z
cGxpdCgnOicpKQoKICAgIHY3PWZyb3plbnNldChbJ2FybXY3YScsICdhcm12N3InLCAnYXJtdjdt
JywgJ2FybXY3dmUnXSkKICAgIGlmIG1hY2hfb3ZlcnJpZGVzLmlzZGlzam9pbnQodjcpIGFuZCBm
ZWF0LmlzZGlzam9pbnQodjcpOgogICAgICAgIHJldHVybiBGYWxzZQogICAgZWxzZToKICAgICAg
ICByZXR1cm4gVHJ1ZQoKIyBSZXNwb25zaWJsZSBmb3IgdGFraW5nIFlvY3RvIHRyaXBsZXMgYW5k
IGNvbnZlcnRpbmcgaXQgdG8gUnVzdCB0cmlwbGVzClRhc2tzIHRoaXMgdGFzayBkZXBlbmRzIG9u
OiBbJy9hbGEtbHBnZ3AzMS9ybWFjbGVvZC9zcmMvZGlzdHJvL3lvY3RvL3Bva3ktY29udHJpYi5n
aXQvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1jcm9zc18xLjU0LjAuYmI6ZG9fcGF0
Y2gnXQpUaGlzIHRhc2sgZGVwZW5kcyBvbiB0aGUgY2hlY2tzdW1zIG9mIGZpbGVzOiBbXQpIYXNo
IGZvciBkZXBlbmRlbnQgdGFzayAvYWxhLWxwZ2dwMzEvcm1hY2xlb2Qvc3JjL2Rpc3Ryby95b2N0
by9wb2t5LWNvbnRyaWIuZ2l0L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3QtY3Jvc3Nf
MS41NC4wLmJiOmRvX3BhdGNoIGlzIGVjNGE5ZWQ4NmRmMWM4YzJiMjdiYjFlNDIyNjU1Y2IyY2Vk
YzFkOWEzNmI3MjBmYWI2MzZiOWFmOWUzY2NhNDgKQ29tcHV0ZWQgYmFzZSBoYXNoIGlzIGJkNjY2
Mjk2MzFlNzU3ZGNjY2ZjMTAzYzEzZTdkZTZhYzM1Njg2NzdkZjNlZjVhZDQ3ZGQ5OWU2MjQyN2Nh
YWIgYW5kIGZyb20gZmlsZSBiZDY2NjI5NjMxZTc1N2RjY2NmYzEwM2MxM2U3ZGU2YWMzNTY4Njc3
ZGYzZWY1YWQ0N2RkOTllNjI0MjdjYWFiCkNvbXB1dGVkIHRhc2sgaGFzaCBpcyA0NDhhODExMzIz
MGExNmFjNWQ2MDZkZTE4OTg5Zjk4YjM3MDBlZGViM2U3OTU2YzZmMDIyMDdhYTc2YTVkNGYzCg==

--------------ECD9F43D689B1AB7E99C7024
Content-Type: text/plain; charset=UTF-8;
 name="2.rust-cross-i686.do_rust_gen_target"
Content-Disposition: attachment;
 filename="2.rust-cross-i686.do_rust_gen_target"
Content-Transfer-Encoding: base64

YmFzZXdoaXRlbGlzdDogeydQV0QnLCAnU1NUQVRFX0hBU0hFUVVJVl9PV05FUicsICdTVEFNUFNf
RElSJywgJ0NDQUNIRScsICdCQl9XT1JLRVJDT05URVhUJywgJ0NPUkVCQVNFJywgJ0JCUEFUSCcs
ICdIT01FJywgJ1RNUERJUicsICdFUlJPUl9RQScsICdTU1RBVEVfSEFTSEVRVUlWX01FVEhPRCcs
ICdCQl9UQVNLSEFTSCcsICdHSVRfQ0VJTElOR19ESVJFQ1RPUklFUycsICdTU1RBVEVfSEFTSEVR
VUlWX1JFUE9SVF9UQVNLREFUQScsICdDQ0FDSEVfTk9IQVNIRElSJywgJ0JCX0hBU0hTRVJWRScs
ICdCVUlMRF9BUkNIJywgJ1BSU0VSVl9MT0NLRE9XTicsICdCVUlMREhJU1RPUllfRElSJywgJ1NE
S1BLR1NVRkZJWCcsICdQQVRIJywgJ1dPUktESVInLCAnT01QX05VTV9USFJFQURTJywgJ1NIRUxM
JywgJ0VYVEVSTkFMX1RPT0xDSEFJTicsICdQQVJBTExFTF9NQUtFJywgJ1NUQUdJTkdfRElSX0hP
U1QnLCAnUFNFVURPX0lHTk9SRV9QQVRIUycsICdVU0VSJywgJ0ZJTEVTUEFUSCcsICdTVEFHSU5H
X0RJUl9UQVJHRVQnLCAnQkJfVU5JSEFTSCcsICdMSUNFTlNFX1BBVEgnLCAnRExfRElSJywgJ1NT
VEFURV9ESVInLCAnU09VUkNFX0RBVEVfRVBPQ0gnLCAnQ0NBQ0hFX1RPUF9ESVInLCAnUFJTRVJW
X0hPU1QnLCAnTE9HTkFNRScsICdGSUxFU0VYVFJBUEFUSFMnLCAnRklMRV9ESVJOQU1FJywgJ1NU
QU1QQ0xFQU4nLCAnU1NUQVRFX1BLR0FSQ0gnLCAnUEtHREFUQV9ESVInLCAnUFJTRVJWX0RVTVBE
SVInLCAnQkJTRVJWRVInLCAnZXh0ZW5kX3JlY2lwZV9zeXNyb290JywgJ1BSU0VSVl9EVU1QRklM
RScsICdXQVJOX1FBJywgJ0JCX0xJTUlURURERVBTJywgJ1RISVNESVInLCAnRklMRScsICdERVBM
T1lfRElSJywgJ0NDQUNIRV9ESVInfQp0YXNrd2hpdGVsaXN0OiBOb25lClRhc2sgZGVwZW5kZW5j
aWVzOiBbJ0FSTV9USFVNQl9PUFQnLCAnREVGQVVMVFRVTkUnLCAnTUFDSElORScsICdNQUNISU5F
T1ZFUlJJREVTJywgJ1BBQ0tBR0VfQVJDSCcsICdSVVNUX1BBTklDX1NUUkFURUdZJywgJ1RBUkdF
VF9BUkNIJywgJ1RBUkdFVF9DQ19BUkNIJywgJ1RBUkdFVF9GUFUnLCAnVEFSR0VUX0xMVk1fQ1BV
JywgJ1RBUkdFVF9MTFZNX0ZFQVRVUkVTJywgJ1RSQU5TTEFURURfVEFSR0VUX0FSQ0gnLCAnVFVO
RV9BUkNIJywgJ1RVTkVfQ0NBUkdTJywgJ1RVTkVfRkVBVFVSRVMnLCAnVFVORV9GRUFUVVJFUzp0
dW5lLWNvcmUyLTMyJywgJ1RVTkVfRkVBVFVSRVM6dHVuZS14ODYnLCAnWDg2QVJDSDMyJywgJ1g4
NkFSQ0g2NCcsICdhcmNoX3RvX3J1c3RfdGFyZ2V0X2FyY2gnLCAnbGx2bV9jcHUnLCAnbGx2bV9m
ZWF0dXJlcycsICdsbHZtX2ZlYXR1cmVzX2Zyb21fY2NfYXJjaCcsICdsbHZtX2ZlYXR1cmVzX2Zy
b21fdGFyZ2V0X2ZwdScsICdsbHZtX2ZlYXR1cmVzX2Zyb21fdHVuZScsICdwcmVmaXhfZm9yJywg
J3J1c3RfZ2VuX3RhcmdldCcsICdzeXNfZm9yJywgJ3RhcmdldF9pc19hcm12NyddCmJhc2VoYXNo
OiBkNjk3Y2YyY2JiNTgwN2U4M2Y4YjU1ZGU4MDEyZDViYjlhYjg2NzRmNGJiZjk1NTg3ZmMzY2E4
MjJhNDcyNjliCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBBUk1fVEhVTUJfT1BU
IGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBERUZBVUxUVFVORSBp
cyBzZXQoKQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgTUFDSElORSBpcyBzZXQo
KQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgTUFDSElORU9WRVJSSURFUyBpcyB7
J01BQ0hJTkUnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgUEFDS0FHRV9BUkNI
IGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBSVVNUX1BBTklDX1NU
UkFURUdZIGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUQVJHRVRf
QVJDSCBpcyB7J1RVTkVfQVJDSCd9Ckxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBU
QVJHRVRfQ0NfQVJDSCBpcyB7J1RVTkVfQ0NBUkdTJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9y
IHZhcmlhYmxlIFRBUkdFVF9GUFUgaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZh
cmlhYmxlIFRBUkdFVF9MTFZNX0NQVSBpcyB7J2xsdm1fY3B1J30KTGlzdCBvZiBkZXBlbmRlbmNp
ZXMgZm9yIHZhcmlhYmxlIFRBUkdFVF9MTFZNX0ZFQVRVUkVTIGlzIHsnbGx2bV9mZWF0dXJlcyd9
Ckxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUUkFOU0xBVEVEX1RBUkdFVF9BUkNI
IGlzIHsnVEFSR0VUX0FSQ0gnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgVFVO
RV9BUkNIIGlzIHsnWDg2QVJDSDY0JywgJ1g4NkFSQ0gzMid9Ckxpc3Qgb2YgZGVwZW5kZW5jaWVz
IGZvciB2YXJpYWJsZSBUVU5FX0NDQVJHUyBpcyBzZXQoKQpMaXN0IG9mIGRlcGVuZGVuY2llcyBm
b3IgdmFyaWFibGUgVFVORV9GRUFUVVJFUyBpcyB7J0RFRkFVTFRUVU5FJywgJ1RVTkVfRkVBVFVS
RVM6dHVuZS1jb3JlMi0zMid9Ckxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUVU5F
X0ZFQVRVUkVTOnR1bmUtY29yZTItMzIgaXMgeydUVU5FX0ZFQVRVUkVTOnR1bmUteDg2J30KTGlz
dCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIFRVTkVfRkVBVFVSRVM6dHVuZS14ODYgaXMg
c2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIFg4NkFSQ0gzMiBpcyBzZXQo
KQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgWDg2QVJDSDY0IGlzIHNldCgpCkxp
c3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBhcmNoX3RvX3J1c3RfdGFyZ2V0X2FyY2gg
aXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIGxsdm1fY3B1IGlzIHsn
UEFDS0FHRV9BUkNIJywgJ1RSQU5TTEFURURfVEFSR0VUX0FSQ0gnLCAnVFVORV9GRUFUVVJFUyd9
Ckxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBsbHZtX2ZlYXR1cmVzIGlzIHsnbGx2
bV9mZWF0dXJlc19mcm9tX3RhcmdldF9mcHUnLCAnbGx2bV9mZWF0dXJlc19mcm9tX2NjX2FyY2gn
LCAnbGx2bV9mZWF0dXJlc19mcm9tX3R1bmUnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFy
aWFibGUgbGx2bV9mZWF0dXJlc19mcm9tX2NjX2FyY2ggaXMgeydUQVJHRVRfQ0NfQVJDSCd9Ckxp
c3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBsbHZtX2ZlYXR1cmVzX2Zyb21fdGFyZ2V0
X2ZwdSBpcyB7J1RBUkdFVF9GUFUnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUg
bGx2bV9mZWF0dXJlc19mcm9tX3R1bmUgaXMgeydBUk1fVEhVTUJfT1BUJywgJ1RVTkVfRkVBVFVS
RVMnLCAndGFyZ2V0X2lzX2FybXY3JywgJ01BQ0hJTkVPVkVSUklERVMnfQpMaXN0IG9mIGRlcGVu
ZGVuY2llcyBmb3IgdmFyaWFibGUgcHJlZml4X2ZvciBpcyBzZXQoKQpMaXN0IG9mIGRlcGVuZGVu
Y2llcyBmb3IgdmFyaWFibGUgcnVzdF9nZW5fdGFyZ2V0IGlzIHsnc3lzX2ZvcicsICdwcmVmaXhf
Zm9yJywgJ2FyY2hfdG9fcnVzdF90YXJnZXRfYXJjaCcsICdSVVNUX1BBTklDX1NUUkFURUdZJ30K
TGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIHN5c19mb3IgaXMgc2V0KCkKTGlzdCBv
ZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIHRhcmdldF9pc19hcm12NyBpcyB7J1RVTkVfRkVB
VFVSRVMnLCAnVEFSR0VUX0FSQ0gnLCAnTUFDSElORU9WRVJSSURFUyd9ClZhcmlhYmxlIGRvX3J1
c3RfZ2VuX3RhcmdldHMgdmFsdWUgaXMgICAgIHdkID0gZC5nZXRWYXIoJ1dPUktESVInKSArICcv
dGFyZ2V0cy8nCiAgICAjIEl0IGlzIGltcG9ydGFudCAnVEFSR0VUJyBpcyBsYXN0IGhlcmUgc28g
dGhhdCBpdCBvdmVycmlkZXMgb3VyIGxlc3MKICAgICMgaW5mb3JtZWQgY2hvaWNlcyBmb3IgQlVJ
TEQgJiBIT1NUIGlmIFRBUkdFVCBoYXBwZW5zIHRvIGJlIHRoZSBzYW1lIGFzCiAgICAjIGVpdGhl
ciBvZiB0aGVtLgogICAgZm9yIHRoaW5nIGluIFsnQlVJTEQnLCAnSE9TVCcsICdUQVJHRVQnXToK
ICAgICAgICBiYi5kZWJ1ZygxLCAicnVzdF9nZW5fdGFyZ2V0IGZvciAiICsgdGhpbmcpCiAgICAg
ICAgZmVhdHVyZXMgPSAiIgogICAgICAgIGNwdSA9ICJnZW5lcmljIgogICAgICAgIGFyY2ggPSBk
LmdldFZhcigne31fQVJDSCcuZm9ybWF0KHRoaW5nKSkKICAgICAgICBpZiB0aGluZyBpcyAiVEFS
R0VUIjoKICAgICAgICAgICAgIyBhcm0gYW5kIGFybXY3IGhhdmUgZGlmZmVyZW50IHRhcmdldHMg
aW4gbGx2bQogICAgICAgICAgICBpZiBhcmNoID09ICJhcm0iIGFuZCB0YXJnZXRfaXNfYXJtdjco
ZCk6CiAgICAgICAgICAgICAgICBhcmNoID0gJ2FybXY3JwogICAgICAgICAgICBmZWF0dXJlcyA9
IGQuZ2V0VmFyKCdUQVJHRVRfTExWTV9GRUFUVVJFUycpIG9yICIiCiAgICAgICAgICAgIGNwdSA9
IGQuZ2V0VmFyKCdUQVJHRVRfTExWTV9DUFUnKQogICAgICAgIHJ1c3RfZ2VuX3RhcmdldChkLCB0
aGluZywgd2QsIGZlYXR1cmVzLCBjcHUsIGFyY2gpCgpWYXJpYWJsZSBBUk1fVEhVTUJfT1BUIHZh
bHVlIGlzIE5vbmUKVmFyaWFibGUgREVGQVVMVFRVTkUgdmFsdWUgaXMgY29yZTItMzIKVmFyaWFi
bGUgTUFDSElORSB2YWx1ZSBpcyBxZW11eDg2Y29weQpWYXJpYWJsZSBNQUNISU5FT1ZFUlJJREVT
IHZhbHVlIGlzICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdUVU5FX0ZFQVRVUkVTJywgJ214MzInLCAn
eDg2LXgzMjonLCAnJywgZCl9JHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLCAn
bTMyJywgJ3g4NjonLCAnJywgZCl9cWVtdWFsbDoke01BQ0hJTkV9OnFlbXV4ODYKVFVORV9GRUFU
VVJFU3ttMzJ9ID0gU2V0ClRVTkVfRkVBVFVSRVN7bXgzMn0gPSBVbnNldApWYXJpYWJsZSBQQUNL
QUdFX0FSQ0ggdmFsdWUgaXMgJHtCVUlMRF9BUkNIfQpWYXJpYWJsZSBSVVNUX1BBTklDX1NUUkFU
RUdZIHZhbHVlIGlzIHVud2luZApWYXJpYWJsZSBUQVJHRVRfQVJDSCB2YWx1ZSBpcyAke1RVTkVf
QVJDSH0KVmFyaWFibGUgVEFSR0VUX0NDX0FSQ0ggdmFsdWUgaXMgJHtUVU5FX0NDQVJHU30gLS1z
eXNyb290PSR7U1RBR0lOR19ESVJfVEFSR0VUfQpWYXJpYWJsZSBUQVJHRVRfRlBVIHZhbHVlIGlz
IApWYXJpYWJsZSBUQVJHRVRfTExWTV9DUFUgdmFsdWUgaXMgJHtAbGx2bV9jcHUoZCl9ClZhcmlh
YmxlIFRBUkdFVF9MTFZNX0ZFQVRVUkVTIHZhbHVlIGlzICR7QGxsdm1fZmVhdHVyZXMoZCl9ClZh
cmlhYmxlIFRSQU5TTEFURURfVEFSR0VUX0FSQ0ggdmFsdWUgaXMgJHtAZC5nZXRWYXIoJ1RBUkdF
VF9BUkNIJykucmVwbGFjZSgiXyIsICItIil9ClZhcmlhYmxlIFRVTkVfQVJDSCB2YWx1ZSBpcyAk
e0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsICdtMzInLCAnJHtYODZBUkNIMzJ9
JywgJycsIGQpfSR7QGJiLnV0aWxzLmNvbnRhaW5zKCdUVU5FX0ZFQVRVUkVTJywgJ214MzInLCAn
JHtYODZBUkNINjR9JywgJycsIGQpfSR7QGJiLnV0aWxzLmNvbnRhaW5zKCdUVU5FX0ZFQVRVUkVT
JywgJ202NCcsICcke1g4NkFSQ0g2NH0nLCAnJywgZCl9ClRVTkVfRkVBVFVSRVN7bTMyfSA9IFNl
dApUVU5FX0ZFQVRVUkVTe202NH0gPSBVbnNldApUVU5FX0ZFQVRVUkVTe214MzJ9ID0gVW5zZXQK
VmFyaWFibGUgVFVORV9DQ0FSR1MgdmFsdWUgaXMgIC1tMzIgLW1hcmNoPWNvcmUyIC1tdHVuZT1j
b3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlClZhcmlhYmxlIFRVTkVfRkVBVFVSRVMgdmFsdWUgaXMg
JHtUVU5FX0ZFQVRVUkVTOnR1bmUtJHtERUZBVUxUVFVORX19ClZhcmlhYmxlIFRVTkVfRkVBVFVS
RVM6dHVuZS1jb3JlMi0zMiB2YWx1ZSBpcyAke1RVTkVfRkVBVFVSRVM6dHVuZS14ODZ9IGNvcmUy
ClZhcmlhYmxlIFRVTkVfRkVBVFVSRVM6dHVuZS14ODYgdmFsdWUgaXMgbTMyClZhcmlhYmxlIFg4
NkFSQ0gzMiB2YWx1ZSBpcyBpNjg2ClZhcmlhYmxlIFg4NkFSQ0g2NCB2YWx1ZSBpcyB4ODZfNjQK
VmFyaWFibGUgYXJjaF90b19ydXN0X3RhcmdldF9hcmNoIHZhbHVlIGlzIGRlZiBhcmNoX3RvX3J1
c3RfdGFyZ2V0X2FyY2goYXJjaCk6CiAgICBpZiBhcmNoID09ICJpNTg2IiBvciBhcmNoID09ICJp
Njg2IjoKICAgICAgICByZXR1cm4gIng4NiIKICAgIGVsaWYgYXJjaCA9PSAibWlwc2VsIjoKICAg
ICAgICByZXR1cm4gIm1pcHMiCiAgICBlbGlmIGFyY2ggPT0gIm1pcDY0c2VsIjoKICAgICAgICBy
ZXR1cm4gIm1pcHM2NCIKICAgIGVsaWYgYXJjaCA9PSAiYXJtdjciOgogICAgICAgIHJldHVybiAi
YXJtIgogICAgZWxpZiBhcmNoID09ICJwb3dlcnBjNjRsZSI6CiAgICAgICAgcmV0dXJuICJwb3dl
cnBjNjQiCiAgICBlbHNlOgogICAgICAgIHJldHVybiBhcmNoCgojIGdlbmVyYXRlcyBvdXIgdGFy
Z2V0IENQVSB2YWx1ZQpWYXJpYWJsZSBsbHZtX2NwdSB2YWx1ZSBpcyBkZWYgbGx2bV9jcHUoZCk6
CiAgICBjcHUgPSBkLmdldFZhcignUEFDS0FHRV9BUkNIJykKICAgIHRhcmdldCA9IGQuZ2V0VmFy
KCdUUkFOU0xBVEVEX1RBUkdFVF9BUkNIJykKCiAgICB0cmFucyA9IHt9CiAgICB0cmFuc1snY29y
ZWk3LTY0J10gPSAiY29yZWk3IgogICAgdHJhbnNbJ2NvcmUyLTMyJ10gPSAiY29yZTIiCiAgICB0
cmFuc1sneDg2LTY0J10gPSAieDg2LTY0IgogICAgdHJhbnNbJ2k2ODYnXSA9ICJpNjg2IgogICAg
dHJhbnNbJ2k1ODYnXSA9ICJpNTg2IgogICAgdHJhbnNbJ3Bvd2VycGMnXSA9ICJwb3dlcnBjIgog
ICAgdHJhbnNbJ21pcHM2NCddID0gIm1pcHM2NCIKICAgIHRyYW5zWydtaXBzNjRlbCddID0gIm1p
cHM2NCIKICAgIHRyYW5zWydyaXNjdjY0J10gPSAiZ2VuZXJpYy1ydjY0IgogICAgdHJhbnNbJ3Jp
c2N2MzInXSA9ICJnZW5lcmljLXJ2MzIiCgogICAgaWYgdGFyZ2V0IGluIFsibWlwcyIsICJtaXBz
ZWwiXToKICAgICAgICBmZWF0ID0gZnJvemVuc2V0KGQuZ2V0VmFyKCdUVU5FX0ZFQVRVUkVTJyku
c3BsaXQoKSkKICAgICAgICBpZiAibWlwczMycjIiIGluIGZlYXQ6CiAgICAgICAgICAgIHRyYW5z
WydtaXBzZWwnXSA9ICJtaXBzMzJyMiIKICAgICAgICAgICAgdHJhbnNbJ21pcHMnXSA9ICJtaXBz
MzJyMiIKICAgICAgICBlbGlmICJtaXBzMzIiIGluIGZlYXQ6CiAgICAgICAgICAgIHRyYW5zWydt
aXBzZWwnXSA9ICJtaXBzMzIiCiAgICAgICAgICAgIHRyYW5zWydtaXBzJ10gPSAibWlwczMyIgoK
ICAgIHRyeToKICAgICAgICByZXR1cm4gdHJhbnNbY3B1XQogICAgZXhjZXB0OgogICAgICAgIHJl
dHVybiB0cmFucy5nZXQodGFyZ2V0LCAiZ2VuZXJpYyIpCgpWYXJpYWJsZSBsbHZtX2ZlYXR1cmVz
IHZhbHVlIGlzIGRlZiBsbHZtX2ZlYXR1cmVzKGQpOgogICAgcmV0dXJuICcsJy5qb2luKGxsdm1f
ZmVhdHVyZXNfZnJvbV90dW5lKGQpICsKICAgICAgICAgICAgICAgICAgICBsbHZtX2ZlYXR1cmVz
X2Zyb21fY2NfYXJjaChkKSArCiAgICAgICAgICAgICAgICAgICAgbGx2bV9mZWF0dXJlc19mcm9t
X3RhcmdldF9mcHUoZCkpCgoKIyMgYXJtLXVua25vd24tbGludXgtZ251ZWFiaWhmClZhcmlhYmxl
IGxsdm1fZmVhdHVyZXNfZnJvbV9jY19hcmNoIHZhbHVlIGlzIGRlZiBsbHZtX2ZlYXR1cmVzX2Zy
b21fY2NfYXJjaChkKToKICAgIGYgPSBbXQogICAgZmVhdCA9IGQuZ2V0VmFyKCdUQVJHRVRfQ0Nf
QVJDSCcpCiAgICBpZiBub3QgZmVhdDoKICAgICAgICByZXR1cm4gW10KICAgIGZlYXQgPSBmcm96
ZW5zZXQoZmVhdC5zcGxpdCgpKQoKICAgIGlmICctbW1teCcgaW4gZmVhdDoKICAgICAgICBmLmFw
cGVuZCgiK21teCIpCiAgICBpZiAnLW1zc2UnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIitz
c2UiKQogICAgaWYgJy1tc3NlMicgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK3NzZTIiKQog
ICAgaWYgJy1tc3NlMycgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK3NzZTMiKQogICAgaWYg
Jy1tc3NzZTMnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIitzc3NlMyIpCiAgICBpZiAnLW1z
c2U0LjEnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIitzc2U0LjEiKQogICAgaWYgJy1tc3Nl
NC4yJyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrc3NlNC4yIikKICAgIGlmICctbXNzZTRh
JyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrc3NlNGEiKQogICAgaWYgJy1tYXZ4JyBpbiBm
ZWF0OgogICAgICAgIGYuYXBwZW5kKCIrYXZ4IikKICAgIGlmICctbWF2eDInIGluIGZlYXQ6CiAg
ICAgICAgZi5hcHBlbmQoIithdngyIikKCiAgICByZXR1cm4gZgoKVmFyaWFibGUgbGx2bV9mZWF0
dXJlc19mcm9tX3RhcmdldF9mcHUgdmFsdWUgaXMgZGVmIGxsdm1fZmVhdHVyZXNfZnJvbV90YXJn
ZXRfZnB1KGQpOgogICAgIyBUQVJHRVRfRlBVIGNhbiBiZSBoYXJkIG9yIHNvZnQuICtzb2Z0LWZs
b2F0IHRlbGwgbGx2bSB0byB1c2Ugc29mdCBmbG9hdAogICAgIyBBQkkuIFRoZXJlIGlzIG5vIG9w
dGlvbiBmb3IgaGFyZC4KCiAgICBmcHUgPSBkLmdldFZhcignVEFSR0VUX0ZQVScsIFRydWUpCiAg
ICByZXR1cm4gWyIrc29mdC1mbG9hdCJdIGlmIGZwdSA9PSAic29mdCIgZWxzZSBbXQoKVmFyaWFi
bGUgbGx2bV9mZWF0dXJlc19mcm9tX3R1bmUgdmFsdWUgaXMgZGVmIGxsdm1fZmVhdHVyZXNfZnJv
bV90dW5lKGQpOgogICAgZiA9IFtdCiAgICBmZWF0ID0gZC5nZXRWYXIoJ1RVTkVfRkVBVFVSRVMn
KQogICAgaWYgbm90IGZlYXQ6CiAgICAgICAgcmV0dXJuIFtdCiAgICBmZWF0ID0gZnJvemVuc2V0
KGZlYXQuc3BsaXQoKSkKCiAgICBtYWNoX292ZXJyaWRlcyA9IGQuZ2V0VmFyKCdNQUNISU5FT1ZF
UlJJREVTJykKICAgIG1hY2hfb3ZlcnJpZGVzID0gZnJvemVuc2V0KG1hY2hfb3ZlcnJpZGVzLnNw
bGl0KCc6JykpCgogICAgaWYgJ3ZmcHY0JyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrdmZw
NCIpCiAgICBpZiAndmZwdjMnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIit2ZnAzIikKICAg
IGlmICd2ZnB2M2QxNicgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2QxNiIpCgogICAgaWYg
J3ZmcHYyJyBpbiBmZWF0IG9yICd2ZnAnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIit2ZnAy
IikKCiAgICBpZiAnbmVvbicgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK25lb24iKQoKICAg
IGlmICdtaXBzMzInIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIittaXBzMzIiKQoKICAgIGlm
ICdtaXBzMzJyMicgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK21pcHMzMnIyIikKCiAgICBp
ZiB0YXJnZXRfaXNfYXJtdjcoZCk6CiAgICAgICAgZi5hcHBlbmQoJyt2NycpCgogICAgaWYgKCdh
cm12NicgaW4gbWFjaF9vdmVycmlkZXMpIG9yICgnYXJtdjYnIGluIGZlYXQpOgogICAgICAgIGYu
YXBwZW5kKCIrdjYiKQogICAgaWYgJ2FybXY1dGUnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQo
IitzdHJpY3QtYWxpZ24iKQogICAgICAgIGYuYXBwZW5kKCIrdjV0ZSIpCiAgICBlbGlmICdhcm12
NScgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK3N0cmljdC1hbGlnbiIpCiAgICAgICAgZi5h
cHBlbmQoIit2NSIpCgogICAgaWYgKCdhcm12NCcgaW4gbWFjaF9vdmVycmlkZXMpIG9yICgnYXJt
djQnIGluIGZlYXQpOgogICAgICAgIGYuYXBwZW5kKCIrc3RyaWN0LWFsaWduIikKCiAgICBpZiAn
ZHNwJyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrZHNwIikKCiAgICBpZiAndGh1bWInIGlu
IGZlYXQ6CiAgICAgICAgaWYgZC5nZXRWYXIoJ0FSTV9USFVNQl9PUFQnKSA9PSAidGh1bWIiOgog
ICAgICAgICAgICBpZiB0YXJnZXRfaXNfYXJtdjcoZCk6CiAgICAgICAgICAgICAgICBmLmFwcGVu
ZCgnK3RodW1iMicpCiAgICAgICAgICAgIGYuYXBwZW5kKCIrdGh1bWItbW9kZSIpCgogICAgaWYg
J2NvcnRleGE1JyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrYTUiKQogICAgaWYgJ2NvcnRl
eGE3JyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrYTciKQogICAgaWYgJ2NvcnRleGE5JyBp
biBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrYTkiKQogICAgaWYgJ2NvcnRleGExNScgaW4gZmVh
dDoKICAgICAgICBmLmFwcGVuZCgiK2ExNSIpCiAgICBpZiAnY29ydGV4YTE3JyBpbiBmZWF0Ogog
ICAgICAgIGYuYXBwZW5kKCIrYTE3IikKICAgIGlmICgncmlzY3Y2NCcgaW4gZmVhdCkgb3IgKCdy
aXNjdjMyJyBpbiBmZWF0KToKICAgICAgICBmLmFwcGVuZCgiK2EsK2MsK2QsK2YsK20iKQogICAg
cmV0dXJuIGYKCiMgVEFSR0VUX0NDX0FSQ0ggY2hhbmdlcyBmcm9tIGJ1aWxkL2Nyb3NzL3Rhcmdl
dCBzbyBpdCdsbCBkbyB0aGUgcmlnaHQgdGhpbmcKIyB0aGlzIHNob3VsZCBnbyBhd2F5IHdoZW4g
aHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0L3B1bGwvMzE3MDkgaXMKIyBzdGFibGUg
KDEuOS4wPykKVmFyaWFibGUgcHJlZml4X2ZvciB2YWx1ZSBpcyBkZWYgcHJlZml4X2ZvcihkLCB0
aGluZyk6CiAgICByZXR1cm4gZC5nZXRWYXIoJ3t9X1BSRUZJWCcuZm9ybWF0KHRoaW5nKSkKCiMg
Q29udmVydCBhIG5vcm1hbCBhcmNoIChIT1NUX0FSQ0gsIFRBUkdFVF9BUkNILCBCVUlMRF9BUkNI
LCBldGMpIHRvIHNvbWV0aGluZwojIHJ1c3QncyBpbnRlcm5hbHMgd29uJ3QgY2hva2Ugb24uClZh
cmlhYmxlIHJ1c3RfZ2VuX3RhcmdldCB2YWx1ZSBpcyBkZWYgcnVzdF9nZW5fdGFyZ2V0KGQsIHRo
aW5nLCB3ZCwgZmVhdHVyZXMsIGNwdSwgYXJjaCk6CiAgICBpbXBvcnQganNvbgogICAgc3lzID0g
c3lzX2ZvcihkLCB0aGluZykKICAgIHByZWZpeCA9IHByZWZpeF9mb3IoZCwgdGhpbmcpCgogICAg
ZmVhdHVyZXMgPSBmZWF0dXJlcyBvciBkLmdldFZhckZsYWcoJ0ZFQVRVUkVTJywgYXJjaCkgb3Ig
IiIKICAgIGZlYXR1cmVzID0gZmVhdHVyZXMuc3RyaXAoKQoKICAgICMgYnVpbGQgdHNwZWMKICAg
IHRzcGVjID0ge30KICAgIHRzcGVjWydsbHZtLXRhcmdldCddID0gZC5nZXRWYXJGbGFnKCdMTFZN
X1RBUkdFVCcsIGFyY2gpCiAgICB0c3BlY1snZGF0YS1sYXlvdXQnXSA9IGQuZ2V0VmFyRmxhZygn
REFUQV9MQVlPVVQnLCBhcmNoKQogICAgdHNwZWNbJ21heC1hdG9taWMtd2lkdGgnXSA9IGludChk
LmdldFZhckZsYWcoJ01BWF9BVE9NSUNfV0lEVEgnLCBhcmNoKSkKICAgIHRzcGVjWyd0YXJnZXQt
cG9pbnRlci13aWR0aCddID0gZC5nZXRWYXJGbGFnKCdUQVJHRVRfUE9JTlRFUl9XSURUSCcsIGFy
Y2gpCiAgICB0c3BlY1sndGFyZ2V0LWMtaW50LXdpZHRoJ10gPSBkLmdldFZhckZsYWcoJ1RBUkdF
VF9DX0lOVF9XSURUSCcsIGFyY2gpCiAgICB0c3BlY1sndGFyZ2V0LWVuZGlhbiddID0gZC5nZXRW
YXJGbGFnKCdUQVJHRVRfRU5ESUFOJywgYXJjaCkKICAgIHRzcGVjWydhcmNoJ10gPSBhcmNoX3Rv
X3J1c3RfdGFyZ2V0X2FyY2goYXJjaCkKICAgIHRzcGVjWydvcyddID0gImxpbnV4IgogICAgaWYg
Im11c2wiIGluIHRzcGVjWydsbHZtLXRhcmdldCddOgogICAgICAgIHRzcGVjWydlbnYnXSA9ICJt
dXNsIgogICAgZWxzZToKICAgICAgICB0c3BlY1snZW52J10gPSAiZ251IgogICAgaWYgInJpc2N2
NjQiIGluIHRzcGVjWydsbHZtLXRhcmdldCddOgogICAgICAgIHRzcGVjWydsbHZtLWFiaW5hbWUn
XSA9ICJscDY0ZCIKICAgIGlmICJyaXNjdjMyIiBpbiB0c3BlY1snbGx2bS10YXJnZXQnXToKICAg
ICAgICB0c3BlY1snbGx2bS1hYmluYW1lJ10gPSAiaWxwMzJkIgogICAgdHNwZWNbJ3ZlbmRvcidd
ID0gInVua25vd24iCiAgICB0c3BlY1sndGFyZ2V0LWZhbWlseSddID0gInVuaXgiCiAgICB0c3Bl
Y1snbGlua2VyJ10gPSAie317fWdjYyIuZm9ybWF0KGQuZ2V0VmFyKCdDQ0FDSEUnKSwgcHJlZml4
KQogICAgdHNwZWNbJ2FyJ10gPSAie31hciIuZm9ybWF0KHByZWZpeCkKICAgIHRzcGVjWydjcHUn
XSA9IGNwdQogICAgaWYgZmVhdHVyZXMgIT0gIiI6CiAgICAgICAgdHNwZWNbJ2ZlYXR1cmVzJ10g
PSBmZWF0dXJlcwogICAgdHNwZWNbJ2R5bmFtaWMtbGlua2luZyddID0gVHJ1ZQogICAgdHNwZWNb
J2V4ZWN1dGFibGVzJ10gPSBUcnVlCiAgICB0c3BlY1snbGlua2VyLWlzLWdudSddID0gVHJ1ZQog
ICAgdHNwZWNbJ2xpbmtlci1mbGF2b3InXSA9ICJnY2MiCiAgICB0c3BlY1snaGFzLXJwYXRoJ10g
PSBUcnVlCiAgICB0c3BlY1snaGFzLWVsZi10bHMnXSA9IFRydWUKICAgIHRzcGVjWydwb3NpdGlv
bi1pbmRlcGVuZGVudC1leGVjdXRhYmxlcyddID0gVHJ1ZQogICAgdHNwZWNbJ3BhbmljLXN0cmF0
ZWd5J10gPSBkLmdldFZhcigiUlVTVF9QQU5JQ19TVFJBVEVHWSIpCgogICAgIyB3cml0ZSBvdXQg
dGhlIHRhcmdldCBzcGVjIGpzb24gZmlsZQogICAgd2l0aCBvcGVuKHdkICsgc3lzICsgJy5qc29u
JywgJ3cnKSBhcyBmOgogICAgICAgIGpzb24uZHVtcCh0c3BlYywgZiwgaW5kZW50PTQpCgpWYXJp
YWJsZSBzeXNfZm9yIHZhbHVlIGlzIGRlZiBzeXNfZm9yKGQsIHRoaW5nKToKICAgIHJldHVybiBk
LmdldFZhcigne31fU1lTJy5mb3JtYXQodGhpbmcpKQoKVmFyaWFibGUgdGFyZ2V0X2lzX2FybXY3
IHZhbHVlIGlzIGRlZiB0YXJnZXRfaXNfYXJtdjcoZCk6CiAgICAnJydEZXRlcm1pbmUgaWYgdGFy
Z2V0IGlzIGFybXY3JycnCiAgICAjIFRVTkVfRkVBVFVSRVMgbWF5IGluY2x1ZGUgYXJtKiBldmVu
IGlmIHRoZSB0YXJnZXQgaXMgbm90IGFybQogICAgIyBpbiB0aGUgY2FzZSBvZiAqLW5hdGl2ZSBw
YWNrYWdlcwogICAgaWYgZC5nZXRWYXIoJ1RBUkdFVF9BUkNIJykgIT0gJ2FybSc6CiAgICAgICAg
cmV0dXJuIEZhbHNlCgogICAgZmVhdCA9IGQuZ2V0VmFyKCdUVU5FX0ZFQVRVUkVTJykKICAgIGZl
YXQgPSBmcm96ZW5zZXQoZmVhdC5zcGxpdCgpKQogICAgbWFjaF9vdmVycmlkZXMgPSBkLmdldFZh
cignTUFDSElORU9WRVJSSURFUycpCiAgICBtYWNoX292ZXJyaWRlcyA9IGZyb3plbnNldChtYWNo
X292ZXJyaWRlcy5zcGxpdCgnOicpKQoKICAgIHY3PWZyb3plbnNldChbJ2FybXY3YScsICdhcm12
N3InLCAnYXJtdjdtJywgJ2FybXY3dmUnXSkKICAgIGlmIG1hY2hfb3ZlcnJpZGVzLmlzZGlzam9p
bnQodjcpIGFuZCBmZWF0LmlzZGlzam9pbnQodjcpOgogICAgICAgIHJldHVybiBGYWxzZQogICAg
ZWxzZToKICAgICAgICByZXR1cm4gVHJ1ZQoKIyBSZXNwb25zaWJsZSBmb3IgdGFraW5nIFlvY3Rv
IHRyaXBsZXMgYW5kIGNvbnZlcnRpbmcgaXQgdG8gUnVzdCB0cmlwbGVzClRhc2tzIHRoaXMgdGFz
ayBkZXBlbmRzIG9uOiBbJy9hbGEtbHBnZ3AzMS9ybWFjbGVvZC9zcmMvZGlzdHJvL3lvY3RvL3Bv
a3ktY29udHJpYi5naXQvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1jcm9zc18xLjU0
LjAuYmI6ZG9fcGF0Y2gnXQpUaGlzIHRhc2sgZGVwZW5kcyBvbiB0aGUgY2hlY2tzdW1zIG9mIGZp
bGVzOiBbXQpIYXNoIGZvciBkZXBlbmRlbnQgdGFzayAvYWxhLWxwZ2dwMzEvcm1hY2xlb2Qvc3Jj
L2Rpc3Ryby95b2N0by9wb2t5LWNvbnRyaWIuZ2l0L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0
L3J1c3QtY3Jvc3NfMS41NC4wLmJiOmRvX3BhdGNoIGlzIGVjNGE5ZWQ4NmRmMWM4YzJiMjdiYjFl
NDIyNjU1Y2IyY2VkYzFkOWEzNmI3MjBmYWI2MzZiOWFmOWUzY2NhNDgKQ29tcHV0ZWQgYmFzZSBo
YXNoIGlzIGQ2OTdjZjJjYmI1ODA3ZTgzZjhiNTVkZTgwMTJkNWJiOWFiODY3NGY0YmJmOTU1ODdm
YzNjYTgyMmE0NzI2OWIgYW5kIGZyb20gZmlsZSBkNjk3Y2YyY2JiNTgwN2U4M2Y4YjU1ZGU4MDEy
ZDViYjlhYjg2NzRmNGJiZjk1NTg3ZmMzY2E4MjJhNDcyNjliCkNvbXB1dGVkIHRhc2sgaGFzaCBp
cyA4M2QxYTI2ZWJlN2UyZGYzZjQ5NjAyNGEyOTdiYTc4MmUxNDVlNjk4MjQ1N2UwOTEwMmQ1ZTdj
NGZiZjFiM2I3Cg==

--------------ECD9F43D689B1AB7E99C7024--
