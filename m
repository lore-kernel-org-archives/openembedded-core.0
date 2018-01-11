Return-Path: <mkelly@xevo.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0053.outbound.protection.outlook.com [104.47.38.53])
	by mail.openembedded.org (Postfix) with ESMTP id CBB986059E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 19:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VKKP/F/Agrln2CVHBW7qf2YNj4JNKVYTXtMoiLObW7k=;
	b=or5eRyovns0XOuU9FnxMJ1kScDiFN4GEkVwa7R/7UsjAaebOYP/GYuA6V8IFFcSGb/jia/YyhZE2s1d80ZmscHFFDrc3z5I4ZJZuBLhthO5BbSkQX8jvdCdT7yeKpyWNowmEE+qAPrbwpCP4tVexZCkQBOOSMAC6E5DsN9NYU0Y=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	CY4PR0101MB2934.prod.exchangelabs.com (10.171.223.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Thu, 11 Jan 2018 19:33:34 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
	<CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
	<0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
	<aa0ec366-dcd4-bac2-418a-acb0f9a06709@xevo.com>
	<CAMKF1sqKEc6KBZChcgx2U9e9eWLrW1NC60=HkSPHjfJn5UX7NA@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <7f531d17-d48d-2472-896b-764c2f1b756e@xevo.com>
Date: Thu, 11 Jan 2018 11:33:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqKEc6KBZChcgx2U9e9eWLrW1NC60=HkSPHjfJn5UX7NA@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: SN4PR0401CA0004.namprd04.prod.outlook.com (10.171.32.14) To
	CY4PR0101MB2934.prod.exchangelabs.com (10.171.223.139)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 800fff52-b53e-4c7f-a94b-08d5592a34da
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR0101MB2934; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	3:8M2uNX2o0CmN+V5CuLzm7Bo8Mrzb5Vgp1xsy6xbvIvDRx1I/SjlDiTjMauEv0lN5iTaon9999q9EutkQ4XevAG51ejpTNQhZ/uYMwsGUPWPjge36Q64MyFm+dyUW5Cat2o82EMWNJXRERJt/OV68vV91bXCsYPA1XKLdL6ESNJCz1OcZ/YlBRIySmRdYHIxRrkLZHrGOpRvj1L/1o0NsUAptBxbHyQp/pxpRn9mmTxVWUEB7XzHWFn9iGJYWrGwE;
	25:LKxqZ4wNvMGRgV08eKPNeToVhFbhLc7BMYf+CRZYorxjfbwy9FbtBVZoHYL9eInR4GdrNN9c7yTY/FTrPt0G+MIjXyemNoVFSrLZsfDcWbjom1I5NR98u02GU+hJqf9oq3MDz+wVff0dl0CKDOZb7Q4fPtqGXA204uCqOTYhj0MYLcwcLDC4Bx+cwGr4B+zNibt80w69ViirTnuLjQetinBw5UWyh59HU8Ls3GoY+kGjgU0otCpqAwnMpa30+lwWS/1Sme2i1vRJT9vUYSQ+KDnCaty5vNxE9sC1HqWApGY9Hi564YrdaBhSsq3drYkqd6UtCii/XoQowBJPLL5pdw==;
	31:bZ9oJ+/ykH6ZFff6T8stMKgmFMgVNlPKFGKPwPiU8Yuu0tqC67zmJUzigemVO73QvyuFZ6PXO1w6saOr0C5M/53vUMDGcVZaiGehk+p5tFYbM1snreV5PphnY0fFdQ+1VSgh3KUA9U2fo1YAjuM8QHRHLwkAPVQDBFP1jZ2XXWZ7vnSTUZ7NkPQRjkrMwwXGUiH4YbwxxK9dT2BYefyazybfg6/9XtoGXkleu+UanOU=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2934:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	20:rUsNSzVZs4PQgMsA16FB5h55bCjHkTrlyZV5CN0mg9mSu8SYvwg5piMIumZw7ZLCLowOHTMt/5qxfXCOLEPn4PgvQIDy1f3jQ51hyD/nRnpbOBO4wtk8z/XMbgoN56IOy+9uafAk/gQZru80eslMmbyn9ZzohL54thRjHFfr5ZG8qtn51zUsad94o3HXCj84OStMPf9lSBozYB+LZuMQJT6cl2cdSQb3KEZYSLiP7ITUKSEfgQqIEq55sZ+PIRoVGDMLWUljry24jKN0ThUnX0wGlhNP9DAgEWm6xg13SoXVIHJ7xIHG2W0MKUbmvozy/hdLlj6QMxvxUoA6lXffaJmWPQwemUs5k3msusD/8BgANYTHS+oROdBJLIp5ZRpJJIycmQwEXME28u3iaw6vWRa85dBAdnjQ6Ql0pffp4W8=;
	4:WHhJ+qz7tYpD51MXfxMVKIOyPH8VsiL46RvbWrBEqBzAz9EsIkxbTapv0U6O4d/OAaP/M4emEFjCI/2zqoenbwANukqkIaZ6S/Zu0fqZddhymCrCsC6JIbEr5HVMDdnnVaJiq2EwpYVpf/NBwjLBztr+JzhKMbFMKm9p/4PqAScf/W76rgcs8DYspRQ+DtB3d9CK+AE7NhRhdwcg1yYaXBNRt+gLCkt4t0fkbrC67fVnQcWG11B29+LL4LRlHjCtTw21QtIqv9WK2OfzfW/iOg==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29345355091DFEF6206C4AAAAB160@CY4PR0101MB2934.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231023)(944501075)(6041268)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:CY4PR0101MB2934; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR0101MB2934; 
