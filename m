Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.82632.1629454005488069647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 03:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=hqzLOisl;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3866a1384c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17K9A1vI024254
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 03:06:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=zWbhtyE+Kh0wDfJ82Q1T/81tLeoBn3zd6taUJpu9L6w=;
 b=hqzLOislBzQsc8gIkopzp4Z6+bW/26JMAciJOg7Lw3CSuCNtpWizhrRYLrfxZblJE57W
 SUA0OQ1dzpcsmu0EVrJyfnJhW6wCnWqtSt2MaOUsgwNvAOeOKjCcBowxqXrKi1/S48Si
 FSzgpU9YYdaWMR0VK8fBrJ7+0SgIdgvGmVqSfliCalro6X49UGRS3i3wn6QzMyyHfJTy
 XQK/TuXRS2IjzqVPpA/aGg6QkHkficnfgVElrCdLsSDX8GAU9696tZutEa7STE0lNtmQ
 lg7r9/JzUo9pJQhHMjimxBdHlGJA6S64mOX+CtoNCIsdAssGuP55p/E6Nn5cuSfQtwIw bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ahtm8gkhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 03:06:43 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17KA6hF9004438
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 03:06:43 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ahtm8gkhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Aug 2021 03:06:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpuSFi53FUbsv9zzA6ca4bLywsICAaX5CgVRBIc/UQez5mrgAI40sgrUHxe+TdHERceloVPX8qSDLTguc6rILz3r974jZ32OPHk5+WNIK7D+O3fpjYcXBaX6wJxRT9cP1l0lLM8GaLjQfj/FkODWCxsXl3kGjOajt2rhKg9mm0hCLhmv/yHvNGsoBmXu9BqeIwF2BFdv3aQL6NOXDYJBFjIfvt/D9Bra1vQ/w6+A+hEnbmPcpN4W7dnGliO/ayl++Npao8PBHykDDfwFQLpvuNLxr2f7ksGSWyx1FDRfpjQTwenuZ5Q7YSO57ZiGcw1tk8sbZptMikru2ODJayJDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWbhtyE+Kh0wDfJ82Q1T/81tLeoBn3zd6taUJpu9L6w=;
 b=BTzg6kDBydt0i3TSBNKtxnkgQBTLssaqDXqqEf72aDvE5dXV+qB+a9nTTiCJLvYz5pnrDXr4P4FHrEdiGItJ3k7jR1jR0jXEejIhxMrrDQhXwzIdjisIbN2rA8+HEeqxTMxApIiPK0fCab1B9tDyrQHjcSzdlYTOUmAVVrOeGkBfZXm79vIFjU4Ek8bogkGfZvX3ZtkxcNznoxRe0+z+UHAzsWXl0f4rNDT63gFISFx7sty5Q0wHKyfLhzYTWqB50cKHPkC2conXwd5HEJcHIFusITe9QQWLmdycqbX1Mn573QrOsbOOyJa2rzvX1B/PFaJQ4cb38rljNQZrbZMcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: linux.microsoft.com; dkim=none (message not signed)
 header.d=none;linux.microsoft.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 10:06:39 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 10:06:39 +0000
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io,
        cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com,
        Khem Raj <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
        saul.wold@windriver.com, martin.jansa@gmail.com, paul@pbarker.dev,
        Trevor Gamblin <trevor.gamblin@windriver.com>,
        anbelski@linux.microsoft.com
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
 <20210813151947.55142-1-vinay.m.engg@gmail.com>
 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
 <169C1FA457B99CA0.23238@lists.openembedded.org>
