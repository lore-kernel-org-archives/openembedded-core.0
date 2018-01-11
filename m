Return-Path: <mkelly@xevo.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0056.outbound.protection.outlook.com [104.47.36.56])
	by mail.openembedded.org (Postfix) with ESMTP id BD8CC787F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UWLNGfrwE5oSbB5q31jniaQMqyPa8EJy5XvwQH7RI4I=;
	b=1XVpuT+wECjoKfBciKPx/p8OYCncIraB10nH0CdmMfgNKnEtM5j6yzBf67ygIH/58KLSf2F91UsR2RW+4h/Bzquo8j5MTrb3RyNlXskynqVePDqvzrCPDOuJZk/CfQmGHxZ2nMh21VEEWWoPbd2JNzHd06HaA2av5zA68ExakA8=
Received: from [10.201.1.39] (65.122.179.226) by
	DM5PR0101MB2939.prod.exchangelabs.com (10.174.183.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Thu, 11 Jan 2018 19:53:47 +0000
From: Martin Kelly <mkelly@xevo.com>
To: Khem Raj <raj.khem@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
	<CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
	<0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
	<aa0ec366-dcd4-bac2-418a-acb0f9a06709@xevo.com>
	<CAMKF1sqKEc6KBZChcgx2U9e9eWLrW1NC60=HkSPHjfJn5UX7NA@mail.gmail.com>
	<7f531d17-d48d-2472-896b-764c2f1b756e@xevo.com>
Message-ID: <1cab62f4-fef4-970f-d9ca-01a29b664ff9@xevo.com>
Date: Thu, 11 Jan 2018 11:53:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <7f531d17-d48d-2472-896b-764c2f1b756e@xevo.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR01CA0036.prod.exchangelabs.com (10.172.172.150) To
	DM5PR0101MB2939.prod.exchangelabs.com (10.174.183.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0673fd94-abfe-45d6-cc47-08d5592d0752
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020070)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:DM5PR0101MB2939; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	3:7oxn24JlqP/rrghAmDsvAheUUwWv4a3Qw/5ssa+UbmlPFWeaByJIx0MvYyDSH3AZccG+XOit0Z7Cqp0ldKY7gf7SDdxzxjXTd6dMASpbwcOiktFmDl7LnyNTRPeYv/+6EdgxCob+tdF/jUMtLURSoc0YUGhqPxw5c0j8a1rcmM2AVksYDgnVE+G0ndwaa4bZDe767384f4rOGQQlHyh8UtJhjCapRyaH8egOIHF6AGRvVkyWuCTiGTBw2+SBj+c7;
	25:aTs/Z9fQuKwjqZivVuQFXZiw6w/2atiLzzsC9f9XmOpPbHIqVTY9gMezX1iDqy+SizK3tfAS5//ie3WWPustVltDE1JvUHwsqYhaeDxqP0KKiXorCCaH4mBmf3PnVbx0nOA3WWMk81NyNya4VJfhmWIh1LJbQLFx5ibcGWp+ERJ5XXPU8LKlCHHaHr6+tn0foVGrH6Rw+iFcC0/GPJW9YX63v++N5Rhh7hzOS6CmMm6eBhX38hK59uTP6uctU9pmUTKkmttTXLto5tCKhUkyktOG0tFmR83+Oz+iGDp4ReOhpDdyvhnryz7+ylShRJhObqYJQpbDEQzwY0yJw0rS5A==;
	31:mCxEIcv+rg7nE7VMh2tv8tBNFj2BIaQw4qNHCnSWcEz4cqgdSXupjRO287aLMXClNh3N8akr0cZcHZS8u6quc2qgcc5cvaE4lH0H96XUsgQbb+b9E7zwjfxRNbXRkpCYdKyp7EeycEjMumU9iIMNA0ar6GzD++dtzrp3zM11aQkXon+oSzrjBCfm3eTEpBZtxDyF2CX01+ETMQdtaME3+9vojQw7JBoD19oqE/ylAX0=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2939:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	20:pKRSstVKD7FApZ0NHGnIb0EwFd1K4PTX7b7XJx/NLOZGexOJ8u2jj2i2/nmQhINKuPbvQi8xqk5DuttUsF2eS/BPYgVdZPtQGVQXemsREw8heN+cQk0PK6Gl8TQOoFDm4rkdyXzY1bttX0Skl5YuSIcnvSjMjpjPLk57+Xi5Fw9HERPK1KUFwuCb8e3gRgo4V4kAeYuw7cmJowuyAgXkasDC1+vlstDdVLWWNoxg/yg466w3VHdgOJ2PMPPcI2fdsS0OTOpiV/cA6y9Jsf5aB/DSzX8IGo0aAHDAWAiogHLJLX+8q7oZmowwuRYKF2aIDl7WsjHI7Ryk96cutbPnq9OFX9SmxE6QW+myj/zFF6hxeymU5WkadrdxFeM7bYu2x1KQhNlIQyDl/4vLVUqqTIrEUBuYRbHw1T9OMQ4UJkI=;
	4:Pj+MV8SPpixcezE1tBikb4s73OwfwIuI5/lYc/BRdWUUrI0TyCx5p2if/J3YNtqDCFFkT5TTsK9yPaxeGtgOL45Dw/NivM+N5GWAZiTTLPxoK+c63j5Iqci4s7M+5lUvfWm+jaDxyGOQ+3DVWJAvuqKNlUsTJx0WJcxMFQ/RU74Sq372/Zn1SX94ShcAtxgg7GZf064VLdkIc7YjjuLMewOeBtsjHZ+bO1p5JkrSLmGaybKzk9v0SF0UarlonRaPVlSXO8ffNcCRmt1yjfmSAw==
X-Microsoft-Antispam-PRVS: <DM5PR0101MB293980DEA315E41200A1259DAB160@DM5PR0101MB2939.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231023)(944501134)(10201501046)(6041268)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011);
	SRVR:DM5PR0101MB2939; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM5PR0101MB2939; 
