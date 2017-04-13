Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0086.outbound.protection.outlook.com
	[104.47.37.86])
	by mail.openembedded.org (Postfix) with ESMTP id DD79B77D60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 00:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=u39Bw+pHdjdtHG8AXsdZod4h9Q27fNNckTG/TqFHra4=;
	b=RRyQCjSPSNef1/swdLdapZb8vG8dmunId7EXMa7cnDzBN5xzC9TY795pRzzDm/ppOhezufkOPHg9n+tGIGkbF4wz+1Vrik1Pd7be2HFd7rT7oH6bB4xLpTwRCOA6GAcAVH9TlBHOtH1++RHB/+GC3IvZZaaC+VFZcAyLXNOWlrk=
Authentication-Results: xevo.com; dkim=none (message not signed)
	header.d=none;xevo.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	CY4PR01MB2679.prod.exchangelabs.com (10.172.135.13) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1019.17; Thu, 13 Apr 2017 00:11:57 +0000
From: Martin Kelly <mkelly@xevo.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, akuster808
	<akuster808@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1491508529-2862-1-git-send-email-martin@xevo.com>
	<becb96f0-bc8a-3a91-0649-cab9be51d6dd@gmail.com>
	<1491930851.12091.30.camel@linuxfoundation.org>
	<a8ff712f-037d-be31-ab05-5d4f30d6f65b@xevo.com>
Message-ID: <eb7aa35b-6dbb-e009-c085-0d84c257381b@xevo.com>
Date: Wed, 12 Apr 2017 17:16:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <a8ff712f-037d-be31-ab05-5d4f30d6f65b@xevo.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR16CA0006.namprd16.prod.outlook.com (10.173.216.16) To
	CY4PR01MB2679.prod.exchangelabs.com (10.172.135.13)
X-MS-Office365-Filtering-Correlation-Id: 28bbb92f-2f8e-48cf-5a7b-08d48201b30f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR01MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	3:EQhC5wRlR0q3/auKIvA9jGqQ0R7YMdFANPqZNaDw4EKBcXRSBGZ3YEqIGs+K3OMJGx5FKHz0vW9/fWCH+01lsG9Vff0uw3cWq7n5naZYjCJUG0Bu/IuU449/qCbiUEKWNYr+RwbioljFNGuW54knQTn9ji/n1+/Q0NMqmp8ztnOWA8+eDSrdVEXvwYCaUvs/xtL1nxGkfYwcnygZ50SBYdaw5+SBTRWva8FbM2FIt4fu2BxkEwFJVSrLEFCm6Ep5QMo9fskdyumMCQSfbhhxvIcga5T+9fxYd8E8IGwujV5HQ2iK/90GGIoGRIyZLCirAuXpaN/38R530bGdrp+Mlg==;
	25:7lvtm2He/I3v8nreM5arJ7FYf9cKkbiN4r29HUzQfpcWaMrVXhcEjGXILd+JVK2ffmFwkA6LnvP+3rR5ZennmZgnbNtO9p2SniatnrLeDnP7o39Xr+t3F944l4PekN1DvoJ2nD2vGNvsny4v3wqJaU9ud5cHvO/Bt4MMoBWDPOB357O2peb7aomAzNfMX5jKNDAAcgvd6yP2OtaDEZ8mlAXA4zfiU7ynSd/wac5dquDoJEBkV+W/SV9QfSr29BG8C57Db2lh1gSp8tPuGAOWFG6XP3VRT7dvGSyAg7CTZ5xIwMxCsHaY92QbyQohgNugpKwzW9EkPlx+L0V3u9yw/CUaF3XN5qYr9+AyhK9BtM6OFWfm5NFWmnnpYgIz53tdp6LhxASemgEPm2FpTsYIWADDpdO+KfvnEMru/cXYz0yTGowJAH/WswJXKodoxrZad/Ifd9rg6owAJjKT8fmlSQ==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	31:A6l1aXaB6dILlFv2ydE9QjIMwXGZHI8i5R+XjwNZXAnayQ6ZWLev/v+TUi6PhsTViacEfM/MI5NpYLcmlw/XM2U+OGmEO6tDOVYb22eD0/ErhAVu0ullb3JJcEjODIDygbpWvYZ2PM5FglogEDfvSzpDgHYqbfNAJroeL9XvJQt9e9+UFGTeGQQ5xVWGbLOLhlAXG8CQdarTTJkQSc3LX2zKcqzNWR6lQhQiNd2oPs8=;
	20:s1c7o+r/X2gBlqBKIBdznWsJWeu4wQBfGy5Dzqkghs6fMvw4UsBPEsL6Zqodu9vZllxKt6tR/ncrtdPZkV7ILTBjI7SRZmvFIGjbi+RCFwLVvNrGseamJ9e5kMlvwBbSJsZq/Euh746pP6n2E5QyFpwM16pgXUp5cXXhrtgzjFxhXpnv9RN4jCHxjihve2ilWr99R0EEgof8gFaQE8kzS3swoqiok7YJ1l+V1IU4dx5aZ6sHnmsuCyn4hTl4aCD4qpLVY6FlyU/EdMYov3iq7DdaEzEarvBZt7hF6UQHcj9kzTZECe6sBN3n005y3YwVXD738TZ0c5JVXRwiF5f68g==