Message-ID: <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
Date: Fri, 20 Aug 2021 06:06:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <169C1FA457B99CA0.23238@lists.openembedded.org>
X-ClientProxiedBy: BY5PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::30) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by BY5PR17CA0017.namprd17.prod.outlook.com (2603:10b6:a03:1b8::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 10:06:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31ec7473-8ce9-4a7d-d1d9-08d963c23363
X-MS-TrafficTypeDiagnostic: DM4PR11MB5277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5277986E99E9BBD960AD0CFDF8C19@DM4PR11MB5277.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qbv2j+ribF135ccBCau/XMHL1zdzcoxz4KImFJFMdUmqy8jig1PVhZXsA3PM3JmKBKiva9iIVmdJFD5HgurRLYMilo6HmbYHUwOJXUPryS7Y/T8eF+NNC/zgYE43bP8u6cL3v1EmHwVjQ/1QgRtW7dqPKkKlHAEbVePalTPRz2LaoFbw0gsSOD1MmEyX/KtBz/icOT0Q1T26zjsDA0S1tPgFEE3j2JW+jSl9GvnZiFHQ3D4+Y/kpK5zPyIAvk8A7dSJx/UuVFnNMVKY5JK967Nwnp96k7UI3PTPFi3ha0cIECJbJqJzxWTYOG5NYoqKnmWS7lbInqKOCjw1r1eYU2ZfWm1DQq9WJQcrdoQDFNmGb8pDwODiUYg/3LghwJ3Vr9E7jb0CPbXDOf7srwdpZ5AOQRO9Okf5EJ0RaZ3WYM9TACoHgZl5r694rMJ3qqyYulnwqBrzuVGCrWQhgL6D6yGxg3n2llv3uTV7/Ebq37qos/4086cavsuJK1dax1LGuqJFRoRlaCZAGU75ly6drOkDd71jDGkcapdEuRrtTzLJG6ewWjHPNLxvrdQT8cZcZrzzXmfWaaQ9pRldvfBbpQBIrLc4MXW3zsz6sVLyEX5nszWGlho78TjQqSPY6iOD2i0jOtzLnCxwl7TC6KGvQO1aiEGCtUaGVMkhFAb1HFKjpWaHQsT9wBpK95gWYpWRep17rlAE23EKx7GPO9VfrDL4YJnFucr7AbHYyVPD3vKQ2okvRYJSHRcENwicA6dV23dv8m0tSMzLGV/dE+l4XI2TjoM6eFjr/5PwKQQO/YqYZF3xhhDZo78PlqC/caO6ufw8n+aX1A3tu/Sw445N1xe1Xa6mcNoKNTvn714wDh9c9wJ49pfxSGj6FzAjZE8OB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39850400004)(136003)(31696002)(83380400001)(36756003)(2906002)(66946007)(38100700002)(86362001)(6666004)(31686004)(38350700002)(235185007)(6916009)(54906003)(7416002)(316002)(5660300002)(26005)(15650500001)(16576012)(8936002)(478600001)(33964004)(956004)(52116002)(4326008)(6486002)(53546011)(186003)(966005)(66556008)(66576008)(66476007)(21480400003)(2616005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2xrMVVBMGRkUWxOZ0ZpckJ1TjEwK0kyOTJ4QnRpSHZSL2xLdkh4VlcxK2NI?=
 =?utf-8?B?ME9ZbE1EOEdBdHZENlFaODVIQjZ1UTdMQXpTRzJibG9OQjN5VEgySWE0T0kr?=
 =?utf-8?B?YjNtL295cDdtVVMrMTNsQjdGdVNhYXRNVENvTHA5VVB6Y2JqdW03aDcxVHZk?=
 =?utf-8?B?dllCbkhsQ3pGNTdRWTY5alk3T1hvSGk4Z0I3aVhIYzMwYm8zMDE0SHNZZklE?=
 =?utf-8?B?cEFGdHpIc3NTSGVoM1BHdzZCYUxzK1A5L2ZTNHFlQ0VEcU1QTjJRUXN6dGVQ?=
 =?utf-8?B?MHF6WjNuTFVPMythZlJjU2VuOXBEbTlpallJZjRwL3U2YUlROGxIemRqS2Jv?=
 =?utf-8?B?dEhUUlR3dmkrYnBYL2VFcm5kWmhROUFrSDBLV3diVFJybDliaHgwNklsaWtF?=
 =?utf-8?B?SjdlK2VnTHV2OWs3elZjN0x1SDltakRQdWd1Q3VncUt3MXFHeTNlNWhBVmJV?=
 =?utf-8?B?dG1EWk5INTVtdDBEbCs0YnZiblJXUTlGMDJHaThHK3V1eFp3N3JaS0ZoM1l1?=
 =?utf-8?B?a0ZqZXR5aGN2RDNOS2c2OFJmbFFqMUx4MWNSek9FWVFwcG9BakVXWjJrSE9t?=
 =?utf-8?B?Ri8vVk9Jc2R4ajA4bWlwRlh2RXdjdW5najZEdkUrMVlVUDhSL1pFSGxqMmg2?=
 =?utf-8?B?djhPR1hSMGlDZ08ycEx0WjVscXM0Nkl0WWliakxIRGFHWUxxWGF1TGx5a2VP?=
 =?utf-8?B?eHJxQXI4VlNxcHE3Z3dhYVBmSDF5RldBemh0SHlMOVlVcjY2UXVUSmg5c25J?=
 =?utf-8?B?UFBUVmhVUEVQWTRjMlhCdkJhL216QkYyaSt6WlBFT3NQa3MweTBZajBvc1BJ?=
 =?utf-8?B?aTNodnpuNXpxUVBlT1IwVlpGd3BReHp6TzRGSDFZV1A3OEhMc3oxemFlWWd3?=
 =?utf-8?B?eVZxYUlMeTRITEM5VTU2UmsvWStxaHNNWE9DdGJrdEk1OEd6SzhuME9hSnU2?=
 =?utf-8?B?WmNMRDhVS0p3Z1pCNGRIY3BkT1ZNeXM5bjgyZkJuV3ZId2piV2FueDllOGZo?=
 =?utf-8?B?SndMbXd1THVZNlhaL0sydU5OZGo0ZllrNVdValBCYkIyOC9DbXkzc2Y3c1pr?=
 =?utf-8?B?RHk2MUhCTlNqZmJtSnhHNzViOEZhT01hYi9LdkUrMHpUSERGQlBSb3NFeXBx?=
 =?utf-8?B?clRlWk1tZnYzb0xDVEQzRVR4R3duMTNsWkI0MjdQWUo3eUFLTGFLRU1kOVB3?=
 =?utf-8?B?alhvampSTmh2eTc5U0ZKNFZHWGZZekREWmw1RG5DQVNzL0M4VW5SLzNnYmMr?=
 =?utf-8?B?VzFoWHQranIrbTF2VldGdnRTYU1yaDZ6RlYyWDF3L1MzdXkxZ1V0QWk4OGJ3?=
 =?utf-8?B?R09nRmNsVlFHc3E1TUdGaDE5aWU2a2xpcTM3cDFSbnpBZk8rVXZneXlkVTYz?=
 =?utf-8?B?a21kUlFYSjZqTERZWitmcStJTFM3dXRQNU5tNkhOb1lYdzZaWStZSWZXQVB1?=
 =?utf-8?B?WjExMFlqRU5pS1dtM1ltWmNrTllnQUUvMXJPeDA2SlBndHl2MmNvWUI3QVVx?=
 =?utf-8?B?U2s4eUJSOTRrUzNsbWpkS1NSbjRDRTlKRnRmU0w1aXVzeHdvOENjUHZyanlP?=
 =?utf-8?B?bCsvRVhKd2NZRFc1a3d1czVySHlHdkVWdHhmWjJ1QkRTazhGdFdvdjdJR1Vu?=
 =?utf-8?B?SVZFeWtlZGR5UFMwUWtuZFk3bkNNMnpkbXdNckJhWXFrYzU5YlJiaVRKb285?=
 =?utf-8?B?NlhjRDhPUU1KREp2Z2ZUNkNVbGhKUEYzS3hENVNnVVMzdkRUamt5ajVTcE82?=
 =?utf-8?Q?8R+zl24djpd6ByiusYu1aQnZK8fQS1wW1EIWna+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ec7473-8ce9-4a7d-d1d9-08d963c23363
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 10:06:39.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Js2M92OL5+GWZLr/HWRq8eWamm72hDUg7b4VqloYvPkmI0QjTSli9reXvYwJZ0Fq6T57tXzHUkh2Hxb++oL7je6EQxb+CBzuHjLVIVad4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
X-Proofpoint-ORIG-GUID: YWKzTs_xn_9U6_jCor8izW8V8PUCetd3
X-Proofpoint-GUID: h_sCChanmDOs641dZQ63Az1tZOemJWTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-20_03,2021-08-20_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108200057
X-Groupsio-MsgNum: 155022
Content-Type: multipart/mixed;
 boundary="------------5B2540863C54AC13B23B2E88"
Content-Language: en-CA

--------------5B2540863C54AC13B23B2E88
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17K9A1vI024254

Added Trevor who may be working on upgrading python-cryptography.
Added Anatol since he was interested last time we worked on merging.

Again, let me know if you want to be dropped by replying privately.
No one from the meta-rust community responded last time so I'm
assuming that y'all are just on vacation! ;-)

On 2021-08-17 10:52 a.m., Randy MacLeod wrote:
> On 2021-08-13 11:22 a.m., Vinay Kumar wrote:
>> Hi Randy,
>>
>>>> Vinay or I will look into glibc/qemuppc64
>>>> if no one else is working on that.
>>
>> The failure is due to the below error in libstd-rs package build.
>> "error: unrecognized arch "powerpc64le" in target specification"
>>
>> The reason for this is "arch": "powerpc64le" from the below target
>> specific file.
>>

,,,

>=20
> Thanks Vinay, applied.
>=20
> I'll push a new branch to poky-contrib later today.


I fixed and worked-around a few issues and pushed a new branch:

=20
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Drmacleod/rust-re=
do-aug-17-2021-a

1. There are only a few new commits including Vinay's:

    757da4cbf1e rust: remove Rust version 1.51.0 toolchain

    a4808f787ca cargo_common: remove http_proxy

    b6941135c00 rust-common.inc: Fix build failure with qemuppc64.


If anyone wants to help by doing test builds, trying to generate and use

and SDK with rust in it or anything else, that'd be great.



Alex also ran a test build on the Autobuilder:

    https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2439



but I have yet to look at the failed stages in the run.


Testing logs and debugging notes below for those interested.

../Randy



The test:
    oe-selftest -r distrodata.Distrodata.test_maintainers


is fixed by creating maintainer records for all rusty packages
and by removing the older version of the rust toolchain:
    757da4cbf1e rust: remove Rust version 1.51.0 toolchain



I suppose that if the meta-rust users want to keep an older TC
it can live in meta-rust.

Then, these tests:

    oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs

    oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs


were failing. One issue was fixed by the work-around of:

    a4808f787ca cargo_common: remove http_proxy


Debugging the next step was a challenge since I hadn't worked
with diffsigs before. Then to simplify, I removed all rusty .bb package
    ( by mv foo.bb foo.bb.hide)
until I was down to the first recipe in the dependency tree:

    rust-llvm-native.

and then running:
   oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs \
                  sstatetests.SStateTests.test_sstate_sametune_samesigs \



2021-08-19 17:54:12,878 - oe-selftest - INFO
- Ran 2 tests in 142.010s

- OK

- RESULTS:

- RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs:
       PASSED (41.45s)

- RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs:
       PASSED (98.89s)

- SUMMARY:

- oe-selftest () - Ran 2 tests in 142.012s

- oe-selftest - OK - All required tests passed
     (successes=3D2, skipped=3D0, failures=3D0, errors=3D0)


adding the next self consistent group of package:
    cargo/cargo-cross-canadian_1.54.0.bb

    cargo/cargo_1.54.0.bb

    rust/libstd-rs_1.54.0.bb

    rust/rust-cross-canadian_1.54.0.bb

    rust/rust-cross_1.54.0.bb

    rust/rust-tools-cross-canadian_1.54.0.bb

    rust/rust_1.54.0.bb



I see another http_proxy failure that seems to require a feature
drop in cargo:
=20
https://github.com/rust-lang/cargo/blob/master/src/cargo/ops/registry.rs#L5=
24

Patching out a feature doesn't seem like a good idea but
maybe someone else has a better one?

To see if there were other problems lurking menacingly behind the proxy
error, I disabled the http_proxy test in:
	meta/lib/oeqa/selftest/cases/sstatetests.py


    -http_proxy =3D "http://example.com/"

    +http_proxy =3D ""


and ran again to find:

- RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs:
       PASSED (50.63s)
- RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs:
       FAILED (160.05s)

so that's somewhat encouraging but there is still the error:

      File ".../meta/lib/oeqa/selftest/cases/sstatetests.py", line 449,
    in test_sstate_sametune_samesigs

      self.assertCountEqual(files1, files2)

AssertionError: Element counts were not equal:

First has 1, Second has 0:
'/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\
tmp-sstatesamehash/stamps/x86_64-linux/\
lib32-rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.\
fc54579cc139c777172242c3da3e0'


First has 1, Second has 0:
'/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/\
tmp-sstatesamehash/stamps/x86_64-linux/\
lib32-rust-cross-i686/1.54.0-r0.do_compile.sigdata.\
86cb5a1346b0615cb21fab3c0110cc964ecced'


... lots of similar lines of diffsig info ...


Hacking the test to not clean up and
running bitbake-dumpsigs on the two sig files for the first error,
I get the two files attached. I also attached the
    tmp/log/oe-selftest-results.log file.

That's it for now.


../Randy


>=20
> ../Randy
>>
>> On Fri, Aug 13, 2021 at 8:50 PM Vinay Kumar <vinay.m.engg@gmail.com>=20
>> wrote:
>>>
>>> rust-common.inc: Fix build failure with qemuppc64.
>>>
>>> The glibc build of "rust-hello-world" throws error in libstd-rs package=
.
>>> error: unrecognized arch "powerpc64le" in target specification
>>>
>>> The same got fixed by changing the arch to "powerpc64".
>>>
>>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>>> ---
>>> =C2=A0 meta/recipes-devtools/rust/rust-common.inc | 2 ++
>>> =C2=A0 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/rust/rust-common.inc=20
>>> b/meta/recipes-devtools/rust/rust-common.inc
>>> index 350517c723..f574152815 100644
>>> --- a/meta/recipes-devtools/rust/rust-common.inc
>>> +++ b/meta/recipes-devtools/rust/rust-common.inc
>>> @@ -248,6 +248,8 @@ def arch_to_rust_target_arch(arch):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "mips64"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif arch =3D=3D "armv7":
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "arm"
>>> +=C2=A0=C2=A0=C2=A0 elif arch =3D=3D "powerpc64le":
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "powerpc64"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return arch
>>>
>>> --=20
>>> 2.31.1
>>>
>=20
>=20
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux

--------------5B2540863C54AC13B23B2E88
Content-Type: text/plain; charset=UTF-8;
 name="lib32-rust-cross-i686--targets.sigdata.1"
Content-Disposition: attachment;
 filename="lib32-rust-cross-i686--targets.sigdata.1"
Content-Transfer-Encoding: base64

YmFzZXdoaXRlbGlzdDogeydTREtQS0dTVUZGSVgnLCAnUFdEJywgJ1NTVEFURV9IQVNIRVFVSVZf
TUVUSE9EJywgJ0JVSUxEX0FSQ0gnLCAnREVQTE9ZX0RJUicsICdIT01FJywgJ0NDQUNIRScsICdP
TVBfTlVNX1RIUkVBRFMnLCAnVVNFUicsICdQU0VVRE9fSUdOT1JFX1BBVEhTJywgJ1NUQU1QQ0xF
QU4nLCAnRVJST1JfUUEnLCAnUFJTRVJWX0hPU1QnLCAnUFJTRVJWX0RVTVBGSUxFJywgJ1BBVEgn
LCAnQ09SRUJBU0UnLCAnU09VUkNFX0RBVEVfRVBPQ0gnLCAnQ0NBQ0hFX05PSEFTSERJUicsICdT
U1RBVEVfSEFTSEVRVUlWX1JFUE9SVF9UQVNLREFUQScsICdTSEVMTCcsICdCQlBBVEgnLCAnU1NU
QVRFX1BLR0FSQ0gnLCAnTE9HTkFNRScsICdTU1RBVEVfSEFTSEVRVUlWX09XTkVSJywgJ0JCX1VO
SUhBU0gnLCAnRExfRElSJywgJ0JCU0VSVkVSJywgJ0VYVEVSTkFMX1RPT0xDSEFJTicsICdCQl9M
SU1JVEVEREVQUycsICdQUlNFUlZfTE9DS0RPV04nLCAnQ0NBQ0hFX0RJUicsICdTVEFHSU5HX0RJ
Ul9IT1NUJywgJ0xJQ0VOU0VfUEFUSCcsICdTU1RBVEVfRElSJywgJ0ZJTEVfRElSTkFNRScsICdX
T1JLRElSJywgJ0ZJTEVTRVhUUkFQQVRIUycsICdDQ0FDSEVfVE9QX0RJUicsICdQQVJBTExFTF9N
QUtFJywgJ1BLR0RBVEFfRElSJywgJ1BSU0VSVl9EVU1QRElSJywgJ0ZJTEVTUEFUSCcsICdCQl9I
QVNIU0VSVkUnLCAnV0FSTl9RQScsICdleHRlbmRfcmVjaXBlX3N5c3Jvb3QnLCAnU1RBTVBTX0RJ
UicsICdTVEFHSU5HX0RJUl9UQVJHRVQnLCAnVEhJU0RJUicsICdCVUlMREhJU1RPUllfRElSJywg
J0JCX1RBU0tIQVNIJywgJ0dJVF9DRUlMSU5HX0RJUkVDVE9SSUVTJywgJ1RNUERJUicsICdGSUxF
JywgJ0JCX1dPUktFUkNPTlRFWFQnfQp0YXNrd2hpdGVsaXN0OiBOb25lClRhc2sgZGVwZW5kZW5j
aWVzOiBbJ0FSTV9USFVNQl9PUFQnLCAnREVGQVVMVFRVTkUnLCAnTUFDSElORScsICdNQUNISU5F
T1ZFUlJJREVTJywgJ1BBQ0tBR0VfQVJDSCcsICdSVVNUX1BBTklDX1NUUkFURUdZJywgJ1RBUkdF
VF9BUkNIJywgJ1RBUkdFVF9DQ19BUkNIJywgJ1RBUkdFVF9GUFUnLCAnVEFSR0VUX0xMVk1fQ1BV
JywgJ1RBUkdFVF9MTFZNX0ZFQVRVUkVTJywgJ1RSQU5TTEFURURfVEFSR0VUX0FSQ0gnLCAnVFVO
RV9BUkNIJywgJ1RVTkVfQ0NBUkdTJywgJ1RVTkVfRkVBVFVSRVMnLCAnVFVORV9GRUFUVVJFUzp0
dW5lLXg4NicsICdYODZBUkNIMzInLCAnWDg2QVJDSDY0JywgJ2FyY2hfdG9fcnVzdF90YXJnZXRf
YXJjaCcsICdsbHZtX2NwdScsICdsbHZtX2ZlYXR1cmVzJywgJ2xsdm1fZmVhdHVyZXNfZnJvbV9j
Y19hcmNoJywgJ2xsdm1fZmVhdHVyZXNfZnJvbV90YXJnZXRfZnB1JywgJ2xsdm1fZmVhdHVyZXNf
ZnJvbV90dW5lJywgJ3ByZWZpeF9mb3InLCAncnVzdF9nZW5fdGFyZ2V0JywgJ3N5c19mb3InLCAn
dGFyZ2V0X2lzX2FybXY3J10KYmFzZWhhc2g6IDg4NmM5OGQwOGMyZjQxZTgwMTg4YWMzMzE5OGEw
YjRmNmM0MmUzYTE2OTRiNzhmZGZjMzVlNmJkZmM1YzYyMTQKTGlzdCBvZiBkZXBlbmRlbmNpZXMg
Zm9yIHZhcmlhYmxlIEFSTV9USFVNQl9PUFQgaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMg
Zm9yIHZhcmlhYmxlIERFRkFVTFRUVU5FIGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZv
ciB2YXJpYWJsZSBNQUNISU5FIGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJp
YWJsZSBNQUNISU5FT1ZFUlJJREVTIGlzIHsnTUFDSElORSd9Ckxpc3Qgb2YgZGVwZW5kZW5jaWVz
IGZvciB2YXJpYWJsZSBQQUNLQUdFX0FSQ0ggaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMg
Zm9yIHZhcmlhYmxlIFJVU1RfUEFOSUNfU1RSQVRFR1kgaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRl
bmNpZXMgZm9yIHZhcmlhYmxlIFRBUkdFVF9BUkNIIGlzIHsnVFVORV9BUkNIJ30KTGlzdCBvZiBk
ZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIFRBUkdFVF9DQ19BUkNIIGlzIHsnVFVORV9DQ0FSR1Mn
fQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgVEFSR0VUX0ZQVSBpcyBzZXQoKQpM
aXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgVEFSR0VUX0xMVk1fQ1BVIGlzIHsnbGx2
bV9jcHUnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgVEFSR0VUX0xMVk1fRkVB
VFVSRVMgaXMgeydsbHZtX2ZlYXR1cmVzJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlh
YmxlIFRSQU5TTEFURURfVEFSR0VUX0FSQ0ggaXMgeydUQVJHRVRfQVJDSCd9Ckxpc3Qgb2YgZGVw
ZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUVU5FX0FSQ0ggaXMgeydYODZBUkNINjQnLCAnWDg2QVJD
SDMyJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIFRVTkVfQ0NBUkdTIGlzIHNl
dCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUVU5FX0ZFQVRVUkVTIGlzIHsn
REVGQVVMVFRVTkUnLCAnVFVORV9GRUFUVVJFUzp0dW5lLXg4Nid9Ckxpc3Qgb2YgZGVwZW5kZW5j
aWVzIGZvciB2YXJpYWJsZSBUVU5FX0ZFQVRVUkVTOnR1bmUteDg2IGlzIHNldCgpCkxpc3Qgb2Yg
ZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBYODZBUkNIMzIgaXMgc2V0KCkKTGlzdCBvZiBkZXBl
bmRlbmNpZXMgZm9yIHZhcmlhYmxlIFg4NkFSQ0g2NCBpcyBzZXQoKQpMaXN0IG9mIGRlcGVuZGVu
Y2llcyBmb3IgdmFyaWFibGUgYXJjaF90b19ydXN0X3RhcmdldF9hcmNoIGlzIHNldCgpCkxpc3Qg
b2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBsbHZtX2NwdSBpcyB7J1BBQ0tBR0VfQVJDSCcs
ICdUVU5FX0ZFQVRVUkVTJywgJ1RSQU5TTEFURURfVEFSR0VUX0FSQ0gnfQpMaXN0IG9mIGRlcGVu
ZGVuY2llcyBmb3IgdmFyaWFibGUgbGx2bV9mZWF0dXJlcyBpcyB7J2xsdm1fZmVhdHVyZXNfZnJv
bV90dW5lJywgJ2xsdm1fZmVhdHVyZXNfZnJvbV90YXJnZXRfZnB1JywgJ2xsdm1fZmVhdHVyZXNf
ZnJvbV9jY19hcmNoJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIGxsdm1fZmVh
dHVyZXNfZnJvbV9jY19hcmNoIGlzIHsnVEFSR0VUX0NDX0FSQ0gnfQpMaXN0IG9mIGRlcGVuZGVu
Y2llcyBmb3IgdmFyaWFibGUgbGx2bV9mZWF0dXJlc19mcm9tX3RhcmdldF9mcHUgaXMgeydUQVJH
RVRfRlBVJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIGxsdm1fZmVhdHVyZXNf
ZnJvbV90dW5lIGlzIHsnQVJNX1RIVU1CX09QVCcsICd0YXJnZXRfaXNfYXJtdjcnLCAnVFVORV9G
RUFUVVJFUycsICdNQUNISU5FT1ZFUlJJREVTJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZh
cmlhYmxlIHByZWZpeF9mb3IgaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlh
YmxlIHJ1c3RfZ2VuX3RhcmdldCBpcyB7J1JVU1RfUEFOSUNfU1RSQVRFR1knLCAnc3lzX2Zvcics
ICdwcmVmaXhfZm9yJywgJ2FyY2hfdG9fcnVzdF90YXJnZXRfYXJjaCd9Ckxpc3Qgb2YgZGVwZW5k
ZW5jaWVzIGZvciB2YXJpYWJsZSBzeXNfZm9yIGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVz
IGZvciB2YXJpYWJsZSB0YXJnZXRfaXNfYXJtdjcgaXMgeydUQVJHRVRfQVJDSCcsICdUVU5FX0ZF
QVRVUkVTJywgJ01BQ0hJTkVPVkVSUklERVMnfQpWYXJpYWJsZSBkb19ydXN0X2dlbl90YXJnZXRz
IHZhbHVlIGlzICAgICB3ZCA9IGQuZ2V0VmFyKCdXT1JLRElSJykgKyAnL3RhcmdldHMvJwogICAg
IyBJdCBpcyBpbXBvcnRhbnQgJ1RBUkdFVCcgaXMgbGFzdCBoZXJlIHNvIHRoYXQgaXQgb3ZlcnJp
ZGVzIG91ciBsZXNzCiAgICAjIGluZm9ybWVkIGNob2ljZXMgZm9yIEJVSUxEICYgSE9TVCBpZiBU
QVJHRVQgaGFwcGVucyB0byBiZSB0aGUgc2FtZSBhcwogICAgIyBlaXRoZXIgb2YgdGhlbS4KICAg
IGZvciB0aGluZyBpbiBbJ0JVSUxEJywgJ0hPU1QnLCAnVEFSR0VUJ106CiAgICAgICAgYmIuZGVi
dWcoMSwgInJ1c3RfZ2VuX3RhcmdldCBmb3IgIiArIHRoaW5nKQogICAgICAgIGZlYXR1cmVzID0g
IiIKICAgICAgICBjcHUgPSAiZ2VuZXJpYyIKICAgICAgICBhcmNoID0gZC5nZXRWYXIoJ3t9X0FS
Q0gnLmZvcm1hdCh0aGluZykpCiAgICAgICAgaWYgdGhpbmcgaXMgIlRBUkdFVCI6CiAgICAgICAg
ICAgICMgYXJtIGFuZCBhcm12NyBoYXZlIGRpZmZlcmVudCB0YXJnZXRzIGluIGxsdm0KICAgICAg
ICAgICAgaWYgYXJjaCA9PSAiYXJtIiBhbmQgdGFyZ2V0X2lzX2FybXY3KGQpOgogICAgICAgICAg
ICAgICAgYXJjaCA9ICdhcm12NycKICAgICAgICAgICAgZmVhdHVyZXMgPSBkLmdldFZhcignVEFS
R0VUX0xMVk1fRkVBVFVSRVMnKSBvciAiIgogICAgICAgICAgICBjcHUgPSBkLmdldFZhcignVEFS
R0VUX0xMVk1fQ1BVJykKICAgICAgICBydXN0X2dlbl90YXJnZXQoZCwgdGhpbmcsIHdkLCBmZWF0
dXJlcywgY3B1LCBhcmNoKQoKVmFyaWFibGUgQVJNX1RIVU1CX09QVCB2YWx1ZSBpcyBOb25lClZh
cmlhYmxlIERFRkFVTFRUVU5FIHZhbHVlIGlzIHg4NgpWYXJpYWJsZSBNQUNISU5FIHZhbHVlIGlz
IHFlbXV4ODYKVmFyaWFibGUgTUFDSElORU9WRVJSSURFUyB2YWx1ZSBpcyAke0BiYi51dGlscy5j
b250YWlucygnVFVORV9GRUFUVVJFUycsICdteDMyJywgJ3g4Ni14MzI6JywgJycsIGQpfSR7QGJi
LnV0aWxzLmNvbnRhaW5zKCdUVU5FX0ZFQVRVUkVTJywgJ20zMicsICd4ODY6JywgJycsIGQpfXFl
bXVhbGw6JHtNQUNISU5FfQpUVU5FX0ZFQVRVUkVTe20zMn0gPSBTZXQKVFVORV9GRUFUVVJFU3tt
eDMyfSA9IFVuc2V0ClZhcmlhYmxlIFBBQ0tBR0VfQVJDSCB2YWx1ZSBpcyAke0JVSUxEX0FSQ0h9
ClZhcmlhYmxlIFJVU1RfUEFOSUNfU1RSQVRFR1kgdmFsdWUgaXMgdW53aW5kClZhcmlhYmxlIFRB
UkdFVF9BUkNIIHZhbHVlIGlzICR7VFVORV9BUkNIfQpWYXJpYWJsZSBUQVJHRVRfQ0NfQVJDSCB2
YWx1ZSBpcyAke1RVTkVfQ0NBUkdTfSAtLXN5c3Jvb3Q9JHtTVEFHSU5HX0RJUl9UQVJHRVR9ClZh
cmlhYmxlIFRBUkdFVF9GUFUgdmFsdWUgaXMgClZhcmlhYmxlIFRBUkdFVF9MTFZNX0NQVSB2YWx1
ZSBpcyAke0BsbHZtX2NwdShkKX0KVmFyaWFibGUgVEFSR0VUX0xMVk1fRkVBVFVSRVMgdmFsdWUg
aXMgJHtAbGx2bV9mZWF0dXJlcyhkKX0KVmFyaWFibGUgVFJBTlNMQVRFRF9UQVJHRVRfQVJDSCB2
YWx1ZSBpcyAke0BkLmdldFZhcignVEFSR0VUX0FSQ0gnKS5yZXBsYWNlKCJfIiwgIi0iKX0KVmFy
aWFibGUgVFVORV9BUkNIIHZhbHVlIGlzICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdUVU5FX0ZFQVRV
UkVTJywgJ20zMicsICcke1g4NkFSQ0gzMn0nLCAnJywgZCl9JHtAYmIudXRpbHMuY29udGFpbnMo
J1RVTkVfRkVBVFVSRVMnLCAnbXgzMicsICcke1g4NkFSQ0g2NH0nLCAnJywgZCl9JHtAYmIudXRp
bHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLCAnbTY0JywgJyR7WDg2QVJDSDY0fScsICcnLCBk
KX0KVFVORV9GRUFUVVJFU3ttMzJ9ID0gU2V0ClRVTkVfRkVBVFVSRVN7bTY0fSA9IFVuc2V0ClRV
TkVfRkVBVFVSRVN7bXgzMn0gPSBVbnNldApWYXJpYWJsZSBUVU5FX0NDQVJHUyB2YWx1ZSBpcyAg
LW0zMgpWYXJpYWJsZSBUVU5FX0ZFQVRVUkVTIHZhbHVlIGlzICR7VFVORV9GRUFUVVJFUzp0dW5l
LSR7REVGQVVMVFRVTkV9fQpWYXJpYWJsZSBUVU5FX0ZFQVRVUkVTOnR1bmUteDg2IHZhbHVlIGlz
IG0zMgpWYXJpYWJsZSBYODZBUkNIMzIgdmFsdWUgaXMgaTY4NgpWYXJpYWJsZSBYODZBUkNINjQg
dmFsdWUgaXMgeDg2XzY0ClZhcmlhYmxlIGFyY2hfdG9fcnVzdF90YXJnZXRfYXJjaCB2YWx1ZSBp
cyBkZWYgYXJjaF90b19ydXN0X3RhcmdldF9hcmNoKGFyY2gpOgogICAgaWYgYXJjaCA9PSAiaTU4
NiIgb3IgYXJjaCA9PSAiaTY4NiI6CiAgICAgICAgcmV0dXJuICJ4ODYiCiAgICBlbGlmIGFyY2gg
PT0gIm1pcHNlbCI6CiAgICAgICAgcmV0dXJuICJtaXBzIgogICAgZWxpZiBhcmNoID09ICJtaXA2
NHNlbCI6CiAgICAgICAgcmV0dXJuICJtaXBzNjQiCiAgICBlbGlmIGFyY2ggPT0gImFybXY3IjoK
ICAgICAgICByZXR1cm4gImFybSIKICAgIGVsaWYgYXJjaCA9PSAicG93ZXJwYzY0bGUiOgogICAg
ICAgIHJldHVybiAicG93ZXJwYzY0IgogICAgZWxzZToKICAgICAgICByZXR1cm4gYXJjaAoKIyBn
ZW5lcmF0ZXMgb3VyIHRhcmdldCBDUFUgdmFsdWUKVmFyaWFibGUgbGx2bV9jcHUgdmFsdWUgaXMg
ZGVmIGxsdm1fY3B1KGQpOgogICAgY3B1ID0gZC5nZXRWYXIoJ1BBQ0tBR0VfQVJDSCcpCiAgICB0
YXJnZXQgPSBkLmdldFZhcignVFJBTlNMQVRFRF9UQVJHRVRfQVJDSCcpCgogICAgdHJhbnMgPSB7
fQogICAgdHJhbnNbJ2NvcmVpNy02NCddID0gImNvcmVpNyIKICAgIHRyYW5zWydjb3JlMi0zMidd
ID0gImNvcmUyIgogICAgdHJhbnNbJ3g4Ni02NCddID0gIng4Ni02NCIKICAgIHRyYW5zWydpNjg2
J10gPSAiaTY4NiIKICAgIHRyYW5zWydpNTg2J10gPSAiaTU4NiIKICAgIHRyYW5zWydwb3dlcnBj
J10gPSAicG93ZXJwYyIKICAgIHRyYW5zWydtaXBzNjQnXSA9ICJtaXBzNjQiCiAgICB0cmFuc1sn
bWlwczY0ZWwnXSA9ICJtaXBzNjQiCiAgICB0cmFuc1sncmlzY3Y2NCddID0gImdlbmVyaWMtcnY2
NCIKICAgIHRyYW5zWydyaXNjdjMyJ10gPSAiZ2VuZXJpYy1ydjMyIgoKICAgIGlmIHRhcmdldCBp
biBbIm1pcHMiLCAibWlwc2VsIl06CiAgICAgICAgZmVhdCA9IGZyb3plbnNldChkLmdldFZhcign
VFVORV9GRUFUVVJFUycpLnNwbGl0KCkpCiAgICAgICAgaWYgIm1pcHMzMnIyIiBpbiBmZWF0Ogog
ICAgICAgICAgICB0cmFuc1snbWlwc2VsJ10gPSAibWlwczMycjIiCiAgICAgICAgICAgIHRyYW5z
WydtaXBzJ10gPSAibWlwczMycjIiCiAgICAgICAgZWxpZiAibWlwczMyIiBpbiBmZWF0OgogICAg
ICAgICAgICB0cmFuc1snbWlwc2VsJ10gPSAibWlwczMyIgogICAgICAgICAgICB0cmFuc1snbWlw
cyddID0gIm1pcHMzMiIKCiAgICB0cnk6CiAgICAgICAgcmV0dXJuIHRyYW5zW2NwdV0KICAgIGV4
Y2VwdDoKICAgICAgICByZXR1cm4gdHJhbnMuZ2V0KHRhcmdldCwgImdlbmVyaWMiKQoKVmFyaWFi
bGUgbGx2bV9mZWF0dXJlcyB2YWx1ZSBpcyBkZWYgbGx2bV9mZWF0dXJlcyhkKToKICAgIHJldHVy
biAnLCcuam9pbihsbHZtX2ZlYXR1cmVzX2Zyb21fdHVuZShkKSArCiAgICAgICAgICAgICAgICAg
ICAgbGx2bV9mZWF0dXJlc19mcm9tX2NjX2FyY2goZCkgKwogICAgICAgICAgICAgICAgICAgIGxs
dm1fZmVhdHVyZXNfZnJvbV90YXJnZXRfZnB1KGQpKQoKCiMjIGFybS11bmtub3duLWxpbnV4LWdu
dWVhYmloZgpWYXJpYWJsZSBsbHZtX2ZlYXR1cmVzX2Zyb21fY2NfYXJjaCB2YWx1ZSBpcyBkZWYg
bGx2bV9mZWF0dXJlc19mcm9tX2NjX2FyY2goZCk6CiAgICBmID0gW10KICAgIGZlYXQgPSBkLmdl
dFZhcignVEFSR0VUX0NDX0FSQ0gnKQogICAgaWYgbm90IGZlYXQ6CiAgICAgICAgcmV0dXJuIFtd
CiAgICBmZWF0ID0gZnJvemVuc2V0KGZlYXQuc3BsaXQoKSkKCiAgICBpZiAnLW1tbXgnIGluIGZl
YXQ6CiAgICAgICAgZi5hcHBlbmQoIittbXgiKQogICAgaWYgJy1tc3NlJyBpbiBmZWF0OgogICAg
ICAgIGYuYXBwZW5kKCIrc3NlIikKICAgIGlmICctbXNzZTInIGluIGZlYXQ6CiAgICAgICAgZi5h
cHBlbmQoIitzc2UyIikKICAgIGlmICctbXNzZTMnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQo
Iitzc2UzIikKICAgIGlmICctbXNzc2UzJyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrc3Nz
ZTMiKQogICAgaWYgJy1tc3NlNC4xJyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrc3NlNC4x
IikKICAgIGlmICctbXNzZTQuMicgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK3NzZTQuMiIp
CiAgICBpZiAnLW1zc2U0YScgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK3NzZTRhIikKICAg
IGlmICctbWF2eCcgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2F2eCIpCiAgICBpZiAnLW1h
dngyJyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrYXZ4MiIpCgogICAgcmV0dXJuIGYKClZh
cmlhYmxlIGxsdm1fZmVhdHVyZXNfZnJvbV90YXJnZXRfZnB1IHZhbHVlIGlzIGRlZiBsbHZtX2Zl
YXR1cmVzX2Zyb21fdGFyZ2V0X2ZwdShkKToKICAgICMgVEFSR0VUX0ZQVSBjYW4gYmUgaGFyZCBv
ciBzb2Z0LiArc29mdC1mbG9hdCB0ZWxsIGxsdm0gdG8gdXNlIHNvZnQgZmxvYXQKICAgICMgQUJJ
LiBUaGVyZSBpcyBubyBvcHRpb24gZm9yIGhhcmQuCgogICAgZnB1ID0gZC5nZXRWYXIoJ1RBUkdF
VF9GUFUnLCBUcnVlKQogICAgcmV0dXJuIFsiK3NvZnQtZmxvYXQiXSBpZiBmcHUgPT0gInNvZnQi
IGVsc2UgW10KClZhcmlhYmxlIGxsdm1fZmVhdHVyZXNfZnJvbV90dW5lIHZhbHVlIGlzIGRlZiBs
bHZtX2ZlYXR1cmVzX2Zyb21fdHVuZShkKToKICAgIGYgPSBbXQogICAgZmVhdCA9IGQuZ2V0VmFy
KCdUVU5FX0ZFQVRVUkVTJykKICAgIGlmIG5vdCBmZWF0OgogICAgICAgIHJldHVybiBbXQogICAg
ZmVhdCA9IGZyb3plbnNldChmZWF0LnNwbGl0KCkpCgogICAgbWFjaF9vdmVycmlkZXMgPSBkLmdl
dFZhcignTUFDSElORU9WRVJSSURFUycpCiAgICBtYWNoX292ZXJyaWRlcyA9IGZyb3plbnNldCht
YWNoX292ZXJyaWRlcy5zcGxpdCgnOicpKQoKICAgIGlmICd2ZnB2NCcgaW4gZmVhdDoKICAgICAg
ICBmLmFwcGVuZCgiK3ZmcDQiKQogICAgaWYgJ3ZmcHYzJyBpbiBmZWF0OgogICAgICAgIGYuYXBw
ZW5kKCIrdmZwMyIpCiAgICBpZiAndmZwdjNkMTYnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQo
IitkMTYiKQoKICAgIGlmICd2ZnB2MicgaW4gZmVhdCBvciAndmZwJyBpbiBmZWF0OgogICAgICAg
IGYuYXBwZW5kKCIrdmZwMiIpCgogICAgaWYgJ25lb24nIGluIGZlYXQ6CiAgICAgICAgZi5hcHBl
bmQoIituZW9uIikKCiAgICBpZiAnbWlwczMyJyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIr
bWlwczMyIikKCiAgICBpZiAnbWlwczMycjInIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIitt
aXBzMzJyMiIpCgogICAgaWYgdGFyZ2V0X2lzX2FybXY3KGQpOgogICAgICAgIGYuYXBwZW5kKCcr
djcnKQoKICAgIGlmICgnYXJtdjYnIGluIG1hY2hfb3ZlcnJpZGVzKSBvciAoJ2FybXY2JyBpbiBm
ZWF0KToKICAgICAgICBmLmFwcGVuZCgiK3Y2IikKICAgIGlmICdhcm12NXRlJyBpbiBmZWF0Ogog
ICAgICAgIGYuYXBwZW5kKCIrc3RyaWN0LWFsaWduIikKICAgICAgICBmLmFwcGVuZCgiK3Y1dGUi
KQogICAgZWxpZiAnYXJtdjUnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIitzdHJpY3QtYWxp
Z24iKQogICAgICAgIGYuYXBwZW5kKCIrdjUiKQoKICAgIGlmICgnYXJtdjQnIGluIG1hY2hfb3Zl
cnJpZGVzKSBvciAoJ2FybXY0JyBpbiBmZWF0KToKICAgICAgICBmLmFwcGVuZCgiK3N0cmljdC1h
bGlnbiIpCgogICAgaWYgJ2RzcCcgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2RzcCIpCgog
ICAgaWYgJ3RodW1iJyBpbiBmZWF0OgogICAgICAgIGlmIGQuZ2V0VmFyKCdBUk1fVEhVTUJfT1BU
JykgPT0gInRodW1iIjoKICAgICAgICAgICAgaWYgdGFyZ2V0X2lzX2FybXY3KGQpOgogICAgICAg
ICAgICAgICAgZi5hcHBlbmQoJyt0aHVtYjInKQogICAgICAgICAgICBmLmFwcGVuZCgiK3RodW1i
LW1vZGUiKQoKICAgIGlmICdjb3J0ZXhhNScgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2E1
IikKICAgIGlmICdjb3J0ZXhhNycgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2E3IikKICAg
IGlmICdjb3J0ZXhhOScgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2E5IikKICAgIGlmICdj
b3J0ZXhhMTUnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIithMTUiKQogICAgaWYgJ2NvcnRl
eGExNycgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2ExNyIpCiAgICBpZiAoJ3Jpc2N2NjQn
IGluIGZlYXQpIG9yICgncmlzY3YzMicgaW4gZmVhdCk6CiAgICAgICAgZi5hcHBlbmQoIithLCtj
LCtkLCtmLCttIikKICAgIHJldHVybiBmCgojIFRBUkdFVF9DQ19BUkNIIGNoYW5nZXMgZnJvbSBi
dWlsZC9jcm9zcy90YXJnZXQgc28gaXQnbGwgZG8gdGhlIHJpZ2h0IHRoaW5nCiMgdGhpcyBzaG91
bGQgZ28gYXdheSB3aGVuIGh0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC9wdWxsLzMx
NzA5IGlzCiMgc3RhYmxlICgxLjkuMD8pClZhcmlhYmxlIHByZWZpeF9mb3IgdmFsdWUgaXMgZGVm
IHByZWZpeF9mb3IoZCwgdGhpbmcpOgogICAgcmV0dXJuIGQuZ2V0VmFyKCd7fV9QUkVGSVgnLmZv
cm1hdCh0aGluZykpCgojIENvbnZlcnQgYSBub3JtYWwgYXJjaCAoSE9TVF9BUkNILCBUQVJHRVRf
QVJDSCwgQlVJTERfQVJDSCwgZXRjKSB0byBzb21ldGhpbmcKIyBydXN0J3MgaW50ZXJuYWxzIHdv
bid0IGNob2tlIG9uLgpWYXJpYWJsZSBydXN0X2dlbl90YXJnZXQgdmFsdWUgaXMgZGVmIHJ1c3Rf
Z2VuX3RhcmdldChkLCB0aGluZywgd2QsIGZlYXR1cmVzLCBjcHUsIGFyY2gpOgogICAgaW1wb3J0
IGpzb24KICAgIHN5cyA9IHN5c19mb3IoZCwgdGhpbmcpCiAgICBwcmVmaXggPSBwcmVmaXhfZm9y
KGQsIHRoaW5nKQoKICAgIGZlYXR1cmVzID0gZmVhdHVyZXMgb3IgZC5nZXRWYXJGbGFnKCdGRUFU
VVJFUycsIGFyY2gpIG9yICIiCiAgICBmZWF0dXJlcyA9IGZlYXR1cmVzLnN0cmlwKCkKCiAgICAj
IGJ1aWxkIHRzcGVjCiAgICB0c3BlYyA9IHt9CiAgICB0c3BlY1snbGx2bS10YXJnZXQnXSA9IGQu
Z2V0VmFyRmxhZygnTExWTV9UQVJHRVQnLCBhcmNoKQogICAgdHNwZWNbJ2RhdGEtbGF5b3V0J10g
PSBkLmdldFZhckZsYWcoJ0RBVEFfTEFZT1VUJywgYXJjaCkKICAgIHRzcGVjWydtYXgtYXRvbWlj
LXdpZHRoJ10gPSBpbnQoZC5nZXRWYXJGbGFnKCdNQVhfQVRPTUlDX1dJRFRIJywgYXJjaCkpCiAg
ICB0c3BlY1sndGFyZ2V0LXBvaW50ZXItd2lkdGgnXSA9IGQuZ2V0VmFyRmxhZygnVEFSR0VUX1BP
SU5URVJfV0lEVEgnLCBhcmNoKQogICAgdHNwZWNbJ3RhcmdldC1jLWludC13aWR0aCddID0gZC5n
ZXRWYXJGbGFnKCdUQVJHRVRfQ19JTlRfV0lEVEgnLCBhcmNoKQogICAgdHNwZWNbJ3RhcmdldC1l
bmRpYW4nXSA9IGQuZ2V0VmFyRmxhZygnVEFSR0VUX0VORElBTicsIGFyY2gpCiAgICB0c3BlY1sn
YXJjaCddID0gYXJjaF90b19ydXN0X3RhcmdldF9hcmNoKGFyY2gpCiAgICB0c3BlY1snb3MnXSA9
ICJsaW51eCIKICAgIGlmICJtdXNsIiBpbiB0c3BlY1snbGx2bS10YXJnZXQnXToKICAgICAgICB0
c3BlY1snZW52J10gPSAibXVzbCIKICAgIGVsc2U6CiAgICAgICAgdHNwZWNbJ2VudiddID0gImdu
dSIKICAgIGlmICJyaXNjdjY0IiBpbiB0c3BlY1snbGx2bS10YXJnZXQnXToKICAgICAgICB0c3Bl
Y1snbGx2bS1hYmluYW1lJ10gPSAibHA2NGQiCiAgICBpZiAicmlzY3YzMiIgaW4gdHNwZWNbJ2xs
dm0tdGFyZ2V0J106CiAgICAgICAgdHNwZWNbJ2xsdm0tYWJpbmFtZSddID0gImlscDMyZCIKICAg
IHRzcGVjWyd2ZW5kb3InXSA9ICJ1bmtub3duIgogICAgdHNwZWNbJ3RhcmdldC1mYW1pbHknXSA9
ICJ1bml4IgogICAgdHNwZWNbJ2xpbmtlciddID0gInt9e31nY2MiLmZvcm1hdChkLmdldFZhcign
Q0NBQ0hFJyksIHByZWZpeCkKICAgIHRzcGVjWydhciddID0gInt9YXIiLmZvcm1hdChwcmVmaXgp
CiAgICB0c3BlY1snY3B1J10gPSBjcHUKICAgIGlmIGZlYXR1cmVzICE9ICIiOgogICAgICAgIHRz
cGVjWydmZWF0dXJlcyddID0gZmVhdHVyZXMKICAgIHRzcGVjWydkeW5hbWljLWxpbmtpbmcnXSA9
IFRydWUKICAgIHRzcGVjWydleGVjdXRhYmxlcyddID0gVHJ1ZQogICAgdHNwZWNbJ2xpbmtlci1p
cy1nbnUnXSA9IFRydWUKICAgIHRzcGVjWydsaW5rZXItZmxhdm9yJ10gPSAiZ2NjIgogICAgdHNw
ZWNbJ2hhcy1ycGF0aCddID0gVHJ1ZQogICAgdHNwZWNbJ2hhcy1lbGYtdGxzJ10gPSBUcnVlCiAg
ICB0c3BlY1sncG9zaXRpb24taW5kZXBlbmRlbnQtZXhlY3V0YWJsZXMnXSA9IFRydWUKICAgIHRz
cGVjWydwYW5pYy1zdHJhdGVneSddID0gZC5nZXRWYXIoIlJVU1RfUEFOSUNfU1RSQVRFR1kiKQoK
ICAgICMgd3JpdGUgb3V0IHRoZSB0YXJnZXQgc3BlYyBqc29uIGZpbGUKICAgIHdpdGggb3Blbih3
ZCArIHN5cyArICcuanNvbicsICd3JykgYXMgZjoKICAgICAgICBqc29uLmR1bXAodHNwZWMsIGYs
IGluZGVudD00KQoKVmFyaWFibGUgc3lzX2ZvciB2YWx1ZSBpcyBkZWYgc3lzX2ZvcihkLCB0aGlu
Zyk6CiAgICByZXR1cm4gZC5nZXRWYXIoJ3t9X1NZUycuZm9ybWF0KHRoaW5nKSkKClZhcmlhYmxl
IHRhcmdldF9pc19hcm12NyB2YWx1ZSBpcyBkZWYgdGFyZ2V0X2lzX2FybXY3KGQpOgogICAgJycn
RGV0ZXJtaW5lIGlmIHRhcmdldCBpcyBhcm12NycnJwogICAgIyBUVU5FX0ZFQVRVUkVTIG1heSBp
bmNsdWRlIGFybSogZXZlbiBpZiB0aGUgdGFyZ2V0IGlzIG5vdCBhcm0KICAgICMgaW4gdGhlIGNh
c2Ugb2YgKi1uYXRpdmUgcGFja2FnZXMKICAgIGlmIGQuZ2V0VmFyKCdUQVJHRVRfQVJDSCcpICE9
ICdhcm0nOgogICAgICAgIHJldHVybiBGYWxzZQoKICAgIGZlYXQgPSBkLmdldFZhcignVFVORV9G
RUFUVVJFUycpCiAgICBmZWF0ID0gZnJvemVuc2V0KGZlYXQuc3BsaXQoKSkKICAgIG1hY2hfb3Zl
cnJpZGVzID0gZC5nZXRWYXIoJ01BQ0hJTkVPVkVSUklERVMnKQogICAgbWFjaF9vdmVycmlkZXMg
PSBmcm96ZW5zZXQobWFjaF9vdmVycmlkZXMuc3BsaXQoJzonKSkKCiAgICB2Nz1mcm96ZW5zZXQo
Wydhcm12N2EnLCAnYXJtdjdyJywgJ2FybXY3bScsICdhcm12N3ZlJ10pCiAgICBpZiBtYWNoX292
ZXJyaWRlcy5pc2Rpc2pvaW50KHY3KSBhbmQgZmVhdC5pc2Rpc2pvaW50KHY3KToKICAgICAgICBy
ZXR1cm4gRmFsc2UKICAgIGVsc2U6CiAgICAgICAgcmV0dXJuIFRydWUKCiMgUmVzcG9uc2libGUg
Zm9yIHRha2luZyBZb2N0byB0cmlwbGVzIGFuZCBjb252ZXJ0aW5nIGl0IHRvIFJ1c3QgdHJpcGxl
cwpUYXNrcyB0aGlzIHRhc2sgZGVwZW5kcyBvbjogWyd2aXJ0dWFsOm11bHRpbGliOmxpYjMyOi9h
bGEtbHBnZ3AzMS9ybWFjbGVvZC9zcmMvZGlzdHJvL3lvY3RvL3Bva3ktY29udHJpYi5naXQvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1jcm9zc18xLjU0LjAuYmI6ZG9fcGF0Y2gnXQpU
aGlzIHRhc2sgZGVwZW5kcyBvbiB0aGUgY2hlY2tzdW1zIG9mIGZpbGVzOiBbXQpIYXNoIGZvciBk
ZXBlbmRlbnQgdGFzayB2aXJ0dWFsOm11bHRpbGliOmxpYjMyOi9hbGEtbHBnZ3AzMS9ybWFjbGVv
ZC9zcmMvZGlzdHJvL3lvY3RvL3Bva3ktY29udHJpYi5naXQvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1c3QvcnVzdC1jcm9zc18xLjU0LjAuYmI6ZG9fcGF0Y2ggaXMgNDY1MmVhMzE4Y2VlMjE1YTg3
ZDhiOTI1YjMzNzA1MWY3YzcwY2Q0ZWU2ZTg1ZDg0OTIyOTI1ZWZjOTc5ZGZhNApDb21wdXRlZCBi
YXNlIGhhc2ggaXMgODg2Yzk4ZDA4YzJmNDFlODAxODhhYzMzMTk4YTBiNGY2YzQyZTNhMTY5NGI3
OGZkZmMzNWU2YmRmYzVjNjIxNCBhbmQgZnJvbSBmaWxlIDg4NmM5OGQwOGMyZjQxZTgwMTg4YWMz
MzE5OGEwYjRmNmM0MmUzYTE2OTRiNzhmZGZjMzVlNmJkZmM1YzYyMTQKQ29tcHV0ZWQgdGFzayBo
YXNoIGlzIGZjNTQ1NzljYzEzOWM3NzcxNzIyNDJjM2RhM2UwOTVmNDMwOGM1Y2U2MDZiMjM2NWE1
Yjg2YzQzNzFlZTRmODYK

--------------5B2540863C54AC13B23B2E88
Content-Type: text/plain; charset=UTF-8;
 name="lib32-rust-cross-i686--targets.sigdata.2"
Content-Disposition: attachment;
 filename="lib32-rust-cross-i686--targets.sigdata.2"
Content-Transfer-Encoding: base64

YmFzZXdoaXRlbGlzdDogeydCQl9UQVNLSEFTSCcsICdMSUNFTlNFX1BBVEgnLCAnSE9NRScsICdQ
S0dEQVRBX0RJUicsICdQU0VVRE9fSUdOT1JFX1BBVEhTJywgJ1NTVEFURV9IQVNIRVFVSVZfTUVU
SE9EJywgJ0NDQUNIRV9ESVInLCAnRklMRVNQQVRIJywgJ1NUQU1QQ0xFQU4nLCAnQkJfTElNSVRF
RERFUFMnLCAnRklMRScsICdTVEFHSU5HX0RJUl9IT1NUJywgJ1RNUERJUicsICdGSUxFX0RJUk5B
TUUnLCAnU1NUQVRFX0hBU0hFUVVJVl9PV05FUicsICdXT1JLRElSJywgJ0JCUEFUSCcsICdQUlNF
UlZfSE9TVCcsICdUSElTRElSJywgJ0RFUExPWV9ESVInLCAnU1RBTVBTX0RJUicsICdPTVBfTlVN
X1RIUkVBRFMnLCAnQ0NBQ0hFX1RPUF9ESVInLCAnUFJTRVJWX0RVTVBESVInLCAnTE9HTkFNRScs
ICdHSVRfQ0VJTElOR19ESVJFQ1RPUklFUycsICdDT1JFQkFTRScsICdQUlNFUlZfRFVNUEZJTEUn
LCAnU1RBR0lOR19ESVJfVEFSR0VUJywgJ0JCX1dPUktFUkNPTlRFWFQnLCAnQlVJTERISVNUT1JZ
X0RJUicsICdCVUlMRF9BUkNIJywgJ1NTVEFURV9ESVInLCAnUEFSQUxMRUxfTUFLRScsICdCQlNF
UlZFUicsICdQQVRIJywgJ1BSU0VSVl9MT0NLRE9XTicsICdGSUxFU0VYVFJBUEFUSFMnLCAnQ0NB
Q0hFX05PSEFTSERJUicsICdTSEVMTCcsICdXQVJOX1FBJywgJ1NTVEFURV9IQVNIRVFVSVZfUkVQ
T1JUX1RBU0tEQVRBJywgJ1NES1BLR1NVRkZJWCcsICdVU0VSJywgJ1NPVVJDRV9EQVRFX0VQT0NI
JywgJ2V4dGVuZF9yZWNpcGVfc3lzcm9vdCcsICdFWFRFUk5BTF9UT09MQ0hBSU4nLCAnQkJfSEFT
SFNFUlZFJywgJ0NDQUNIRScsICdFUlJPUl9RQScsICdCQl9VTklIQVNIJywgJ1NTVEFURV9QS0dB
UkNIJywgJ1BXRCcsICdETF9ESVInfQp0YXNrd2hpdGVsaXN0OiBOb25lClRhc2sgZGVwZW5kZW5j
aWVzOiBbJ0FSTV9USFVNQl9PUFQnLCAnREVGQVVMVFRVTkUnLCAnTUFDSElORScsICdNQUNISU5F
T1ZFUlJJREVTJywgJ1BBQ0tBR0VfQVJDSCcsICdSVVNUX1BBTklDX1NUUkFURUdZJywgJ1RBUkdF
VF9BUkNIJywgJ1RBUkdFVF9DQ19BUkNIJywgJ1RBUkdFVF9GUFUnLCAnVEFSR0VUX0xMVk1fQ1BV
JywgJ1RBUkdFVF9MTFZNX0ZFQVRVUkVTJywgJ1RSQU5TTEFURURfVEFSR0VUX0FSQ0gnLCAnVFVO
RV9BUkNIJywgJ1RVTkVfQ0NBUkdTJywgJ1RVTkVfRkVBVFVSRVMnLCAnVFVORV9GRUFUVVJFUzp0
dW5lLXg4NicsICdYODZBUkNIMzInLCAnWDg2QVJDSDY0JywgJ2FyY2hfdG9fcnVzdF90YXJnZXRf
YXJjaCcsICdsbHZtX2NwdScsICdsbHZtX2ZlYXR1cmVzJywgJ2xsdm1fZmVhdHVyZXNfZnJvbV9j
Y19hcmNoJywgJ2xsdm1fZmVhdHVyZXNfZnJvbV90YXJnZXRfZnB1JywgJ2xsdm1fZmVhdHVyZXNf
ZnJvbV90dW5lJywgJ3ByZWZpeF9mb3InLCAncnVzdF9nZW5fdGFyZ2V0JywgJ3N5c19mb3InLCAn
dGFyZ2V0X2lzX2FybXY3J10KYmFzZWhhc2g6IGE2ZDNkMTlkMTE4NDBhYTFhNTk1MGNmMmJkN2E4
ZjZkZDI0OWY5NWY0MGZkOWU1NmZhNzdmMzM3ZTQzYWU0MmUKTGlzdCBvZiBkZXBlbmRlbmNpZXMg
Zm9yIHZhcmlhYmxlIEFSTV9USFVNQl9PUFQgaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMg
Zm9yIHZhcmlhYmxlIERFRkFVTFRUVU5FIGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZv
ciB2YXJpYWJsZSBNQUNISU5FIGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJp
YWJsZSBNQUNISU5FT1ZFUlJJREVTIGlzIHsnTUFDSElORSd9Ckxpc3Qgb2YgZGVwZW5kZW5jaWVz
IGZvciB2YXJpYWJsZSBQQUNLQUdFX0FSQ0ggaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMg
Zm9yIHZhcmlhYmxlIFJVU1RfUEFOSUNfU1RSQVRFR1kgaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRl
bmNpZXMgZm9yIHZhcmlhYmxlIFRBUkdFVF9BUkNIIGlzIHsnVFVORV9BUkNIJ30KTGlzdCBvZiBk
ZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIFRBUkdFVF9DQ19BUkNIIGlzIHsnVFVORV9DQ0FSR1Mn
fQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgVEFSR0VUX0ZQVSBpcyBzZXQoKQpM
aXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgVEFSR0VUX0xMVk1fQ1BVIGlzIHsnbGx2
bV9jcHUnfQpMaXN0IG9mIGRlcGVuZGVuY2llcyBmb3IgdmFyaWFibGUgVEFSR0VUX0xMVk1fRkVB
VFVSRVMgaXMgeydsbHZtX2ZlYXR1cmVzJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlh
YmxlIFRSQU5TTEFURURfVEFSR0VUX0FSQ0ggaXMgeydUQVJHRVRfQVJDSCd9Ckxpc3Qgb2YgZGVw
ZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUVU5FX0FSQ0ggaXMgeydYODZBUkNINjQnLCAnWDg2QVJD
SDMyJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIFRVTkVfQ0NBUkdTIGlzIHNl
dCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBUVU5FX0ZFQVRVUkVTIGlzIHsn
REVGQVVMVFRVTkUnLCAnVFVORV9GRUFUVVJFUzp0dW5lLXg4Nid9Ckxpc3Qgb2YgZGVwZW5kZW5j
aWVzIGZvciB2YXJpYWJsZSBUVU5FX0ZFQVRVUkVTOnR1bmUteDg2IGlzIHNldCgpCkxpc3Qgb2Yg
ZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBYODZBUkNIMzIgaXMgc2V0KCkKTGlzdCBvZiBkZXBl
bmRlbmNpZXMgZm9yIHZhcmlhYmxlIFg4NkFSQ0g2NCBpcyBzZXQoKQpMaXN0IG9mIGRlcGVuZGVu
Y2llcyBmb3IgdmFyaWFibGUgYXJjaF90b19ydXN0X3RhcmdldF9hcmNoIGlzIHNldCgpCkxpc3Qg
b2YgZGVwZW5kZW5jaWVzIGZvciB2YXJpYWJsZSBsbHZtX2NwdSBpcyB7J1RSQU5TTEFURURfVEFS
R0VUX0FSQ0gnLCAnVFVORV9GRUFUVVJFUycsICdQQUNLQUdFX0FSQ0gnfQpMaXN0IG9mIGRlcGVu
ZGVuY2llcyBmb3IgdmFyaWFibGUgbGx2bV9mZWF0dXJlcyBpcyB7J2xsdm1fZmVhdHVyZXNfZnJv
bV9jY19hcmNoJywgJ2xsdm1fZmVhdHVyZXNfZnJvbV90dW5lJywgJ2xsdm1fZmVhdHVyZXNfZnJv
bV90YXJnZXRfZnB1J30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIGxsdm1fZmVh
dHVyZXNfZnJvbV9jY19hcmNoIGlzIHsnVEFSR0VUX0NDX0FSQ0gnfQpMaXN0IG9mIGRlcGVuZGVu
Y2llcyBmb3IgdmFyaWFibGUgbGx2bV9mZWF0dXJlc19mcm9tX3RhcmdldF9mcHUgaXMgeydUQVJH
RVRfRlBVJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlhYmxlIGxsdm1fZmVhdHVyZXNf
ZnJvbV90dW5lIGlzIHsnTUFDSElORU9WRVJSSURFUycsICdUVU5FX0ZFQVRVUkVTJywgJ3Rhcmdl
dF9pc19hcm12NycsICdBUk1fVEhVTUJfT1BUJ30KTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZh
cmlhYmxlIHByZWZpeF9mb3IgaXMgc2V0KCkKTGlzdCBvZiBkZXBlbmRlbmNpZXMgZm9yIHZhcmlh
YmxlIHJ1c3RfZ2VuX3RhcmdldCBpcyB7J1JVU1RfUEFOSUNfU1RSQVRFR1knLCAnc3lzX2Zvcics
ICdwcmVmaXhfZm9yJywgJ2FyY2hfdG9fcnVzdF90YXJnZXRfYXJjaCd9Ckxpc3Qgb2YgZGVwZW5k
ZW5jaWVzIGZvciB2YXJpYWJsZSBzeXNfZm9yIGlzIHNldCgpCkxpc3Qgb2YgZGVwZW5kZW5jaWVz
IGZvciB2YXJpYWJsZSB0YXJnZXRfaXNfYXJtdjcgaXMgeydNQUNISU5FT1ZFUlJJREVTJywgJ1RV
TkVfRkVBVFVSRVMnLCAnVEFSR0VUX0FSQ0gnfQpWYXJpYWJsZSBkb19ydXN0X2dlbl90YXJnZXRz
IHZhbHVlIGlzICAgICB3ZCA9IGQuZ2V0VmFyKCdXT1JLRElSJykgKyAnL3RhcmdldHMvJwogICAg
IyBJdCBpcyBpbXBvcnRhbnQgJ1RBUkdFVCcgaXMgbGFzdCBoZXJlIHNvIHRoYXQgaXQgb3ZlcnJp
ZGVzIG91ciBsZXNzCiAgICAjIGluZm9ybWVkIGNob2ljZXMgZm9yIEJVSUxEICYgSE9TVCBpZiBU
QVJHRVQgaGFwcGVucyB0byBiZSB0aGUgc2FtZSBhcwogICAgIyBlaXRoZXIgb2YgdGhlbS4KICAg
IGZvciB0aGluZyBpbiBbJ0JVSUxEJywgJ0hPU1QnLCAnVEFSR0VUJ106CiAgICAgICAgYmIuZGVi
dWcoMSwgInJ1c3RfZ2VuX3RhcmdldCBmb3IgIiArIHRoaW5nKQogICAgICAgIGZlYXR1cmVzID0g
IiIKICAgICAgICBjcHUgPSAiZ2VuZXJpYyIKICAgICAgICBhcmNoID0gZC5nZXRWYXIoJ3t9X0FS
Q0gnLmZvcm1hdCh0aGluZykpCiAgICAgICAgaWYgdGhpbmcgaXMgIlRBUkdFVCI6CiAgICAgICAg
ICAgICMgYXJtIGFuZCBhcm12NyBoYXZlIGRpZmZlcmVudCB0YXJnZXRzIGluIGxsdm0KICAgICAg
ICAgICAgaWYgYXJjaCA9PSAiYXJtIiBhbmQgdGFyZ2V0X2lzX2FybXY3KGQpOgogICAgICAgICAg
ICAgICAgYXJjaCA9ICdhcm12NycKICAgICAgICAgICAgZmVhdHVyZXMgPSBkLmdldFZhcignVEFS
R0VUX0xMVk1fRkVBVFVSRVMnKSBvciAiIgogICAgICAgICAgICBjcHUgPSBkLmdldFZhcignVEFS
R0VUX0xMVk1fQ1BVJykKICAgICAgICBydXN0X2dlbl90YXJnZXQoZCwgdGhpbmcsIHdkLCBmZWF0
dXJlcywgY3B1LCBhcmNoKQoKVmFyaWFibGUgQVJNX1RIVU1CX09QVCB2YWx1ZSBpcyBOb25lClZh
cmlhYmxlIERFRkFVTFRUVU5FIHZhbHVlIGlzIHg4NgpWYXJpYWJsZSBNQUNISU5FIHZhbHVlIGlz
IHFlbXV4ODZjb3B5ClZhcmlhYmxlIE1BQ0hJTkVPVkVSUklERVMgdmFsdWUgaXMgJHtAYmIudXRp
bHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLCAnbXgzMicsICd4ODYteDMyOicsICcnLCBkKX0k
e0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsICdtMzInLCAneDg2OicsICcnLCBk
KX1xZW11YWxsOiR7TUFDSElORX06cWVtdXg4NgpUVU5FX0ZFQVRVUkVTe20zMn0gPSBTZXQKVFVO
RV9GRUFUVVJFU3tteDMyfSA9IFVuc2V0ClZhcmlhYmxlIFBBQ0tBR0VfQVJDSCB2YWx1ZSBpcyAk
e0JVSUxEX0FSQ0h9ClZhcmlhYmxlIFJVU1RfUEFOSUNfU1RSQVRFR1kgdmFsdWUgaXMgdW53aW5k
ClZhcmlhYmxlIFRBUkdFVF9BUkNIIHZhbHVlIGlzICR7VFVORV9BUkNIfQpWYXJpYWJsZSBUQVJH
RVRfQ0NfQVJDSCB2YWx1ZSBpcyAke1RVTkVfQ0NBUkdTfSAtLXN5c3Jvb3Q9JHtTVEFHSU5HX0RJ
Ul9UQVJHRVR9ClZhcmlhYmxlIFRBUkdFVF9GUFUgdmFsdWUgaXMgClZhcmlhYmxlIFRBUkdFVF9M
TFZNX0NQVSB2YWx1ZSBpcyAke0BsbHZtX2NwdShkKX0KVmFyaWFibGUgVEFSR0VUX0xMVk1fRkVB
VFVSRVMgdmFsdWUgaXMgJHtAbGx2bV9mZWF0dXJlcyhkKX0KVmFyaWFibGUgVFJBTlNMQVRFRF9U
QVJHRVRfQVJDSCB2YWx1ZSBpcyAke0BkLmdldFZhcignVEFSR0VUX0FSQ0gnKS5yZXBsYWNlKCJf
IiwgIi0iKX0KVmFyaWFibGUgVFVORV9BUkNIIHZhbHVlIGlzICR7QGJiLnV0aWxzLmNvbnRhaW5z
KCdUVU5FX0ZFQVRVUkVTJywgJ20zMicsICcke1g4NkFSQ0gzMn0nLCAnJywgZCl9JHtAYmIudXRp
bHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLCAnbXgzMicsICcke1g4NkFSQ0g2NH0nLCAnJywg
ZCl9JHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLCAnbTY0JywgJyR7WDg2QVJD
SDY0fScsICcnLCBkKX0KVFVORV9GRUFUVVJFU3ttMzJ9ID0gU2V0ClRVTkVfRkVBVFVSRVN7bTY0
fSA9IFVuc2V0ClRVTkVfRkVBVFVSRVN7bXgzMn0gPSBVbnNldApWYXJpYWJsZSBUVU5FX0NDQVJH
UyB2YWx1ZSBpcyAgLW0zMgpWYXJpYWJsZSBUVU5FX0ZFQVRVUkVTIHZhbHVlIGlzICR7VFVORV9G
RUFUVVJFUzp0dW5lLSR7REVGQVVMVFRVTkV9fQpWYXJpYWJsZSBUVU5FX0ZFQVRVUkVTOnR1bmUt
eDg2IHZhbHVlIGlzIG0zMgpWYXJpYWJsZSBYODZBUkNIMzIgdmFsdWUgaXMgaTY4NgpWYXJpYWJs
ZSBYODZBUkNINjQgdmFsdWUgaXMgeDg2XzY0ClZhcmlhYmxlIGFyY2hfdG9fcnVzdF90YXJnZXRf
YXJjaCB2YWx1ZSBpcyBkZWYgYXJjaF90b19ydXN0X3RhcmdldF9hcmNoKGFyY2gpOgogICAgaWYg
YXJjaCA9PSAiaTU4NiIgb3IgYXJjaCA9PSAiaTY4NiI6CiAgICAgICAgcmV0dXJuICJ4ODYiCiAg
ICBlbGlmIGFyY2ggPT0gIm1pcHNlbCI6CiAgICAgICAgcmV0dXJuICJtaXBzIgogICAgZWxpZiBh
cmNoID09ICJtaXA2NHNlbCI6CiAgICAgICAgcmV0dXJuICJtaXBzNjQiCiAgICBlbGlmIGFyY2gg
PT0gImFybXY3IjoKICAgICAgICByZXR1cm4gImFybSIKICAgIGVsaWYgYXJjaCA9PSAicG93ZXJw
YzY0bGUiOgogICAgICAgIHJldHVybiAicG93ZXJwYzY0IgogICAgZWxzZToKICAgICAgICByZXR1
cm4gYXJjaAoKIyBnZW5lcmF0ZXMgb3VyIHRhcmdldCBDUFUgdmFsdWUKVmFyaWFibGUgbGx2bV9j
cHUgdmFsdWUgaXMgZGVmIGxsdm1fY3B1KGQpOgogICAgY3B1ID0gZC5nZXRWYXIoJ1BBQ0tBR0Vf
QVJDSCcpCiAgICB0YXJnZXQgPSBkLmdldFZhcignVFJBTlNMQVRFRF9UQVJHRVRfQVJDSCcpCgog
ICAgdHJhbnMgPSB7fQogICAgdHJhbnNbJ2NvcmVpNy02NCddID0gImNvcmVpNyIKICAgIHRyYW5z
Wydjb3JlMi0zMiddID0gImNvcmUyIgogICAgdHJhbnNbJ3g4Ni02NCddID0gIng4Ni02NCIKICAg
IHRyYW5zWydpNjg2J10gPSAiaTY4NiIKICAgIHRyYW5zWydpNTg2J10gPSAiaTU4NiIKICAgIHRy
YW5zWydwb3dlcnBjJ10gPSAicG93ZXJwYyIKICAgIHRyYW5zWydtaXBzNjQnXSA9ICJtaXBzNjQi
CiAgICB0cmFuc1snbWlwczY0ZWwnXSA9ICJtaXBzNjQiCiAgICB0cmFuc1sncmlzY3Y2NCddID0g
ImdlbmVyaWMtcnY2NCIKICAgIHRyYW5zWydyaXNjdjMyJ10gPSAiZ2VuZXJpYy1ydjMyIgoKICAg
IGlmIHRhcmdldCBpbiBbIm1pcHMiLCAibWlwc2VsIl06CiAgICAgICAgZmVhdCA9IGZyb3plbnNl
dChkLmdldFZhcignVFVORV9GRUFUVVJFUycpLnNwbGl0KCkpCiAgICAgICAgaWYgIm1pcHMzMnIy
IiBpbiBmZWF0OgogICAgICAgICAgICB0cmFuc1snbWlwc2VsJ10gPSAibWlwczMycjIiCiAgICAg
ICAgICAgIHRyYW5zWydtaXBzJ10gPSAibWlwczMycjIiCiAgICAgICAgZWxpZiAibWlwczMyIiBp
biBmZWF0OgogICAgICAgICAgICB0cmFuc1snbWlwc2VsJ10gPSAibWlwczMyIgogICAgICAgICAg
ICB0cmFuc1snbWlwcyddID0gIm1pcHMzMiIKCiAgICB0cnk6CiAgICAgICAgcmV0dXJuIHRyYW5z
W2NwdV0KICAgIGV4Y2VwdDoKICAgICAgICByZXR1cm4gdHJhbnMuZ2V0KHRhcmdldCwgImdlbmVy
aWMiKQoKVmFyaWFibGUgbGx2bV9mZWF0dXJlcyB2YWx1ZSBpcyBkZWYgbGx2bV9mZWF0dXJlcyhk
KToKICAgIHJldHVybiAnLCcuam9pbihsbHZtX2ZlYXR1cmVzX2Zyb21fdHVuZShkKSArCiAgICAg
ICAgICAgICAgICAgICAgbGx2bV9mZWF0dXJlc19mcm9tX2NjX2FyY2goZCkgKwogICAgICAgICAg
ICAgICAgICAgIGxsdm1fZmVhdHVyZXNfZnJvbV90YXJnZXRfZnB1KGQpKQoKCiMjIGFybS11bmtu
b3duLWxpbnV4LWdudWVhYmloZgpWYXJpYWJsZSBsbHZtX2ZlYXR1cmVzX2Zyb21fY2NfYXJjaCB2
YWx1ZSBpcyBkZWYgbGx2bV9mZWF0dXJlc19mcm9tX2NjX2FyY2goZCk6CiAgICBmID0gW10KICAg
IGZlYXQgPSBkLmdldFZhcignVEFSR0VUX0NDX0FSQ0gnKQogICAgaWYgbm90IGZlYXQ6CiAgICAg
ICAgcmV0dXJuIFtdCiAgICBmZWF0ID0gZnJvemVuc2V0KGZlYXQuc3BsaXQoKSkKCiAgICBpZiAn
LW1tbXgnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIittbXgiKQogICAgaWYgJy1tc3NlJyBp
biBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrc3NlIikKICAgIGlmICctbXNzZTInIGluIGZlYXQ6
CiAgICAgICAgZi5hcHBlbmQoIitzc2UyIikKICAgIGlmICctbXNzZTMnIGluIGZlYXQ6CiAgICAg
ICAgZi5hcHBlbmQoIitzc2UzIikKICAgIGlmICctbXNzc2UzJyBpbiBmZWF0OgogICAgICAgIGYu
YXBwZW5kKCIrc3NzZTMiKQogICAgaWYgJy1tc3NlNC4xJyBpbiBmZWF0OgogICAgICAgIGYuYXBw
ZW5kKCIrc3NlNC4xIikKICAgIGlmICctbXNzZTQuMicgaW4gZmVhdDoKICAgICAgICBmLmFwcGVu
ZCgiK3NzZTQuMiIpCiAgICBpZiAnLW1zc2U0YScgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgi
K3NzZTRhIikKICAgIGlmICctbWF2eCcgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2F2eCIp
CiAgICBpZiAnLW1hdngyJyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrYXZ4MiIpCgogICAg
cmV0dXJuIGYKClZhcmlhYmxlIGxsdm1fZmVhdHVyZXNfZnJvbV90YXJnZXRfZnB1IHZhbHVlIGlz
IGRlZiBsbHZtX2ZlYXR1cmVzX2Zyb21fdGFyZ2V0X2ZwdShkKToKICAgICMgVEFSR0VUX0ZQVSBj
YW4gYmUgaGFyZCBvciBzb2Z0LiArc29mdC1mbG9hdCB0ZWxsIGxsdm0gdG8gdXNlIHNvZnQgZmxv
YXQKICAgICMgQUJJLiBUaGVyZSBpcyBubyBvcHRpb24gZm9yIGhhcmQuCgogICAgZnB1ID0gZC5n
ZXRWYXIoJ1RBUkdFVF9GUFUnLCBUcnVlKQogICAgcmV0dXJuIFsiK3NvZnQtZmxvYXQiXSBpZiBm
cHUgPT0gInNvZnQiIGVsc2UgW10KClZhcmlhYmxlIGxsdm1fZmVhdHVyZXNfZnJvbV90dW5lIHZh
bHVlIGlzIGRlZiBsbHZtX2ZlYXR1cmVzX2Zyb21fdHVuZShkKToKICAgIGYgPSBbXQogICAgZmVh
dCA9IGQuZ2V0VmFyKCdUVU5FX0ZFQVRVUkVTJykKICAgIGlmIG5vdCBmZWF0OgogICAgICAgIHJl
dHVybiBbXQogICAgZmVhdCA9IGZyb3plbnNldChmZWF0LnNwbGl0KCkpCgogICAgbWFjaF9vdmVy
cmlkZXMgPSBkLmdldFZhcignTUFDSElORU9WRVJSSURFUycpCiAgICBtYWNoX292ZXJyaWRlcyA9
IGZyb3plbnNldChtYWNoX292ZXJyaWRlcy5zcGxpdCgnOicpKQoKICAgIGlmICd2ZnB2NCcgaW4g
ZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK3ZmcDQiKQogICAgaWYgJ3ZmcHYzJyBpbiBmZWF0Ogog
ICAgICAgIGYuYXBwZW5kKCIrdmZwMyIpCiAgICBpZiAndmZwdjNkMTYnIGluIGZlYXQ6CiAgICAg
ICAgZi5hcHBlbmQoIitkMTYiKQoKICAgIGlmICd2ZnB2MicgaW4gZmVhdCBvciAndmZwJyBpbiBm
ZWF0OgogICAgICAgIGYuYXBwZW5kKCIrdmZwMiIpCgogICAgaWYgJ25lb24nIGluIGZlYXQ6CiAg
ICAgICAgZi5hcHBlbmQoIituZW9uIikKCiAgICBpZiAnbWlwczMyJyBpbiBmZWF0OgogICAgICAg
IGYuYXBwZW5kKCIrbWlwczMyIikKCiAgICBpZiAnbWlwczMycjInIGluIGZlYXQ6CiAgICAgICAg
Zi5hcHBlbmQoIittaXBzMzJyMiIpCgogICAgaWYgdGFyZ2V0X2lzX2FybXY3KGQpOgogICAgICAg
IGYuYXBwZW5kKCcrdjcnKQoKICAgIGlmICgnYXJtdjYnIGluIG1hY2hfb3ZlcnJpZGVzKSBvciAo
J2FybXY2JyBpbiBmZWF0KToKICAgICAgICBmLmFwcGVuZCgiK3Y2IikKICAgIGlmICdhcm12NXRl
JyBpbiBmZWF0OgogICAgICAgIGYuYXBwZW5kKCIrc3RyaWN0LWFsaWduIikKICAgICAgICBmLmFw
cGVuZCgiK3Y1dGUiKQogICAgZWxpZiAnYXJtdjUnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQo
IitzdHJpY3QtYWxpZ24iKQogICAgICAgIGYuYXBwZW5kKCIrdjUiKQoKICAgIGlmICgnYXJtdjQn
IGluIG1hY2hfb3ZlcnJpZGVzKSBvciAoJ2FybXY0JyBpbiBmZWF0KToKICAgICAgICBmLmFwcGVu
ZCgiK3N0cmljdC1hbGlnbiIpCgogICAgaWYgJ2RzcCcgaW4gZmVhdDoKICAgICAgICBmLmFwcGVu
ZCgiK2RzcCIpCgogICAgaWYgJ3RodW1iJyBpbiBmZWF0OgogICAgICAgIGlmIGQuZ2V0VmFyKCdB
Uk1fVEhVTUJfT1BUJykgPT0gInRodW1iIjoKICAgICAgICAgICAgaWYgdGFyZ2V0X2lzX2FybXY3
KGQpOgogICAgICAgICAgICAgICAgZi5hcHBlbmQoJyt0aHVtYjInKQogICAgICAgICAgICBmLmFw
cGVuZCgiK3RodW1iLW1vZGUiKQoKICAgIGlmICdjb3J0ZXhhNScgaW4gZmVhdDoKICAgICAgICBm
LmFwcGVuZCgiK2E1IikKICAgIGlmICdjb3J0ZXhhNycgaW4gZmVhdDoKICAgICAgICBmLmFwcGVu
ZCgiK2E3IikKICAgIGlmICdjb3J0ZXhhOScgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2E5
IikKICAgIGlmICdjb3J0ZXhhMTUnIGluIGZlYXQ6CiAgICAgICAgZi5hcHBlbmQoIithMTUiKQog
ICAgaWYgJ2NvcnRleGExNycgaW4gZmVhdDoKICAgICAgICBmLmFwcGVuZCgiK2ExNyIpCiAgICBp
ZiAoJ3Jpc2N2NjQnIGluIGZlYXQpIG9yICgncmlzY3YzMicgaW4gZmVhdCk6CiAgICAgICAgZi5h
cHBlbmQoIithLCtjLCtkLCtmLCttIikKICAgIHJldHVybiBmCgojIFRBUkdFVF9DQ19BUkNIIGNo
YW5nZXMgZnJvbSBidWlsZC9jcm9zcy90YXJnZXQgc28gaXQnbGwgZG8gdGhlIHJpZ2h0IHRoaW5n
CiMgdGhpcyBzaG91bGQgZ28gYXdheSB3aGVuIGh0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcv
cnVzdC9wdWxsLzMxNzA5IGlzCiMgc3RhYmxlICgxLjkuMD8pClZhcmlhYmxlIHByZWZpeF9mb3Ig
dmFsdWUgaXMgZGVmIHByZWZpeF9mb3IoZCwgdGhpbmcpOgogICAgcmV0dXJuIGQuZ2V0VmFyKCd7
fV9QUkVGSVgnLmZvcm1hdCh0aGluZykpCgojIENvbnZlcnQgYSBub3JtYWwgYXJjaCAoSE9TVF9B
UkNILCBUQVJHRVRfQVJDSCwgQlVJTERfQVJDSCwgZXRjKSB0byBzb21ldGhpbmcKIyBydXN0J3Mg
aW50ZXJuYWxzIHdvbid0IGNob2tlIG9uLgpWYXJpYWJsZSBydXN0X2dlbl90YXJnZXQgdmFsdWUg
aXMgZGVmIHJ1c3RfZ2VuX3RhcmdldChkLCB0aGluZywgd2QsIGZlYXR1cmVzLCBjcHUsIGFyY2gp
OgogICAgaW1wb3J0IGpzb24KICAgIHN5cyA9IHN5c19mb3IoZCwgdGhpbmcpCiAgICBwcmVmaXgg
PSBwcmVmaXhfZm9yKGQsIHRoaW5nKQoKICAgIGZlYXR1cmVzID0gZmVhdHVyZXMgb3IgZC5nZXRW
YXJGbGFnKCdGRUFUVVJFUycsIGFyY2gpIG9yICIiCiAgICBmZWF0dXJlcyA9IGZlYXR1cmVzLnN0
cmlwKCkKCiAgICAjIGJ1aWxkIHRzcGVjCiAgICB0c3BlYyA9IHt9CiAgICB0c3BlY1snbGx2bS10
YXJnZXQnXSA9IGQuZ2V0VmFyRmxhZygnTExWTV9UQVJHRVQnLCBhcmNoKQogICAgdHNwZWNbJ2Rh
dGEtbGF5b3V0J10gPSBkLmdldFZhckZsYWcoJ0RBVEFfTEFZT1VUJywgYXJjaCkKICAgIHRzcGVj
WydtYXgtYXRvbWljLXdpZHRoJ10gPSBpbnQoZC5nZXRWYXJGbGFnKCdNQVhfQVRPTUlDX1dJRFRI
JywgYXJjaCkpCiAgICB0c3BlY1sndGFyZ2V0LXBvaW50ZXItd2lkdGgnXSA9IGQuZ2V0VmFyRmxh
ZygnVEFSR0VUX1BPSU5URVJfV0lEVEgnLCBhcmNoKQogICAgdHNwZWNbJ3RhcmdldC1jLWludC13
aWR0aCddID0gZC5nZXRWYXJGbGFnKCdUQVJHRVRfQ19JTlRfV0lEVEgnLCBhcmNoKQogICAgdHNw
ZWNbJ3RhcmdldC1lbmRpYW4nXSA9IGQuZ2V0VmFyRmxhZygnVEFSR0VUX0VORElBTicsIGFyY2gp
CiAgICB0c3BlY1snYXJjaCddID0gYXJjaF90b19ydXN0X3RhcmdldF9hcmNoKGFyY2gpCiAgICB0
c3BlY1snb3MnXSA9ICJsaW51eCIKICAgIGlmICJtdXNsIiBpbiB0c3BlY1snbGx2bS10YXJnZXQn
XToKICAgICAgICB0c3BlY1snZW52J10gPSAibXVzbCIKICAgIGVsc2U6CiAgICAgICAgdHNwZWNb
J2VudiddID0gImdudSIKICAgIGlmICJyaXNjdjY0IiBpbiB0c3BlY1snbGx2bS10YXJnZXQnXToK
ICAgICAgICB0c3BlY1snbGx2bS1hYmluYW1lJ10gPSAibHA2NGQiCiAgICBpZiAicmlzY3YzMiIg
aW4gdHNwZWNbJ2xsdm0tdGFyZ2V0J106CiAgICAgICAgdHNwZWNbJ2xsdm0tYWJpbmFtZSddID0g
ImlscDMyZCIKICAgIHRzcGVjWyd2ZW5kb3InXSA9ICJ1bmtub3duIgogICAgdHNwZWNbJ3Rhcmdl
dC1mYW1pbHknXSA9ICJ1bml4IgogICAgdHNwZWNbJ2xpbmtlciddID0gInt9e31nY2MiLmZvcm1h
dChkLmdldFZhcignQ0NBQ0hFJyksIHByZWZpeCkKICAgIHRzcGVjWydhciddID0gInt9YXIiLmZv
cm1hdChwcmVmaXgpCiAgICB0c3BlY1snY3B1J10gPSBjcHUKICAgIGlmIGZlYXR1cmVzICE9ICIi
OgogICAgICAgIHRzcGVjWydmZWF0dXJlcyddID0gZmVhdHVyZXMKICAgIHRzcGVjWydkeW5hbWlj
LWxpbmtpbmcnXSA9IFRydWUKICAgIHRzcGVjWydleGVjdXRhYmxlcyddID0gVHJ1ZQogICAgdHNw
ZWNbJ2xpbmtlci1pcy1nbnUnXSA9IFRydWUKICAgIHRzcGVjWydsaW5rZXItZmxhdm9yJ10gPSAi
Z2NjIgogICAgdHNwZWNbJ2hhcy1ycGF0aCddID0gVHJ1ZQogICAgdHNwZWNbJ2hhcy1lbGYtdGxz
J10gPSBUcnVlCiAgICB0c3BlY1sncG9zaXRpb24taW5kZXBlbmRlbnQtZXhlY3V0YWJsZXMnXSA9
IFRydWUKICAgIHRzcGVjWydwYW5pYy1zdHJhdGVneSddID0gZC5nZXRWYXIoIlJVU1RfUEFOSUNf
U1RSQVRFR1kiKQoKICAgICMgd3JpdGUgb3V0IHRoZSB0YXJnZXQgc3BlYyBqc29uIGZpbGUKICAg
IHdpdGggb3Blbih3ZCArIHN5cyArICcuanNvbicsICd3JykgYXMgZjoKICAgICAgICBqc29uLmR1
bXAodHNwZWMsIGYsIGluZGVudD00KQoKVmFyaWFibGUgc3lzX2ZvciB2YWx1ZSBpcyBkZWYgc3lz
X2ZvcihkLCB0aGluZyk6CiAgICByZXR1cm4gZC5nZXRWYXIoJ3t9X1NZUycuZm9ybWF0KHRoaW5n
KSkKClZhcmlhYmxlIHRhcmdldF9pc19hcm12NyB2YWx1ZSBpcyBkZWYgdGFyZ2V0X2lzX2FybXY3
KGQpOgogICAgJycnRGV0ZXJtaW5lIGlmIHRhcmdldCBpcyBhcm12NycnJwogICAgIyBUVU5FX0ZF
QVRVUkVTIG1heSBpbmNsdWRlIGFybSogZXZlbiBpZiB0aGUgdGFyZ2V0IGlzIG5vdCBhcm0KICAg
ICMgaW4gdGhlIGNhc2Ugb2YgKi1uYXRpdmUgcGFja2FnZXMKICAgIGlmIGQuZ2V0VmFyKCdUQVJH
RVRfQVJDSCcpICE9ICdhcm0nOgogICAgICAgIHJldHVybiBGYWxzZQoKICAgIGZlYXQgPSBkLmdl
dFZhcignVFVORV9GRUFUVVJFUycpCiAgICBmZWF0ID0gZnJvemVuc2V0KGZlYXQuc3BsaXQoKSkK
ICAgIG1hY2hfb3ZlcnJpZGVzID0gZC5nZXRWYXIoJ01BQ0hJTkVPVkVSUklERVMnKQogICAgbWFj
aF9vdmVycmlkZXMgPSBmcm96ZW5zZXQobWFjaF9vdmVycmlkZXMuc3BsaXQoJzonKSkKCiAgICB2
Nz1mcm96ZW5zZXQoWydhcm12N2EnLCAnYXJtdjdyJywgJ2FybXY3bScsICdhcm12N3ZlJ10pCiAg
ICBpZiBtYWNoX292ZXJyaWRlcy5pc2Rpc2pvaW50KHY3KSBhbmQgZmVhdC5pc2Rpc2pvaW50KHY3
KToKICAgICAgICByZXR1cm4gRmFsc2UKICAgIGVsc2U6CiAgICAgICAgcmV0dXJuIFRydWUKCiMg
UmVzcG9uc2libGUgZm9yIHRha2luZyBZb2N0byB0cmlwbGVzIGFuZCBjb252ZXJ0aW5nIGl0IHRv
IFJ1c3QgdHJpcGxlcwpUYXNrcyB0aGlzIHRhc2sgZGVwZW5kcyBvbjogWyd2aXJ0dWFsOm11bHRp
bGliOmxpYjMyOi9hbGEtbHBnZ3AzMS9ybWFjbGVvZC9zcmMvZGlzdHJvL3lvY3RvL3Bva3ktY29u
dHJpYi5naXQvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1jcm9zc18xLjU0LjAuYmI6
ZG9fcGF0Y2gnXQpUaGlzIHRhc2sgZGVwZW5kcyBvbiB0aGUgY2hlY2tzdW1zIG9mIGZpbGVzOiBb
XQpIYXNoIGZvciBkZXBlbmRlbnQgdGFzayB2aXJ0dWFsOm11bHRpbGliOmxpYjMyOi9hbGEtbHBn
Z3AzMS9ybWFjbGVvZC9zcmMvZGlzdHJvL3lvY3RvL3Bva3ktY29udHJpYi5naXQvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1c3QvcnVzdC1jcm9zc18xLjU0LjAuYmI6ZG9fcGF0Y2ggaXMgNDY1MmVh
MzE4Y2VlMjE1YTg3ZDhiOTI1YjMzNzA1MWY3YzcwY2Q0ZWU2ZTg1ZDg0OTIyOTI1ZWZjOTc5ZGZh
NApDb21wdXRlZCBiYXNlIGhhc2ggaXMgYTZkM2QxOWQxMTg0MGFhMWE1OTUwY2YyYmQ3YThmNmRk
MjQ5Zjk1ZjQwZmQ5ZTU2ZmE3N2YzMzdlNDNhZTQyZSBhbmQgZnJvbSBmaWxlIGE2ZDNkMTlkMTE4
NDBhYTFhNTk1MGNmMmJkN2E4ZjZkZDI0OWY5NWY0MGZkOWU1NmZhNzdmMzM3ZTQzYWU0MmUKQ29t
cHV0ZWQgdGFzayBoYXNoIGlzIDhlZDViNWQ3YzlhNjBiNDRiNTA5NzQyNWIyNmNlNTU1N2VjMzQy
MGNiNzYxYzkyOTVjNTYzMDdkNWRkYWVjMjIK

--------------5B2540863C54AC13B23B2E88
Content-Type: text/x-log; charset=UTF-8;
 name="oe-selftest-results.log"
Content-Disposition: attachment;
 filename="oe-selftest-results.log"
Content-Transfer-Encoding: 7bit

2021-08-19 19:14:18,686 - oe-selftest - INFO - Adding layer libraries:
2021-08-19 19:14:18,686 - oe-selftest - INFO - 	/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/lib
2021-08-19 19:14:18,687 - oe-selftest - INFO - 	/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta-yocto-bsp/lib
2021-08-19 19:14:18,687 - oe-selftest - INFO - 	/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta-selftest/lib
2021-08-19 19:14:18,688 - oe-selftest - INFO - Running bitbake -e to test the configuration is valid/parsable
2021-08-19 19:14:22,626 - oe-selftest - INFO - Adding: "include selftest.inc" in /ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/conf/local.conf
2021-08-19 19:14:22,627 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2021-08-19 19:14:22,628 - oe-selftest - INFO - test_sstate_noop_samesigs (sstatetests.SStateTests)
2021-08-19 19:15:13,256 - oe-selftest - INFO -  ... ok
2021-08-19 19:15:13,257 - oe-selftest - INFO - test_sstate_sametune_samesigs (sstatetests.SStateTests)
2021-08-19 19:17:53,301 - oe-selftest - INFO -  ... FAIL
2021-08-19 19:17:53,303 - oe-selftest - INFO - Traceback (most recent call last):
  File "/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/lib/oeqa/selftest/cases/sstatetests.py", line 449, in test_sstate_sametune_samesigs
    self.assertCountEqual(files1, files2)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.fc54579cc139c777172242c3da3e095f4308c5ce606b2365a5b86c4371ee4f86'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_compile.sigdata.86cb5a1346b0615cb21fab3c0110cc964eccedbb94b2ccf99546dfd456897cca'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_install.sigdata.a1c0c3ed27e293a2daaa185482dc7fee2ed18490748e5077f8012882091aa2a8'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_populate_sysroot.sigdata.a77e66f54b1be8285f4b33bafdd3d15e0a1ea694c0fd18832c61efb8c8fb312a'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_install.sigdata.b5d31a12e244bccafa0e5b8152c051c7d071855da0b638a3479ce7d677f146b5'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_populate_sysroot.sigdata.4fd86084264170fb770ca358d1c3efd8dd70e231fe0d2328f98de3732c50a2a7'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.448a8113230a16ac5d606de18989f98b3700edeb3e7956c6f02207aa76a5d4f3'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_compile.sigdata.de7ff2af7f15af3b23a6ceb362ffa91602eebd17e19ed3df7709d81c2c390ce4'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_compile.sigdata.5ed1d5378e69e6ce244174b1becfb5340fb7349d25780cc8f5a7f222b4bf5cde'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_install.sigdata.4fb2c2301f0aca4a4e2add6ca1656d3bf843b88cf31819c70ac4de60cca2b513'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_configure.sigdata.1330164135e31705d4f1120ded68cd49dc32eb8d37945854b8383f7894366f61'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.c92d02429f22ecf3c6bb5c31cd2f4faaca852e6115e549be6a1154ef88e42049'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package.sigdata.8614d96d94145c5a40e074b90ab4d10e2a228c8dd39916213ca67f96632d6133'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_packagedata.sigdata.fdfe6627047063dcf31c49165a716901448863c29235d9cedc5e07ceb73527b1'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package_write_rpm.sigdata.7537a5040399eaf51e4eb82b4c4d7a4927bfe40b38ce70ebc67be217b945c3de'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_populate_sysroot.sigdata.31bd54b8811665bd9b0da94add1042a768272b88b3301c916ac3f318db87c508'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package_qa.sigdata.13cbaa397a096de35904dd0f8750b19c16419d7d1a2fae0f14c2c7923a308c28'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.9bc0d54595e72e4e4da3980443c1df558581966144ace9f189e526419b7ce2d4'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package_qa.sigdata.19d7bc678a149de0d7f4b97f862f9ee271ef5c66c91886a5852335ed916f9e8b'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_install.sigdata.1e8482a852298d971b4640702a5723b3cf472ef802731b7fa4af7ad63b2fd48d'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_compile.sigdata.f149b25486972d08fc27e40653849eab265b3a31800aa8cf81f50a094b3060ac'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_packagedata.sigdata.4e63c49044a74657f9437ea8d75aecb086aa14bead0471e3b4927d975a3101a7'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package_write_rpm.sigdata.cf1734d0d9b1b20bafeb8c59d6bd812147b6ce5edd59e188f27cbc243038dbdf'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_populate_sysroot.sigdata.f5feb243311ea6bbf2fcd150821e6bb1e5024b361e37e21c8cac275cd542de25'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_configure.sigdata.87d8770b4dfad359aba60cc05741c8b3cc6de3f27f4d7afdd4409394833f0899'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package.sigdata.0e813eb4208488aa2f444072feb41274c1045f7e285b29298ac9275c76b24ad5'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_packagedata.sigdata.3cc10eb84345704add643a12ddddf290a02d4b3c0482382e7b322192f629af56'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_install.sigdata.df3851ac16cc5fbef4a87ac73a43a54b9914581075b8fdd9ce41d4058c3c6ea1'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_populate_sysroot.sigdata.7d6215490248e5b6ebdd13606b0eb5d8afca26574a204f58e73c7880a7360c4a'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.9a8775d578e4e91c87ef0965d09260480b343a7cb586372f5c2f3f46ea7826ea'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package.sigdata.4ee3961f0c45352fe0e2b994dff393489529690dd01875bef5279ef6663f82eb'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_configure.sigdata.c7e1878a5670ac2759ed65c00c7832356aaa3ef8b8b8aac0ffda0fe8fe63c70d'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package_write_rpm.sigdata.869b9a50422604a92d6ed74fe38423f8f6ed6e80ce79255247e77214b5157546'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_compile.sigdata.8bcb4d754f0a6dccf2cea9ea1935a5330697e80a9e83c83749212a4b94a28939'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package_qa.sigdata.09aa4c5f61302977f5a89a55a7ccf914f99a71c10f04c77742ceec7008954990'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package_qa.sigdata.7f6a8e8e9487d8636bb66616077cf81081086062a24615142e5898a64695a29f'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.de37e9ffbafd6fa03ee163ac594b7b419aacaa7f76e841d5755f8f8c60fc229d'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package_write_rpm.sigdata.9bddcac412aa8ee310498f0d7c7a4a06075cc34c0e2592ecff24245b21a4b570'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_install.sigdata.77e14b907df816833644f466be6a219a5dd4ba6a12e18a0bd94b3d2f45febedd'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_compile.sigdata.9cea907c87090b4d9f0cf4460629546297a47db724809fbfd5ee7730401b7574'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_populate_sysroot.sigdata.19fc3d945202f03fe941cdb046886fb934f8267a60e28a7be0f6e2686a479c26'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_packagedata.sigdata.e49c2774170926d3efacc76132e129b5cbdd264971e8087ecc4f307ae8ea4961'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_configure.sigdata.6597ee477731c9440692237db01a70832e473588ab7082751a2f2c9d87c556ae'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package.sigdata.f229bd686fa4d08a7ced7fc54292e959f5b7483734d4aef92f27e9cc1b126f9b'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_compile.sigdata.65f3be30da4dc333a13bbf69d4f0cf418730718936e4f633a01a94f33b8ebef1'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.8ed5b5d7c9a60b44b5097425b26ce5557ec3420cb761c9295c56307d5ddaec22'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_populate_sysroot.sigdata.331b2d9bcff9e6e81582074f1cd8587ffb4eeb64c73a1d2cbdfa0e563a1abff3'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_install.sigdata.a8ae893a542660b332a7cd22e9e982c4241135b06ef30125d487cf2ee92b3b91'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_install.sigdata.045bfaf4832974f96447aa7f7c431abd3c32c56d1956d921354b10f2e57aa7ee'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_compile.sigdata.27dddf67e61a73c1c42fbebf2ec5cd58d9c6b18b79ab9d3bbc61f350b393700a'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.83d1a26ebe7e2df3f496024a297ba782e145e6982457e09102d5e7c4fbf1b3b7'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_populate_sysroot.sigdata.891d5abc469d187e34b531bf81a1ef742d6b834204af8c43ee0949744f2ea413'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_configure.sigdata.59dc8b0def7802484c734787962400026246f70c2bf48ade3baeac5671d9c47f'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_populate_sysroot.sigdata.7358ba758bc3a8c76d87a45ecb5dc8cb3224b45098f81d3724b226295922c475'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package_qa.sigdata.ad013cb428b0fc127583e1ca7a5f39a4cca7cd7fe13fa669ed3cbc4b9ee3332a'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_install.sigdata.88e565d06d7c69e985da195f7752911022a974d6b9e89d82699de274d107f853'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package.sigdata.802365a52628bc0b173556977b135e38fee5fbfc415327bbb0b695ef601a4709'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_packagedata.sigdata.a3c32256c02d42d24d639b04f6fc2073b0c53c840cd008f4b8b788b94977da94'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_compile.sigdata.19d6cef321ed3808d928b6de955b214f1a3444afc6e6fe73b68447060d66cdff'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.16c650c390029ea40a19975d6e9ac1c9e8486cb82ff49607cbb380a771ffe970'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package_write_rpm.sigdata.6d745c3a58e4d35933079194d8e83979ea0d032a9d6498c880305b8b283b8412'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_configure.sigdata.149b205adb6a48cb396e6da73dd45fb13c51ece5c0e56e01b4458e32a8bbc21c'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package_qa.sigdata.914dc0f062bcc4d4898cafff2b380735b5bfb2343408fb6460046f400f73755b'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_packagedata.sigdata.71beb081559a476e39a0527a8a42b92c9e4ee209dedbf67e82d1ccc03babf9fb'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_compile.sigdata.c2bddf0463e3c501a9ccaf1b1511f322311fb5e8c244e6cff9046db8c65e8f72'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package.sigdata.c6e360d90dae93948f78fdc15d054df8d76fb998bfe8e7d5d194f3dcf24ce30f'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_populate_sysroot.sigdata.6f146b8c3d06fd84630198af8e2b8b7d8446c82c0e2f292f5b33043b67c698c9'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.d3afb749ff9f7f41f9a79b6f2d7d00615c3a05435e75d91cad2ebec11843bc92'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_install.sigdata.17e30337464c783f7ae7e2c156bb747ef149606d78d58d1f144a01196d94315a'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package_write_rpm.sigdata.4d760c1f09a402e714c869b5f5f4af5b831e8fc3f0df3c40168387f10cb7c324'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package_qa.sigdata.c57da894fee804da21cdadeb46ce4eb4109ca220edb97317e4c1643a43ba9e2d'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_compile.sigdata.29c8e6034e583ae319c6c10f7c4836d1e36dd1958be403909015aef467f9aae4'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package_write_rpm.sigdata.6c4edfb164464b469d13f708c0cec9aef53029579999abfcfcb422986bd12e32'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package.sigdata.5f1e651a667cc88f31cd1aec4957dd8b5ae7fbc23afc2b4c333354d019a662ff'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_configure.sigdata.ec87c5e68c278794e01b1b9c04638282cfd51c49f33cb8edb0fec532c8c82e2c'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_packagedata.sigdata.f0ded7162e6e6e9fcc5f1979ceae387c460572398e2711ec2e72eb8fa35fe714'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_populate_sysroot.sigdata.77885fed1ad105f8827d4249a8a708879922b9dddcefdcc56f7bb574b911c9f2'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_install.sigdata.bf859e6a1293873570398b9bb5985cf52fd5063167e41982de7654ab0eaae860'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.1a58b70dc6d5603759317eae619cae800aad6931792369177a104444377cc328'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package_write_rpm.sigdata.ff24591a4417413bf286f9e71c84d5c2269f9b96281a07f40549644af42c3d97'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_compile.sigdata.71fef31c7bbce861911f82dd52b09c5a6fc249de935b8367ea20082adef7633f'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_configure.sigdata.f7f84daf9d8df2a85fd595496b99ff1d6d23d51a7d9f0d82bb1f9b0abc9a7b99'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_populate_sysroot.sigdata.b3f362658ce87e7e720f29144364fae73eb8a1eaaf897c5c0e2468ba8f13a6b4'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package.sigdata.b5181478414e28c3dd45ae98b6eab21ed4ef1a15e03cb4de9180e50e1cd3cf00'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.3415af033f8229cb7feed2837e9af07578edddfb21352d467c6ad4a2d80ccee6'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_install.sigdata.92074371f84fc2a53a748fb31021ea4bfe391ea30866ae3fe170c6c608e13a04'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_packagedata.sigdata.03502fab07462a4db1a68ac3ece92c0415bc986397296574397d05b21aee1f1c'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package_qa.sigdata.97f781f84907e0c40a014339446dc0098dc89fa8cd0d4f9a681908337e3f1424'

2021-08-19 19:17:53,313 - oe-selftest - INFO - ======================================================================
2021-08-19 19:17:53,313 - oe-selftest - INFO - FAIL: test_sstate_sametune_samesigs (sstatetests.SStateTests)
2021-08-19 19:17:53,313 - oe-selftest - INFO - ----------------------------------------------------------------------
2021-08-19 19:17:53,314 - oe-selftest - INFO - Traceback (most recent call last):
  File "/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/lib/oeqa/selftest/cases/sstatetests.py", line 449, in test_sstate_sametune_samesigs
    self.assertCountEqual(files1, files2)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.fc54579cc139c777172242c3da3e095f4308c5ce606b2365a5b86c4371ee4f86'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_compile.sigdata.86cb5a1346b0615cb21fab3c0110cc964eccedbb94b2ccf99546dfd456897cca'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_install.sigdata.a1c0c3ed27e293a2daaa185482dc7fee2ed18490748e5077f8012882091aa2a8'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_populate_sysroot.sigdata.a77e66f54b1be8285f4b33bafdd3d15e0a1ea694c0fd18832c61efb8c8fb312a'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_install.sigdata.b5d31a12e244bccafa0e5b8152c051c7d071855da0b638a3479ce7d677f146b5'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_populate_sysroot.sigdata.4fd86084264170fb770ca358d1c3efd8dd70e231fe0d2328f98de3732c50a2a7'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.448a8113230a16ac5d606de18989f98b3700edeb3e7956c6f02207aa76a5d4f3'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_compile.sigdata.de7ff2af7f15af3b23a6ceb362ffa91602eebd17e19ed3df7709d81c2c390ce4'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_compile.sigdata.5ed1d5378e69e6ce244174b1becfb5340fb7349d25780cc8f5a7f222b4bf5cde'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_install.sigdata.4fb2c2301f0aca4a4e2add6ca1656d3bf843b88cf31819c70ac4de60cca2b513'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_configure.sigdata.1330164135e31705d4f1120ded68cd49dc32eb8d37945854b8383f7894366f61'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.c92d02429f22ecf3c6bb5c31cd2f4faaca852e6115e549be6a1154ef88e42049'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package.sigdata.8614d96d94145c5a40e074b90ab4d10e2a228c8dd39916213ca67f96632d6133'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_packagedata.sigdata.fdfe6627047063dcf31c49165a716901448863c29235d9cedc5e07ceb73527b1'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package_write_rpm.sigdata.7537a5040399eaf51e4eb82b4c4d7a4927bfe40b38ce70ebc67be217b945c3de'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_populate_sysroot.sigdata.31bd54b8811665bd9b0da94add1042a768272b88b3301c916ac3f318db87c508'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package_qa.sigdata.13cbaa397a096de35904dd0f8750b19c16419d7d1a2fae0f14c2c7923a308c28'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.9bc0d54595e72e4e4da3980443c1df558581966144ace9f189e526419b7ce2d4'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package_qa.sigdata.19d7bc678a149de0d7f4b97f862f9ee271ef5c66c91886a5852335ed916f9e8b'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_install.sigdata.1e8482a852298d971b4640702a5723b3cf472ef802731b7fa4af7ad63b2fd48d'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_compile.sigdata.f149b25486972d08fc27e40653849eab265b3a31800aa8cf81f50a094b3060ac'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_packagedata.sigdata.4e63c49044a74657f9437ea8d75aecb086aa14bead0471e3b4927d975a3101a7'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package_write_rpm.sigdata.cf1734d0d9b1b20bafeb8c59d6bd812147b6ce5edd59e188f27cbc243038dbdf'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_populate_sysroot.sigdata.f5feb243311ea6bbf2fcd150821e6bb1e5024b361e37e21c8cac275cd542de25'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_configure.sigdata.87d8770b4dfad359aba60cc05741c8b3cc6de3f27f4d7afdd4409394833f0899'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package.sigdata.0e813eb4208488aa2f444072feb41274c1045f7e285b29298ac9275c76b24ad5'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_packagedata.sigdata.3cc10eb84345704add643a12ddddf290a02d4b3c0482382e7b322192f629af56'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_install.sigdata.df3851ac16cc5fbef4a87ac73a43a54b9914581075b8fdd9ce41d4058c3c6ea1'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_populate_sysroot.sigdata.7d6215490248e5b6ebdd13606b0eb5d8afca26574a204f58e73c7880a7360c4a'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.9a8775d578e4e91c87ef0965d09260480b343a7cb586372f5c2f3f46ea7826ea'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package.sigdata.4ee3961f0c45352fe0e2b994dff393489529690dd01875bef5279ef6663f82eb'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_configure.sigdata.c7e1878a5670ac2759ed65c00c7832356aaa3ef8b8b8aac0ffda0fe8fe63c70d'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package_write_rpm.sigdata.869b9a50422604a92d6ed74fe38423f8f6ed6e80ce79255247e77214b5157546'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_compile.sigdata.8bcb4d754f0a6dccf2cea9ea1935a5330697e80a9e83c83749212a4b94a28939'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package_qa.sigdata.09aa4c5f61302977f5a89a55a7ccf914f99a71c10f04c77742ceec7008954990'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package_qa.sigdata.7f6a8e8e9487d8636bb66616077cf81081086062a24615142e5898a64695a29f'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.de37e9ffbafd6fa03ee163ac594b7b419aacaa7f76e841d5755f8f8c60fc229d'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package_write_rpm.sigdata.9bddcac412aa8ee310498f0d7c7a4a06075cc34c0e2592ecff24245b21a4b570'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_install.sigdata.77e14b907df816833644f466be6a219a5dd4ba6a12e18a0bd94b3d2f45febedd'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_compile.sigdata.9cea907c87090b4d9f0cf4460629546297a47db724809fbfd5ee7730401b7574'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_populate_sysroot.sigdata.19fc3d945202f03fe941cdb046886fb934f8267a60e28a7be0f6e2686a479c26'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_packagedata.sigdata.e49c2774170926d3efacc76132e129b5cbdd264971e8087ecc4f307ae8ea4961'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_configure.sigdata.6597ee477731c9440692237db01a70832e473588ab7082751a2f2c9d87c556ae'
First has 1, Second has 0:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package.sigdata.f229bd686fa4d08a7ced7fc54292e959f5b7483734d4aef92f27e9cc1b126f9b'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_compile.sigdata.65f3be30da4dc333a13bbf69d4f0cf418730718936e4f633a01a94f33b8ebef1'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.8ed5b5d7c9a60b44b5097425b26ce5557ec3420cb761c9295c56307d5ddaec22'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_populate_sysroot.sigdata.331b2d9bcff9e6e81582074f1cd8587ffb4eeb64c73a1d2cbdfa0e563a1abff3'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/lib32-rust-cross-i686/1.54.0-r0.do_install.sigdata.a8ae893a542660b332a7cd22e9e982c4241135b06ef30125d487cf2ee92b3b91'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_install.sigdata.045bfaf4832974f96447aa7f7c431abd3c32c56d1956d921354b10f2e57aa7ee'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_compile.sigdata.27dddf67e61a73c1c42fbebf2ec5cd58d9c6b18b79ab9d3bbc61f350b393700a'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_rust_gen_targets.sigdata.83d1a26ebe7e2df3f496024a297ba782e145e6982457e09102d5e7c4fbf1b3b7'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86_64-linux/rust-cross-i686/1.54.0-r0.do_populate_sysroot.sigdata.891d5abc469d187e34b531bf81a1ef742d6b834204af8c43ee0949744f2ea413'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_configure.sigdata.59dc8b0def7802484c734787962400026246f70c2bf48ade3baeac5671d9c47f'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_populate_sysroot.sigdata.7358ba758bc3a8c76d87a45ecb5dc8cb3224b45098f81d3724b226295922c475'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package_qa.sigdata.ad013cb428b0fc127583e1ca7a5f39a4cca7cd7fe13fa669ed3cbc4b9ee3332a'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_install.sigdata.88e565d06d7c69e985da195f7752911022a974d6b9e89d82699de274d107f853'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package.sigdata.802365a52628bc0b173556977b135e38fee5fbfc415327bbb0b695ef601a4709'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_packagedata.sigdata.a3c32256c02d42d24d639b04f6fc2073b0c53c840cd008f4b8b788b94977da94'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_compile.sigdata.19d6cef321ed3808d928b6de955b214f1a3444afc6e6fe73b68447060d66cdff'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.16c650c390029ea40a19975d6e9ac1c9e8486cb82ff49607cbb380a771ffe970'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/rust/1.54.0-r0.do_package_write_rpm.sigdata.6d745c3a58e4d35933079194d8e83979ea0d032a9d6498c880305b8b283b8412'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_configure.sigdata.149b205adb6a48cb396e6da73dd45fb13c51ece5c0e56e01b4458e32a8bbc21c'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package_qa.sigdata.914dc0f062bcc4d4898cafff2b380735b5bfb2343408fb6460046f400f73755b'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_packagedata.sigdata.71beb081559a476e39a0527a8a42b92c9e4ee209dedbf67e82d1ccc03babf9fb'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_compile.sigdata.c2bddf0463e3c501a9ccaf1b1511f322311fb5e8c244e6cff9046db8c65e8f72'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package.sigdata.c6e360d90dae93948f78fdc15d054df8d76fb998bfe8e7d5d194f3dcf24ce30f'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_populate_sysroot.sigdata.6f146b8c3d06fd84630198af8e2b8b7d8446c82c0e2f292f5b33043b67c698c9'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.d3afb749ff9f7f41f9a79b6f2d7d00615c3a05435e75d91cad2ebec11843bc92'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_install.sigdata.17e30337464c783f7ae7e2c156bb747ef149606d78d58d1f144a01196d94315a'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/core2-32-poky-linux/libstd-rs/1.54.0-r0.do_package_write_rpm.sigdata.4d760c1f09a402e714c869b5f5f4af5b831e8fc3f0df3c40168387f10cb7c324'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package_qa.sigdata.c57da894fee804da21cdadeb46ce4eb4109ca220edb97317e4c1643a43ba9e2d'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_compile.sigdata.29c8e6034e583ae319c6c10f7c4836d1e36dd1958be403909015aef467f9aae4'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package_write_rpm.sigdata.6c4edfb164464b469d13f708c0cec9aef53029579999abfcfcb422986bd12e32'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_package.sigdata.5f1e651a667cc88f31cd1aec4957dd8b5ae7fbc23afc2b4c333354d019a662ff'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_configure.sigdata.ec87c5e68c278794e01b1b9c04638282cfd51c49f33cb8edb0fec532c8c82e2c'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_packagedata.sigdata.f0ded7162e6e6e9fcc5f1979ceae387c460572398e2711ec2e72eb8fa35fe714'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_populate_sysroot.sigdata.77885fed1ad105f8827d4249a8a708879922b9dddcefdcc56f7bb574b911c9f2'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_install.sigdata.bf859e6a1293873570398b9bb5985cf52fd5063167e41982de7654ab0eaae860'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libstd-rs/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.1a58b70dc6d5603759317eae619cae800aad6931792369177a104444377cc328'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package_write_rpm.sigdata.ff24591a4417413bf286f9e71c84d5c2269f9b96281a07f40549644af42c3d97'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_compile.sigdata.71fef31c7bbce861911f82dd52b09c5a6fc249de935b8367ea20082adef7633f'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_configure.sigdata.f7f84daf9d8df2a85fd595496b99ff1d6d23d51a7d9f0d82bb1f9b0abc9a7b99'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_populate_sysroot.sigdata.b3f362658ce87e7e720f29144364fae73eb8a1eaaf897c5c0e2468ba8f13a6b4'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package.sigdata.b5181478414e28c3dd45ae98b6eab21ed4ef1a15e03cb4de9180e50e1cd3cf00'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_prepare_recipe_sysroot.sigdata.3415af033f8229cb7feed2837e9af07578edddfb21352d467c6ad4a2d80ccee6'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_install.sigdata.92074371f84fc2a53a748fb31021ea4bfe391ea30866ae3fe170c6c608e13a04'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_packagedata.sigdata.03502fab07462a4db1a68ac3ece92c0415bc986397296574397d05b21aee1f1c'
First has 0, Second has 1:  '/ala-lpggp31/rmacleod/src/distro/yocto/b/aug-19-a-st/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-rust/1.54.0-r0.do_package_qa.sigdata.97f781f84907e0c40a014339446dc0098dc89fa8cd0d4f9a681908337e3f1424'

2021-08-19 19:17:53,314 - oe-selftest - INFO - ----------------------------------------------------------------------
2021-08-19 19:17:53,314 - oe-selftest - INFO - Ran 2 tests in 212.678s
2021-08-19 19:17:53,315 - oe-selftest - INFO - FAILED
2021-08-19 19:17:53,315 - oe-selftest - INFO -  (failures=1)
2021-08-19 19:18:00,057 - oe-selftest - INFO - RESULTS:
2021-08-19 19:18:00,058 - oe-selftest - INFO - RESULTS - sstatetests.SStateTests.test_sstate_noop_samesigs: PASSED (50.63s)
2021-08-19 19:18:00,059 - oe-selftest - INFO - RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs: FAILED (160.05s)
2021-08-19 19:18:00,062 - oe-selftest - INFO - SUMMARY:
2021-08-19 19:18:00,062 - oe-selftest - INFO - oe-selftest () - Ran 2 tests in 212.680s
2021-08-19 19:18:00,062 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed (successes=1, skipped=0, failures=1, errors=0)

--------------5B2540863C54AC13B23B2E88--