X-Forefront-PRVS: 0549E6FD50
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(376002)(366004)(39380400002)(346002)(396003)(39850400004)(24454002)(189003)(199004)(6666003)(66066001)(52146003)(23676004)(2486003)(386003)(6916009)(53546011)(2950100002)(67846002)(86362001)(52116002)(2906002)(478600001)(25786009)(97736004)(54906003)(83506002)(93886005)(58126008)(229853002)(316002)(6486002)(230700001)(53936002)(16576012)(77096006)(16526018)(76176011)(90366009)(31696002)(6246003)(8676002)(305945005)(7736002)(39060400002)(68736007)(81156014)(106356001)(8936002)(4326008)(105586002)(31686004)(65956001)(50466002)(81166006)(6346003)(64126003)(36756003)(5660300001)(65806001)(3846002)(65826007)(6116002)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2939; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7MjM6QTJna2h3cXV1R1VzMW8wVGg2MWFvRnR4?=
	=?utf-8?B?REtjMGFwYi9UbHg3NHFBYUsxN0d3by8yVzRTM0p5aTR6SWNZcEdsK3A0S28r?=
	=?utf-8?B?RmxDMXJYQ2I0dERwWSs3MWpzVHo3STl6dXZ1TDFBR2k3L0h4QXVFQmxiejRv?=
	=?utf-8?B?dXFxN2JCMHNNaEZiVmpOdE9WT2xJdmdpL21FbWNsakgrdzQvZi9OTzNyV1FY?=
	=?utf-8?B?Zlc0QnFjc1J2ZmF1dEpxWWpiU0dFTm1BT25VSS9lTHNNY3V0ZkxSQnRPdGZl?=
	=?utf-8?B?MGcycTd5MGVvSzhZYWNIYk0vV3drc2owOWdkaFB3eThWZ21kSGJWQ3BwZmx0?=
	=?utf-8?B?NG1YOCswZkFCSHpYbVdsSEJvUDVxWnI4U2RQWFdPTzhsUnRjR1Rud3NRVk1w?=
	=?utf-8?B?YW9hMUc5d1dabUNVa2oyNkFNNks3Mk11NDNXNEt0ODI0UG56T0xJMlgrUHZ3?=
	=?utf-8?B?MCswK3BEdWRRREtEbFZQVVI1MzkyS0IzOGtGQ1dpL2h1c2dmcktxMTloTmNK?=
	=?utf-8?B?SkdSSE5PYVpwdUxueFprYmdwbkVnNjJkZms4TU1DUU92RlQzTnNWZXV4L1NX?=
	=?utf-8?B?U2diOVhQb3F2UUYvNzB2SzM0TytSVlpTeUlXRUxoSVdDak1uV0plK1ljUm54?=
	=?utf-8?B?dUZTdmhsWmVFR2w5UnNmM2xMZ0N4SnZIc1hNNC9LSDd5OVNScXJnVlh6WTh0?=
	=?utf-8?B?ZzBldzRyc2tYdnY5UXlwdGMyKzVmU1dXenlNMnY2R3Z6am5wNUswd3dCOGVs?=
	=?utf-8?B?MUcyaHI1WUpyOEsrNzJobzBCQ3ViRWhmejdJUW1KS0ZJZ1BteEtTK25WZXdo?=
	=?utf-8?B?cEg4S3dtNGNObW1rZjdTYVlndGhIbEpXdmNOV2gvQWFXWUVQZGV2bHljcis4?=
	=?utf-8?B?em84aUFNK1N0WnJXWGJEU01lM0wwd1FJeXo5V3JLUDlhYXlVTXdmNld4REZT?=
	=?utf-8?B?ek5MQzAweTg2bUxSS1NVcDNyKy9NSHFQUkxkTk1YM1F6QnViWGwxdGdnSjli?=
	=?utf-8?B?ZFdCNklreFdSaERPZW0xd0tMVTkwUU53R1E3bFBnQzd6UEh2OWgzZVNtTEdu?=
	=?utf-8?B?MXpVUGttVEo4a1lnL3ZOTlJiYzlTUVBGemRRNUxoaFNGcG1JeWltMVl6Q3dl?=
	=?utf-8?B?NGhhaXA3cUNxdE02Y1VvTTlKR3J1MjFEMzI0MGs0YjhhRGJ1Qkx6V3FvYk9h?=
	=?utf-8?B?cjM2d1E1V2x5V3F3VlNqM3kzWVRJVS9xRVJQYVZtcys3UUxmZktsODhOM1oz?=
	=?utf-8?B?bmx6UHVSVXhoeEE5M0I4N1Z0Y3F1TnBkV0NiSkEwTFE0NnVXamJwWHNyS2Ft?=
	=?utf-8?B?WW81ZHJQSFRxZ0FiMHRMUHlwUVJta3RUSk1UejVjNGVGTXdjL3MvRElhMlUx?=
	=?utf-8?B?VjNOOUxZOUduVGJyUTV3QXEvN2JxS2xBb1ZVQXp0RTZqeXFnaHRlWUNtNFdq?=
	=?utf-8?B?K055c3F6QnlCSWxvZE5WVFpNNGpkcklDa3FzVmxGbGlQTHdZTlpqRk9YYUdu?=
	=?utf-8?B?VHUxNjRmZVVLVzl5SUljMUgvWEEvbzhVVnR4bFNwaUNUNGN1WXNSRUpFU0xI?=
	=?utf-8?B?Qy9sRDZmWlpQdnU2VHRQZG0wc2E2cG1DVXR1akdpZ2pNcC9xNUNmd2RvQkkx?=
	=?utf-8?B?Mjl3d0VzK2JlM21NZDVXUnNlVktENlNOY1F6Wjd0ZDIxdlpuVXNFSjhaakt2?=
	=?utf-8?B?MU1aY0JXMWxEU3RXbUJETms2RFUvUFJZS2VPbDlEMzJ5Rk4zaGRoUmY2NUh4?=
	=?utf-8?B?eFgxcnJrK1NlNW9tTU9oQUFCUVlGT3RnS1hLbU8waDI5WEYzSXNwOVhvZ200?=
	=?utf-8?B?UnRSQzQ0clJ5cXd3TFNaYXBSKy9aQlBiOGk4NjVrUEoyd2o4Q0dqL21pN2JL?=
	=?utf-8?B?NjJML081TVFVNmN2cjhYNVZwUjRPaEJ4ckkzZVVnYmY1TEVnRlZWWkNJbWtk?=
	=?utf-8?B?ZlpIUmhXUFpNR296WDRGMWhHR3QxWWlLT0NwWDNlR0lPY0M4V0hWaEdxKyty?=
	=?utf-8?B?a1YzMDY0SUwvVitjRnpzTFV1WStzU2pObXB5S1FRPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	6:0aG5b8dqeRlmVCJG3DJBc/314B9Oy9t9txeMf8asAyu2nmLdo36EprWALrNcHrvB7mPpXT9y56QKi+C+NqXhR8M5E1EbbHhd7jpRzKX2X7wroHQ8z+Vz7abI2vGLEpX+TSFXkI/8WYZ6TvzRVIhXea3bpb+QVDAseAFvjBZAUn/kWJzHMRxsRqZmGxS+ZENyz8qlI9ldA46OxgTBB0FIdJGjZaYIDfITGfYu660OmeUmWPSURkwU1AI8L24L5WRbTm+o8LbWCcYd4igsjwpG6aDR1tcTxZBjaDH1eGQPSY2T+81aIUTvBZ9uqKv1FJuIHEm+g6/x7TDIh2s1KQ4gDt98Tolb/qRHEH8KkHdBQI4=;
	5:FIMX+utLDikBxV9Uowlxoh5L9yG0iS2w5jyBEuPxBMv/dnH9v5KvPxZrEXkSHMMwtK0cLyDgKuHbxKmheg3XzpsxVIg4dcoJA8VWEvVoKWasbDrcwUy1hVnzXLshqAm9Lt41ViXArsh4mvRkPri37P9sipaeUAVxt6xuEwUGsHE=;
	24:jRD9QzEWswGTJQt+EfGEtpl1decD3eO6IBKTwh7VnF1nqW/GMet7KLp1YpI3swD88HiqAd2uf87SyslZVOpf16UZE9qc0pqpagJ4bRzc2Kg=;
	7:VkvKB/GVb1Pje/N+wo3XosOZ2YpZ7hME6f/sV56XdcrIZolJFoK7ScaRIAyXEIUbCwWzmK1QQSb/tTWHRBIkbJ3B6QcxhxBdMFYKQnK66KABCHubz9g0+On5JLr5CnBoDEi2Tc1bJHKjR2RL5UhDBwOHf1NLn8lHD0u8jHQVE15OUO12ZTtYElT6AlmjqegG64gHM9OVzcavTlr86RnYCZFgy9QSCMRyZ3cIPUG8SD/Z2Rxh3GpATMV/tSlRQmeB
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2018 19:53:47.1091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0673fd94-abfe-45d6-cc47-08d5592d0752
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2939
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
X-List-Received-Date: Thu, 11 Jan 2018 19:53:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/2018 11:33 AM, Martin Kelly wrote:
> On 01/11/2018 11:26 AM, Khem Raj wrote:
>> On Thu, Jan 11, 2018 at 11:22 AM, Martin Kelly <mkelly@xevo.com> wrote:
>>> Khem and Alexander, could you comment on which solution is preferable 
>>> from
>>> an SDK standpoint? Otherwise, could you nominate someone else to do 
>>> so in
>>> your place? :)
>>>
>>> Here are the possible solutions proposed:
>>>
>>> - Generate meson.cross toolchain file at SDK extraction time.
>>> - Wrap meson with a shell script that dynamically generates a 
>>> toolchain file
>>> and then runs meson pointing to it.
>>> - Change meson to support pulling in env vars in meson.cross, and use a
>>> fixed meson.cross file that references the env vars.
>>>
>>
>> We already have environment file, could it be used for meson as well 
>> and needed
>> bits be generated during build time for SDK.
>>
> 
> Yes, it is certainly technically possible. I'm wondering whether or not 
> that involves ugly special-casing, as I'm not familiar with the SDK 
> extraction code. If not, it's probably the best solution.
> 