X-Microsoft-Antispam-PRVS: <CY4PR01MB26793F38F468732E3DC480E2AB020@CY4PR01MB2679.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123562025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(20161123560025)(6072148);
	SRVR:CY4PR01MB2679; BCL:0; PCL:0; RULEID:; SRVR:CY4PR01MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	4:SfB+qI/Uwl0w7nbzyLCJ1IAblKwfgOhpzCJFWfVHudjYGZidbGkYboAnAnyYGko9yC1hMrxbTCcE8CvKZaDkIu3aLu5lIPrQPhEHGRaKEW3J9Anet3GHUXhsAafM6oRbIgpQR4UqLtqLnIXJ3HyjZpvmuWQiE4kHY5wWz2t577puX8FrPbXLip485Iw8ZAJ9vs+guABWvslAhXBj9YTpIwXm+3v9X3Gb2Ogryv6JjNVQG93HUvbDod59gaWdZyUAS4YylHQA5gTwweOn54LsqrJZ0oz62QQzfsY4jcT4ywOYD+9GTFXyONav9smJYMyrGmvRsaJSEL7CFWsZ+AQ3foizkmSRT0qwejLgbkWSRd01VzhFInb3ZwcHTsY0koDfSW2GcmkHolNKmwwmMVeeYvBefK/DxS2jwh8f20TlcPNMeLPgTutgrgl2hawc0lYbnMZs9hm92hCeIftFGvIUYDK6qwwOs91L4PFVLnRfiYyn94jIMbg18mFqc2/V1HV25dmbWUDKFZl23AlVU0p38kO+LotLWf+Fq5xZiSoDx2NU7vz/XFPgkul0iAotkebVudpAArbgRglyOZZZmnbpHsfvtQ1ERW6vKWUvVIFikscWmzhC6zCFulMalMnpuYfUf7VsGY17O4JFWa64+w2UG3juDP/6Y5/aVzNL+XGWBLGyQiVySVSlCrwU+ZpGp8Uws6K2s7fDQ2S7LPds4Z2QWQ==