X-Forefront-PRVS: 0549E6FD50
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(366004)(39380400002)(346002)(396003)(376002)(39850400004)(189003)(199004)(24454002)(316002)(8676002)(53546011)(25786009)(31686004)(97736004)(31696002)(230700001)(81156014)(76176011)(386003)(67846002)(16526018)(81166006)(478600001)(68736007)(93886005)(86362001)(58126008)(83506002)(52116002)(6666003)(65826007)(36756003)(64126003)(6116002)(2906002)(3846002)(2486003)(16576012)(6246003)(5660300001)(54906003)(305945005)(52146003)(8936002)(7736002)(2950100002)(23676004)(6916009)(39060400002)(229853002)(65806001)(106356001)(105586002)(6486002)(65956001)(66066001)(77096006)(53936002)(47776003)(4326008)(90366009)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2934; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzQ7MjM6R2VkVW9OeUdXcjFaeStzVE5xU0MwRXRD?=
	=?utf-8?B?azdQbDZMRHBpT3JOM0hpN2tsUVdCbUswS1lNOWRONFF3eEcyK3U4L0NjMGx3?=
	=?utf-8?B?dHh3cVlyclYwclRab0NCUmdTOU9ONURTOFNwcVVXVGhyQ3E5RjZ1QVlsY0dv?=
	=?utf-8?B?cHpYZkJHeEIzNGhGME9Xd1A4Zmd3UjJPVkoxYzd6dDJEb1BBOFJsMXhVWFE3?=
	=?utf-8?B?SnhRcThqblRtTVFQcEZ4aXNsRk5ENlRkc2c1Y0V6dXpvYTlGV3NMc2J1Qzlk?=
	=?utf-8?B?N0czUkhjakJLRi9qMmYrNHdkYklabVpaSjRacWdMbGJ4c2VKLzZrdSszSHE3?=
	=?utf-8?B?NHN2QVMrMmJXamNOS2dZSUhnUkpKem5CNHBpU1F0THIzR3E0aFk4dWtBZFdn?=
	=?utf-8?B?c2E3Yk5VU1V2QWNvWXhadTgwTU9CRklGYVpZelBjNXhyOGZaZ0dZOUFMTnRX?=
	=?utf-8?B?ekd3ZGhhWEJ1RGhua2lqcGpoMktzTmtBM3F3c0dCOWpiQkxKT0lSMjRCSnZU?=
	=?utf-8?B?WlpQd0NGd202dEZORFp2azRkbGZoQzQwVzZNYXFZQmpPcVhwNEhWYlhZdnV0?=
	=?utf-8?B?WXhnd0pZeGJWOSt3R0w2cWNHaWFsVjVYakpGdldQRWw2cWFsQkh2SHpFb1hS?=
	=?utf-8?B?NDlZR2RmcFRnVCtCdm1GY0RnY2xobk5EV2diY2RlYytUM1o1Rkd3SnNkbDF1?=
	=?utf-8?B?bndaczNraFlldk01d3dJN2hSb2V1dm80aXErRlRwNlpmY1FYc0xSclNuTGhQ?=
	=?utf-8?B?UU5ocDZPbC9GaHVFQW80K2lvQ0FlLzdQTnRKNlNHL0dHUFpDNFBMeWZpS25l?=
	=?utf-8?B?Z3JsR3BHU0U3YVNYUzZKeWprK1pmRUhXa2xLN1RaLzkwYmVpYk5aeDJCVXRr?=
	=?utf-8?B?a3NnNWV6am8yQm9ENWREZ25xR2pleDVGTzhBeGwweGlITTc4ZTkvanJxYlA4?=
	=?utf-8?B?Q1NvWjZUalZvcTJFMWsvU0JRSFpPZkRpVUp0TlpjYllOWGUxWDlrSGgxWFk5?=
	=?utf-8?B?L2ZNVFFERm1HeTByd3lqRWMrUThZYXUxd1R0MTVreTRTalhEVVZpRm1VRmh5?=
	=?utf-8?B?QXNZVDl3L2YzR2F2VU40N0JKakZjUDJHdml2S25sL2xrajMrZUUyTXFVMkpQ?=
	=?utf-8?B?V0Y5WVdEYWpycXoyN0YxazU4RElnUzJwVDFGZFlibG9vSUJHM0pQbkpScmZZ?=
	=?utf-8?B?bjJQdTBmNnREWElUbkRqMmJjRUhZVlNJMGZ2V0ZrRHQ2QnordDFCWFgwM2dV?=
	=?utf-8?B?VWw1L2JGYzdkVEpjbHJISHV6OVFBOE5CbHRMWExia2s0SnNUT1hnK05JV0lq?=
	=?utf-8?B?ZjhxdWRwclZJam1CQVJQbHVpenR1L2Jub3QrWUVOQjB3M1FLNWVwN2RLM3p2?=
	=?utf-8?B?MCtvRFNBdzhKZXBpSkpQdi9lYkRZOERFT2ZYMEtvbkVKbVQveWtPOHRBejlQ?=
	=?utf-8?B?OEJDVDFJM2Q3TGtBUzFNS2FQRGErbHBnd0krME1VT3ZqQjNUaUQ1TXRnaHYv?=
	=?utf-8?B?NkUzVkN6anNzbFc4SDJvNkdna1BjcUMxQ2NEYktkbkNnUE9sWWpMakN0dFUx?=
	=?utf-8?B?b25EUVY5NFlCaytRWUNIOGVURHdzZTFYbnlqOGdMWUZPNGpSQ2xWLzNxTDIv?=
	=?utf-8?B?R0wxQ2RpM1VESy9jWkh2NFZ4dGJhcEwvcUxsL2VYSk50QzNaVCtURG1IK3Vr?=
	=?utf-8?B?Z3NnTU82aThUbFcvdkNLemlzM2RpT2hWOEViaThjdFhGRUQ3QWlLQ3FtdXhZ?=
	=?utf-8?B?eWFwOUhHQW13c2xYWjFLZ1lvWE1uc1dLcHVIS2JyL1BPeEVKWlF5ZzIvb0lB?=
	=?utf-8?B?Qnczd0xYN2pnNmRlODBnU3JMZU9FYStYemxyYjN1WmxVN2Nic2VUUUg1VFg5?=
	=?utf-8?B?WFlMOG9Wd003aTlkQTQ5UzJ6dS9rVTM3U0pKY0xCUHpMWC9LRG9jenJpSnVr?=
	=?utf-8?B?bGNaU0VmUHdnaWRESVZCM0JhZFdWelA1V0hnbHhQeWM4YWhwdVBLMittcnRo?=
	=?utf-8?Q?PKtzO3fM?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	6:au5t0u72jKMKUu7/9JUrrxQoqArXsJxWGoQr22nqz06rE5ra5VjkwVwyOfRQt/7o5FIWThGEKvv4WOL5GUr7d6+Bq49REh+t6iMj1DrQne84tor6V7SCvJlTHGOypIFROIDOfb3rkeAPHGCHzq2YvOUw0K/P6UchKZQk8d2XHeBg52IILf0koiRk0cChBva6R1seIWjfVz3RwrizjfwR7ESqSjPgXXogN/5GUeKDoks7s+JHkodcu2yi9BwUmovdxih9oNU3RpW6UHr/EwVSF88fir+z9YCpm6u5kKWKAP/8TgavbmA7gKAsMBTjQlX6BoTts3dNs6chz3MoJvaSBc/5JuFcw1qDUgI65vRqSO4=;
	5:jDTfTHFrXSKRG8/O1y3eWc0f7ZT+gY72ScqR6XQqt9TsMIn1SDkPreQ5iVZd8ru5Q0ukan8nEBwMNgV1rQD3qe7+0083sM9oliiVTxKGv83IRYwgg08CmwqgfBfdJmVP4tJojBKC3Yy27kVdyelIYoe8pUxdDrvjz1+srk5UVVk=;
	24:HGKKy+XlRtzl3ijwVN1nUa7z3TA6ItKr7XSgSwc3eMnQA8Gi7CbNBXyFUssq1wVPZ6fIcYhzCokSuj4WNQMMmw6bU/fsVuXdmRS4aB5HR6c=;
	7:QaVjsCE8CKo1qI36dWVDFEgvAvFwqgNFR5NwecK4qg0Z7zAZ049BgI38eGrdtaElGRUohiyOq3sgV8jroSNyck6dJu+53NRJcipYL2lHLBh6AWeZDBe9ntsl4Og8eCIPX69HL4KcYae83mck6CA0o5U9d0jPp/H5KRJmWaRxgu9RKqm4OHREfWqnQI0HAaaAZw1/G/wUmcBuASFn03WpuEkObnvwOuxD/txDW8TtyUNHIb1XZTEa+FMPrYacSiTB
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2018 19:33:34.7099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 800fff52-b53e-4c7f-a94b-08d5592a34da
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2934
Cc: Jussi Pakkanen <jpakkane@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 19:33:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/2018 11:26 AM, Khem Raj wrote:
> On Thu, Jan 11, 2018 at 11:22 AM, Martin Kelly <mkelly@xevo.com> wrote:
>> Khem and Alexander, could you comment on which solution is preferable from
>> an SDK standpoint? Otherwise, could you nominate someone else to do so in
>> your place? :)
>>
>> Here are the possible solutions proposed:
>>
>> - Generate meson.cross toolchain file at SDK extraction time.
>> - Wrap meson with a shell script that dynamically generates a toolchain file
>> and then runs meson pointing to it.
>> - Change meson to support pulling in env vars in meson.cross, and use a
>> fixed meson.cross file that references the env vars.
>>
> 
> We already have environment file, could it be used for meson as well and needed
> bits be generated during build time for SDK.
> 

