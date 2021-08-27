Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3738.1630037136568246813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 21:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=qmv44DF+;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38737f6272=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17R3kYB1012897
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 04:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=yjToxEKns0Tfftz0OPzsI15STTrDDge8u3wB1Y9STNw=;
 b=qmv44DF+YUh6ykHGiHzgvfQxwz3R/yFgdHkInuuVniswnsLRCv8P0U8AWNvuoYJ69lmk
 nhXij6TRi5XrnurO5csGR1JWsZpBAR+3VCvnc2UuHvDtXoo6ttwxJWaL8BTghQWXwZ1f
 CqyD5k/oFj7FPw70dzH6vashJV4FynHYAg1fu5NQDkGp4lL7VnddjnwSWcazVFjEN7Ya
 zUGVJiVXfFjGj9OJFZ19hj8T2aLNYZv71AnFWDRRose7tb11vARB+HFuG3TcapyuEaDP
 bnynPZi4FvYwQrEC6UF83yEieyUr2Hmf5BGVleCW1jlHidseK0s3o3BiDJETheCh+Qjo 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ap12yrypg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 04:05:35 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17R45ZqC014611
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 04:05:35 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ap12yrypf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Aug 2021 04:05:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gl9zBB0GZkkF2hgNLAMGeyD3qluO6ZmYtZs8y/RGTT2ryDZgIzeEfzsYEx5a/D0ngkLq3TnUN4p6ZxeZkX7ThqSF65lMyprkHmHBX7QkGzUkul2PZYtsKpfm3Z0t0DfNA+d7otxdQXAINcvxOICVCWIL4Bz8p0wD4ixTPCaFEBv9jtWOuzETxZMcOFl0whPxw6wLpPyrijrawdfPNYBzCBDCe95QDrnjyQbEYyIBvPBDbwJEIqaQ939L7TU6nPNStZ52srvdrMI/AZBdVymXLd5VbHH0FtUKOiY8/7h6EWMhQrCdMVAK77eB5U20BreN4vtvBjY/0cyjnhTnEOes2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjToxEKns0Tfftz0OPzsI15STTrDDge8u3wB1Y9STNw=;
 b=CK0oX8JWyyynPjyuGPadRLfJpIuTbh/GtqUAnNJHhPbCdjIU8g3kPyR6eiedCgvyB82zOb5Qz/JrL1CUHd990zJ/WXFkH5JdVM1dKA90JCbPID2OJNpp9w6iY7QQKYdLabHp6ma4lULwQxpxyV8EIOH/kwnmpHTDvfEerYhOSexDNCls6eK4kaISEJ25y2EuyPgku7Q36yy/j2/ouh93kvOCojn1B0ig2Y12nWRsWX7oajYquZMRFI93LEsEZ+E5O9wXuNKWY0ALnk+c6ThCXd4XqM1qFYF2ThgmsFLezysmfp6Lwz6ftcE+H9uawvMukXYY4Udx0dyPIce9HR7PkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR1101MB2185.namprd11.prod.outlook.com (2603:10b6:4:4f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 04:05:33 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 04:05:33 +0000
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io,
        cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com,
        Khem Raj <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
        saul.wold@windriver.com, martin.jansa@gmail.com, paul@pbarker.dev,
        Trevor Gamblin <trevor.gamblin@windriver.com>,
        anbelski@linux.microsoft.com, Vinay Kumar <vinay.m.engg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Orling, Timothy T" <timothy.t.orling@intel.com>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
 <20210813151947.55142-1-vinay.m.engg@gmail.com>
 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
 <169C1FA457B99CA0.23238@lists.openembedded.org>
 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
 <169D3274AAECC435.19323@lists.openembedded.org>
 <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
 <87dacc6ecc7af109db0039894254c77b43ae8323.camel@linuxfoundation.org>
 <3e7ff50b-57f8-0503-b514-e53a82e0b2d5@windriver.com>
 <e36985f82120c87f598289c672eafdacb5e37d86.camel@linuxfoundation.org>
 <169E4C0C80951608.1595@lists.openembedded.org>
Message-ID: <23bc2196-4f7c-4958-e191-bd6f47223da2@windriver.com>
Date: Fri, 27 Aug 2021 00:05:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <169E4C0C80951608.1595@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by SJ0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:a03:33a::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Fri, 27 Aug 2021 04:05:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 184f6c67-fc3a-4d70-7be9-08d9690fea9e
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2185:
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
 <DM5PR1101MB218541CD1E1189C42DA9BECAF8C89@DM5PR1101MB2185.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 Aic79fyuVjZvCB1sPIagPj5OH5j8jU5DBOfgrR7R+wS6SzQgcfaenySYSmcp+nOv8QNneNILo8Ih+DzG4Rmt0/j7WDEwvVFwzy85tt4+Xec4Q+VmBOcTp6qi8qI1OmlZzvB8IC8m7quekDVjuqKvv02j2gd0e8JmiJP7yDnJe40sog2UHHpT5cwG0qV2d40LoqfRhhCzJjcH+lpDnXE7wPTMlKh8z4fMRP/kkkwxpuIGxmReFsXaps/DZsdUA28ZCkIq5JSVDQIHvz8hEc857oi9etuC0uIeeH/V0Y1BdRf1gVlPuLaxvB1zqJdS0DAsUvWCCBn49PwRYsVADohlYrmaLzj5wqViez/WglhlFVhSyUnWFW/C9C5gmiQb/gsheceB2LHlpjEIhnrwPyBKmoIhP9+0U7y9o4TYbdW/CVynCl82gmHcBoomfw5D/dKC7aVFbR3jI8S5yCPW9WnLHht1lUQnZ3e/nFTqnhydPgUhPA6depZIHqGkuFHdsbU1yxRhGmnLtH8rZTxmbSBA30NIV7v5PVM+l6LILMT7pEew3Wv4YdKCEuUCLLL8NQoKUUS4LMjQiyjgYRJu/RDAvGS4dNAIZ4yNmhKetzlv17AScsyDZPzp5CXNExqcJeBEkg29v88RkA3lmK4PmiGaJWZDzZcGg04QTFszVmG/sNCU3NuVc+QpYrvNjXVrxoU1RtWhvbwhEpE2Bu4uSamYrNnEP0mlJFoGAGBOaab9B7tR6dk3cVL+06gVWAQpU8TYQBVQpQGBcXpx301htVvymkWZjm5Yjg7arZX7hKu+WD/jClO0EOk8kRTcMiz/EZJaGlPujPzSqrbqv6jbiUBayj4s4TK8e1TrXcrlnEQEMTyipfhvrdmw9c/L4gf+fafk
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(136003)(366004)(346002)(38100700002)(478600001)(16576012)(83380400001)(52116002)(38350700002)(6916009)(186003)(966005)(2906002)(8676002)(7416002)(6666004)(53546011)(36756003)(66946007)(66556008)(316002)(66476007)(6486002)(5660300002)(4326008)(86362001)(8936002)(956004)(31686004)(15650500001)(26005)(2616005)(54906003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?VHhMU2xMblc3WVNZK3FJUlg1RjhRUjU4TEdIMnYxREwvS2NINHh0aGNXRkRX?=
 =?utf-8?B?c2xqbk9EL0NXOGtVLzF1NjJwRDYxdGwrK1E3Y1BoUkQ3Wk9FQlJCc052VHNX?=
 =?utf-8?B?Z2pjSExTOU1rY0Z1aTMyUEh5anpsNCtJSncrT1pmaDRsVy94eVVzalZPS1Z6?=
 =?utf-8?B?M3BBMzV0NWVEbnhleXJjbS9oR3R3VU5xbjVWR0piZWhoTTh5c2d5SGt6VElF?=
 =?utf-8?B?bzBxbWh5ZG5QbGJzZUMzNTlUQXJWWGREMWNwK2tySDlqb3RFQmpVcU14U2dM?=
 =?utf-8?B?QzV6UWNsUVRtbm5VeUhZZWpVbmh5ZmQvUTZOZnFlZkRzMm9pUUZHQ082OGx3?=
 =?utf-8?B?bVY1d0s0cTlqOEw4ZHQzUW1RaFVXZ1h6YmwxcHhhRDNPdXN4S2ZxR1JMSTgz?=
 =?utf-8?B?ZHZERkE3UDhFWWkySndHUXhscFFjVlpQUXJpbHpnR1FRcG8vaHRXUEpDaFlN?=
 =?utf-8?B?RGp3MW1TaVF6TnMzM3BzRCtvTkN6ZGdxekNibW9RelYwZkpsdms3NStHOEd0?=
 =?utf-8?B?ZGprWVF0NDBFT0VsV0VBZlNwVDJiWmk2WFU4KythUUVIcnlic3BrRVBZcHJF?=
 =?utf-8?B?VzJVTWVvdzFsSGJDOENlTWQvZ3dZTTdET0h5SnYzZTdGNWkyMXZSR0tIdUNl?=
 =?utf-8?B?Z2c5d2NxMVA4MlRqQ1RPQkgwcm5UNlpiLzVjZk5pd2J0QkNna0Z6NWZHOVlE?=
 =?utf-8?B?Y0YzcEwyT2FaMzJETmdpNDBtSTJORnhPSklFS2Y0OUFVd2JJUERyREdDTmo4?=
 =?utf-8?B?NjBZTkZPVkliS1JrMnNDOEk2T1dXeHZVUlZwVGRPbDFwRGVxbk9LRm9mRUFa?=
 =?utf-8?B?NGVtdDV2STBRM3UxS1lTU09YbkFGa1daNWQ3S3BIOHYydkRYV0tLYUdXbHJ3?=
 =?utf-8?B?ZUNoNDI3aVZwbHBjTDB2MjY2L01YZGhISjBoRnhVZm5QdXZVNTRVYTRMKzd6?=
 =?utf-8?B?cC9HSkw0dC8ybm9jZU56R0NFbG1EMld1MzkvVWgxUjdUdnhueDFtUzVKS0JH?=
 =?utf-8?B?ZFhVQUN3bzJORWVhY0dDaFh0S0t6WWtXU2ZvanRETzhqME9VVytOcWEvQ1RG?=
 =?utf-8?B?eVdGVFFRblFxaDd3WDcwcTRJT1lTRWlpejBTTWNLejUxSEFzYjAxOFRBYk5O?=
 =?utf-8?B?NkZjNEt1Z2VSbHZ2akZqZEtIUXllZkNxZ010ZktncTZmbWg0ZFozdVptdXdC?=
 =?utf-8?B?ZGJrdWdvaDgrOUQ1akhscGxmT1Y1Wk93M0FJeWdqREpZR3FZSk14NjdFS0Ny?=
 =?utf-8?B?YkJETGw4RHFCUnlENnpRY3pGZHYwcE9MK3FZT0ZTeEFYQnlQT0g4REt2bjV0?=
 =?utf-8?B?NFpRbTB4ODlveE5QM3BHOU9qTnJIcmJGUFRObU0vVnFUc0RKa0h2WGFnbGNV?=
 =?utf-8?B?ZDk3UXNMWkdtK2czYllDUlREOUNsYUxXdldKVFZVSWFJNHZPYUlEM1VDaE0r?=
 =?utf-8?B?eHpFeWJwUzZ3cG1LaE1IOXliRVpjZ0dNSmV2VjlrZ3VaZGloY3JVWStNS1Vx?=
 =?utf-8?B?NC84bFl0QU9rN0NvSlYzNmowdXRFUkpKWUlWazlJMjVpaDNqR3hUeVZWTXQ5?=
 =?utf-8?B?NWZUQUhNOEZYVFVVOXF4bXJsNUFzZ2lkeEhxaURFZlV6bGh1Vmp3Z3N6Wmdt?=
 =?utf-8?B?WTVJWTFNeUhSWStPTkN0Q0loUTJhbXR3SUhCQTlZWGVER2VvcGFTMVU5OVhw?=
 =?utf-8?B?eU1Qa21aT1lpU3pTSW42bXQ2NUptbzlZZFEzVHVkVi9GUndySStlZ3dYaUJz?=
 =?utf-8?Q?LuLhAI1pRv8alAQXlS0Qa9lZpKTFm8FiOZTtZ3J?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184f6c67-fc3a-4d70-7be9-08d9690fea9e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 04:05:33.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHB+vFSFYs3+ujtTu4hzmqM466qTqb+4I04z4aXShe2S5U53+0b8k9xOEhTlyNjedYXW9Dgh2gyP1ZuSztu5LrmLlQ4ZLgoBaCFy1iKWDik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2185
X-Proofpoint-GUID: K6G1WmltlxFgWmgzsF5-zYc8l1UvUtjX
X-Proofpoint-ORIG-GUID: 5X3mUALJhMPNQFXWOHipujaYjqPii0iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-27_01,2021-08-26_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270022
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17R3kYB1012897
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-08-24 12:48 p.m., Randy MacLeod wrote:
> Add Steven Walter in hopes that he or someone else
> who uses meta-rust will help out.
>=20
> On 2021-08-23 5:21 a.m., Richard Purdie wrote:
>> On Sun, 2021-08-22 at 08:45 -0400, Randy MacLeod wrote:
>>> On 2021-08-22 7:19 a.m., Richard Purdie wrote:
>>>> On Sat, 2021-08-21 at 23:12 -0400, Randy MacLeod wrote:
>>>>> On 2021-08-20 10:48 p.m., Randy MacLeod wrote:
>>>>> With a patch from Richard, and the http_proxy check removed,
>>>>> $ git diff | grep "^[+-]"
>>>>> =C2=A0 =C2=A0--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
>>>>> =C2=A0 =C2=A0+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
>>>>> =C2=A0 =C2=A0-http_proxy =3D "http://example.com/"
>>>>> =C2=A0 =C2=A0+http_proxy =3D ""
>>>>> we have fixed the oe-selftest that was failing.
>>>>> =C2=A0 =C2=A0Any volunteers to stub out the http[s]_proxy code in car=
go ?
>>>>> I've written up a commit log that could use some review and pushed=20
>>>>> an update
>>>>> to:
>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacl=
eod/rust-redo-aug-17-2021-a=20
>>>>>
>>>>>
>>>>
>>>> I'm not sure you need to change cargo, I think if you remove the bit=
=20
>>>> in the
>>>> bbclass that injects http_proxy, the tests are ok. That will perhaps=
=20
>>>> break
>>>> anyone using proxies but for now, I think that is a reasonable step=20
>>>> of getting
>>>> this moved forward?
>>> That's what I hoped for as well but not what my testing showed.
>>>
>>> I removed (commented out actually) the http_proxy injection here:
>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drmac=
leod/rust-redo-aug-17-2021-a&id=3Da4808f787caf8d0b44cf3946cf204164f24f91d4=
=20
>>>
>>>
>>> but the test still fails unless I mangle the test:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 meta/lib/oeqa/selftest/cases/sstatetests.py
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -http_proxy =3D "http://example.com/"
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 +http_proxy =3D ""
>> Right, my point is that doesn't remove it. You need to delete it, not=20
>> comment it
>> out.
>>
>> The issue is that bitbake does variable expansion on the scripts=20
>> before running
>> them.
>>
>> It can't tell that this is a comment, just that the script differs after
>> variable expansion.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
> Richard has fixed several new issues and is testing this in master-next:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=3Dmaster-next
>=20
> using the YP autobuilder.
>=20
> We're seeing some odd intermittent build failures especially when using
> the uninative class (used by default in poky) perhaps on older hosts but
> we're not 100% sure of that correlation yet. See below and:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/581/st=
eps/13/logs/stdio=20
>=20
>=20
> If we can't get this fixed in the next day or two, we'll miss the fall=20
> release.
>=20
> ../Randy


Thanks to Richard's dogged determination and Herculean efforts,
the Rust recipes are now merged to the oe-core master branch.

    https://git.openembedded.org/openembedded-core/log/?qt=3Drange&q=3Dmast=
er


There are still some known problems, such as:

1. Tim Orling finding that Rust fails to build python-cryptography:

=20
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/rust_p=
ython3-cryptography

Tim says that this change helps:
=20
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dtimo/rustc=
-print-cfg-fix


and:

2. a reproducible build failure on CentOS-7:

    https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/597

where, we see:
    =3D note: /bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' \
    not found (required by \
    /home/pokybuild/yocto-worker/reproducible-centos/build/\
    build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
    1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)





    error: linking with `\
    /home/pokybuild/yocto-worker/reproducible-centos/build/\
    build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
    1.54.0-r0/wrapper/target-rust-ccld` failed: exit status: 1


---


Please test, send patches and/or let me know about any other problems by
email or by opening  a defect in the YP bugzilla:
    https://bugzilla.yoctoproject.org/


I'll work on a commit for meta-rust to remove the components
that have been moved to oe-core. I'm not sure what the
meta-rust developers and users want to do as far as what will
remain in meta-rust but the short list that I have so far is:
1. scripts
2. Jenkins tests
3. Rust version 1.51.0 ?


../Randy

>=20
>=20
> error: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found=20
> (required by=20
> /home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reproduci=
bleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/build/boo=
tstrap/debug/deps/libproc_macro_error_attr-9c7a09885c50c72e.so)=20
>=20
>  =C2=A0=C2=A0=C2=A0 -->=20
> /home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reproduci=
bleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/vendor/pr=
oc-macro-error/src/lib.rs:284:9=20
>=20
>  =C2=A0284 | pub use proc_macro_error_attr::proc_macro_error;
>  =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^^^^^^^^^^^^^^^^^^^^^
>=20
>  =C2=A0error: aborting due to previous error
>  =C2=A0error: could not compile `proc-macro-error`
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