X-Forefront-PRVS: 02760F0D1C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39400400002)(39410400002)(39830400002)(39450400003)(377454003)(24454002)(377424004)(33646002)(50466002)(66066001)(53936002)(230700001)(7736002)(189998001)(305945005)(42186005)(2906002)(76176999)(50986999)(90366009)(31686004)(6486002)(54356999)(77096006)(8676002)(36756003)(38730400002)(5660300001)(229853002)(53546009)(6666003)(2950100002)(25786009)(86362001)(3846002)(47776003)(23676002)(93886004)(31696002)(4326008)(107886003)(6116002)(6246003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR01MB2679; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxTUIyNjc5OzIzOi84TDdsRFlhM1hwaFJNa0pReVN1Wlh6SE54?=
	=?utf-8?B?LzNyVGk3akltYzdCSnNQTy9DZ2JqS1hEajhhK1lPK2dGUWV5N0E4MnZBZ0Jx?=
	=?utf-8?B?d3p2Z2hJYWR4a0lBTWw5bnF6bXcydXFrWUthbGE0T2pvdWJWT3FzWnB6cmU5?=
	=?utf-8?B?T2xtRWgrWWxSVDd2R1VvYkczWjc2bHVQd3NyekpBVURMNFd0OXZRRGJMUTBa?=
	=?utf-8?B?RTRCUUtRbjltRG5VWWpxTjhsOHd3TW9NZ3N3VjJuRWZPY3B4V2lpYUtua0dU?=
	=?utf-8?B?NG95Z1VwLzFWU0F4blhtVmc1VEw3OEdiTHgxaFNta2RIbDV1c1IrNHZ5SUI4?=
	=?utf-8?B?OVpVZUVNcDVvWDhTOXB6THVQSWw0aEo5NGkzMnBvTW5KYjNlS2xLZnF6TTZy?=
	=?utf-8?B?M2k4M2kyNjY5aVZpejBGYTBvZnN3NFRqelpqYXY4aExUUks4TU8wcGFFZmFI?=
	=?utf-8?B?Um84bzQwQkh1L1ZrVm1IQW0zQmwxK3FUMHlsY0d5aERLTlVRVkpJcnNZT3R6?=
	=?utf-8?B?ZXgxWHNBSkJ0TDNpTnBVUU1oc1FlUkJPN0hXaURhWURXOEF6UmZCSnlIUkdj?=
	=?utf-8?B?VFJsRWZHVVoxdzdidmdRZlMzbFlDNnN3YmZTc2p4K0hrZlJhZmt0WUJZZGpZ?=
	=?utf-8?B?Z0xTSFV3Nnp2bnRZeG9OSkliQnRKR0pkdkZ5Q3ZLTzc4dTFoYklibksxSnRI?=
	=?utf-8?B?cmtSaGpSYjYra2tML1hRa0VJZzIrTWtnVTRwNFd4dzN6Tnh0NXNGQVhzL2dT?=
	=?utf-8?B?SEJSUXk5T2hYYWs2bXhmcTNQSERYeUpJUDdWWkZaMzdKa1A1c1hRTzNYRy9x?=
	=?utf-8?B?cVNzSGtZT21VVTV6QkdNNkpkUnpRdTNxS3BVeURBaXQ1OC9kNlZHRDRGMS9X?=
	=?utf-8?B?dG0wMjl4aExaTHozbExmdmZVeFFyNm9nV01ZbUxOR0VwNVhxb0Q2bjg1RS9Y?=
	=?utf-8?B?VDR2Z0NvOXNMSXhvczZXRjFQVmtmZmVaNlhGUDh5cmpCTGRId05od0NoMXh5?=
	=?utf-8?B?WVNOTDlpMGw5ZU42TUFpemxuU2V4R1VZUjkvZ0JDSi9jL05MMmZMRkh1S3Za?=
	=?utf-8?B?QVllT3MwSHYxTWpsMVhWYkc4amlLc3YvRVlveGdhdEhBRWlZeE9TN0RVT2tI?=
	=?utf-8?B?T1ZUUGRIdzJMK2hWVjlhcTNoeW1EaG5qdDE0SEVvNm1rVmxCOFp6bGlyUzdm?=
	=?utf-8?B?TUFnT2p6N1JIUjd5WE5VVnFLSG9BOHhxMkxLbWxIa2pOcVdkWTJKdGtPSnhy?=
	=?utf-8?B?RzRYYlloL3UzczNETitsMU44bHJSYjFqZzhzUHFVUUtTc0RuN3IyMkQwdko3?=
	=?utf-8?B?dWF3WUdSNno2bDMzQ0l0V0ZXTHdYYXlGWEMwbUw5Uk9MTEZyRzBRRHZkc3c1?=
	=?utf-8?B?ZUZVeC9VcGNhaWhpWWJ3b2xOVjY0TUg4REU3alpLd3I2ajlwQXZMTTZBc3Vn?=
	=?utf-8?B?dkV3cnVWTmJsUUpXMTRpRUJSVjdkTy9mT1dHRkdUTk1QS0FqMkNqLzdlb3E5?=
	=?utf-8?Q?GWFhgUBLOocJfs5am6NaDFIKKAPAVae6+Dm54YqHBNjnhh?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	6:eGnTcpoZGsU/EksvkskM4BFDIQnzUafbO/lFPC2BqUFSL79oLRqrlZ1ALsTSFX/sswO/aRcu7gZjDo8xCnNgQJJPmLfxd8RrhGLOQ+BgrQX3/xYjoZ7lgxmfHh5Ax4254zyD95kbrN75qsOO0siZ1pU9nobkl2xfMyTp4jAiXxSDPO3SkjpR876m0JnWasvMzV+kc5ZCl0P/pv/rZKkJDUJtCBj8m9ynZV0tCqlBSUEHURklWKAuMgQogjVQXAXXQ78xjlTVAX39sz7Z0X0GT5kpZrg7tXMVWoYY/hAWIwAUDtyBreq9n9ScaXjRQkzv/1EwA7hauIVbqdsQp9wangc8G0UslXHw5pFjlPlZART8TgDIRe43tzGoxrU0+39UX/pa3i5AKBzfubL3ZREtto/sSngJLLRvh6621p4bBsdCLoQ5Z4191rWw1rOA4sQ1qLJXoLZK8P3o4q2p2sblug==;
	5:5JZIS64OQSJ1Kqa8TdS/y747GS5pxnNLu/a5T8knNQIhemStCKZeWXJCW7BSNGS/i3ICC+DblVOXW40lUP/Bi/gIiBJHUSPbj/kz9AxHQcXLcPFcUlK04JwD/ZkxGV0kNPIoKKkqjmlgj66p8rWx/uIQAZz7dGD2JD2RmgDnmRI=;
	24:bTnTyMWtZx59jyC8A7hL+lpQt1pyyLT0dmOblbeJlB7JiVjGxzFk6m3dJKr0f4TKhAgL+iCgBIGg8dc3ymAc3kDQY4nflsqNOcQqvTjmw6g=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	7:93kBGLS75RPQMghuqYD3jnKqK69e7yjghHSonHSi6ljgV6C1O/FJW4qy0W5KkO+XjdhRsnlD9DIyFcZvZRb/TRgxCRnhUhBCr3Qo2znUX7ONxkBOabykq7zI2z+nt/srgJ6bJSSVIQTIoSeY0JybhZfutoiU6hbIbMT8jAzkroPXMTzxu82o2M9qfJvBQZZeiWLzEJj9qyTNTrIZtXVkao/+H+jlA5dtCQUnadciEBa3xJcXtLG+MjTt5oEYXOjbuqg05djPti1hQNi8pl9mjyXRbh5Y3UeOy/EaqsIGl5jFW3TYEzaQG2rNIMrvN6q8XQllg4LQjMdXEQMzfCXb2Q==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2017 00:11:57.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR01MB2679
Cc: Martin Kelly <martin@xevo.com>
Subject: Re: [PATCH] libsdl: enable X11 for nativesdk
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
X-List-Received-Date: Thu, 13 Apr 2017 00:11:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2017 02:47 PM, Martin Kelly wrote:
> On 04/11/2017 10:14 AM, Richard Purdie wrote:
>> On Tue, 2017-04-11 at 09:34 -0700, akuster808 wrote:
>>>
>>> On 04/06/2017 12:55 PM, Martin Kelly wrote:
>>>>
>>>> From: Martin Kelly <mkelly@xevo.com>
>>>>
>>>> Currently, the following situation fails:
>>>>
>>>> - Build an SDK and image. Make the image support graphics but not
>>>> X11.
>>>> - Extract SDK and copy image somewhere outside of the Yocto
>>>> workspace. Do
>>>>    runqemu on the image.
>>>>
>>>> This results in the error:
>>>> "Could not initialize SDL(No available video device) - exiting"
>>> This seems to have fixed an issue I was seeing on FedoraCore 25 with
>>> Morty with the same error.  Did I miss comments regarding these
>>> changes?
>>
>> No, I haven't directly commented but these changes do worry me a bit in
>> that we're setting the PACKAGECONFIG to x11 for some nativesdk things
>> and ignoring it for others. I don't like the inconsistency.
>>
>> I'm hoping the patch from Jussi today will be a better solution for
>> this problem, at least for master.
>>
>

I finally tested today with Jussi's patch, and I'm happy to report that 
it appears to fix the issue!