Yes, it is certainly technically possible. I'm wondering whether or not 
that involves ugly special-casing, as I'm not familiar with the SDK 
extraction code. If not, it's probably the best solution.

>>
>> On 01/09/2018 12:33 PM, Martin Kelly wrote:
>>>
>>> On 01/09/2018 10:40 AM, Jussi Pakkanen wrote:
>>>>
>>>> On Tue, Jan 9, 2018 at 8:20 PM, Martin Kelly <mkelly@xevo.com> wrote:
>>>>
>>>>> Note the "native C compiler" line, which directly uses $CC.
>>>>>
>>>>> I'm not sure if this is correct, but an easy way to fix the issue is to
>>>>> ignore $CC for internal sanity checking when a cross file is specified.
>>>>> In
>>>>> that way, meson would probe the system and use the normal gcc for sanity
>>>>> checking while still using the cross file for the actual build.
>>>>
>>>>
>>>> That breaks the whole reason the sanity check is there in the first
>>>> place. Its point is to test "is the native compiler the user has
>>>> specified working and capable of creating executables". If we change
>>>> it then that becomes "is the system default compiler (which we might
>>>> or might not use) working". We need to be able to support the case of
>>>> users defining both the cross compiler and the native compiler. So
>>>> something like this:
>>>>
>>>> CC=/some/native/cc meson --cross-file=mycross.txt <other options>
>>>>
>>>
>>> Yeah, that makes sense. The issue here is that the OE SDK sets CC, CXX etc
>>> to point to the cross compiler, not to the native compiler, so when meson
>>> assumes it's native, things will break. I think we need a way to specify
>>> both cross and host compilers separately from the env vars. For example, if
>>> the binaries section were split in two: "host-binaries" and
>>> "target-binaries", then in the cross-file case, meson could use
>>> "host-binaries" instead of looking at CC and other vars.
>>>
>>>>> Right now, the SDK contains fixed contents, and there is some top-level
>>>>> logic
>>>>> for rewriting a few paths to make everything relocatable. I don't think
>>>>> OE
>>>>> wants to inject a special-case one-time generation of the toolchain file
>>>>> at SDK
>>>>> extraction time, as it circumvents the normal build process,
>>>>
>>>>
>>>> Would it not be possible to generate the cross file when creating the
>>>> SDK contents originally? The only change it would need is the same
>>>> kind of path fixing. The setup does not really change.
>>>>
>>>
>>> I think it would be possible, but I'm guessing it would require some
>>> special-casing that we may not want to do. Khem probably has a better
>>> informed opinion on this than I.
>>>
>>>>> Another approach would be to generate the toolchain file truly
>>>>> "on-the-fly",
>>>>> such that the meson command points to a script that first generates a
>>>>> toolchain file based on the contents of CC, CXX, etc. and then runs
>>>>> meson. I
>>>>> think this is a bad idea because it is complex (will definitely surprise
>>>>> people) and slow. It also breaks people in surprising ways when they
>>>>> accidentally use a meson from outside the SDK due to the PATH setup.
>>>>
>>>>
>>>> This is, roughly, what Debian does currently.
>>>>
>>>
>>> That's too bad :).