Specifically, looking at script meta/files/toolchain-shar-extract.sh, I 
don't see a clean way to do something special for a single meson 
package. There is no per-package hook or similar logic.

>>>
>>> On 01/09/2018 12:33 PM, Martin Kelly wrote:
>>>>
>>>> On 01/09/2018 10:40 AM, Jussi Pakkanen wrote:
>>>>>
>>>>> On Tue, Jan 9, 2018 at 8:20 PM, Martin Kelly <mkelly@xevo.com> wrote:
>>>>>
>>>>>> Note the "native C compiler" line, which directly uses $CC.
>>>>>>
>>>>>> I'm not sure if this is correct, but an easy way to fix the issue 
>>>>>> is to
>>>>>> ignore $CC for internal sanity checking when a cross file is 
>>>>>> specified.
>>>>>> In
>>>>>> that way, meson would probe the system and use the normal gcc for 
>>>>>> sanity
>>>>>> checking while still using the cross file for the actual build.
>>>>>
>>>>>
>>>>> That breaks the whole reason the sanity check is there in the first
>>>>> place. Its point is to test "is the native compiler the user has
>>>>> specified working and capable of creating executables". If we change
>>>>> it then that becomes "is the system default compiler (which we might
>>>>> or might not use) working". We need to be able to support the case of
>>>>> users defining both the cross compiler and the native compiler. So
>>>>> something like this:
>>>>>
>>>>> CC=/some/native/cc meson --cross-file=mycross.txt <other options>
>>>>>
>>>>
>>>> Yeah, that makes sense. The issue here is that the OE SDK sets CC, 
>>>> CXX etc
>>>> to point to the cross compiler, not to the native compiler, so when 
>>>> meson
>>>> assumes it's native, things will break. I think we need a way to 
>>>> specify
>>>> both cross and host compilers separately from the env vars. For 
>>>> example, if
>>>> the binaries section were split in two: "host-binaries" and
>>>> "target-binaries", then in the cross-file case, meson could use
>>>> "host-binaries" instead of looking at CC and other vars.
>>>>
>>>>>> Right now, the SDK contains fixed contents, and there is some 
>>>>>> top-level
>>>>>> logic
>>>>>> for rewriting a few paths to make everything relocatable. I don't 
>>>>>> think
>>>>>> OE
>>>>>> wants to inject a special-case one-time generation of the 
>>>>>> toolchain file
>>>>>> at SDK
>>>>>> extraction time, as it circumvents the normal build process,
>>>>>
>>>>>
>>>>> Would it not be possible to generate the cross file when creating the
>>>>> SDK contents originally? The only change it would need is the same
>>>>> kind of path fixing. The setup does not really change.
>>>>>
>>>>
>>>> I think it would be possible, but I'm guessing it would require some
>>>> special-casing that we may not want to do. Khem probably has a better
>>>> informed opinion on this than I.
>>>>
>>>>>> Another approach would be to generate the toolchain file truly
>>>>>> "on-the-fly",
>>>>>> such that the meson command points to a script that first generates a
>>>>>> toolchain file based on the contents of CC, CXX, etc. and then runs
>>>>>> meson. I
>>>>>> think this is a bad idea because it is complex (will definitely 
>>>>>> surprise
>>>>>> people) and slow. It also breaks people in surprising ways when they
>>>>>> accidentally use a meson from outside the SDK due to the PATH setup.
>>>>>
>>>>>
>>>>> This is, roughly, what Debian does currently.
>>>>>
>>>>
>>>> That's too bad :).

